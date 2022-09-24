#include <stdio.h>
#include <string.h>
#include <ctype.h>
int reorder(char **s1,char **s2,char **s3);
int main(){
    // driver codes:
    //char *w1 = "helccceejj";
   // char *w2 = "gssjjjjjjsf";
    //char *w3 = "igdfffe";
    //printf("%s\n",w1);
    //printf("%s\n",w2);
    //printf("%s\n",w3);
    //int rt =reorder(&w1,&w2,&w3);
    //printf("%d\n",rt);
    //printf("%s\n",w1);
    //printf("%s\n",w2);
    //printf("%s\n",w3);
    return 0;
}
int reorder(char **s1,char **s2,char **s3){
    int length1;
    int length2;
    int length3;
    length1 = strlen(*s1);
    length2 = strlen(*s2);
    length3 = strlen(*s3);
    if (length1==length2 && length2==length3){
        printf("All 3 are equal length.");
        return length1;
    }
    else if(length1==length2 ||length1==length3||length2==length3){
        printf("Two are equal length.\n");
        return 2;
    }
    else{
        char *temp;
        if(length1>length2&&length2>length3){
            *s1 = *s1;
            *s2 = *s2;
            *s3 = *s3;
        }
        else if(length1>length3&&length3>length2){
            temp = *s2;
            *s1 = *s1;
            *s2 = *s3;
            *s3 = temp;
        }
        else if(length2>length1&&length1>length3){
            temp = *s1;
            *s1 = *s2;
            *s2 = temp;
            *s3 = *s3;
        }
        else if(length2>length3&&length3>length1){
            temp = *s1;
            *s1 = *s2;
            *s2 = *s3;
            *s3 = temp;
        }
        else if(length3>length1&&length1>length2){
            temp =*s1;
            *s1 = *s3;
            
            *s3 = *s2;
            *s2 = temp;
        }
        else if(length3>length2&&length2>length1){
            temp = *s1;
            *s1 = *s3;
            *s2 = *s2;
            *s3 = temp;
        }

        printf("all three are unequal length.");
        return 1;
    }

}