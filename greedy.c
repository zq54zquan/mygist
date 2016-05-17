#include <stdio.h>
#include <stdlib.h>
/*************************************
  贪心策略
  1.最小重量
  2.最大价值
  3.最大价值/重量
  ***********************************/
const int  max_weight = 25;
int values[] ={ 5,10,4,8,7,12,15,9};
int weights[] ={3,4,8,9,3,2,8,10};

typedef struct Target_Object {
    int weight;//重量
    int value;//价值
    int state;//状态 0.未加入1.已加入2.不能加入
} OBJECT;


typedef struct Greedy_Func {
    int all_weight; //总重量
    int all_value; //总价值
    OBJECT* targets; //目标对象
    int (*chooseFunc)(OBJECT *,int count);
} Greedy;


int chooseValuest(OBJECT *objs, int count) {
    int index = -1;
    int maxValue = 0;
    for (int i  = 0 ; i < count; ++i) {
        if(0 == objs[i].state&&objs[i].value>maxValue) {
            index = i;
            maxValue = objs[i].value;
        }
    }
    
    return index;
}

Greedy createGreedy() {
    OBJECT *targets = (OBJECT *)malloc(sizeof(values)/sizeof(int)*sizeof(OBJECT));
    for (int i  = 0 ; i < sizeof(values)/sizeof(int); ++i) {
        OBJECT o = {weights[i],values[i],0};
        targets[i] = o;
    }
    Greedy g = {0,0,targets,chooseValuest};
    return g;
}

void printGreedy(Greedy g) {
    printf("allweight:%d, allValue:%d\n",g.all_weight,g.all_value);
    for (int i  = 0; i < sizeof(values)/sizeof(int); ++i) {
        if(g.targets[i].state == 1) { 
            printf("weight:%d value:%d\n",g.targets[i].weight,g.targets[i].value);
        }
    }

} 

int main(int args, char *argv[]) {
    Greedy g = createGreedy();
    int i = 0;  
    while((i = g.chooseFunc(g.targets,sizeof(values)/sizeof(int)))!=-1) {
       if(g.targets[i].weight+g.all_weight <= max_weight) {
        g.targets[i].state = 1;
        g.all_weight+=g.targets[i].weight;
        g.all_value+=g.targets[i].value;
       } else {
        g.targets[i].state = 2;
       }
    }
    printGreedy(g);
    return 0;
}
