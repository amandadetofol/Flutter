/*Exercício - Média
Faça um programa que calcule a média do aluno

O usuário deve inserir 2 notas, de 0 a 10.
Cada nota deve ter um peso, podendo ser escolhido entre 1 a 3.
Com base nos valores recebidos, calcule a média.
Requisitos técnicos
Deve ser feito com if e switch.*/

const num grade1 = 2;
const num grade2 = 10; 

const num grade1Weight = 2; 
const num grade2Weight = 3;

late final num average; 

bool isValidGradeWeight(num weight) {
  return weight >= 1 && weight <= 3;
}

bool isValidGrade(num grade) {
  return grade >= 0 && grade <= 10;
}

void main(){
 
  if(isValidGrade(grade1) && 
     isValidGrade(grade2) && 
     isValidGradeWeight(grade1Weight) && 
     isValidGradeWeight(grade2Weight)){
      average = (((grade1*grade1Weight)+(grade2*grade2Weight)) / (grade1Weight+grade2Weight)); 
      print(average); 
  } else {
    print("Dados inválidos.");
  }
  
}

