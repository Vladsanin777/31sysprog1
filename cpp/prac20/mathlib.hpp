#pragma once
// The C++ compiler mangles function names, so we use extern "C"
// to ensure the linker can find the correct function names.
// This is good practice for creating C-compatible libraries.
int AddNumbers(int num1, int num2);
int MultiplyNumbers(int num1, int num2);
