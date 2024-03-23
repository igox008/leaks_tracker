# Track Leaks

## Description
Track Leaks is a C project that provides a mechanism to track memory allocations and deallocations using custom wrappers for `malloc` and `free` functions. It includes a header file `track_leaks.h` with logging functionality to record allocation and deallocation events.

## Features
- Custom `malloc` and `free` wrappers with logging capabilities.
- Logs memory allocation and deallocation events with address, source file, and line number information.
- Helps in detecting memory leaks and tracking memory usage in C programs.

## Usage
To use Track Leaks in your C program:
1. Include the `track_leaks.h` header file in your source code.
2. Compile your program with the `track_leaks.h` header file included.
3. Run your program to generate logs in the file `adrress_logs.py` with memory allocation and deallocation information.

## Installation
Simply include the `track_leaks.h` header file in your project and compile it along with your source code.

## Example
```c
#include "track_leaks.h"
#include <stdio.h>

int main() {
    int *ptr = (int*)malloc(sizeof(int));
    *ptr = 10;
    printf("Value: %d\n", *ptr);
    free(ptr);
    return 0;
}
