# language: pt
Funcionalidade: Documentos do projeto
  Como membro da equipe de um projeto
  Quero armazenar os documentos do projeto na plataforma
  Para que relatórios, planilhas e arquivos fiquem reunidos em um só lugar

  Contexto:
    Dado que "ana.souza" está autenticada
    E que existe o projeto de contrato "2024-015" cuja equipe inclui "ana.souza"

  Esquema do Cenário: Enviar documento ao projeto
    Quando ela envia o arquivo "<arquivo>" ao projeto "2024-015"
    Então o arquivo "<arquivo>" aparece na lista de documentos do projeto

    Exemplos:
      | arquivo                     |
      | relatorio_meio_fisico.pdf   |
      | diagnostico_biotico.docx    |
      | inventario_gee.xlsx         |
      | planta_situacao.dwg         |

  Cenário: Baixar um documento
    Dado que o projeto "2024-015" possui o documento "relatorio_meio_fisico.pdf"
    Quando ela baixa o documento "relatorio_meio_fisico.pdf"
    Então o arquivo recebido é igual ao arquivo enviado

  Cenário: Visualizar um PDF sem baixar
    Dado que o projeto "2024-015" possui o documento "relatorio_meio_fisico.pdf"
    Quando ela abre o documento "relatorio_meio_fisico.pdf"
    Então o documento é exibido no navegador

  Cenário: Excluir um documento
    Dado que o projeto "2024-015" possui o documento "diagnostico_biotico.docx"
    Quando ela exclui o documento "diagnostico_biotico.docx"
    Então o documento deixa de aparecer na lista
    E o histórico do projeto registra a exclusão feita por "ana.souza"
