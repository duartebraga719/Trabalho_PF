
module Domain where

import Model

registarPaciente :: Paciente -> [Paciente] -> [Paciente]
registarPaciente paciente pacientes =
    case procurarPacienteNUt (numUtente paciente) pacientes of
        Just _  -> pacientes
        Nothing -> paciente : pacientes

pesquisarPacienteNome :: String -> [Paciente] -> [Paciente]
pesquisarPacienteNome _ [] = []
pesquisarPacienteNome nome (p:ps)
    | nomePaciente p == nome = p : pesquisarPacienteNome nome ps
    | otherwise = pesquisarPacienteNome nome ps

procurarPacienteNUt :: NumUtente -> [Paciente] -> Maybe Paciente
procurarPacienteNUt _ [] = Nothing
procurarPacienteNUt identificador (p:ps)
    | numUtente p == identificador = Just p
    | otherwise = procurarPacienteNUt identificador ps

consultasDoPaciente :: NumUtente -> [Consulta] -> [Consulta]
consultasDoPaciente _ [] = []
consultasDoPaciente identificador (c:cs)
    | numUtenteConsulta c == identificador = c : consultasDoPaciente identificador cs
    | otherwise = consultasDoPaciente identificador cs

contarConsultasPaciente :: NumUtente -> [Consulta] -> Int
contarConsultasPaciente _ [] = 0
contarConsultasPaciente identificador (c:cs)
    | numUtenteConsulta c == identificador = 1 + contarConsultasPaciente identificador cs
    | otherwise = contarConsultasPaciente identificador cs

pacientesSemConsultas :: [Paciente] -> [Consulta] -> [Paciente]
pacientesSemConsultas [] _ = []
pacientesSemConsultas (p:ps) cs
    | contarConsultasPaciente (numUtente p) cs == 0 =
        p : pacientesSemConsultas ps cs
    | otherwise =
        pacientesSemConsultas ps cs 