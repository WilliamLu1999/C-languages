#include <stdio.h>
/*simplify the getLine function*/
int getLine(char s[], int lim) {
    int c, i;
    for (i=0; i<lim-1;++i)
 
    if (c=='\n') {
      s[i]= c;
      ++i;
    }
    else{
        s[i] = '\0';
    }
  
    return i;
  }