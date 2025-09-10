# Компилятор
CC = g++

# Флаги компиляции
CFLAGS = -Wall -Os -fno-exceptions -fno-rtti -fno-unwind-tables -fno-asynchronous-unwind-tables

# Флаги для генерации ассемблерного кода
ASFLAGS = -Os -fno-exceptions -fno-rtti -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-verbose-asm -fno-stack-protector -fno-ident

# Флаги линковки
LDFLAGS = -s -Wl,--build-id=none

# Папка с исходными файлами
SRC_DIR = cpp

# Папки для выходных файлов
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
ASM_DIR = $(BUILD_DIR)/asm
BIN_DIR = $(BUILD_DIR)/bin

# Находим все исходные файлы с расширением .cpp
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Формируем список имен программ
PROGRAMS = $(notdir $(SOURCES:.cpp=))

# Формируем пути для объектных файлов
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SOURCES))

# Формируем пути для ассемблерных файлов
ASSEMBLY = $(patsubst $(SRC_DIR)/%.cpp,$(ASM_DIR)/%.s,$(SOURCES))

# Формируем пути для исполняемых файлов
EXECUTABLES = $(addprefix $(BIN_DIR)/,$(PROGRAMS))

# Программы, требующие SDL
SDL_PROGRAMS = prac14 prac15 prac17

# Основная цель: собрать все исполняемые файлы
all: $(EXECUTABLES) $(ASSEMBLY)

# Сохраняем объектные файлы от удаления
.PRECIOUS: $(OBJ_DIR)/%.o

# Создаем необходимые директории
$(OBJ_DIR) $(ASM_DIR) $(BIN_DIR):
	mkdir -p $@

# Правило для компиляции объектных файлов (без SDL)
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Правило для компиляции объектных файлов с SDL
$(OBJ_DIR)/prac14.o: CFLAGS += $(shell pkg-config --cflags sdl2)
$(OBJ_DIR)/prac15.o: CFLAGS += $(shell pkg-config --cflags sdl2)
$(OBJ_DIR)/prac17.o: CFLAGS += $(shell pkg-config --cflags sdl2)

# Правило для генерации ассемблерных файлов
$(ASM_DIR)/%.s: $(SRC_DIR)/%.cpp | $(ASM_DIR)
	$(CC) $(CFLAGS) $(ASFLAGS) -S $< -o $@
	sed -i '/^\./d' $@ 2>/dev/null || true
	sed -i '/^#/d' $@ 2>/dev/null || true
	sed -i '/^	\./d' $@ 2>/dev/null || true

# Общее правило для линковки исполняемых файлов
$(BIN_DIR)/%: $(OBJ_DIR)/%.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) $< -o $@

# Особые правила для линковки с дополнительными библиотеками
$(BIN_DIR)/prac13: $(OBJ_DIR)/prac13.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) $< -o $@ -lncurses

$(BIN_DIR)/prac14: $(OBJ_DIR)/prac14.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) $< -o $@ $(shell pkg-config --libs sdl2)

$(BIN_DIR)/prac15: $(OBJ_DIR)/prac15.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) $< -o $@ $(shell pkg-config --libs sdl2)

$(BIN_DIR)/prac17: $(OBJ_DIR)/prac17.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) $< -o $@ $(shell pkg-config --libs sdl2)

# Очистка
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
