
module Consultas
    ( procurarPaciente,
      consultasDoPaciente,
      contarConsultasPaciente
    ) where

import Model

procurarPaciente :: NumUtente -> [Paciente] -> Maybe Paciente
procurarPaciente _ [] = Nothing
procurarPaciente identificador (p:ps)
    | numUtente p == identificador = Just p
    | otherwise = procurarPaciente identificador ps

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