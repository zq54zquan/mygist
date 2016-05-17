#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/********************************
 递归实现修改字符串为相同所需要的
最小步数 
  ******************************/
int editDistance(char *s,char *d) {
    //两个字符串中有一个到达结束，还要一个字符串剩余的部分需要去不删除或全部添加
    if (strlen(s)==0||strlen(d) == 0) {
        return abs(strlen(s)-strlen(d));
    }

    if(*s == *d) {
        return editDistance(++s,++d);
    }
    //添加一个
    int s1 = editDistance(s+1,d)+1;
    //删除一个
    int s2 = editDistance(s,d+1)+1;
    //修改一个
    int s3 = editDistance(s+1,d+1)+1;
    
    return fmin(fmin(s1,s2),s3);

}


int main(int args, char *argv[]) {
    int distance = editDistance("hello","malloc");
    printf(":%d",distance);   
}

