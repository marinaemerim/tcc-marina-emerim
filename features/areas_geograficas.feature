# DECISÃO PENDENTE: o RF04 pede um único formato para o protótipo.
# Os cenários usam KMZ. A tabela da Ambiens (Banco Georreferenciado) indica
# que os dados vêm em shapefile ou KMZ; confirmar qual será o formato do protótipo.
@RF04
Feature: Importação de dados geográficos do projeto
  Como membro da equipe de um projeto
  Quero importar os dados vetoriais produzidos no QGIS
  Para que as camadas do projeto fiquem associadas a ele e armazenadas na plataforma

  Background:
    Given "ana@ambiens.com.br" está autenticada
    And existe o projeto de contrato "2024-015"

  Scenario Outline: Importar camadas com diferentes tipos de geometria
    When ela importa no projeto "2024-015" a camada "<camada>" com o arquivo "<arquivo>"
    Then a camada "<camada>" fica associada ao projeto "2024-015"
    And a camada é armazenada com geometria do tipo "<geometria>"

    Examples:
      | camada               | arquivo                   | geometria |
      | Limite da área       | limite_area.kmz           | Polígono  |
      | Cursos d'água        | cursos_dagua.kmz          | Linha     |
      | Nascentes            | nascentes.kmz             | Ponto     |

  Scenario: Projeto com várias camadas
    When ela importa no projeto "2024-015" as camadas:
      | camada                | arquivo                    |
      | Limite da área        | limite_area.kmz            |
      | Restrições ambientais | restricoes_ambientais.kmz  |
    Then o projeto "2024-015" passa a ter 2 camadas, cada uma com seu nome

  Scenario: Importar arquivo em formato não suportado
    When ela tenta importar no projeto "2024-015" o arquivo "limite_area.dwg"
    Then a importação é recusada
    And a mensagem "Formato não suportado. Envie um arquivo KMZ" é exibida

  Scenario: Importar arquivo sem geometria válida
    When ela tenta importar no projeto "2024-015" o arquivo "limite_corrompido.kmz"
    Then a importação é recusada
    And a mensagem "Não foi possível ler a geometria do arquivo" é exibida
