#include <stdio.h>  

#define WITHIN  1 
#define OUT 0 

int main(void){
    int c, state=OUT;

    while((c = getchar()) != EOF){
        if(c ==' ' || c =='\n'){
            if(state == WITHIN){
                state = OUT;
                putchar('\n');
            }
        } else {
            if(state == OUT){
                state = WITHIN;
            }
            putchar(c);
        }
    }
    return 0;
}