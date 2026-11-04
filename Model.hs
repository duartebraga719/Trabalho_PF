
module Model
( 
    Paciente(..),
    EstadoConsulta(..),
    Consulta(..)
) where

data Paciente = Paciente
{
    idPaciente :: Int,
    nomePaciente :: String,
    idadePaciente :: Int,
    contactoPaciente :: String
} deriving (Show, Eq)

data EstadoConsulta
    = Marcada
    | Realizada
    | Cancelada
    deriving (Show, Eq)

data Consulta = Consulta
{
    idConsulta :: Int, 
    dataConsulta :: String, 
    horaConsulta :: String,
    pacienteAssociado :: Int,
    nomeMedico :: String,
    especialidade :: String,
    estadoConsulta :: EstadoConsulta
} deriving (Show, Eq)