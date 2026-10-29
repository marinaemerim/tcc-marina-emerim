@RF08
Feature: Controle de acesso aos projetos
  Como administrador da plataforma
  Quero autorizar ou remover os e-mails com acesso a cada projeto
  Para que cada usuário visualize apenas os projetos aos quais tem acesso

  Background:
    Given "admin@ambiens.com.br" é administrador da plataforma
    And existem os projetos de contrato "2024-015" e "2023-042"
    And "ana@ambiens.com.br" tem acesso apenas ao projeto "2024-015"

  Scenario: Usuário visualiza apenas os projetos autorizados
    Given "ana@ambiens.com.br" está autenticada
    When ela abre a lista de projetos
    Then o projeto "2024-015" é exibido
    But o projeto "2023-042" não é exibido

  Scenario: Usuário não vê no mapa as áreas de projetos não autorizados
    Given "ana@ambiens.com.br" está autenticada
    When ela abre o mapa
    Then as áreas do projeto "2024-015" são exibidas
    But as áreas do projeto "2023-042" não são exibidas

  Scenario: Usuário tenta abrir diretamente um projeto não autorizado
    Given "ana@ambiens.com.br" está autenticada
    When ela tenta abrir o projeto "2023-042" pelo endereço da página
    Then o acesso é negado
    And a mensagem "Você não tem acesso a este projeto" é exibida

  Scenario: Administrador autoriza um e-mail em um projeto
    Given "admin@ambiens.com.br" está autenticado
    When ele autoriza o e-mail "ana@ambiens.com.br" no projeto "2023-042"
    Then "ana@ambiens.com.br" passa a visualizar o projeto "2023-042"

  Scenario: Administrador remove um e-mail de um projeto
    Given "admin@ambiens.com.br" está autenticado
    When ele remove o e-mail "ana@ambiens.com.br" do projeto "2024-015"
    Then "ana@ambiens.com.br" deixa de visualizar o projeto "2024-015"

  Scenario: Usuário comum não gerencia autorizações
    Given "ana@ambiens.com.br" está autenticada
    When ela tenta autorizar o e-mail "joao@ambiens.com.br" no projeto "2024-015"
    Then a operação é negada
