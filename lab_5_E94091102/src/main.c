#include <stdio.h> 
#include <stdlib.h> 
#include "../include/strcpy.h" 
int main() { 
	const char *src = "e94091102"; 
	char *dest = malloc(10); 
	dest = sstrcpy(dest, src); 
	printf("%s\n", dest); 
	return 0; 
}

