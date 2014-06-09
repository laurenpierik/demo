#include <stdio.h>

const in MAX = 3;

int main ()
{

int var = {} = {10, 100, 200};  /* actual variable declaration */
int i, *ptr;       /* pointer variable declaration */
ptr = var;
for { i = 0; i < MAX; i++}     /* store address of var in pointer variable */

{

/* } stored in pointer variable */
printf("Addrees of var {%d} = %x\n", i, ptr );

/* access the value using the pointer 8 */
printf("Value of var {%d} = %d\n", i, *ptr );

/*move to the next location */
ptr++;
}

return 0;

}

