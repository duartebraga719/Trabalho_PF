Sistema de Gest�o de Consultas M�dicas
Descri��o inicial
Este projeto foi desenvolvido no �mbito da unidade curricular de Programa��o Funcional, utilizando a linguagem Haskell. O objetivo deste sistema � gerir pacientes e consultas m�dicas atrav�s de uma abordagem funcional baseada em tipos alg�bricos, recurs�o e fun��es puras. Nesta primeira fase do projeto foram implementadas as estruturas de dados principais e um conjunto inicial de funcionalidades relacionadas com a gest�o de pacientes e consultas. 
Funcionalidades Implementadas
Gest�o de Pacientes
* Registar novos pacientes.
* Pesquisar pacientes pelo nome.
* Procurar pacientes atrav�s do identificador.
Gest�o de Consultas
* Consultar todas as consultas de um determinado paciente.
* Contar o n�mero de consultas associadas a um paciente.
* Identificar pacientes sem consultas registadas.
Estrutura 
Model.hs
Cont�m os tipos de dados que representam o dom�nio da aplica��o:
* EstadoConsulta
* Paciente
* Consulta
Inclui ainda conjuntos de dados de exemplo para testes.  
Domain.hs
Cont�m a l�gica principal da aplica��o:
* registarPaciente
* pesquisarPacienteNome
* procurarPacienteId
* consultasDoPaciente
* contarConsultasPaciente
* pacientesSemConsultas
Estas fun��es constituem o n�cleo funcional do projeto. 
Trabalho Desenvolvido na Fase 1
Nesta fase foi realizada:
* Modela��o do dom�nio do problema.
* Defini��o dos tipos de dados principais.
* Implementa��o das primeiras opera��es funcionais.
* Utiliza��o de recurs�o para processamento de listas.
* Cria��o de dados de demonstra��o.
Link do repositório GitHub:
https://github.com/duartebraga719/Trabalho_PF