# language: pt
Funcionalidade: Cadastro de projetos ambientais
  Como membro da equipe de um projeto
  Quero cadastrar o projeto com seus dados administrativos
  Para que ele possa ser localizado e consultado na plataforma

  Contexto:
    Dado que "ana.souza" está autenticada

  Cenário: Cadastrar projeto com todos os dados obrigatórios
    Quando ela cadastra um projeto com:
      | campo              | valor                         |
      | número do contrato | 2024-015                      |
      | nome               | EIA Loteamento Morro das Pedras |
      | contratante        | Construtora Exemplo Ltda.     |
      | município          | Florianópolis                 |
      | tipo de estudo     | Estudo Ambiental              |
    E anexa o termo de abertura do projeto "TAP_2024-015.pdf"
    Então o projeto "2024-015" é salvo com sucesso
    E ele aparece na lista de projetos

  Cenário: Número de contrato já cadastrado
    Dado que já existe o projeto de contrato "2024-015"
    Quando ela tenta cadastrar outro projeto com o contrato "2024-015"
    Então o cadastro é recusado
    E a mensagem "Já existe um projeto com este número de contrato" é exibida

  Cenário: Cadastro sem campo obrigatório
    Quando ela tenta cadastrar um projeto sem informar o número do contrato
    Então o cadastro é recusado
    E o campo "número do contrato" é destacado como obrigatório

  Cenário: Um mesmo contratante com vários contratos
    Dado que já existe o projeto de contrato "2024-015" do contratante "Construtora Exemplo Ltda."
    Quando ela cadastra o projeto de contrato "2025-003" para o mesmo contratante
    Então o contratante "Construtora Exemplo Ltda." passa a ter 2 projetos

  Cenário: Alterações ficam registradas no histórico
    Dado que existe o projeto de contrato "2024-015"
    Quando "ana.souza" altera o município do projeto para "Palhoça"
    Então o histórico do projeto registra a alteração
    E o registro informa o usuário "ana.souza", a data, o valor anterior e o novo valor
