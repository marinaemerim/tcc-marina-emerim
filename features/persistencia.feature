@RNF04
Feature: Persistência dos dados
  Como colaborador da Ambiens
  Quero que os dados cadastrados continuem disponíveis
  Para não perder informações quando a aplicação for reiniciada

  Scenario: Dados permanecem após reiniciar a aplicação
    Given existe o projeto de contrato "2024-015" com a área "Limite da área" e o documento "relatorio_meio_fisico.pdf"
    When a aplicação é encerrada e iniciada novamente
    Then o projeto "2024-015" continua disponível
    And a área "Limite da área" e o documento "relatorio_meio_fisico.pdf" continuam associados a ele
