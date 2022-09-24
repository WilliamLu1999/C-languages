#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
int main(int argc,char *argv[]){
    char c;
    while(1){
       c =getchar();
       if(argc==1){
           putchar(c);
           printf("\n");
    
       }
       else if(argc==3){
            if (strcmp(argv[1],"-d")==0){
                   putchar(c);
                   putchar(c);
               }
           
           else if(strcmp(argv[1],"-u")==0){
               putchar(toupper(c));

           }
           else if(strcmp(argv[1],"-du")==0||strcmp(argv[1],"-ud")==0){
               if(isalpha(c)){
                   c=toupper(c);
               }
               putchar(c);
               putchar(c);

           }
           else{
               printf("Illegal");
               break;
           }

       }
        else if (argc==4){
            if((strcmp(argv[1],"-u")==0 && strcmp(argv[2],"-d")==0)||(strcmp(argv[1],"-d")==0 && strcmp(argv[2],"-u")==0)){
                 if(isalpha(c)){
                   c=toupper(c);
               }
               putchar(c);
               putchar(c);
            }
            else{
               printf("Illegal");
               break;
           }
        }
    }
    return 0;
}



// another version I dont know which part is having some cute bug. If you could find it, please helo me! Thank you in advcance!

/*
int main(int argc, char *argv[]){
   
    int c, makeDupplicate, makeUpper=0;
    while (--argc>0 && (*++argv)[0] == '-'){
        while((c= *++argv[0])){
            switch(c){
                case ('d'):
                    makeDupplicate=1;
                    
                    break;
                case('u'):
                    makeUpper=1;
                   
                    break;
                default:
                    printf("Illegal option %c\n",c);
                    
                    break; 
            }
        }
    }
    char C = getchar();
    if(makeDupplicate==1 && makeUpper==0){
        putchar(C);
        putchar(C);
        
     }
    else if(makeUpper==0 && makeDupplicate==0){
        putchar(C);
    }
    else if(makeUpper==1 && makeDupplicate==0){
        if(isalpha(C)){
            C =toupper(C);
            putchar(C);
            }
        else{
            putchar(C);
        }
    } 
    else{
        if (isalpha(C)) {
			putchar(toupper(C));
			putchar(toupper(C));
		}
		else {
			putchar(C);
			putchar(C);
		}
	}
    

*/
    

    
