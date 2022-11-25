*** Settings ***
Documentation    Teste - Automação RobotFramework
Resource         ${EXECDIR}/resource/poc.robot


*** Test Cases ***
#Sempre estar na pasta da poc - cd vpoc
#Executar todos os Cenários: robot -d ./results spec
#Executar uma feature: robot -d ./results spec/poc.robot
#Executar somente uma TAG: robot -d ./results -i cadastro tests
#Executar somente um Cenário de Teste: robot -d ./results -t "CT01 - Cadastro" tests

CT01 - Cadastro
    [tags]                                                            cadastro
    Dado que envio uma requisição POST para realizar um cadastro      cadastro.json 
    E confiro o status code                                           201

CT02 - Editar_cadastro
    [tags]                                                            editar_cadastro
    Dado que envio uma requisição PUT para editar um cadastro         editar.json 
    E confiro o status code                                           200

CT03 - consultar_cadastro
    [tags]                                                            consultar_cadastro
    Dado que envio uma requisição GET para consultar um cadastro          
    E confiro o status code                                           201

CT04 - deletar_cadastro
    [tags]                                                            deletar_cadastro
    Dado que envio uma requisição DELETE para excluir um cadastro          
    E confiro o status code                                           201
