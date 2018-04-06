//: Playground - noun: a place where people can play

import UIKit

// 1 - Criar um Enum Com Tipos de IMC
enum IMC : String {
    case Baixo,Medio,Alto
}

//2 - Criar um Struct Pessoa
struct Pessoa{
    var nome : String
    var idade : Int
    var sexo: String
    var altura : Double
    var peso : Double
    var imc : String?
    
    mutating func changeImc(newImc : String){
        imc = newImc
    }
}

// 3 - Criar um Metodo Fora da Struct
func calcImc(altura:Double,peso:Double) ->String{
    let result =  peso/pow(altura, 2)
    switch result {
    case 0 ... 20:
        return IMC.Baixo.rawValue;
    default:
        return IMC.Medio.rawValue;
    }
}

// Iniciar o Struct com Valores pre - definidos
let rodrigo = Pessoa(nome: "Rodrigo", idade: 20, sexo: "Masc", altura: 1.73, peso: 65.0, imc: nil)

print(rodrigo)

// Passar Novos Valores por Copia
// 4- Interligar Tudo (Struct + Func Externa para Calc do IMC )
var teste = rodrigo
teste.nome = "Teste"
teste.idade = 21
teste.sexo = "masc"
teste.altura = 1.73
teste.peso = 65.0
teste.changeImc(newImc: calcImc(altura: teste.altura, peso: teste.peso))

print(teste)


// 5 - Criando um  Array de Pessoa(Struct)
var pessoaList : [Pessoa] = []

//Populando pessoaList Preenchendo o IMC por Funcao externa
var cont = 1

while cont <= 10 {
    teste.nome = "teste" + cont.description
    teste.idade = 21
    teste.sexo = "Masc"
    teste.altura = Double(arc4random_uniform(100))
    teste.peso = Double(arc4random_uniform(100))
    teste.changeImc(newImc: calcImc(altura: teste.altura, peso: teste.peso))
    pessoaList.append(teste)
    cont += 1
}

// Mostrar resultado com imc prenchido
for pessoa  in pessoaList{
    print("nome \(pessoa.nome) tem um imc \(pessoa.imc)")
}







