# language: pt
Funcionalidade: Áreas geográficas do projeto
  Como membro da equipe de um projeto
  Quero importar as áreas do projeto a partir de arquivos geográficos
  Para que elas sejam exibidas no mapa sem precisar usar o QGIS

  Contexto:
    Dado que "ana.souza" está autenticada
    E que existe o projeto de contrato "2024-015" cuja equipe inclui "ana.souza"

  Esquema do Cenário: Importar área a partir de arquivo geográfico
    Quando ela adiciona ao projeto "2024-015" a área "<nome da área>" com o arquivo "<arquivo>"
    Então a área "<nome da área>" é salva no projeto
    E a área é exibida no mapa na localização correta

    Exemplos:
      | nome da área      | arquivo                   |
      | Limite do terreno | limite_terreno.kmz        |
      | Área de matrícula | area_matricula.kml        |
      | Área de estudo    | area_estudo_shapefile.zip |

  Cenário: Projeto com mais de uma área
    Dado que o projeto "2024-015" possui as áreas "Limite do terreno" e "Área de matrícula"
    Quando ela abre o projeto "2024-015"
    Então as duas áreas são listadas, cada uma com seu nome
    E as duas áreas são exibidas no mapa

  Cenário: Arquivo em formato não suportado
    Quando ela tenta adicionar uma área com o arquivo "planta.dwg"
    Então a importação é recusada
    E a mensagem "Formato não suportado. Use KML, KMZ ou Shapefile" é exibida

  Cenário: Arquivo geográfico inválido
    Quando ela tenta adicionar uma área com o arquivo corrompido "limite_corrompido.kmz"
    Então a importação é recusada
    E a mensagem "Não foi possível ler a geometria do arquivo" é exibida
