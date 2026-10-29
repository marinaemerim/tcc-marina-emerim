# language: pt
Funcionalidade: Visualização dos projetos no mapa
  Como colaborador da Ambiens
  Quero ver os projetos no mapa e identificar estudos próximos
  Para reaproveitar informações de projetos anteriores em novas análises

  Contexto:
    Dado que "ana.souza" está autenticada
    E que existem projetos com áreas cadastradas em Florianópolis e Porto Belo

  Cenário: Exibir todos os projetos no mapa
    Quando ela abre o mapa
    Então as áreas de todos os projetos são exibidas no mapa

  Cenário: Consultar um projeto clicando na área
    Quando ela clica na área "Limite do terreno" do projeto "2024-015"
    Então são exibidos o número do contrato, o nome, o contratante e o tipo de estudo do projeto
    E é exibido um link para abrir o projeto

  Cenário: Encontrar projetos próximos a uma área
    Dado que o projeto "2025-003" possui uma área a 2 km do projeto "2024-015"
    E que o projeto "2023-042" possui uma área a 60 km do projeto "2024-015"
    Quando ela busca projetos num raio de 5 km do projeto "2024-015"
    Então o projeto "2025-003" é exibido como projeto próximo
    Mas o projeto "2023-042" não é exibido

  Cenário: Ligar e desligar camadas
    Dado que a camada "Projetos" está visível
    Quando ela desliga a camada "Projetos"
    Então as áreas dos projetos deixam de ser exibidas no mapa

  Cenário: Trocar o mapa base
    Quando ela seleciona o mapa base "Satélite"
    Então o mapa passa a exibir a imagem de satélite
    E as áreas dos projetos continuam visíveis
