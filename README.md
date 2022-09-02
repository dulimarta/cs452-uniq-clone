# Simple `uniq` clone

## Introduction

The Unix utility `uniq` is a text processing program that either report or omit (adjacent) repeated lines. With no command line options given, the program prints the first line of any repeated group. For instance given the following input:

```
Hello?
Hello?
Hello?


No answer? Let's try again:
Hello?
Tik
Tok
Tok
tok
```

the output produced by `uniq` is:

```
Hello?

No answer? Let's try again:
Hello?
Tik
Tok
tok
```

The original `uniq` utility takes several options, but for this assignment you will be handling only three options: `-c`, `-d`, and `-i`.

When the `-c` option is given, each line of output is preceeded with the number of repeated lines in the original input:

```
    3 Hello?
    2
    1 No answer? Let's try again:
    1 Hello?
    1 Tik
    2 Tok
    1 tok
```

When the `-d` option is given, the program prints only the repeated lines in the input:

```
Hello?

Tok
```

Combining both `-c` and `-d`, it produces the following output:

```
    3 Hello?
    2
    2 Tok
```

With the `-i` option comparison between adjacent lines is case insensitive. For instance with both `-c` and `-i` given the output is:

```
    3 Hello?
    2
    1 No answer? Let's try again:
    1 Hello?
    1 Tik
    3 Tok
```

## Your Assignment

You are to write a program that implements a simplified clone of the Unix utility `uniq`.

### Program Requirements

1. It is written in C or C++, developed and tested on our EOS machines compiled with `clang`.
2. Its binary executable shall be called `uno` (to match the name used by the bash scripts for testing)
3. It can take 0 to 3 options (in any order) and at most one filename:

   ```bash
   ./uno -i -c some.txt
   ./uno -c -i -d some.txt
   ```

4. When the filename is not provided, the program shall read its input from `stdin`, i.e. the two invocations below shall produce the same output:

   ```bash
   ./uno -i -c some.txt
   cat some.txt | ./uno -c -i -d
   ```

   In the first invocation, the program reads its input from the file `some.txt` but in the second invocation it reads its input from `stdin`

5. When provided, the filename must be the **last** command line argument
6. Options and filename shall be parsed directly from the command line. Your program shall NOT prompt the user to enter options or filename
7. Normal output shall be printed to `stdout` and only error related messages shall be printed to `stderr`. **DO NOT** produce output to a file!
8. It prints an error message (to `stderr`) when an unrecognized option is given
9. Avoid allocating dynamic memory from the heap. If you do, be sure to prevent memory leak.

## Reasonable Assumptions

You can assume that:

- The input to your program is textual data (ASCII)
- The length of each input line will not exceed 255 characters

However, you **cannot** assume that:

- The file size is limited to some number
- The input contains only a small number of repeated lines

# Grading

Your program correctness will be compared against the original `uniq` utility, i.e, your program must produced the same exact output as produced by `uniq`.


| Item                        |    Point    |
| --------------------------- | :---------: |
| Test case (bash script)     | 2 pts each  |
| Code well commented         |    2 pts    |
| Coding style                |    2 pts    |
| Penalty for memory leak     |   -3 pts    |
| Penalty for program crashed |   -3 pts    |