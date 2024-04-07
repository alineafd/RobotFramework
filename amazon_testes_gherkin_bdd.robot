*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu "Eletrônicos" do site da Amazon.com.br
    ...                E verifica a categoria "Computadores e Informática"
    [Tags]             menus    categoria
    Dado que estou na home page do site Amazon.com.br
    Quando acessar o menu "Livros"
    Então o título da página fica "Livros | Amazon.com.br"
    E aparece a frase "Loja de Livros"
    E aparece a categoria "Livros em Oferta"

Caso de teste 02 - Pesquisa de um produto 
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page do site Amazon.com.br
    Quando digitar o nome do produto "Xbox Series S" no campo de pesquisa
    E clicar no botão de pesquisa
    Então o resultado da pesquisa deve estar listando o produto "Xbox Series S"