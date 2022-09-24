#include <stdlib.h>
#include <stdio.h>

int isdiv35(int n);
int main(int argc, char *argv[argc]){

   
    int f;
    if (argc!=3){
        printf("error!");
        return -argc;
    }
    else{
        int x =atoi(argv[1]);
        int y =atoi(argv[2]);
        if(x>y){
            printf("error!");
        }
        else{
            int a = x;
            while(a<=y && a>=x){
                f = isdiv35(a);
                printf("For %d, the number return is %d\n",a,f);
                a++;
            }
        }
    return 0;
}
}
int isdiv35(int n){
    if (n %3==0 && n%5 !=0)
        return 1;
    else if (n%5==0 && n%3 !=0)
        return 2;
    else if (n %15 ==0) 
        return 3;// this is the same as divisble by 3 and 5 at the same time
    else 
        return 4;
}   