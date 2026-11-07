module Model where

data EstadoConsulta = Marcada | Realizada | Cancelada
    deriving (Show, Eq)

type NumUtente = String

data Paciente = Paciente
    { numUtente        :: NumUtente
    , nomePaciente     :: String
    , idadePaciente    :: Int
    , contactoPaciente :: String
    } deriving (Show, Eq)

data Consulta = Consulta
    { idConsulta          :: Int
    , dataConsulta        :: String
    , horaConsulta        :: String
    , numUtenteConsulta   :: NumUtente
    , nomeMedico          :: String
    , especialidade       :: String
    , estadoConsulta      :: EstadoConsulta
    } deriving (Show, Eq)


--Dados de exmplo
pacientesExemplo = [ Paciente "157078146" "Ana Martins" 34 "910000001"
                   , Paciente "163200867" "Joao Ribeiro" 52 "910000002"
                   , Paciente "156243581" "Maria Costa" 27 "910000003"
                    ]


consultasExemplo = [ Consulta 101 "2026-11-05" "09:00" "157078146" "Dr. Rui Lopes" "Cardiologia" Marcada
                   , Consulta 102 "2026-11-05" "10:30" "163200867" "Dra. Ines Silva" "Oftalmologia" Marcada
                   , Consulta 103 "2026-11-07" "11:00" "157078146" "Dr. Rui Lopes" "Cardiologia" Realizada
                   , Consulta 104 "2026-11-08" "14:00" "156243581" "Dra. Marta Reis" "Dermatologia" Cancelada
                    ]
