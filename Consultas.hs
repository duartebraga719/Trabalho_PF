module Consultas
    ( procurarPaciente
    , consultasDoPaciente
    , contarConsultasPaciente
    ) where

import Model

-- | Procura um paciente pelo seu identificador.
-- Usa pattern matching e recursão sobre a lista de pacientes.
procurarPaciente :: Int -> [Paciente] -> Maybe Paciente
procurarPaciente _ [] = Nothing
procurarPaciente identificador (p:ps)
    | idPaciente p == identificador = Just p
    | otherwise = procurarPaciente identificador ps

-- | Devolve todas as consultas associadas a um paciente.
-- A função percorre recursivamente a lista de consultas.
consultasDoPaciente :: Int -> [Consulta] -> [Consulta]
consultasDoPaciente _ [] = []
consultasDoPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = c : consultasDoPaciente identificador cs
    | otherwise = consultasDoPaciente identificador cs

-- | Conta recursivamente quantas consultas estão associadas a um paciente.
contarConsultasPaciente :: Int -> [Consulta] -> Int
contarConsultasPaciente _ [] = 0
contarConsultasPaciente identificador (c:cs)
    | pacienteAssociado c == identificador = 1 + contarConsultasPaciente identificador cs
    | otherwise = contarConsultasPaciente identificador cs
