#include <stdio.h>
 
int main()
{
    multiplication_table();
}
void multiplication_table(){

    //기본적인 구구단 세로 출력
    for (int i = 1; i <= 9; i++)
    {
        for (int j = 1; j <= 9; j++)
        {
            printf("%d x %d = %d\n", i, j, (i*j));
        }
        printf("\n");
    }
}