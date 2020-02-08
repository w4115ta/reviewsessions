#include <stdio.h>

int x = 1;

void foo() {
	printf("%d\n",x);

}

int main() {
	int x = 2;
	printf("%d\n",x);
	foo();

