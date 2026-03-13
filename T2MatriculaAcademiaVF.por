programa
{
	inclua biblioteca Util//Utilizado para aguardar antes de executar a próxima linha
	inteiro musc=0,func=0//quantidade de aulas de musculação e funcional
	cadeia matriculaC[30][4], armarios[30]//Matriz(Matrícula, nome, aula de musc, aula func)
	logico disponivel=verdadeiro, matriculado=falso//condições para executar ou não estruturas de repetição
	funcao inicio()//Letícia
	{
		inteiro opcao//opcao do menu escolha caso
		caracter confirm='n'//confrimação para caso 5 (Sair do Programa (s/n))
	
		faca{
			menu()//Menu inicial de opções 1 - 5
			escreva("Escolha uma das opções: ")
			leia(opcao)
				escolha(opcao){
				caso 1: matriculas()//Matheus
				pare
				caso 2: aula()//Kenji
				pare
				caso 3: lista()//Letícia
				pare
				caso 4: faturar()//Paola
				pare
				caso 5:
				escreva("Tem certeza que deseja finalizar? (s/n) ")
				leia(confirm)
				se(confirm == 'S'){//correção de caixa alta
					confirm = 's'//para caixa baixa
				}
				pare
				caso contrario:
				limpa()
				escreva("\n\n* OPÇÃO INVÁLIDA *")
				Util.aguarde(1400)
				limpa()
				pare
				}
		}enquanto(confirm!='s')//confirmação para caso 5 (Sair do Programa (s/n))
		
	}
	funcao menu(){//Matheus
		escreva("ACADEMIA - FORÇA TOTAL\n----------------------------------\n1 - Nova Matrícula\n2 - Aula Personal\n3 - Listar Armários\n4 - Faturamento\n5 - Sair do Programa\n----------------------------------\n\n")
	}
	funcao matriculas(){//Matheus
		limpa()
		inteiro a=0//alunos(linha)
		caracter arm = 'n'//confirmação para se o cliente deseja um armário

		faca{
			para(inteiro d=0; d < 2; d++){//d=dados(coluna): coluna 0=matrícula, 1=nome, 2=Aula de musculação, 3=Aula funcional 
				se(matriculaC[a][d]==""){//se nº da matrícula ou nome estiverem vazios
					escreva("Insira sua matrícula: ")
					leia(matriculaC[a][0])
					escreva("Insira seu nome: ")
					leia(matriculaC[a][1])
					escreva("Deseja um armário? (s/n) ")
					leia(arm)
					se(arm=='s' ou arm=='S'){
						armario()
					}
					escreva("* Matrícula registrada com sucesso! *\n")
					matriculado=verdadeiro//encerrará o looping
					Util.aguarde(2200)
				}
			}
			se(a<30){
				a++//depois de checar uma linha, ir para a próxima
			}
			senao{
				escreva("\nMatrículas lotadas!\n")
				matriculado=verdadeiro//para impedir repetição infinita
			}
		}enquanto(matriculado==falso)
		matriculado=falso
		limpa()
	}
	funcao armario(){//Bernardo
		inteiro p//posição do armário
		faca{//repetir enquanto não digitar um armário válido
			escreva("Qual armário deseja?(1-30) ")
			leia(p)
			p-=1//O armario 1 = A posição 0 no vetor, que o cliente não sabe
			se(p>=0 e p <30){
				se(armarios[p]==""){
					disponivel=falso
					armarios[p] = "ocupado"
					escreva(" Armário reservado com sucesso! \n")
				}
				senao{
					escreva("Armário ocupado!\n")
				}
			}
			senao{
				escreva("Armário inexistente\n")
			}
		}enquanto(disponivel==verdadeiro)
		disponivel=verdadeiro//condição para voltar ao looping armário na próxima execução da funcao
	}
	
	funcao aula(){//Kenji
		cadeia matric, data
		inteiro tipoAula// 1-Musculação, 2-Personal
		logico existe = falso
		escreva("Informe sua matrícula: ")
		leia(matric)
		para(inteiro a=0; a < 30; a++){//a=aluno(linha)
			se(matric==matriculaC[a][0]){
				existe=verdadeiro
				escreva("Insira a data: (dd/mm)")
				leia(data)
				escreva("Qual aula?(1=Musculação/2=Funcional) ")
				leia(tipoAula)
				se(tipoAula==1){
					matriculaC[a][2]="Musculação"
					musc++
					escreva("\nAula registrada com sucesso\n")
					Util.aguarde(3000)
				}
				senao se(tipoAula==2){
					matriculaC[a][3]="Funcional"
					func++
					escreva("\nAula registrada com sucesso\n")
					Util.aguarde(3000)
				}
				senao{
					escreva("* Aula inválida *")
				}
			}
		}
		se(existe==falso){
		escreva("\n* Matrícula não encontrada! *\n")
		Util.aguarde(3000)
		}
		existe=falso
	}
	funcao lista(){//Letícia
		escreva("\n----------- Listagem de armários -----------\n")
		para(inteiro i=0; i < 30; i++){
			se(armarios[i]==""){
				se(i<9){//armários de 1 a 9 serão exibidos como 01 a 09, para alinhar corretamente na lista
					escreva("0",i+1,":Livre ")
				}
				senao{
					escreva(i+1,":Livre ")
				}
			}
			senao se(i<9){//armários de 1 a 9 serão exibidos como 01 a 09, para alinhar corretamente na lista
				escreva("0",i+1,":Cheio ")
			}
			senao{
				escreva(i+1,":Cheio ")
			}
			
			se(i==4 ou i==9 ou i==14 ou i==19 ou i==24){//a cada 5 armários, pula 1 linha. Por organização
				escreva("\n")
			}
		}
		escreva("\n--------------------------------------------\n")
		Util.aguarde(5000)
		
	}
	funcao faturar(){//Paola
		inteiro totalM=0,totalAu=func+musc,totalAl=0//TotalMatriculas, TotalAulas,TotalAlunos
		real faturaM, faturaA, faturaT//FaturamentoMatrículas, FaturamentoAulas,FaturamentoTotal
		para(inteiro i=0; i < 30; i++){
			se(matriculaC[i][0]!=""){
				totalM++
			}
		}
		para(inteiro a=0; a < 30; a++){//verificar cada linha da matriz (cada aluno)
			se(matriculaC[a][2]!="" ou matriculaC[a][3]!=""){//se há aulas ou não na linha
				totalAl++//para adicionar +1 para o total de alunos atendidos
			}
		}
		
		faturaM = totalM*200.0//200 reais por matrícula
		faturaA = (musc*100.0)+(func*80.0)
		faturaT = faturaM+faturaA
		limpa()
		escreva("----------------------------------------\nNúmero de matrículas realizadas: ",totalM,"\nNúmero de aulas personal: ",totalAu,"\nNúmero de alunos atendidos: ",totalAl,"\nTotal faturado com matrículas: R$:",faturaM,"0\n","Total faturado com aulas:      R$:",faturaA,"0\n","Total geral arrecadado:        R$:",faturaT,"0\n----------------------------------------\n")
		Util.aguarde(5000)
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3882; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matriculaC, 5, 8, 10}-{armarios, 5, 27, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */