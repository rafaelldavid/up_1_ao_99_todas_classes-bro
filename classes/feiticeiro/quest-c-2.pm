sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
        #Possibilidade 1
         713 => "1 0 0", #Garrafa Vazia
         916 => "1 1 0", #Plumas de Ave
         919 => "1 1 0", #Couro de Animal
        1019 => "1 1 0", #Tronco
        1024 => "1 1 0", #Tinta de Polvo

        #Possibilidade 2
        1050 => "5 1 0", #Tendão
         960 => "5 1 0", #Garra de Crustáceo
         963 => "5 1 0", #Escama Aquática
    
        #Possibilidade 3
         966 => "5 1 0", #Carne de Ostra
         960 => "5 1 0", #Garra de Crustáceo
         950 => "5 1 0", #Coração de Sereia
    
        #Possibilidade 4
        1052 => "5 1 0", #Célula Única
         962 => "5 1 0", #Tentáculo
        1023 => "5 1 0", #Cauda de Peixe
    
        #Possibilidade 5
        1025 => "5 1 0", #Teia de Aranha
         935 => "5 1 0", #Casca
         928 => "5 1 0", #Antenas de Inseto
    
        #Possibilidade 6
        1057 => "5 1 0", #Pó de Traça
         946 => "5 1 0", #Casco de Caramujo
         947 => "5 1 0", #Chifre
    
        #Possibilidade 7     
        1031 => "5 1 0", #Foice de Louca-a-Deus
         955 => "5 1 0", #Pele de Verme
        1013 => "5 1 0"  #Casco Arco-Íris

        #Possibilidade 8
        
        );
    Commands::run("conf -f questc2_implementada true");
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") { 
            Commands::run("iconf $key $items{$key}") 
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

#Inicio da quest para virar sábio#
#Onde estiver, vai pra Yuno e salva por lá!#
automacro questSabio_salvarEmYuno {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    ConfigKeyNot saveMap yuno
    FreeSkillPoints = 0
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    NotInMap yuno
    QuestInactive 2041
    QuestInactive 2042
    QuestInactive 2043
    QuestInactive 2044
    QuestInactive 2045
    QuestInactive 2046
    QuestInactive 2047
    QuestInactive 2048
    QuestInactive 2049
    QuestInactive 2050
    QuestInactive 2051
    QuestInactive 2052
    QuestInactive 2053
    QuestInactive 2053
    QuestInactive 2054
    QuestInactive 2055
    QuestInactive 2056
    QuestInactive 2057
    QuestInactive 2058
    QuestInactive 2059
    QuestInactive 2060
    QuestInactive 2061
    QuestInactive 2062
    exclusive 1
    call aeroplano_izludePara "yuno"
}

#Após salvar em Yuno, vai até o NPC onde iniciará a quest!#
#Todas as quests de sábio devem estar desabilitadas#
#2041#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Para prestar o exame de admissão, você precisa falar com o Professor Claytos. Ele está na sala à esquerda. #
#Fale com o Examinador Teórico Claytos. #
automacro questSabio_irAteOFuncionarioAcademico {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    FreeSkillPoints = 0
    ConfigKeyNot naSequenciaDeSalvamento true
    NpcNotNear /acadêmico/i
    ConfigKey saveMap yuno
    InMap yuno, yuno_in03
    QuestInactive 2041
    QuestInactive 2042
    QuestInactive 2043
    QuestInactive 2044
    QuestInactive 2045
    QuestInactive 2046
    QuestInactive 2047
    QuestInactive 2048
    QuestInactive 2049
    QuestInactive 2050
    QuestInactive 2051
    QuestInactive 2052
    QuestInactive 2053
    QuestInactive 2053
    QuestInactive 2054
    QuestInactive 2055
    QuestInactive 2056
    QuestInactive 2057
    QuestInactive 2058
    QuestInactive 2059
    QuestInactive 2060
    QuestInactive 2061
    QuestInactive 2062
    priority 2
    exclusive 1
    call {
        call pararDeAtacar
        do conf lockMap none
        do move yuno_in03 154 35 &rand(2,4)
    }
}

#Conversando com o NPC para virar sábio#
#Aqui vai ativar a quest 2041!#

#2041#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Para prestar o exame de admissão, você precisa falar com o Professor Claytos. Ele está na sala à esquerda. #
#Fale com o Examinador Teórico Claytos. #
automacro questSabio_falarComFuncionarioAcademico {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    NpcNear /acadêmico/i
    ConfigKey saveMap yuno
    InMap yuno_in03
    QuestInactive 2041
    QuestInactive 2042
    QuestInactive 2043
    QuestInactive 2044
    QuestInactive 2045
    QuestInactive 2046
    QuestInactive 2047
    QuestInactive 2048
    QuestInactive 2049
    QuestInactive 2050
    QuestInactive 2051
    QuestInactive 2052
    QuestInactive 2053
    QuestInactive 2053
    QuestInactive 2054
    QuestInactive 2055
    QuestInactive 2056
    QuestInactive 2057
    QuestInactive 2058
    QuestInactive 2059
    QuestInactive 2060
    QuestInactive 2061
    QuestInactive 2062
    exclusive 1
    call {
        do talknpc 154 35 r1 r0 r0 #Funcionário Acadêmico
    }
}

#Terminou de conversar com o NPC, agora vai se encaminhar para outro#
#Aqui a quest 2041 deve estar ativa!#
#2041#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Para prestar o exame de admissão, você precisa falar com o Professor Claytos. Ele está na sala à esquerda. #
#Fale com o Examinador Teórico Claytos. #
automacro questSabio_irAteOExaminadorTeorico {
    NpcNotNear /teórico/i
    timeout 60
    ConfigKeyNot questSabio irProExamePratico
    QuestActive 2041
    InMap yuno,yuno_in03
    call {
        do move yuno_in03 105 177 &rand(2,4)
    }
}

#Aqui ele vai conversar com o NPC Examinador Teórico#
#Ele deve estar com a quest 2041 ativa!#
#Após terminar, ele vai desabilitar a 2041 e ativar a 2046#

#2046#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Você passou no exame teórico. Agora, por que não vai prestar o exame prático com o Professor Hermes? #
#Fale com o Examinador Prático Hermes. #
automacro questSabio_falarComOExaminadorTeorico {
    InMap yuno_in03
    QuestActive 2041
    timeout 60
    ConfigKeyNot questSabio irProExamePratico
    NpcNear /teórico/i
    call {
        do talk $.NpcNearLastBinId
        do talk resp /capa|diamante|flores/i #1
        do talk resp /prontera|baran/i #2
        do talk resp /alberta|geffen|prontera/i #3
        do talk resp /marin|penomena|estrela/i #4
        do talk resp /fumacento|giearth|metaller/i #5
        do talk resp /drake|argos|raydric/i #6
        do talk resp /marduk|lobo|esporo/i #7
        do talk resp /windser|tomas|barcadi/i #8
        do talk resp /antonio|mocona|jim/i #9
        do talk resp /denise|deborah|marianne/i #10
        do talk resp /("35")|espiritual|("59")/i #11
        do talk resp /("1.3")|("18")|dano1/i #12
        do talk resp /("4")|terra|diamante/i #13
        do talk resp /("90sec.")|("120%")|("280%")/i #14
        do talk resp /fogo|divina|remover/i #15
        do talk resp /20|2|5/i #16
        do talk resp /gatuno|aprendiz|arqueiro/i #17
        do talk resp /álcool|fruto|maldição/i #18
        do talk resp /coração|tristan|geffenia/i #19
        do talk resp /yggdrasil|odin|emperium/i #20
    }
}

automacro questSabio_faleiComEle_passeiNoTest {
    NpcMsgName /por favor volte mais tarde/i /teórico/i
    exclusive 1
    call {
        do conf -f questSabio irProExamePratico
    }
}

#Agora ele vai conversar com o Examinador Prático, ainda com a quest 2041 ativa!#
automacro questSabio_irAteOExaminadorPratico {
    NpcNotNear /prático/i
    exclusive 1
    ConfigKey questSabio irProExamePratico
    QuestActive 2041
    InMap yuno, yuno_in03
    call {
        do move yuno_in03 168 181 &rand(2,4)
    }
}

automacro questSabio_falarComOExaminadorPratico {
    InMap yuno, yuno_in03
    QuestActive 2041
    exclusive 1
    ConfigKey questSabio irProExamePratico 
    NpcNear /prático/i
    call {
        do move 169 180
        call pararDeAtacarApenasCorrer
        do talknpc 169 180
        do talk resp 0
    }
}

#Aqui tem uma sala de espera pra poder entrar no teste prático.#
#Copiei o esquema da sala de espera do Caçador!#

automacro questSabio_labirintoMoverPraPertoDoChat {
    QuestActive 2041
    InChatRoom 0
    IsInCoordinate 45..55 149..158
    InMap job_sage
    call {
        do conf route_randomWalk 0
        do move job_sage 50 162 &rand(2,4)
        do chat join 0
    }
}

automacro questSabio_labirintoChatPerto {
    QuestActive 2041
    InChatRoom 0
    ChatRoomNear /Espera|Waiting/i
    IsInCoordinate 38..61 177..154
    InMap job_sage
    priority -1
    call {
        do chat join 0
    }
}

automacro questSabio_DentroDoChat {
    InChatRoom 1
    QuestActive 2041
    InMap job_sage
    timeout 40
    call {
        do conf -f questSabio aguardandoTeste
        [
        log ===================================
        log = Estou dentro do chat
        log = agora é só esperar minha vez
        log ===================================
        ]
    }
}

#Hora do teste prático#
automacro questSabio_labirinto {
    QuestActive 2041
    InChatRoom 0
    ConfigKey questSabio aguardandoTeste
    InMap job_sage
    call {
        do conf lockMap none if (&config(lockMap) != none)
        call voltarAtacar
        do conf attackAuto_inLockOnly 0
        do conf -f questSabio atacandoMobs
    }
}

automacro questSabio_saiDoLabirinto {
    QuestActive 2041
    ConfigKey questSabio atacandoMobs
    InMap yuno_in03
    timeout 60
    NpcNear /prático/i
    call {
        call pararDeAtacarApenasCorrer
        do talknpc 169 180 #Aqui não tem alternativas, ele só vai te indicar o próximo NPC a conversar...#
        do conf -f questSabio termineiOTestePratico
    }
}

automacro questSabio_falarComSapien {
    NpcMsgName /sapien lylees/i /prático/i
    exclusive 1
    QuestActive 2041
    call {
        do move yuno_in03 62 177 &rand(3,5)
        do talknpc 62 176 #Como o meu foi outro, precisa ver as respostas aqui, acho que também deve ser r0 r0#
        do conf -f questSabio buscarOsItens
    }
}

automacro questSabio_falarComRuthy {
    NpcMsgName /ruthy celsus/i /prático/i
    exclusive 1
    QuestActive 2041
    call {
        do move yuno_in03 32 99 &rand(3,5)
        do talknpc 32 102 r0 r0 #Aqui ele vai pedir os itens que tem de trazer...#
        do conf -f questSabio buscarOsItens
    }
}

automacro questSabio_falarComEvecy {
    NpcMsgName /evecy georgy/i /prático/i
    exclusive 1
    QuestActive 2041
    call {
        do move yuno_in03 240 29 &rand(3,5)
        do talknpc 244 31 #Como o meu foi outro, precisa ver as respostas aqui, acho que também deve ser r0 r0#
        do conf -f questSabio buscarOsItens
    }
}    

#coloque esse if dentro da macro que tiver checando o item
#substitua item pelo item que quer, e o número 5 pela quantidade que precisa
#   if (&storamount(ITEM) > 0 && &invamount(ITEM) < 5) {
#       log tenho que ir no armazem pegar
#       call checarSeArmazenJaFoiAberto
#       call pegarItemDoArmazenSeTiver "NOME" "5"
#   }

#2055#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Sou o Professor Lucius; lembre-se que minha aula tem muitas excursões. Então, preciso que você me traga algumas coisas. #
#5 Tendões, 5 Garras de Crustáceo, 5 Escamas Afiadas #
automacro questSabio_coletarItens_possibilidade2 {
    QuestActive 2055
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        
        $item1{nomeDoItem} = Tendões
        $item1{idDoItem}   = 1050
        $item1{lockMap}    = iz_dun03
        
        $item2{nomeDoItem} = Garra de Crustáceo
        $item2{idDoItem}   = 960
        $item2{lockMap}    = iz_dun00
        
        $item3{nomeDoItem} = Escama Afiada
        $item3{idDoItem}   = 906
        $item3{lockMap}    = iz_dun03
        
        call decidirLockMapProItem
    }
}

#2054#Mudança de Classe: Sábio#SG_FEEL#QUE_NOIMAGE#
#Sou o Professor Lucius; lembre-se que minha aula tem muitas excursões. Então, preciso que você me traga algumas coisas. #
#5 Garras de Crustáceo, 5 Carnes de Ostra, 5 Corações de Sereia #
automacro questCacador_coletarItens_possibilidade3 {
    QuestActive 2054
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {

        $item1{nomeDoItem} = Carne de Ostra
        $item1{idDoItem}   = 966
        $item1{lockMap}    = hu_fild06
        
        $item2{nomeDoItem} = Garra de Crustáceo
        $item2{idDoItem}   = 960
        $item2{lockMap}    = iz_dun00
        
        $item3{nomeDoItem} = Coração de Sereia
        $item3{idDoItem}   = 950
        $item3{lockMap}    = iz_dun02
        
        call decidirLockMapProItem

    }
}

macro decidirLockMapProItem {
    call voltarAtacar
    
    $item1{qtdQuePreciso} = pegarConfigItemsControl("$item1{idDoItem}", "keep")
    $item2{qtdQuePreciso} = pegarConfigItemsControl("$item2{idDoItem}", "keep")
    $item3{qtdQuePreciso} = pegarConfigItemsControl("$item3{idDoItem}", "keep")
    
    if ( &invamount($item1{idDoItem}) < $item1{qtdQuePreciso} ) {
        do conf lockMap $item1{lockMap}
        call pegarItemDoArmazenSeTiver "$item1{idDoItem}" "$item1{qtdQuePreciso}"
        
    } elsif ( &invamount($item1{idDoItem}) >= $item1{qtdQuePreciso} && &invamount($item2{idDoItem}) < $item2{qtdQuePreciso} ) {
        do conf lockMap $item1{lockMap}
        call pegarItemDoArmazenSeTiver "$item2{idDoItem}" "$item2{qtdQuePreciso}"
        
    } elsif ( &invamount($item1{idDoItem}) >= $item1{qtdQuePreciso} && &invamount($item2{idDoItem}) >= $item2{qtdQuePreciso} && &invamount($item3{idDoItem}) < $item3{qtdQuePreciso}) {
        do conf lockMap $item1{lockMap}
        call pegarItemDoArmazenSeTiver "$item3{idDoItem}" "$item3{qtdQuePreciso}"
        
    } elsif ( &invamount($item1{idDoItem}) >= $item1{qtdQuePreciso} && &invamount($item2{idDoItem}) >= $item2{qtdQuePreciso} && &invamount($item3{idDoItem}) >= $item3{qtdQuePreciso}) {
        [
        log ================================
        log Coletei todos os itens, indo Entregar!
        log ================================
        ]
        do conf -f passo_quest_cacador indo entregar itens
        
    } else {
        [
        log ====================================================
        log Deveria estar coletando:
        log $item1{qtdQuePreciso} $item1{nomeDoItem},
        log $item2{qtdQuePreciso} $item2{nomeDoItem} e
        log $item3{qtdQuePreciso} $item3{nomeDoItem} agora
        log Mas algo deu errado... reporte aos criadores dessa eventMacro
        log ====================================================
        ]
    }
}

automacro questSabio_coletarItens_possibilidade4 {
    QuestActive 2041
    timeout 120
    ConfigKey buscarOsItens
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        $qtdItem1 = &invamount(Célula Única)
        $qtdItem2 = &invamount(Tentáculo)
        $qtdItem3 = &invamount(Cauda de Peixe)

        call voltarAtacar

        if (&storamount($qtdItem1) >= 0 && &invamount($qtdItem1) =< 5) {
        log Tenho que ir no armazem pegar!
        call checarSeArmazenJaFoiAberto
        call pegarItemDoArmazenSeTiver "$qtdItem1" "5"
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
        (&storamount($qtdItem2) >= 0 && &invamount($qtdItem2) =< 5)
        log Tenho que ir no armazem pegar!
        call checarSeArmazenJaFoiAberto
        call pegarItemDoArmazenSeTiver "$qtdItem2" "5"
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 5) {
        (&storamount($qtdItem3) >= 0 && &invamount($qtdItem3) =< 5)
        log Tenho que ir no armazem pegar!
        call checarSeArmazenJaFoiAberto
        call pegarItemDoArmazenSeTiver "$qtdItem3" "5"
        } elsif ( $qtdItem1 < 5 ) {
            do conf lockMap iz_dun00
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap iz_dun02
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 5) {
            do conf lockMap iz_dun03
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 5) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_sabio indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 5 Célula Única, 5 Tentáculo e 5 Cauda de Peixe
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}


automacro questCacador_coletarItens_possibilidade5 {
    QuestActive 2047
    QuestActive 2048
    QuestActive 2049
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        $qtdItem2 = &invamount(Teia de Aranha)
        $qtdItem1 = &invamount(Casca)
        $qtdItem3 = &invamount(Antenas de Inseto)

        call voltarAtacar

        if ( $qtdItem1 < 5 ) {
            do conf lockMap mjolnir_10
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap gef_fild00
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 5) {
            do conf lockMap iz_dun00
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 5) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_sabio indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 5 Teia de Aranha, 5 Casca e 5 Antenas de Inseto
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}


automacro questCacador_coletarItens_possibilidade6 {
    QuestActive 2047
    QuestActive 2048
    QuestActive 2049
    exclusive 1
    timeout 60
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        $qtdItem1 = &invamount(Pó de Traça)
        $qtdItem2 = &invamount(Casco de Caramujo)
        $qtdItem3 = &invamount(Chifre)

        call voltarAtacar

        if ( $qtdItem1 < 5 ) {
            do conf lockMap yuno_fild01
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap gef_fild01
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 5) {
            do conf lockMap pay_fild09
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 5) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_sabio indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 5 Pó de Traça, 5 Casco de Caramujo, 5 Chifres
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}


automacro questCacador_coletarItens_possibilidade7 {
    QuestActive 2047
    QuestActive 2048
    QuestActive 2049
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        $qtdItem1 = &invamount(Foice de Louva-a-Deus)
        $qtdItem2 = &invamount(Pele de Verme)
        $qtdItem3 = &invamount(Casco Arco-Íris)

        call voltarAtacar

        if ( $qtdItem1 < 5 ) {
            do conf lockMap yuno_fild01
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap iz_dun00
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 5) {
            do conf lockMap prt_fild02
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 5) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_sabio indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 5 Foice de Louva-a-Deus, 5 Pele de Verme e 5 Casco Arco-Íris
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}


#Itens necessários pra poder continuar na quest pra Sábio!#
#Pra fazer a terceira parte dos testes!#
automacro questSabio_coletarItens_possibilidade1 {
    QuestActive 2047
    QuestActive 2048
    QuestActive 2049
    QuestActive 2050
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_sabio indo entregar itens
    call {
        $qtdItem1 = &invamount(Plumas de Ave)
        $qtdItem2 = &invamount(Couro de Animal)
        $qtdItem3 = &invamount(Tronco)
        $qtdItem4 = &invamount(Tinta de Polvo)
        $qtdItem5 = &invamount(Garrafa Vazia)

        call voltarAtacar

        if ( $qtdItem1 < 5 ) {
            do conf lockMap moc_fild12
        } elsif ( $qtdItem1 >= 1 && $qtdItem2 < 1 ) {
            do conf lockMap moc_fild11
        } elsif ( $qtdItem1 >= 1 && $qtdItem2 >= 1 && $qtdItem3 < 1) {
            do conf lockMap pay_fild01
        } elsif ( $qtdItem1 >= 1 && $qtdItem2 >= 1 && $qtdItem3 >= 1 && $qtdItem4 < 1) {
            do conf lockMap iz_dun02
        } elsif ( $qtdItem1 >= 1 && $qtdItem2 >= 1 && $qtdItem3 >= 1 && $qtdItem4 >= 1 && $qtdItem5 < 1) {
            do move izlude_in 113 59
            do talknpc 115 61
            do buy 713 1
        } elsif ( $qtdItem1 >= 1 && $qtdItem2 >= 1 && $qtdItem3 >= 1 && $qtdItem4 >= 1 && $qtdItem5 >= 1) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_sabio indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 1 Pluma de Ave, 1 Couro de Animal, 1 Tronco,
            log 1 Tinta de Polvo e comprar 1 Garrafa Vazia!
            log Mas algo deu errado... Reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

automacro questSabio_entregarItensEmYuno {
    QuestActive 2047, 2048, 2049, 2050
    ConfigKey passo_quest_sabio indo entregar itens
    NotInMap yuno
    NotInMap yuno_in03
    ConfigKey aeroplano1 yuno
    ConfigKey aeroplano2 none
    exclusive 1
    call {
        call pararDeAtacar
    do conf lockMap none 
        call aeroplano_izludePara "yuno"

    }
}

automacro questSabio_entregarItens_todasAsPossibilidades {
    QuestActive 2047, 2048, 2049, 2050
    ConfigKey passo_quest_sabio indo entregar itens
    InMap yuno
    InMap yuno_in03
    exclusive 1
    call {
        do move yuno_in03 382 382 &rand(2,4) #Aqui vou precisar criar um if dependendo do NPC que ele foi encaminhado de início! São 3 alternativas.#
        do talknpc 382 382 #Idem acima... Esse 382 não é a localização deles!#
    }
}

#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#
#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#
automacro questCacador_falarComACacadoraDaGuildIrIzlude {
    QuestActive 4009, 4010
    InMap hugel, hu_in01
    exclusive 1
    call {
     call aeroplano_hugelPara "izlude"
    }
}

automacro questCacador_falarComACacadoraDaGuildIrPayon {
    QuestActive 4009, 4010
    InMap izlude
    exclusive 1
    call {
     call salvarNaCidade "payon"
    }
}



#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#
automacro questCacador_irAteOPalacioDePayonEntrar {
    QuestActive 4009
    exclusive 1
    InMap payon
    call {
        do conf -f quest_cacador_lider palacio_payon
        do move payon 188 233
    }
}

automacro questCacador_irAteOPalacioDePayon {
    QuestActive 4009
    exclusive 1
    InMap payon_in03
    call {
    do move payon_in03 158 33
        do move payon_in03 131 7 &rand(2,4)
    do talknpc 131 7 r3 
    }
}


#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#
automacro questCacador_irAteAGuildaDosArqueiros {
    QuestActive 4010
    exclusive 1
    InMap payon, pay_arche, payon_in02
    call {
        do conf -f quest_cacador_lider guilda_arqueiros
        do move payon_in02 21 31 &rand(2,4)
    do talknpc 21 31 r3
    }
}

automacro questCacador_labirintoMoverPraPertoDoChat {
    QuestActive 4011
    InChatRoom 0
    IsInCoordinate 164..187 18..41
    exclusive 1
    InMap job_hunte
    call {
        do move &rand(174,177) &rand(34,31)
        do talk resp 0
        do chat join 0
    }
}

automacro questCacador_labirintoChatPerto {
    QuestActive 4011
    InChatRoom 0
    ChatRoomNear /Espera|Waiting/i
    IsInCoordinate 164..187 18..41
    exclusive 1
    InMap job_hunte
    priority -1
    call {
        do chat join 0
    }
}

automacro questCacador_DentroDoChat {
    exclusive 1
    InChatRoom 1
    QuestActive 4011
    InMap job_hunte
    timeout 40
    call {
        [
        log ===================================
        log = Estou dentro do chat
        log = agora é só esperar minha vez
        log ===================================
        ]
    }
}

#4011#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Mate todos os ^ff0000monstros de mudança de classe^000000, e o interruptor vai aparecer. Destrua o interruptor e fuja pela saída ao norte. #
#
automacro questCacador_labirinto {
    QuestActive 4011
    InChatRoom 0
    IsInCoordinate 87..92 65..70
    exclusive 1
    InMap job_hunte
    call {
        if (&config(route_avoidWalls) != 0) do conf route_avoidWalls 0
        if (&config(lockMap) != none) do conf lockMap none
        call pararDeAtacarApenasCorrer

        do move 72 76
        $contador = 0
        do ml #comando pra listar os monstros na tela
        while (&monster(Monstro Alvo) = -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml #comando pra listar os monstros na tela
        do move 117 76
        #do west 10 # 80 83
        #do west 10 # 70 73
        if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        do move 117 76 #movendo pro mesmo lugar, mas para matar outro monstro
        
         if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        do north 55
        do move 94 131
         if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        
        [
        log ===================================
        log = teoricamente já matamos todos so monstros
        log = pelos menos eles tem que estar mortos agora
        log ===================================
        ]
        do move 110 131
        do south 25 
        do west 10
        do talk &npc(/switch/i)
        do talk resp 0
        do east 10 
        do north 25
        do move 89 131
        do north 10
        do conf route_avoidWalls 1
    }
}


#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##
automacro questCacador_irAteAGuildaDosArqueirosRelatarSucesso {
    QuestActive 4012
    exclusive 1
    ConfigKey quest_cacador_lider guilda_arqueiros
    call {
        do move payon_in02 21 31 &rand(2,4)
    do talknpc 21 31 r0
    }
}

#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##
automacro questCacador_irAteOPalacioDePayonRelatarSucessoEntrarPalacio {
    QuestActive 4012
    exclusive 1
    InMap payon
    ConfigKey quest_cacador_lider palacio_payon
    call {
        do move payon 188 233 
    }
}

automacro questCacador_irAteOPalacioDePayonRelatarSucessoNoPalacio {
    QuestActive 4012
    exclusive 1
    InMap payon_in03
    ConfigKey quest_cacador_lider palacio_payon
    call {
        do move payon_in03 158 33
        do move payon_in03 131 7 &rand(2,4)
    do talknpc 131 7 r0 
    }
}

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #
automacro questCacador_termineiDesafiosVoltandoHugel {
    QuestActive 4013
    NotInMap hugel
    NotInMap hu_in01
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    exclusive 1
    call {
        call pararDeAtacar
    do conf lockMap none 
        call aeroplano_junoPara "hugel"

    }
}

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #
automacro questCacador_relatarAoLiderDaGuildDosCacadores {
    QuestActive 4013
    InMap hugel, hu_in01
    exclusive 1
    call {
        do move hu_in01 386 373 &rand(2,4)
        do talknpc 386 373
    [
        log =======================
        log Finalmente sou caçador
        log demorou para caramba
        log =======================
    ]
    }
}



    
