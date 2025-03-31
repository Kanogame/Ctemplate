#include <klib/error.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  initExceptions(argv[0]);

  printf("this is my template\n");
  return 0;
}