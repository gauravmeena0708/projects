#include "common.h"
int main(int argc,char **argv){
  //travis test
  INTRO_t intro;
  printf("Enter your the info: \n[fName LName age]\n");
  fscanf(stdin,"%s %s %d",intro.firstName,intro.lastName,&(intro.age));
  
  print_intro(&intro); 
  return 0;
}
