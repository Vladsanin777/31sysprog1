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

# Директории
PRAC20_SRC_DIR := cpp/prac20
PRAC20_ASM_DIR := build/asm/prac20
PRAC20_OBJ_DIR := build/obj/prac20
PRAC20_BIN_DIR := build/bin
PRAC20_LIB_DIR := build/lib

# Цели сборки
PRAC20_TARGET := $(PRAC20_BIN_DIR)/prac20
PRAC20_LIBRARY := $(PRAC20_LIB_DIR)/prac20.a
PRAC20_ASM_FILES := $(PRAC20_ASM_DIR)/mathlib.s $(PRAC20_ASM_DIR)/main.s
PRAC20_OBJ_FILES := $(PRAC20_OBJ_DIR)/mathlib.o $(PRAC20_OBJ_DIR)/main.o

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
all: $(EXECUTABLES) $(ASSEMBLY) $(PRAC20_TARGET) $(PRAC20_ASM_FILES)

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

# Создание исполняемого файла - ИСПРАВЛЕННАЯ КОМАНДА ЛИНКОВКИ
$(PRAC20_TARGET): $(PRAC20_OBJ_DIR)/main.o $(PRAC20_LIBRARY) | $(PRAC20_BIN_DIR)
	$(CXX) -o $(PRAC20_TARGET) $(PRAC20_OBJ_DIR)/main.o $(PRAC20_LIBRARY)

# Создание статической библиотеки
$(PRAC20_LIBRARY): $(PRAC20_OBJ_DIR)/mathlib.o | $(PRAC20_LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^

# Генерация ассемблерного кода
$(PRAC20_ASM_DIR)/%.s: $(PRAC20_SRC_DIR)/%.cpp | $(PRAC20_ASM_DIR)
	$(CXX) $(CXXFLAGS) -S -o $@ $<
	sed -i '/^\./d' $@ 2>/dev/null || true
	sed -i '/^#/d' $@ 2>/dev/null || true
	sed -i '/^	\./d' $@ 2>/dev/null || true


# Компиляция объектных файлов
$(PRAC20_OBJ_DIR)/%.o: $(PRAC20_SRC_DIR)/%.cpp | $(PRAC20_OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Создание выходных директорий
$(PRAC20_LIB_DIR) $(PRAC20_ASM_DIR) $(PRAC20_OBJ_DIR):
	mkdir -p $@

# Очистка
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
