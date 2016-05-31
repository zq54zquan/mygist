#include <stdio.h>
const int BUFF_SIZE = 100;//栈大小
class OoneStack {
private:
	int *values; //值数组
	int *mins;   //最小值数组
	int vtop;	 //值的栈顶
	int mintop; //最小值栈顶
public:
	void push(int value) {
		vtop+=1;
		values[vtop] = value;
		if(mins[mintop]>value){
			mintop+=1;
			mins[mintop] = value;
		}
	}

	int minValue() {
		return mins[mintop];
	}

	int pop() {
		int v = values[vtop];
		vtop-=1;
		if(v==minValue()) {
			mintop = mintop-1;
		}
		return v;
	}
	OoneStack() {
		values = (int *)malloc(BUFF_SIZE*sizeof(int));
		
		mins = (int *)malloc(BUFF_SIZE*sizeof(int));

		vtop = 0;

		mintop = 0;
	}
}


int main(int args,char **argv) {
	
}
