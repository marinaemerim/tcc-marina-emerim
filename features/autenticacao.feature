@RF01
Feature: Autenticação com conta Google
  Como colaborador da Ambiens
  Quero entrar na plataforma com minha conta Google autorizada
  Para que apenas pessoas autorizadas consultem os dados dos projetos

  Background:
    Given o e-mail "ana@ambiens.com.br" está autorizado na plataforma

  Scenario: Entrar com uma conta Google autorizada
    When o usuário entra com a conta Google "ana@ambiens.com.br"
    Then o acesso à plataforma é liberado
    And o mapa de projetos é exibido

  Scenario: Entrar com uma conta Google não autorizada
    When o usuário entra com a conta Google "visitante@gmail.com"
    Then o acesso à plataforma é negado
    And a mensagem "Esta conta não tem permissão para acessar a plataforma" é exibida

  Scenario: Acessar uma página interna sem estar autenticado
    Given o usuário não está autenticado
    When ele tenta acessar a página de projetos
    Then ele é redirecionado para a tela de login

  Scenario: Sair da plataforma
    Given "ana@ambiens.com.br" está autenticada
    When ela sai da plataforma
    Then ela é redirecionada para a tela de login
    And não consegue mais acessar a página de projetos
