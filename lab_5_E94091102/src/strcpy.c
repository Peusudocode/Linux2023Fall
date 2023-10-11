#include "../include/strcpy.h"
char *sstrcpy(char *dest, const char *src) 
{
	char tmp;
	int count = 0;
	tmp = *src;
	while(tmp != '\0')
	{
		tmp = *(src + count);
		*(dest + count) = tmp;
		count++;
	}
	*(dest + count) = '\0';
	return dest;
}
