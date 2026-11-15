
module Main where

import Model
import Consultas

main :: IO ()
main = do
    putStrLn "=== Sistema de Gestao de Consultas Hospitalares ==="
    putStrLn "Demonstracao da Fase 1"
    putStrLn ""

    putStrLn "Paciente com ID 157078146:"
    case procurarPaciente "157078146" pacientesExemplo of
        Just p  -> print p
        Nothing -> putStrLn "Paciente inexistente."

    putStrLn ""
    putStrLn "Consultas associadas ao paciente com ID 157078146:"
    mapM_ print (consultasDoPaciente "157078146" consultasExemplo)

    putStrLn ""
    putStrLn "Numero de consultas associadas ao paciente com ID 157078146:"
    print (contarConsultasPaciente "157078146" consultasExemplo)

    putStrLn ""
    putStrLn "Pesquisa de um ID inexistente (99):"
    case procurarPaciente "99" pacientesExemplo of
        Just p  -> print p
        Nothing -> putStrLn "Paciente inexistente."