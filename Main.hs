
module Main where

import Model
import DadosExemplo
import Consultas

main :: IO ()
main = do
    putStrLn "=== Sistema de Gestao de Consultas Hospitalares ==="
    putStrLn "Demonstracao da Fase 1"
    putStrLn ""

    putStrLn "Paciente com ID 1:"
    print (procurarPaciente 1 pacientesExemplo)

    putStrLn ""
    putStrLn "Consultas associadas ao paciente com ID 1:"
    mapM_ print (consultasDoPaciente 1 consultasExemplo)

    putStrLn ""
    putStrLn "Numero de consultas associadas ao paciente com ID 1:"
    print (contarConsultasPaciente 1 consultasExemplo)

    putStrLn ""
    putStrLn "Pesquisa de um ID inexistente (99):"
    print (procurarPaciente 99 pacientesExemplo)
