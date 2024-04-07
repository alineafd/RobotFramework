*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                    chrome
${URL}                        https://www.amazon.com.br/
${MENU_LIVROS}                //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${LOCATOR_CATEGORIA_LIVRO}    //img[@src='https://m.media-amazon.com/images/G/32/br-books/2021/November/NewPage_BooksStore/Botoes_Menu/Pequeno/Botoes_19._CB650809174_.jpg']
${LOCATOR_PRODUTO}            //input[contains(@type,'text')]
${LOCATOR_BOTAO_PESQUISAR}    //input[contains(@type,'submit')]
${NOME_PRODUTO}               Xbox Series S

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
    
Verificar se aparece a frase "${TITULO}"
    Element Text Should Be    locator=//h2[contains(.,'${TITULO}')]    expected=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
    Page Should Contain Image    locator=${LOCATOR_CATEGORIA_LIVRO}    message=${CATEGORIA}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${LOCATOR_PRODUTO}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${LOCATOR_BOTAO_PESQUISAR}

Verificar o resultado da pesquisa, se está listando o produto pesquisado
    Page Should Contain    text=${NOME_PRODUTO}