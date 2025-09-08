#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    // Determine the page size for proper memory alignment
    long pageSize = sysconf(_SC_PAGE_SIZE);
    if (pageSize == -1) {
        perror("sysconf");
        return 1;
    }

    // Reserve a region of memory (1024 * 1024 bytes)
    // The PROT_NONE flag reserves the address space without making it accessible.
    void *pMemory = mmap(
        NULL,                          // Address hint (let the OS choose)
        1024 * 1024,                   // Total size of the reserved region
        PROT_NONE,                     // No access permissions initially
        MAP_PRIVATE | MAP_ANONYMOUS,   // Private and not backed by a file
        -1,                            // File descriptor (not applicable for anonymous mapping)
        0                              // Offset in the file (not applicable)
    );

    if (pMemory == MAP_FAILED) {
        perror("mmap (reserve)");
        return 1;
    }

    // Commit a page of memory (4096 bytes) from the reserved region
    // The mprotect function changes the protection of the specified memory region.
    // It makes the first page of the reserved memory read-write.
    if (mprotect(pMemory, 4096, PROT_READ | PROT_WRITE) == -1) {
        perror("mprotect (commit)");
        // Clean up the reserved memory on failure
        munmap(pMemory, 1024 * 1024);
        return 1;
    }

    // Use the memory
    int *numbers = (int *)pMemory;
    for (int i = 0; i < 1024; i++) {
        numbers[i] = i;
    }
    printf("Successfully wrote to memory. numbers[100] = %d\n", numbers[100]);

    // Free the entire reserved memory region
    // munmap is used to unmap and release the memory.
    if (munmap(pMemory, 1024 * 1024) == -1) {
        perror("munmap");
        return 1;
    }

    return 0;
}
