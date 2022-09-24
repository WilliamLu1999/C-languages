#include <stdio.h>

main(){

}
void rotate3(int *A, int *B, int *C){
    int temp;
    temp = *A;
   
    *A = *B;
    *B = *C;
    *C = temp;

}

int plusminus(int *x,int *y){
    int temp;
    temp = *x;
    *x = *x+*y;
    *y= temp-*y;
}