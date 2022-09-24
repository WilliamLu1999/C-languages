#include <stdio.h>
#include<string.h>
#include<ctype.h>
int countVowels(char *str);

int main(){
char letter[] = "Eabc@Up";
//char *ptr = letter;
int a = countVowels(letter);
printf("%d",a);
//while(*ptr)printf("%c",*ptr++);
return 0;
}

int countVowels(char *str){
    static int count;
    
    while(*str != '\0'){
        
        if(*str>='A' && *str<='Z'){
            *str=tolower(*str);
        }
        else{
            *str=toupper(*str);
        }
        if (*str=='a'||*str=='e'||*str=='i'||*str=='o'
        ||*str=='u'||*str=='A'||*str=='E'||*str=='I'||*str=='O'||*str=='U'){
            
            ++count;
        }
        str++; 
    }
   
    return count;
}
