module Model
    ( Paciente(..)
    , EstadoConsulta(..)
    , Consulta(..)
    ) where

-- | Dados que identificam um paciente.
data Paciente = Paciente
    { idPaciente       :: Int
    , nomePaciente     :: String
    , idadePaciente    :: Int
    , contactoPaciente :: Maybe String
    } deriving (Show, Eq)

-- | Estados possíveis de uma consulta.
data EstadoConsulta
    = Marcada
    | Realizada
    | Cancelada
    deriving (Show, Eq)

-- | Dados de uma consulta hospitalar.
data Consulta = Consulta
    { idConsulta          :: Int
    , dataConsulta        :: String
    , horaConsulta        :: String
    , pacienteAssociado   :: Int
    , nomeMedico          :: String
    , especialidade       :: String
    , estadoConsulta      :: EstadoConsulta
    } deriving (Show, Eq)
