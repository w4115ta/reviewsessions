#include <stdio.h>

int main() {
	int x = 1;
	for (int i = 0; i < 5; i++) {
		x = i > 2 ? 1 : "false";
		println("%d\n", sizeof x);
	}	
}
