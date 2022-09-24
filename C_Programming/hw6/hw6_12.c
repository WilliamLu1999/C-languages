#include <stdio.h>

/*
The first question:

it is wrong because the order of alloc and afree follows the stack characteristics. That is, last alloc first afree. So the
afree(p1) and afree(p2) should reverse their order.
*/

char *strncpy(char *s, char *t, int n){
    int count = 0;
    while((*s++ = *t++)){
        count+=1;
        if(count==n)
            break;
           
    }
     return s;
}