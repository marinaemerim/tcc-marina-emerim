# language: pt
Funcionalidade: Autenticação de usuários
  Como colaborador da Ambiens
  Quero acessar a plataforma com meu nome de usuário e senha
  Para que apenas funcionários da empresa consultem os dados dos projetos

  Contexto:
    Dado que existe o usuário "ana.souza" com a senha "Senha@123"

  Cenário: Login com credenciais válidas
    Quando o usuário informa o nome "ana.souza" e a senha "Senha@123"
    Então o acesso à plataforma é liberado
    E o mapa de projetos é exibido

  Cenário: Login com senha incorreta
    Quando o usuário informa o nome "ana.souza" e a senha "senhaErrada"
    Então o acesso à plataforma é negado
    E a mensagem "Usuário ou senha inválidos" é exibida

  Cenário: Acesso a uma página interna sem estar autenticado
    Dado que o usuário não está autenticado
    Quando ele tenta acessar a página de projetos
    Então ele é redirecionado para a tela de login
