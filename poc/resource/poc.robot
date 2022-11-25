***Settings***
Documentation    Teste - Automação RobotFramework
Library          RequestsLibrary
Library          Collections          
Library          String              
Library          OperatingSystem      

*** Variable ***
${URL_API}    https://reqres.in/api/users

*** Keywords ***
Dado que envio uma requisição POST para realizar um cadastro
    [Arguments]    ${arqJson}
    ${headersAPI}     Create Dictionary    Content-Type=application/json      
    Create Session    create_user          ${URL_API}                       ${headersAPI}                     disable_warnings=1    verify=${false}
 
   #Capturando os dados da requisição através de um arquivo Json
    ${request_body}    Get File           ${EXECDIR}\\Massas\\${arqJson}
    Log                ${request_body}
    #Concatenando as URLs e enviando a requisição
    ${resposta}           Post On Session        create_user    url=${URL_API}    data=${request_body}    expected_status=201
    Set Suite Variable    ${resposta}
    Log                   ${resposta.text}

##########################################################################################################
Dado que envio uma requisição PUT para editar um cadastro 
    [Arguments]          ${arqJson}
    ${request_body}      Get File                ${EXECDIR}\\Massas\\${arqJson}
    ${headersAPI}        Create Dictionary       Content-Type=application/json                   
    Create Session       editar                  ${URL_API}            ${headersAPI}    disable_warnings=1    verify=${false}
    ${resposta}          Put On Session          editar               url=/2               
    ...                  data=${request_body}
    Set test Variable    ${resposta}
    Log                  ${resposta.text}

##########################################################################################################
Dado que envio uma requisição GET para consultar um cadastro
    ${headersAPI}          Create Dictionary        Content-Type=application/json  
    Create Session         consulta                 ${URL_API}         ${headersAPI}     disable_warnings=1    verify=${false}
    ${resposta}            Get On Session           consulta          url=?page=2

#########################################################################################################
Dado que envio uma requisição DELETE para excluir um cadastro
    ${headersAPI}          Create Dictionary        Content-Type=application/json  
    Create Session         deletar                 ${URL_API}         ${headersAPI}     disable_warnings=1    verify=${false}
    ${resposta}            Delete On Session           deletar          url=/2

#########################################################################################################
#Valida o Status CODE
E confiro o status code
    [Arguments]                   ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}