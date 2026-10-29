@RF03
Feature: Documentos do projeto
  Como membro da equipe de um projeto
  Quero associar documentos ao projeto e consultá-los
  Para que relatórios e arquivos fiquem centralizados junto ao respectivo projeto

  Background:
    Given "ana@ambiens.com.br" está autenticada
    And existe o projeto de contrato "2024-015"

  Scenario Outline: Associar documento ao projeto
    When ela associa o arquivo "<arquivo>" ao projeto "2024-015"
    Then o arquivo "<arquivo>" aparece na lista de documentos do projeto

    Examples:
      | arquivo                   |
      | relatorio_meio_fisico.pdf |
      | diagnostico_biotico.docx  |
      | inventario_gee.xlsx       |

  Scenario: Consultar os documentos de um projeto
    Given o projeto "2024-015" possui os documentos "relatorio_meio_fisico.pdf" e "diagnostico_biotico.docx"
    When ela abre os documentos do projeto "2024-015"
    Then os dois documentos são listados com nome e data de envio

  Scenario: Baixar um documento
    Given o projeto "2024-015" possui o documento "relatorio_meio_fisico.pdf"
    When ela baixa o documento "relatorio_meio_fisico.pdf"
    Then o arquivo recebido é igual ao arquivo enviado

  Scenario: Documentos ficam restritos ao seu projeto
    Given o projeto "2024-015" possui o documento "relatorio_meio_fisico.pdf"
    And existe o projeto de contrato "2025-003" sem documentos
    When ela abre os documentos do projeto "2025-003"
    Then nenhum documento é listado
