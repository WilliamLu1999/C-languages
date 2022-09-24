#include <stdio.h>
#include <string.h>
void diff(char *A,char *B,char *AnotB){
    int lenA =strlen(A);
    int lenB =strlen(B);
    int i;
    int j;
    //for(i=0;i<lenA;i++){
        for(j=0;j<lenA;j++){
            if (strchr(B,A[j])==NULL){
                strcat(AnotB,A[0][j]);
            }
          

        }
        printf("%s",AnotB);
        
    }




int main(){
    char A[]="1234512";
    char B[]="4188";
    char AnotB[]="";
    diff(A,B,AnotB);

    return 0;
}