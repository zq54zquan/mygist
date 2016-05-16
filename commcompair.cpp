#include <stdio.h>
#include <stdlib.h>
#include <vector>
using namespace std;


//判断括号是否对应。用vector模拟一个栈实现
bool iscommpairs(char *s, int count) {
    vector<char> pairs;
    for (int i = 0; i<count; ++i) {
        if('('==*s) {
            pairs.push_back(*s);
        }
        else if(')'==*s) {
            if(pairs.empty()) {
                return false;
            }else {
                auto last = --pairs.end();
                pairs.erase(last);
            }
        }
        ++s;
    }
    return pairs.empty();
}

int main(int args, char *argv[]) {
    char s[] = "(hello world)!(ni hao )";
    printf("is paire:%d",iscommpairs(s,sizeof(s)));
    return 0;
}
