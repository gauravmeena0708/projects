#include <stdio.h>
/*
 * Make a habit of declaring structs like this it will be usefull
 */
typedef struct intro_s {
  char firstName[20];
  char lastName[20];
  int age;
} INTRO_t, *INTRO_p_t;
void print_intro(INTRO_p_t);

