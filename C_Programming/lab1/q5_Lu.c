#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char *argv[argc]){
    
    char *str = argv[1];
    char *except = argv[2];
    char *dup = argv[3];
    
    while (*str!='\0'){
        if (islower(*str)){
            if(strstr(except,str)){
                str++;
            }
            else{
                if(strstr(dup,str)){
                    putchar(*str);
                    putchar(*str);
                    str++;
                }
                else{
                    putchar(*str);
                    str++;
                }
            }
        }
        else{
            printf("Illegal. Some chars are not letters.");
            break;
        }
    }
    return 0;
}