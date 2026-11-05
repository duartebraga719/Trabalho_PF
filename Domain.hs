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

-- Procura um paciente pelo seu id
-- Usa pattern matching e recursão sobre a lista de pacientes
procurarPacienteId :: Int -> [Paciente] -> Paciente
procurarPacienteId _ [] = Paciente 0 "Paciente inexistente" 0 ""
procurarPacienteId identificador (p:ps)
    | idPaciente p == identificador = p
    | otherwise = procurarPacienteId identificador ps

-- Devolve todas as consultas associadas a um paciente
-- A função percorre recursivamente a lista de consultas
consultasDoPaciente :: Int -> [Consulta] -> [Consulta]
consultasDoPaciente _ [] = []
consultasDoPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = c : consultasDoPaciente identificador cs
    | otherwise = consultasDoPaciente identificador cs

-- Conta recursivamente quantas consultas estão associadas a um paciente
contarConsultasPaciente :: Int -> [Consulta] -> Int
contarConsultasPaciente _ [] = 0
contarConsultasPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = 1 + contarConsultasPaciente identificador cs
    | otherwise = contarConsultasPaciente identificador cs

-- Mostra os pacientes sem consultas
pacientesSemConsultas :: [Paciente] -> [Consulta] -> [Paciente]
pacientesSemConsultas [] _ = []
pacientesSemConsultas (p:ps) cs
    | contarConsultasPaciente (idPaciente p) cs == 0 =
        p : pacientesSemConsultas ps cs
    | otherwise =
        pacientesSemConsultas ps cs

