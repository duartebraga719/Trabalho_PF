
module Main where

import Model
import Domain

-- op 1
verPacientePorNut :: IO ()
verPacientePorNut = do
    putStrLn "Insira o numero de utente:"
    nut <- getLine
    case procurarPacienteNUt nut pacientesExemplo of
        Just p  -> print p
        Nothing -> putStrLn "O paciente procurado nao foi encontrado."

-- op 2
verConsultasPaciente :: IO ()
verConsultasPaciente = do
    putStrLn "Insira o numero de utente:"
    nut <- getLine
    let lista = consultasDoPaciente nut consultasExemplo
    mapM_ print lista

-- op 3
verTotalConsultasPaciente :: IO ()
verTotalConsultasPaciente = do
    putStrLn "Insira o numero de utente:"
    nut <- getLine
    let total = contarConsultasPaciente nut consultasExemplo
    print total

-- op 4
verPacientesSemConsultas :: IO ()
verPacientesSemConsultas = do
    let semConsultas = pacientesSemConsultas pacientesExemplo consultasExemplo
    if null semConsultas
        then putStrLn "Nao existem pacientes sem consultas."
        else mapM_ print semConsultas

-- op 5
verMedicosDisponiveis :: IO ()
verMedicosDisponiveis = do
    putStrLn "Insira o dia (AAAA-MM-DD):"
    dia <- getLine
    putStrLn "Insira a hora (HH:MM):"
    hora <- getLine
    let disponiveis = medicosDisponiveis dia hora medicosExemplo consultasExemplo
    mapM_ print disponiveis

-- op 6
verConsultasEspecialidade :: IO ()
verConsultasEspecialidade = do
    putStrLn "Insira a especialidade:"
    esp <- getLine
    let filtradas = filtrarConsultasPorEspecialidade esp medicosExemplo consultasExemplo
    mapM_ print filtradas

-- op 7
main :: IO ()
main = do
    putStrLn "--------------------------------------------"
    putStrLn "                    Menu                    "
    putStrLn "--------------------------------------------"
    putStrLn "(1) Procurar paciente por numero de utente"
    putStrLn "(2) Listar consultas de um paciente"
    putStrLn "(3) Contar consultas de um paciente"
    putStrLn "(4) Listar pacientes sem consultas"
    putStrLn "(5) Listar medicos disponiveis por dia e hora"
    putStrLn "(6) Filtrar consultas por especialidade\n"
    putStrLn "(0) Sair"
    putStrLn "--------------------------------------------"

    putStrLn "Insira a opcao:"
    opcao <- getLine
    escolherOpcao opcao

escolherOpcao :: String -> IO ()
escolherOpcao opcao
    | opcao == "1" = do
                     verPacientePorNut
                     main
    | opcao == "2" = do
                     verConsultasPaciente
                     main
    | opcao == "3" = do
                     verTotalConsultasPaciente
                     main
    | opcao == "4" = do
                     verPacientesSemConsultas
                     main
    | opcao == "5" = do
                     verMedicosDisponiveis
                     main
    | opcao == "6" = do
                     verConsultasEspecialidade
                     main
    | opcao == "0" = putStrLn "A sair do programa!"
    | otherwise    = do
                     putStrLn "Opcao invalida."
                     main