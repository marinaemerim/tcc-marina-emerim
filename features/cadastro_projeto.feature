@RF02
Feature: Cadastro, edição e consulta de projetos
  Como membro da equipe de um projeto
  Quero cadastrar, editar e consultar os projetos ambientais
  Para que suas informações fiquem centralizadas e organizadas por tipo de estudo

  Background:
    Given "ana@ambiens.com.br" está autenticada

  Scenario: Cadastrar projeto com os dados obrigatórios
    When ela cadastra um projeto com:
      | campo              | valor                                    |
      | número do contrato | 2024-015                                 |
      | nome               | EIA/RIMA Loteamento Morro das Pedras     |
      | cliente            | Construtora Exemplo Ltda.                |
      | município          | Florianópolis                            |
      | tipo de estudo     | EIA/RIMA – Estudo de Impacto Ambiental   |
    Then o projeto "2024-015" é salvo com sucesso
    And ele aparece na lista de projetos

  Scenario: Cadastrar projeto sem um dado obrigatório
    When ela tenta cadastrar um projeto sem informar o número do contrato
    Then o cadastro é recusado
    And o campo "número do contrato" é indicado como obrigatório

  Scenario: Cadastrar projeto com número de contrato já existente
    Given já existe o projeto de contrato "2024-015"
    When ela tenta cadastrar outro projeto com o contrato "2024-015"
    Then o cadastro é recusado
    And a mensagem "Já existe um projeto com este número de contrato" é exibida

  Scenario: Tipos de estudo disponíveis no cadastro
    When ela abre o formulário de cadastro de projeto
    Then as opções de tipo de estudo são:
      | tipo de estudo                                         |
      | EVA – Estudo de Viabilidade Ambiental                  |
      | DIA – Diagnóstico e Viabilidade Ambiental              |
      | RAP – Relatório Ambiental Prévio                       |
      | EAS – Estudo Ambiental Simplificado                    |
      | EIA/RIMA – Estudo de Impacto Ambiental                 |
      | EIV – Estudo de Impacto de Vizinhança                  |
      | IF – Inventário Florestal                              |
      | PRAD – Plano de Recuperação de Área Degradada          |

  Scenario Outline: Classificar o projeto pelo tipo de estudo
    When ela cadastra o projeto de contrato "<contrato>" com o tipo de estudo "<tipo de estudo>"
    Then o projeto "<contrato>" fica classificado como "<tipo de estudo>"

    Examples:
      | contrato | tipo de estudo                                 |
      | 2024-015 | EIA/RIMA – Estudo de Impacto Ambiental         |
      | 2023-042 | RAP – Relatório Ambiental Prévio               |
      | 2025-003 | PRAD – Plano de Recuperação de Área Degradada  |

  Scenario: Editar os dados de um projeto
    Given existe o projeto de contrato "2024-015" no município "Florianópolis"
    When ela altera o município do projeto "2024-015" para "Palhoça"
    Then o projeto "2024-015" passa a ter o município "Palhoça"

  Scenario: Consultar os dados de um projeto
    Given existe o projeto de contrato "2024-015" com nome "EIA/RIMA Loteamento Morro das Pedras"
    When ela abre o projeto "2024-015"
    Then são exibidos o número do contrato, o nome, o cliente, o município e o tipo de estudo
