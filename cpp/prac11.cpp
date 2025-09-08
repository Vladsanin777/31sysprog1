#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
void* ThreadFunction(void* lpParam) {
    int threadId = *(int*)lpParam;
    printf("Thread %d started\n", threadId);
    // Выполнение работы потока
    return NULL;
}
int main() {
    pthread_t threads[5];
    int threadIds[5];
    for (int i = 0; i < 5; i++) {
        threadIds[i] = i;
        pthread_create(
            &threads[i],    // Идентификатор потока
            NULL,           // Атрибуты потока
            ThreadFunction, // Функция потока
            &threadIds[i]   // Аргумент функции
        );
    }
    // Ожидание завершения всех потоков
    for (int i = 0; i < 5; i++) {
        pthread_join(threads[i], NULL);
    }
    return 0;
}
