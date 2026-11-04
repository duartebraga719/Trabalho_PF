
import Model

module Consultas
(
    procurarPaciente,
    consultasDoPaciente,
    contarConsultasPaciente
) where

procurarPaciente :: Int -> Paciente
procurarPaciente _ [] = Nothing
procurarPaciente identificador (p:ps)
    | idPaciente p == identificador = Just p
    | otherwise = procurarPaciente identificador ps

consultasDoPaciente :: Int -> [Consulta] -> [Consulta]
consultasDoPaciente _ [] = []
consultasDoPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = c : consultasDoPaciente identificador cs
    | otherwise = consultasDoPaciente identificador cs

contarConsultasPaciente :: Int -> [Consulta] -> Int
contarConsultasPaciente _ [] = 0
contarConsultasPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = 1 + contarConsultasPaciente identificador cs
    | otherwise = contarConsultasPaciente identificador cs