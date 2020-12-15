#include <stdio.h>
#include <stdlib.h>

int main()
{
    float Peso1=0,Peso2=0.8,Erro,Taxa_Aprendizado=0.05,soma;
    for (int i=1; i<6; i++){
        soma= (i*Peso1)+(i*Peso2);
        Erro=(i*2)-soma;
        Peso1=Peso1+(Erro*Taxa_Aprendizado*i);
        Peso2=Peso2+(Erro*Taxa_Aprendizado*i);
        printf("soma= %f, peso1= %f, peso2=%f Erro=%f\n",soma,Peso1,Peso2,Erro);
    }
    printf("-------------TABELA FINAL:-----------\n");
    for (int j=1;j<10;j++){
        float soma_final= (j*Peso1)+(j*Peso2);
        printf("%d + %d = %.2f\n",j,j,soma_final);
    }
    return 0;
}
