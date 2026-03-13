programa
{
	inclua biblioteca Util
	inteiro musc=0,func=0
	cadeia matriculaC[30][4], armarios[30]
	logico disponivel=verdadeiro, matriculado=falso
	funcao inicio()
	{
		inteiro opcao
		caracter confirm='n'
	
		faca{
			menu()
			escreva("Escolha uma das opções: ")
			leia(opcao)
				escolha(opcao){
				caso 1: matriculas()
				pare
				caso 2: aula()
				pare
				caso 3: lista()
				pare
				caso 4: faturar()
				pare
				caso 5:
				escreva("Tem certeza que deseja finalizar? (s/n) ")
				leia(confirm)
				se(confirm == 'S'){
					confirm = 's'
				}
				pare
				caso contrario:
				limpa()
				escreva("\n\n* OPÇÃO INVÁLIDA *")
				Util.aguarde(1400)
				limpa()
				pare
				}
		}enquanto(confirm!='s')
		
	}
	funcao menu(){
		escreva("ACADEMIA - FORÇA TOTAL\n----------------------------------\n1 - Nova Matrícula\n2 - Aula Personal\n3 - Listar Armários\n4 - Faturamento\n5 - Sair do Programa\n----------------------------------\n\n")
	}
	funcao matriculas(){
		limpa()
		inteiro a=0//alunos(linha)
		caracter confirma, arm = 'n'
		confirma='s'

		faca{
		para(inteiro d=0; d < 2; d++){//dados(coluna)
				se(matriculaC[a][d]==""){
					escreva("Insira sua matrícula: ")
					leia(matriculaC[a][0])
					escreva("Insira seu nome: ")
					leia(matriculaC[a][1])
					escreva("Deseja um armário? (s/n) ")
					leia(arm)
					disponivel=verdadeiro
					se(arm=='s' ou arm=='S'){
						armario()
					}
					escreva("* Matrícula registrada com sucesso! *\n")
					matriculado=verdadeiro
					Util.aguarde(2200)
				}
			}
			a++
		}enquanto(matriculado==falso)
		matriculado=falso
		limpa()
	}
	funcao armario(){
		inteiro p
		faca{
			escreva("Qual armário deseja?(1-30) ")
			leia(p)
			p-=1
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
	}
	
	funcao aula(){
		cadeia matric, data
		inteiro tipoAula
		logico existe = falso
		escreva("Informe sua matrícula: ")
		leia(matric)
		para(inteiro a=0; a < 30; a++){
			para(inteiro d=0; d < 1; d++){
				se(matric==matriculaC[a][0]){
					existe=verdadeiro
					escreva("Insira a data: (dd/mm)")
					leia(data)
					escreva("Qual aula?(1=Musculação/2=Funcional) ")
					leia(tipoAula)
					se(tipoAula==1){
					matriculaC[a][2]="Musculação"
						musc++
					}
					senao se(tipoAula==2){
						matriculaC[a][3]="Funcional"
						func++
					}
					senao{
						escreva("* Aula inválida *")
					}
				}
			}
		}
		se(existe==verdadeiro){
			escreva("\nAula registrada com sucesso\n")
			Util.aguarde(3000)
		}
		se(existe==falso){
			escreva("\n* Matrícula não encontrada! *\n")
			Util.aguarde(3000)
		}
		existe=falso
	}
	funcao lista(){
		escreva("\n----------- Listagem de armários -----------\n")
		para(inteiro i=0; i < 30; i++){
			se(armarios[i]==""){
				se(i<9){
					escreva("0",i+1,":Livre ")
				}
				senao{
					escreva(i+1,":Livre ")
				}
			}
			senao se(i<9){
				escreva("0",i+1,":Cheio ")
			}
			senao{
				escreva(i+1,":Cheio ")
			}
			
			se(i==4 ou i==9 ou i==14 ou i==19 ou i==24){
				escreva("\n")
			}
		}
		escreva("\n--------------------------------------------\n")
		Util.aguarde(5000)
		
	}
	funcao faturar(){
		inteiro totalM=0,totalAu=func+musc,totalAl=0
		real faturaM, faturaA, faturaT
		para(inteiro i=0; i < 10; i++){
			se(matriculaC[i][0]!=""){
				totalM++
			}
		}
		para(inteiro a=0; a < 30; a++){
			se(matriculaC[a][2]!="" ou matriculaC[a][3]!=""){
				totalAl++
			}
		}
		
		faturaM = totalM*200.0
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
 * @POSICAO-CURSOR = 1870; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matriculaC, 5, 8, 10}-{armarios, 5, 27, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */