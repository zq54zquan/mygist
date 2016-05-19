#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
typedef struct tagCharItem {
    char c;
    int value;
    bool leading;
}CHAR_ITEM;
CHAR_ITEM charItem[] = {
    { 'W', -1, true  },
    { 'D', -1, true  },
    { 'O', -1, false },
    { 'T', -1, false },
    { 'G', -1, true  },
    { 'L', -1, false },
    { 'E', -1, false },
    { 'C', -1, false },
    { 'M', -1, false }
};

const int max_nums = 9;
const int max_value = 10;

typedef struct tagCharValue {
    const int valu;
    int used;
}CHAR_VALUE;


CHAR_VALUE charValue[] = {
    {(int)1,0},
    {(int)2,0},
    {(int)3,0},
    {(int)4,0},
    {(int)5,0},
    {(int)6,0},
    {(int)7,0},
    {(int)8,0},
    {(int)9,0},
    {(int)0,0},
    
};

int makeIntegerValue(CHAR_ITEM *ci,char *v) {
    size_t size = strlen(v);
    int value = 0;
    for(int i  = 0; i < size ; ++i) {
        for (int j = 0; j < max_nums; ++j) {
            if(v[i] == ci[j].c) {
                value += pow(10,(size-i-1))*ci[j].value;
            }
        }
    }
    return value;
}

void checkValues(CHAR_ITEM *ci) {
    char minuend[] = "WWWDOT";
    char subtrahend[] = "GOOGLE";
    char diff[] = "DOTCOM";
    int m = makeIntegerValue(ci,minuend);
    int s = makeIntegerValue(ci,subtrahend);
    int d = makeIntegerValue(ci,diff);
    if ((m-s)==d) {
        printf("%d - %d = %d\n",m,s,d);
    }
}

bool isValide(CHAR_ITEM i,CHAR_VALUE v) {
    if (v.used == 0){
        if(0 == v.valu&&(i.leading == true)) {
            return false;
        }
        return true;
    }
    return false;
}

void buildValidChars(CHAR_ITEM *ci,  int index,void(*callback)(CHAR_ITEM *)) {
    if(index == max_nums) {
        callback(ci);
        return;
    }
    for(int i = 0 ;i < max_value; ++i) {
        if(isValide(ci[index],charValue[i])) {
            ci[index].value = charValue[i].valu;
            charValue[i].used = 1;
            buildValidChars(ci,index+1,callback);
            charValue[i].used = 0;
        }
    }
}


int main(int args,char *argv[]) {
    buildValidChars(charItem,0,checkValues);
    for (int i = 0; i< max_value; ++i) {
        printf("v:%d\n",charValue[i].valu);
    }
    return 0;
}

