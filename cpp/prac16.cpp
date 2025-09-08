#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main() {
    std::string filename = "example.txt";
    std::string buffer = "Hello from C++!";
    
    // Аналог создания файла и записи в него
    // (INT 21h, AH=3Ch и INT 21h, AH=40h)
    // std::ofstream - это поток для записи в файл.
    // std::ios::out | std::ios::trunc - открывает файл для записи и удаляет его содержимое, если он уже существует.
    std::ofstream outfile(filename, std::ios::out | std::ios::trunc);
    if (!outfile) {
        std::cerr << "Error: Could not create or open the file for writing." << std::endl;
        return 1;
    }
    
    std::cout << "Creating and writing to file..." << std::endl;
    outfile << buffer;
    outfile.close(); // Закрываем файл
    
    // Аналог чтения из файла
    // (INT 21h, AH=3Fh)
    // std::ifstream - это поток для чтения из файла.
    std::ifstream infile(filename);
    if (!infile) {
        std::cerr << "Error: Could not open the file for reading." << std::endl;
        return 1;
    }
    
    std::cout << "Reading from file..." << std::endl;
    // Чтение всего содержимого файла в строку
    std::string readBuffer((std::istreambuf_iterator<char>(infile)),
                           std::istreambuf_iterator<char>());
    
    std::cout << "File content: " << readBuffer << std::endl;
    
    infile.close(); // Закрываем файл
    
    return 0;
}
