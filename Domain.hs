
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

procurarMedicoId :: IdMedico -> [Medico] -> Maybe Medico
procurarMedicoId idM =
    foldr (\m acc -> if idMedico m == idM then Just m else acc) Nothing

registarMedico :: Medico -> [Medico] -> Either String [Medico]
registarMedico medico medicos =
    case procurarMedicoId (idMedico medico) medicos of
        Just _  -> Left ("Ja existe um medico com o ID " ++ show (idMedico medico) ++ ".")
        Nothing -> Right (medico : medicos)

pesquisarMedicoEspecialidade :: String -> [Medico] -> [Medico]
pesquisarMedicoEspecialidade esp =
    filter (\m -> especialidade m == esp)

consultasDoMedico :: IdMedico -> [Consulta] -> [Consulta]
consultasDoMedico idM =
    filter (\c -> idMedicoConsulta c == idM)

contarConsultasMedico :: IdMedico -> [Consulta] -> Int
contarConsultasMedico idM =
    foldl (\acc c -> if idMedicoConsulta c == idM then acc + 1 else acc) 0

filtrarConsultasPorEspecialidade :: String -> [Medico] -> [Consulta] -> [Consulta]
filtrarConsultasPorEspecialidade esp medicos =
    filter consultaDaEspecialidade
  where
    idsEspecialidade :: [IdMedico]
    idsEspecialidade = map idMedico (pesquisarMedicoEspecialidade esp medicos)

    consultaDaEspecialidade :: Consulta -> Bool
    consultaDaEspecialidade c = idMedicoConsulta c `elem` idsEspecialidade

-- Consideramos ocupado se existir consulta não cancelada nesse dia e hora
medicoOcupadoEm :: IdMedico -> String -> String -> [Consulta] -> Bool
medicoOcupadoEm idM dia hora =
    any (\c -> idMedicoConsulta c == idM
            && dataConsulta c == dia
            && horaConsulta c == hora
            && estadoConsulta c /= Cancelada)
            
medicosDisponiveis :: String -> String -> [Medico] -> [Consulta] -> [Medico]
medicosDisponiveis dia hora medicos consultas =
    filter (\m -> not (medicoOcupadoEm (idMedico m) dia hora consultas)) medicos