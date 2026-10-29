# language: pt
Funcionalidade: Consulta de projetos
  Como colaborador da Ambiens
  Quero pesquisar projetos por diferentes critérios
  Para encontrar rapidamente estudos já realizados

  Contexto:
    Dado que "ana.souza" está autenticada
    E que existem os projetos:
      | contrato | nome                            | contratante               | município     | tipo de estudo             |
      | 2024-015 | EIA Loteamento Morro das Pedras | Construtora Exemplo Ltda. | Florianópolis | Estudo Ambiental           |
      | 2023-042 | PCA Porto Belo                  | Porto Sul S.A.            | Porto Belo    | Plano de Controle Ambiental |
      | 2025-003 | Monitoramento Morro das Pedras  | Construtora Exemplo Ltda. | Florianópolis | Monitoramento              |

  Esquema do Cenário: Pesquisar projetos por critério
    Quando ela pesquisa projetos por <critério> "<valor>"
    Então os projetos de contrato "<resultado>" são exibidos

    Exemplos:
      | critério           | valor                     | resultado          |
      | número do contrato | 2024-015                  | 2024-015           |
      | nome               | Morro das Pedras          | 2024-015, 2025-003 |
      | contratante        | Construtora Exemplo Ltda. | 2024-015, 2025-003 |
      | município          | Porto Belo                | 2023-042           |
      | tipo de estudo     | Monitoramento             | 2025-003           |

  Cenário: Pesquisa sem resultados
    Quando ela pesquisa projetos por número do contrato "9999-999"
    Então nenhum projeto é exibido
    E a mensagem "Nenhum projeto encontrado" é exibida

  Cenário: Selecionar um resultado da pesquisa
    Quando ela pesquisa projetos por número do contrato "2023-042"
    E seleciona o projeto "2023-042" nos resultados
    Então o mapa é centralizado nas áreas do projeto "2023-042"
