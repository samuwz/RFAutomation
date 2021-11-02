*** Settings ***
Documentation   Aqui estarão presentes as resoluções de todos os exercicios da Prime Hero.
...             É muito importante informarmos o propósito deste documento.

*** Variables ***
${NOME}         Samuel William 

&{PESSOA}       
...     nome=Samuel     
...     sobrenome=William       
...     idade=23
...     hobby=poker
...     email=swzubek@hotmail.com
...     genero=Masculino


@{FRUTAS}

...     melancia
...     pessego
...     morango
...     uva
...     melão


*** Test Cases ***
Cenario: Imprimindo informações da pessoa
    Log To Console     ${PESSOA.nome}
    Log To Console     ${PESSOA.sobrenome}
    Log To Console     ${PESSOA.idade}
    Log To Console     ${PESSOA.hobby}
    Log To Console     ${PESSOA.email}
    Log To Console     ${PESSOA.genero}

# python -m robot tests/exercicios.robot // no console

Cenario: Imprimindo lista de frutas 
    [Tags]      LISTA  #[Tags]  Lista - para executar só a lista frutas sem executar a de cima "PESSOA"
    Log To Console      ${Frutas[0]}
    Log To Console      ${Frutas[1]}
    Log To Console      ${Frutas[2]}
    Log To Console      ${Frutas[3]}
    Log To Console      ${Frutas[4]}

# python -m robot -i tests/exercicios.robot // no console (Terminal-bashk)

Cenario: Somando dois valores
    [Tags]      SOMA
    Somar dois numeros  10  17

Cenario: Somando dois valores
    [Tags]      SOMA
    Somar os numeros "50" e "25"
# python -m robot -i SOMA tests/exercicios.robot // no console (Terminal-bash)

Cenario: Criar email
    [Tags]      EMAIL
    Criar email  samuel  william  23

Cenario: Contar 
    [Tags]      CONTAR
    Contar de 0 a 9

Vendo lista
    [Tags]      FRUTAS
    Percorrer itens de uma lista

Cenario: Estou numero
    [Tags]      NUM 
    Exercicio Contar 

Cenario: Lista de Paises
    [Tags]      PAISES
    Exercicio Paises

Cenario: Tomando decisão da cor do carro
    [Tags]      CARRO
    Escolhendo o carro  Roxo

Cenario: Escolhendo numero
    [Tags]      OIE
    Contar      
         
    
# python -m robot -i EMAIL tests/exercicios.robot // no console (Terminal-bash)

*** Keywords ***

#Somar dois numeros
#    [Arguments]         ${NUM_A}    ${NUM_B}
#    ${SOMA}             Evaluate    ${NUM_A} + ${NUM_B}
#    [Return]            ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}             Evaluate    ${NUM_A}+${NUM_B}
    Log To Console      ${SOMA}

Criar email
    [Arguments]     ${NOME}     ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate        SEPARATOR=_     ${NOME}     ${SOBRENOME}    ${IDADE}@robot.com
    Log To Console    ${EMAIL}

Contar de 0 a 9
    FOR     ${count}    IN RANGE    0   9
        Log To Console      ${count}
    END

Percorrer itens de uma lista
    @{FRUTAS}       Create List     Morango     uva         laranja     Pera
    FOR     ${FRUTAS}       IN      @{FRUTAS}
        Log To Console      ${FRUTAS}
    END

Exercicio Contar 
    FOR     ${numero}       IN RANGE        0       11
        Log To Console      \nEstou no número:${numero}
    END 

Exercicio Paises
    @{PAISES}       Create List     França      Canada      Brasil      Alemanha
    FOR     ${PAISES}       IN      @{PAISES}
        Log To Console      \n${PAISES}
    END


Escolhendo o carro
    [Arguments]     ${COR_CARRO}
    IF      '${COR_CARRO}'=='Roxo'
        Log To Console      \nEu gostaria de comprar este carro
    ELSE IF     '${COR_CARRO}'=='Preto'
        Log To console      \nEu tambem gosto desta cor
    ELSE  
        Log To Console      \nNão gostei das cores
    END

Contar 
    FOR     ${NUMERO}   IN RANGE    0     11
        IF      '${NUMERO}'=='5'
            Log To Console      \nEstou no numero:${NUMERO}
        ELSE IF     '${NUMERO}'=='8'
            Log To console      \nEstou no numero:${NUMERO}
        END
    END

k