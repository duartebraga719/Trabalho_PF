module Domain where

import Model

-- Registar Pacientes
registarPaciente :: Paciente -> [Paciente] -> [Paciente]
registarPaciente paciente pacientes = paciente : pacientes

-- Pesquisa Pacientes pelo nome
pesquisarPacienteNome :: String -> [Paciente] -> [Paciente]
pesquisarPacienteNome _ [] = []
pesquisarPacienteNome nome (p:ps)
    | nomePaciente p == nome = p : pesquisarPacienteNome nome ps
    | otherwise = pesquisarPacienteNome nome ps

-- Procura um paciente pelo seu numero de utente
-- Usa pattern matching e recursão sobre a lista de pacientes
procurarPacienteNUt :: NumUtente -> [Paciente] -> Paciente
procurarPacienteNUt _ [] = Paciente "" "Paciente inexistente" 0 ""
procurarPacienteNUt identificador (p:ps)
    | numUtente p == identificador = p
    | otherwise = procurarPacienteNUt identificador ps

-- Devolve todas as consultas associadas a um paciente
-- A função percorre recursivamente a lista de consultas
consultasDoPaciente :: NumUtente -> [Consulta] -> [Consulta]
consultasDoPaciente _ [] = []
consultasDoPaciente identificador (c:cs)
    | numUtenteConsulta c == identificador = c : consultasDoPaciente identificador cs
    | otherwise = consultasDoPaciente identificador cs

-- Conta recursivamente quantas consultas estão associadas a um paciente
contarConsultasPaciente :: NumUtente -> [Consulta] -> Int
contarConsultasPaciente _ [] = 0
contarConsultasPaciente identificador (c:cs)
    | numUtenteConsulta c == identificador = 1 + contarConsultasPaciente identificador cs
    | otherwise = contarConsultasPaciente identificador cs

-- Mostra os pacientes sem consultas
pacientesSemConsultas :: [Paciente] -> [Consulta] -> [Paciente]
pacientesSemConsultas [] _ = []
pacientesSemConsultas (p:ps) cs
    | contarConsultasPaciente (numUtente p) cs == 0 =
        p : pacientesSemConsultas ps cs
    | otherwise =
        pacientesSemConsultas ps cs

