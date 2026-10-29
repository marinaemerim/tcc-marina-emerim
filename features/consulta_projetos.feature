@RF06
Feature: Pesquisa e filtro de projetos
  Como colaborador da Ambiens
  Quero pesquisar e filtrar projetos por diferentes critérios
  Para encontrar rapidamente estudos já realizados

  Background:
    Given "ana@ambiens.com.br" está autenticada e tem acesso a todos os projetos
    And existem os projetos:
      | contrato | nome                                 | cliente                   | município     | tipo de estudo                                |
      | 2024-015 | EIA/RIMA Loteamento Morro das Pedras | Construtora Exemplo Ltda. | Florianópolis | EIA/RIMA – Estudo de Impacto Ambiental        |
      | 2023-042 | RAP Marina Porto Belo                | Porto Sul S.A.            | Porto Belo    | RAP – Relatório Ambiental Prévio              |
      | 2025-003 | PRAD Morro das Pedras                | Construtora Exemplo Ltda. | Florianópolis | PRAD – Plano de Recuperação de Área Degradada |

  Scenario Outline: Pesquisar projetos por um critério
    When ela pesquisa projetos por <critério> "<valor>"
    Then os projetos de contrato "<resultado>" são exibidos

    Examples:
      | critério           | valor                                         | resultado          |
      | nome               | Morro das Pedras                              | 2024-015, 2025-003 |
      | número do contrato | 2023-042                                      | 2023-042           |
      | cliente            | Construtora Exemplo Ltda.                     | 2024-015, 2025-003 |
      | município          | Porto Belo                                    | 2023-042           |
      | tipo de estudo     | PRAD – Plano de Recuperação de Área Degradada | 2025-003           |

  Scenario: Combinar filtros
    When ela filtra projetos pelo município "Florianópolis" e pelo tipo de estudo "EIA/RIMA – Estudo de Impacto Ambiental"
    Then apenas o projeto "2024-015" é exibido

  Scenario: Pesquisa sem resultados
    When ela pesquisa projetos por número do contrato "9999-999"
    Then nenhum projeto é exibido
    And a mensagem "Nenhum projeto encontrado" é exibida
