# Cenários marcados com @escopo-relatorio vêm do Escopo do relatório,
# mas ainda não têm requisito correspondente na planilha.
Feature: Mapa interativo dos projetos
  Como colaborador da Ambiens
  Quero visualizar os projetos no mapa e consultar suas informações
  Para localizar estudos sem precisar de conhecimento em geoprocessamento

  Background:
    Given "ana@ambiens.com.br" está autenticada
    And o projeto "2024-015" possui a área "Limite da área" em Florianópolis

  @RF05
  Scenario: Visualizar as áreas dos projetos no mapa
    When ela abre o mapa
    Then a área "Limite da área" é exibida na sua localização em Florianópolis

  @RF05
  Scenario: O mapa não permite editar geometrias
    When ela abre o mapa
    Then não há opção para desenhar, mover ou excluir áreas

  @RF07
  Scenario: Consultar um projeto ao selecionar sua área no mapa
    When ela seleciona a área "Limite da área" no mapa
    Then são exibidos o número do contrato, o nome, o cliente e o tipo de estudo do projeto "2024-015"
    And é exibida uma opção para acessar os demais dados e documentos do projeto

  @RF07
  Scenario: Acessar o projeto a partir do mapa
    Given ela selecionou a área "Limite da área" no mapa
    When ela escolhe acessar os dados do projeto
    Then a página do projeto "2024-015" é aberta com seus dados e documentos

  @escopo-relatorio
  Scenario: Alternar o mapa base
    When ela seleciona o mapa base "Satélite"
    Then o mapa passa a exibir a imagem de satélite
    And as áreas dos projetos continuam visíveis

  @escopo-relatorio
  Scenario: Localizar um ponto por coordenadas
    When ela busca as coordenadas "-27.6600, -48.4800"
    Then o mapa é centralizado nessas coordenadas
    And um marcador é exibido no ponto informado
