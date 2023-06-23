#language:pt
Funcionalidade: API - marvel

  Contexto: Preparar request
    Dado que configure minha request

# -------------------------------- Consulta ----------------------------------
Cenario: Validar total de registros retornados é igual ao valor do campo "limit"
    Quando realizo uma consulta 
    Então deve retornar o total de registros refetente a o limit da pagina

Cenario: Validar endpoint de histórias em quadrinhos por Id validando todas as histórias em quadrinho que possuem o title "Marvel Previews (2017)"

    Quando realizo uma consulta por Id
    E consulto por id
    Então deve retornar todas as histórias que possuem o titulo Marvel Previews