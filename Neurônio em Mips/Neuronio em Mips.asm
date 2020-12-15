

.data
  

peso2: .float 0.8 
  
taxa:  .float 0.05
  
i:     .float 1.0 
  
um:    .float 1.0
  
peso1: .float 0.0
  
erro:  .float 0.0 
  
soma:  .float 0.0 
  
comparador: .float 6.0 
  
soma_final: .float 0.0 
  
j:     .float 1.0
  


.text
  

lwc1 $f0, peso2     #Estabelecendo peso 2 como float 
  
lwc1 $f1, taxa      #Estabelecendo taxa_aprendizado como float 
  
lwc1 $f2, i         #Estabelecendo i como float 
  
lwc1 $f3, peso1     #Estabelecendo peso1 como float  
lwc1 $f4, erro      #Estabelecendo erro como float 
  
lwc1 $f5, soma      #Estabelecendo soma como float  
  
lwc1 $f6, um        #Estabelecendo um como float
  
lwc1 $f12,soma_final        
  
lwc1 $f13,j
 
   


main: 
      

addi $s0, $zero, 0
      
addi $s1, $zero, 5
 


for:  
     

#Processo de aprendizado do neurônio
      

sgt     $t0,$s0,$s1   #t0=contador>comparador
      
beq     $t0,1,parte2     #t0=verdadeiro pula pra parte 2 
     
beq     $s0,$s1,parte22   #se contador=comparador pula pra parte 2 
      
mul.s   $f7,$f2,$f3   #f7= i*Peso1 
      
mul.s   $f8,$f2,$f0   #f8= i*Peso2 
      
add.s   $f5,$f7,$f8   #soma= f7+f8 
      
add.s   $f9,$f2,$f2   #f9=i+i 
      
sub.s   $f4,$f9,$f5   #Erro=f9-soma
      
mul.s   $f10,$f4,$f1  #f10=erro*taxa 
      
mul.s   $f11,$f10,$f2 #f11=erro*taxa*i 
      
add.s   $f3,$f3,$f11  #Peso1=Peso1+(Erro*Taxa_Aprendizado*i) 
      
add.s   $f0,$f0,$f11  #Peso2=Peso2+(Erro*Taxa_Aprendizado*i) 
     
add.s   $f2,$f2,$f6   #i=i+1 
      
addi    $s0,$s0,1     #contador=contador+1 
      
j for 
parte2: 
parte22: 
     
addi $s2, $zero, 0  #contador=0
     
addi $s3, $zero, 5  #comparador=5
 
for2:  
     

#Demonstração do aprendizado do neurônio
      

sgt     $t0,$s2,$s3   #t0=contador>comparador
      
beq     $t0,1,FIM     #t0=verdadeiro pula pro final  
      
beq     $s2,$s3,END   #se contador=comparador pula pro final
      
mul.s   $f14,$f13,$f3 #f14=j*Peso1 
      mul.s   $f15,$f13,$f0 #f15=j*Peso2 
      
add.s   $f12,$f15,$f14 #soma_final= (j*Peso1)+(j*Peso2) 
      
add.s   $f13,$f13,$f6  #j=j+1 
      
add     $s2,$s2,1     #contador=contador+1 
      
j for2


END:


FIM: 
     

jr $ra
  































     
      
      
  
