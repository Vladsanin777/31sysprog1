#include <iostream>
#include <vector>
#include <cmath>
#include <SDL2/SDL.h>

const int SAMPLE_RATE = 44100;
const int AMPLITUDE = 28000;

// Data from the original assembly program
const std::vector<double> frequencies = {262, 294, 330, 349, 392, 440, 494, 523};
const std::vector<int> durations_ms = {100, 100, 100, 100, 100, 100, 100, 200};

// State for the audio generation
struct AudioData {
    int current_note_index = 0;
    Uint32 current_note_samples_left = 0;
    double current_phase = 0.0;
};

// Global audio data
AudioData audio_data;

// This function generates the sound samples.
// It's called by SDL's audio driver whenever it needs more audio data.
void AudioCallback(void* userdata, Uint8* stream, int len) {
    Sint16* buffer = reinterpret_cast<Sint16*>(stream);
    int samples_to_generate = len / sizeof(Sint16);

    for (int i = 0; i < samples_to_generate; ++i) {
        if (audio_data.current_note_samples_left == 0) {
            // Move to the next note if the current one is finished
            if (audio_data.current_note_index < frequencies.size()) {
                audio_data.current_note_samples_left = (durations_ms[audio_data.current_note_index] * SAMPLE_RATE) / 1000;
                audio_data.current_phase = 0.0;
                audio_data.current_note_index++;
            } else {
                // End of sequence, fill the rest with silence
                buffer[i] = 0;
                continue;
            }
        }

        // Generate a sine wave sample
        double frequency = frequencies[audio_data.current_note_index - 1];
        double value = sin(audio_data.current_phase);
        buffer[i] = static_cast<Sint16>(value * AMPLITUDE);

        // Update the phase for the next sample
        audio_data.current_phase += (2.0 * M_PI * frequency) / SAMPLE_RATE;
        audio_data.current_note_samples_left--;
    }
}

int main(int argc, char* argv[]) {
    // Initialize the SDL audio subsystem.
    if (SDL_Init(SDL_INIT_AUDIO) < 0) {
        std::cerr << "SDL could not initialize! SDL Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    // Set up the audio format.
    SDL_AudioSpec desired_spec;
    SDL_zero(desired_spec);
    desired_spec.freq = SAMPLE_RATE;
    desired_spec.format = AUDIO_S16SYS; // 16-bit signed integer
    desired_spec.channels = 1;          // Mono
    desired_spec.samples = 4096;        // Buffer size
    desired_spec.callback = AudioCallback;
    desired_spec.userdata = &audio_data;

    // Open the audio device.
    SDL_AudioDeviceID deviceId = SDL_OpenAudioDevice(NULL, 0, &desired_spec, NULL, 0);
    if (deviceId == 0) {
        std::cerr << "Failed to open audio: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }

    // Start playing the audio
    SDL_PauseAudioDevice(deviceId, 0);

    // Keep the program running while the audio is playing
    std::cout << "Playing tones..." << std::endl;
    while (audio_data.current_note_index <= frequencies.size() + 1) {
        SDL_Delay(100);
    }
    std::cout << "Playback finished." << std::endl;

    // Clean up
    SDL_CloseAudioDevice(deviceId);
    SDL_Quit();

    return 0;
}
