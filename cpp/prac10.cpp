#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <iostream>
#include <cstring>

#define SAFE_CREATE_PROCESS(procInfo, program, args) \
    do { \
        pid_t __pid = fork(); \
        if (__pid == -1) { \
            perror("fork"); \
            exit(EXIT_FAILURE); \
        } else if (__pid == 0) { \
            execvp(program, args); \
            perror("execvp"); \
            _exit(EXIT_FAILURE); \
        } else { \
            *(procInfo) = __pid; \
        } \
    } while(0)

#define WAIT_PROCESS_COMPLETION(hProcess) \
    if (waitpid(hProcess, NULL, 0) == -1) { \
        perror("waitpid"); \
    }

bool RunAndWaitForProcess(void) {
    pid_t pi;
    char* const args[] = {strdup("ls"), strdup("-l"), NULL};
    SAFE_CREATE_PROCESS(&pi, "ls", args);
    WAIT_PROCESS_COMPLETION(pi);
    return true;
}

int main(void) {
    std::cout << RunAndWaitForProcess() << std::endl;
    return 0;
}
