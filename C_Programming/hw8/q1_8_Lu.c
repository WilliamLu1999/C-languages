#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//Question 2:
// first sizeof(struct gameValType) is: 8*10002 bytes. The Second is: 8 bytes.
// Because of array, the size of employees is 2*16 = 32 bytes 


//Question 1:
struct point {
    double x;
    double y;
  };
struct point mkPoint(double x, double y) {
    // return {x, y};   invalid in C
    struct point pt;
    pt.x = x;
    pt.y = y;
    return pt;
  }


struct point mkRectangle(double a,double b,double c, double d){
    //assume the first two nums are for upper right, last two are for lower left.
    struct point pt1;
    struct point pt2;
    pt1.x =a;
    pt1.y=b;
    pt2.x =c;
    pt2.y=d;
}rect1;

struct point mkRectangle(struct point pt1,struct point pt2){
    struct point pt3;
    struct point pt4;
    //assume pt1 is upper left, pt2 is lower left
    //pt3 is lower left, pt4 is upper right
    pt3.x = pt1.x;
    pt3.y = pt2.y;
    pt4.x = pt2.x;
    pt4.y = pt1.y;
    
}rect2;