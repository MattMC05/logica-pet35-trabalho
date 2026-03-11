programa
{//Trabalho feito por Bernardo, Kenji, Letícia, Matheus e Paola
	inclua biblioteca Util
	inteiro hotel[8][15]
	inteiro andar=0, quarto=0, disponivel=0, ocupado=0
	logico ocupa = falso
	funcao inicio()
	{
		
		hospedar()
		finalizar()
		
	}//funcoes:
	funcao mapa(){
		escreva("====== Mapa de ocupação do hotel ======\n\n")
		para(inteiro a=0; a < 8; a++){//andares, linhas
			escreva("Andar ",a+1,": ")
			para(inteiro q=0; q < 15; q++){//quartos, colunas
				escreva(hotel[a][q]," ")
			}
			escreva("\n")
		}

	}
	funcao hospedar(){
		faca{
			se(andar<8 e quarto<15 e ocupa==falso){
				limpa()
				mapa()
			}
			ocupa = falso
			escreva("\nQual quarto deseja se hospedar?\n")
			escreva("Insira o andar: ")
			leia(andar)
			andar-=1//andar = andar -1
			escreva("Insira o quarto: ")
			leia(quarto)
			quarto-=1
			se(andar<8 e andar>=0 e quarto<15 e quarto>=0){
				se(hotel[andar][quarto]==0){
				hotel[andar][quarto]=1
				escreva("*Quarto reservado com sucesso!!*")
				Util.aguarde(1600)
				}
				senao se(andar>=0 e quarto>=0){
					limpa()
					mapa()
					escreva("\n********************* ERRO *********************\n        O quarto inserido já está ocupado,\n   use o mapa como referência, os quartos com 0\n          estão disponíveis para reserva\n")
					ocupa = verdadeiro
				}
			}
			senao se(andar>=0 e quarto>=0){
				limpa()
				mapa()
				escreva("\n********************* ERRO *********************\n           O quarto inserido é inválido,\n insira um andar de 1 à 8 e um quarto de 1 a 15\n")
			}
		}enquanto(andar>=0 e quarto>=0)


		
	}
	funcao finalizar(){
		para(inteiro a=0; a < 8; a++){//andares
			para(inteiro q=0; q < 15; q++){//quartos
				se(hotel[a][q]==0){
					disponivel++//disponivel = disponivel +1
				}
				senao{
					ocupado++
				}
			}
		}
		limpa()
		mapa()
		escreva("\nPrograma finalizado!\n")
		escreva(disponivel," quartos disponíveis\n",ocupado," quartos ocupados")
		
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 245; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {hotel, 4, 9, 5}-{andar, 5, 9, 5}-{quarto, 5, 18, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */