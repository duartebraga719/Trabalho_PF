
module Model where

data EstadoConsulta = Marcada | Realizada | Cancelada
    deriving (Show, Eq)

type NumUtente = String
type IdMedico = Int

data Paciente = Paciente
    { 
        numUtente :: NumUtente,
        nomePaciente :: String,
        idadePaciente :: Int,
        contactoPaciente :: String
    } deriving (Show, Eq)

data Medico = Medico
    { 
        idMedico     :: IdMedico,
        nomeMedico   :: String,
        especialidade :: String
    } deriving (Show, Eq)

data Consulta = Consulta
    { 
        idConsulta        :: Int,
        dataConsulta      :: String,
        horaConsulta      :: String,
        numUtenteConsulta :: NumUtente,
        idMedicoConsulta  :: IdMedico,
        estadoConsulta    :: EstadoConsulta
    } deriving (Show, Eq)

pacientesExemplo = 
    [ 
        Paciente "157078146" "Ana Martins" 34 "910000001",
        Paciente "163200867" "Joao Ribeiro" 52 "910000002",
        Paciente "156243581" "Maria Costa" 27 "910000003"
    ]

medicosExemplo =
    [ 
        Medico 1 "Dr. Rui Lopes" "Cardiologia",
        Medico 2 "Dra. Ines Silva" "Oftalmologia",
        Medico 3 "Dra. Marta Reis" "Dermatologia"
    ]

consultasExemplo = 
    [ 
        Consulta 101 "2026-11-05" "09:00" "157078146" 1 Marcada,
        Consulta 102 "2026-11-05" "10:30" "163200867" 2 Marcada,
        Consulta 103 "2026-11-07" "11:00" "157078146" 1 Realizada,
        Consulta 104 "2026-11-08" "14:00" "156243581" 3 Cancelada
    ]