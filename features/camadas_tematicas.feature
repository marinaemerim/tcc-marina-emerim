# Origem: matriz Estudo x Dado (Banco_Georreferenciado_Ambiens.xlsx), que organiza
# cada dado por estudo -> meio -> tema.
@RF09
Feature: Classificação e filtro de camadas por meio e tema
  Como colaborador da Ambiens
  Quero classificar as camadas de cada projeto por meio e tema
  Para exibir no mapa apenas os dados que interessam à análise

  Background:
    Given "ana@ambiens.com.br" está autenticada
    And existe o projeto de contrato "2024-015"

  Scenario Outline: Classificar uma camada ao importá-la
    When ela importa no projeto "2024-015" a camada "<camada>" com o meio "<meio>" e o tema "<tema>"
    Then a camada "<camada>" fica classificada no meio "<meio>" e no tema "<tema>"

    Examples:
      | camada                | meio           | tema           |
      | Cursos d'água         | Físico         | Hidrografia    |
      | Fitofisionomias       | Biótico        | Vegetação      |
      | Uso do solo           | Socioeconômico | Uso e ocupação |
      | Restrições ambientais | Restrições     | Ambientais     |

  Scenario: Importar camada sem informar o meio
    When ela tenta importar no projeto "2024-015" a camada "Nascentes" sem informar o meio
    Then a importação é recusada
    And o campo "meio" é indicado como obrigatório

  Scenario: Camadas agrupadas por meio no controle do mapa
    Given o projeto "2024-015" possui as camadas:
      | camada          | meio    | tema        |
      | Cursos d'água   | Físico  | Hidrografia |
      | Nascentes       | Físico  | Hidrografia |
      | Fitofisionomias | Biótico | Vegetação   |
    When ela abre o controle de camadas do mapa
    Then as camadas "Cursos d'água" e "Nascentes" aparecem no grupo "Físico"
    And a camada "Fitofisionomias" aparece no grupo "Biótico"

  Scenario: Exibir apenas as camadas de um meio
    Given o projeto "2024-015" possui camadas dos meios "Físico" e "Biótico"
    When ela desliga o grupo "Biótico" no controle de camadas
    Then apenas as camadas do meio "Físico" são exibidas no mapa

  Scenario: Exibir apenas as camadas de um tema
    Given o projeto "2024-015" possui camadas dos temas "Hidrografia" e "Vegetação"
    When ela filtra o mapa pelo tema "Hidrografia"
    Then apenas as camadas do tema "Hidrografia" são exibidas no mapa
