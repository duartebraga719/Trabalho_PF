Sistema de Gestão de Consultas Médicas
Descrição inicial
Este projeto foi desenvolvido no âmbito da unidade curricular de Programação Funcional, utilizando a linguagem Haskell. O objetivo deste sistema é gerir pacientes e consultas médicas através de uma abordagem funcional baseada em tipos algébricos, recursão e funções puras. Nesta primeira fase do projeto foram implementadas as estruturas de dados principais e um conjunto inicial de funcionalidades relacionadas com a gestão de pacientes e consultas. 
Funcionalidades Implementadas
Gestão de Pacientes
* Registar novos pacientes.
* Pesquisar pacientes pelo nome.
* Procurar pacientes através do identificador.
Gestão de Consultas
* Consultar todas as consultas de um determinado paciente.
* Contar o número de consultas associadas a um paciente.
* Identificar pacientes sem consultas registadas.
Estrutura 
Model.hs
Contém os tipos de dados que representam o domínio da aplicação:
* EstadoConsulta
* Paciente
* Consulta
Inclui ainda conjuntos de dados de exemplo para testes.  
Domain.hs
Contém a lógica principal da aplicação:
* registarPaciente
* pesquisarPacienteNome
* procurarPacienteId
* consultasDoPaciente
* contarConsultasPaciente
* pacientesSemConsultas
Estas funções constituem o núcleo funcional do projeto. 
Trabalho Desenvolvido na Fase 1
Nesta fase foi realizada:
* Modelação do domínio do problema.
* Definição dos tipos de dados principais.
* Implementação das primeiras operações funcionais.
* Utilização de recursão para processamento de listas.
* Criação de dados de demonstração.

