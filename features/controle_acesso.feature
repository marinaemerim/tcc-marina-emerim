# language: pt
Funcionalidade: Controle de acesso aos projetos
  Como colaborador da Ambiens
  Quero ter acesso completo apenas aos projetos em que participo
  Para que as informações de cada projeto fiquem restritas à sua equipe (definida no TAP)

  Contexto:
    Dado que existe o projeto de contrato "2024-015" cuja equipe inclui "ana.souza"
    E que existe o projeto de contrato "2023-042" cuja equipe não inclui "ana.souza"
    E que "ana.souza" está autenticada

  Cenário: Membro da equipe edita o próprio projeto
    Quando "ana.souza" abre o projeto "2024-015"
    Então ela pode editar os dados do projeto
    E ela pode enviar documentos para o projeto

  Cenário: Usuário fora da equipe não acessa os dados completos do projeto
    Quando "ana.souza" tenta abrir o projeto "2023-042"
    Então os dados completos do projeto não são exibidos
    E é exibida a opção "Solicitar acesso"

  Cenário: Usuário solicita acesso a um projeto de outra equipe
    Quando "ana.souza" solicita acesso ao projeto "2023-042"
    Então a solicitação fica registrada como "Pendente"
    E o responsável pelo projeto é notificado

  Cenário: Acesso de consulta concedido
    Dado que "ana.souza" recebeu acesso de consulta ao projeto "2023-042"
    Quando "ana.souza" abre o projeto "2023-042"
    Então os dados do projeto são exibidos
    Mas ela não pode editar os dados do projeto
