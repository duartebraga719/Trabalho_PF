# Sistema de Gestão de Consultas Hospitalares — Fase 1

**Unidade curricular:** Programação Funcional  
**Linguagem:** Haskell  
**Fase:** 1 — Modelação e núcleo funcional  
**Elementos do grupo:** Duarte Braga, Rui Teixeira, Tomás Teixeira
**Data:** 03/11/2026

## 1. Descrição do projeto

O projeto consiste no desenvolvimento de uma aplicação simples para apoiar a gestão de pacientes e consultas hospitalares. Nesta primeira fase, o objetivo é estabelecer o modelo de dados, organizar o código em módulos e implementar as primeiras funções puras que permitem procurar pacientes e obter as consultas associadas a um paciente.

Todos os dados incluídos no projeto são fictícios e destinam-se apenas a testes.

## 2. Objetivos da Fase 1

- Definir os tipos de dados principais do domínio.
- Representar a relação entre pacientes e consultas.
- Organizar o código em módulos com responsabilidades distintas.
- Implementar funções puras para procurar um paciente, listar as suas consultas e contar essas consultas.
- Demonstrar o uso de pattern matching e recursão.
- Disponibilizar dados de exemplo e instruções para executar o projeto.

## 3. Modelo de domínio

### Paciente

Cada paciente é representado por um identificador, nome, idade e contacto opcional.

### Consulta

Cada consulta possui um identificador próprio, data, hora, identificador do paciente associado, nome do médico, especialidade e estado.

Os estados possíveis são `Marcada`, `Realizada` e `Cancelada`. Um paciente pode estar associado a várias consultas. A consulta guarda o identificador do paciente, permitindo estabelecer essa relação sem criar uma terceira entidade nesta fase.

## 4. Estrutura do projeto

```text
Sistema_Gestao_Consultas_Hospitalares_Fase1/
├── README.md
├── docs/
│   └── Relatorio_Fase1.md
├── app/
│   └── Main.hs
├── src/
│   ├── Model.hs
│   ├── DadosExemplo.hs
│   └── Consultas.hs
└── test/
    └── TestesFase1.hs
```

- `Model.hs`: define os tipos de dados do domínio.
- `DadosExemplo.hs`: contém dados fictícios para demonstração.
- `Consultas.hs`: contém as funções puras principais, incluindo funções recursivas.
- `Main.hs`: apresenta uma demonstração simples no terminal.
- `TestesFase1.hs`: contém testes básicos das funções da Fase 1.

## 5. Compilação e execução

É necessário ter o compilador GHC instalado.

A partir da pasta principal do projeto, executar:

```bash
ghc -isrc app/Main.hs -o gestao-consultas
```

Depois, executar o programa:

**Linux/macOS:**
```bash
./gestao-consultas
```

**Windows (PowerShell ou CMD):**
```powershell
.\gestao-consultas.exe
```

## 6. Executar os testes

A partir da pasta principal:

```bash
ghc -isrc test/TestesFase1.hs -o testes-fase1
```

Depois executar `./testes-fase1` em Linux/macOS ou `.\testes-fase1.exe` em Windows. Se os testes forem concluídos sem erro, será apresentada a mensagem de sucesso.

## 7. Âmbito desta fase

Esta versão corresponde apenas à Fase 1. Inclui o modelo, dados de demonstração e funções puras iniciais. Ainda não inclui menu interativo, leitura/escrita de ficheiros, edição de registos, validações completas ou estatísticas avançadas, que poderão ser desenvolvidos nas fases seguintes.
