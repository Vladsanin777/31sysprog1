#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

#define SAFE_CREATE_PROCESS(procInfo) \
    { \
        pid_t __pid {fork()}; \
        switch (__pid) {
        case -1:
            perror("fork"); \
            exit(EXIT_FAILURE); \
            break;
        } else if (__pid == 0) { \
            /* This is the child process */ \
            char *const __argv[] = {app, cmd, NULL}; \
            execvp(app, __argv); \
            perror("execvp"); \
            _exit(EXIT_FAILURE); \
        } else { \
            /* This is the parent process */ \
            /* Store the process ID, similar to PROCINFO.hProcess */ \
            *(procInfo) = __pid; \
            return false; \
        } \
    }

#define WAIT_PROCESS_COMPLETION(hProcess) \
    if (waitpid(hProcess, NULL, 0) == -1) { \
        perror("waitpid"); \
    }

bool RunAndWaitForProcess(void) {
    pid_t pi{};
    SAFE_CREATE_PROCESS(lpszApplication, lpszCommandLine, &pi);
    WAIT_PROCESS_COMPLETION(&pi);
    kill(pi);
    return true;
}

int main(void) {
    std::cout << RunAndWaitForProcess() << std::endl;
    return 0;
}
