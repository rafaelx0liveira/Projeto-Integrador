/* Adicionando nova coluna */
ALTER TABLE `pi_dh`.`produto` ADD tipo varchar(100) AFTER `descricao`;
ALTER TABLE `pi_dh`.`usuario` ADD senha varchar(200) AFTER `dtNascimento`;
ALTER TABLE `pi_dh`.`produto` ADD qtde_estoque int AFTER `estoque`;
ALTER TABLE `pi_dh`.`usuario` ADD is_admin boolean AFTER `senha`;
ALTER TABLE `pi_dh`.`usuario` ADD novidades boolean AFTER `is_admin`;
ALTER TABLE `pi_dh`.`pagamentos` CHANGE cartao numero varchar(20);
ALTER TABLE `pi_dh`.`pagamentos` CHANGE nome banco varchar(20);
ALTER TABLE `pi_dh`.`pagamentos` ADD nome varchar(100) AFTER `idPagamentos`;

/*********************
	  PRODUTOS
*********************/
SELECT `produto`.`idProduto`,
    `produto`.`nome`,
    `produto`.`descricao`,
    `produto`.`tipo`,
    `produto`.`preco`,
    `produto`.`alcoolico`,
    `produto`.`imagem`,
    `produto`.`ativo`,
    `produto`.`estoque`,
    `produto`.`qtde_estoque`,
    `produto`.`ingredientes`,
    `produto`.`harmonizacao`,
    `produto`.`graduacao_alcoolica`,
    `produto`.`volume`
FROM `pi_dh`.`produto`;

/* Alterando casa decimais do campo preço  */
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `preco` DECIMAL(7,2);

/* Alterando o tamanho dos campos */
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `imagem` varchar(1000);
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `descricao` varchar(1000);
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `ingredientes` varchar(1000);
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `harmonizacao` varchar(1000);

/* Alterando tipo das colunas */
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `graduacao_alcoolica` varchar(50);
ALTER TABLE `pi_dh`.`produto` MODIFY COLUMN `volume` varchar(100);

/* Inserindo os produtos */

# 1
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(1, 
'Licor 43', 
'Licor 43 ( Cuarenta Y Tres) é uma marca espanhola de licor. Seu nome é derivado de sua composição por incluir 43 ingredientes diferentes.',
'Licor',
120.00, 
true, 
'https://docs.google.com/uc?id=1T3kWu-xY-bCBnPaHQ_xshYjmIzuGWH9W', 
true, 
true,
'É elaborado com suco de limão e de outros frutos, e aromatizado com ervas e especiarias. Frutas cítricas infundido com botanicas selecionadas, emprestam as essências aromáticas, frutas cítricas líquidos, um toque de baunilha delicada e apenas um toque de caramelo.',
'Tiramisù no copo; Carajillo e Bruxinha; Licor 43 Horchata e Brownie;', 
'31% Vol.', 
'700 ml'
);


# 2
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(2, 
'White Horse', 
'Assim como Logan, o White Horse também desenvolvido por Peter Mackie, seus principais maltes são Lagavulin, Glen Elgin e Craigellachie. É um dos primeiros scotch whiskies a serem introduzidos no Brasil, e traz até hoje o mesmo sabor, rico e úmido, e a mesma qualidade, aqui e no mundo inteiro.',
'Uísque',
82.90, 
true, 
'https://docs.google.com/uc?id=19TOU0MDJHBLTV1oOVI_SVIdW3S3g471I', 
true, 
true,
'O Whisky White Horse é composto por mais de 35 maltes, uma das mais elevadas proporções de maltes nos scotch whiskies.',
'Combina com aperitivos e pratos mais leves, como frutos do mar e saladas. Devido ao seu sabor adocicado, também podem acompanhar sobremesas.', 
'40% Vol.', 
'1000 ml'
);


# 3
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(3, 
'The Macallan', 
'O whisky escocês The Macallan Sherry Oak 18 anos é maturado durante no mínimo 18 anos em barris de carvalho europeu ex-xerez, ou seja, que antes tiveram neles vinho xerez espanhol.',
'Uísque',
3869.94, 
true, 
'https://docs.google.com/uc?id=1b-OuoHFcI9vzEHTGeNto6Hh8AFNvnT_B', 
true, 
true,
'O Whisky 18 Years Old Double Cask The Macallan possui aromas de bolo de laranja, xarope de gengibre, caramel, frutos secos e especiarias. Na boca demonstra passas com notas de caramelo, baunilha, especiarias, noz moscada, canela e laranja.',
'Ideal para harmonizar com entradas com salmão e haddock defumados, e também para acompanhar carnes grelhadas, como chuleta.', 
'43% Vol.', 
'700 ml'
);


# 4
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(4, 
'Stella Artois', 
'A experiência e a tradição cervejeira de mais de 600 anos resultam em uma lager muito bem equilibradas. Uma cerveja de sabor intenso e com final suave.',
'Cerveja',
7.15, 
true, 
'https://docs.google.com/uc?id=1fbxJToWezeisvcusLEz4te3ed_1cLhJn', 
true, 
true,
'Sua receita única produz uma cerveja com aromas suaves e notas maltadas.',
'A Stella Artois tem equilíbrio e sofisticação. O amargor e a alta refrescância vão cortar a gordura de carnes vermelhas, já os aromas florais vão complementar a harmonização com frutos do mar.', 
'5% Vol.', 
'330 ml'
);



# 5
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(5, 
'Sprite', 
'Com um sabor único, Sprite Sem Açúcar é o refrigerante de limão mais vendido no mundo. Produzido com água gaseificada, suco de limão e aroma natural, não contém açúcares.',
'Refrigerante',
4.00, 
true, 
'https://docs.google.com/uc?id=11WrK-qdgfLz_xeKIvxQcD3SXF9aMHZ9f', 
true, 
true,
'Água gaseificada, açúcar, suco concentrado de limão, aroma natural, acidulante ácido cítrico, conservadores benzoato de sódio e sorbato de potássio.',
'Harmoniza bem com frutos do mar, frango e carnes brancas, além de salgadinhos e petiscos.', 
'0% Vol.', 
'350 ml'
);


# 6
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(6, 
'Smirnoff', 
'Smirnoff com nova garrafa: design moderno e diferenciado, rótulo mais sofisticado. O grau máximo de pureza, agora com linhas mais modernas.',
'Vodca',
39.99, 
true, 
'https://docs.google.com/uc?id=1fVGOWDEtoF7nyhGYXjBI3ZiqSAuLMUCi', 
true, 
true,
'Bebida composta de álcool de cereais tri destilada e dez vezes filtrada.',
'Alimentos que tem pouca gordura e baixa concentração de carboidratos. Por isso, aves, peixes (em especial o Salmão) e o caviar são a harmonização certa para sua versão pura e para drinks elaborados com ela.', 
'37,5% Vol.', 
'998 ml'
);


# 7
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(7, 
'Skyy Vodka', 
'Destilada 4x e filtrada 3, a SKYY é uma vodka premium, extremamente suave e versátil, resultado da produção inovadora que contempla todos os processos.',
'Vodca',
39.99, 
true, 
'https://docs.google.com/uc?id=1SkqFw7wrMx8hEZuSO42Nnw3EFTJj24JO', 
true, 
true,
'5 fatias de Gengibre, 20 ml de Suco de Limão Siciliano, 2 colheres de Açúcar, 50 ml de Skyy, 100 ml de Club Soda.',
'Ela é conhecida por ser uma bebida versátil que pode ser harmonizada com uma variedade de alimentos de maneiras diferentes. Algumas opções possíveis de harmonização para a vodka incluem: Saladas, Peixes e frutos do mar, Queijos, Massas, Frutas ou Legumes.', 
'40% Vol.', 
'998 ml'
);


# 8
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(8, 
'Skol', 
'Skol é uma cerveja clara, com aroma refinado e sabor leve e suave. Skol Pilsen é uma típica cerveja clara, com aroma refinado e sabor leve e suave. Seu teor de amargor é menos acentuado e seu teor alcoólico é médio.',
'Cerveja',
4.19, 
true, 
'https://docs.google.com/uc?id=1swOX6WWMJYUvEwpmrIPXypKs-24W8dSb', 
true, 
true,
'Água, malte e lúpulo.',
'Peixes, frango e fritas.', 
'7% Vol.', 
'350 ml'
);


# 9
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(9, 
'Schweppes', 
'Schweppes é uma linha premium de bebidas, desenvolvida na Inglaterra em 1783 por Jacob Schweppe, um cientista amador que descobriu um método de produzir água carbonatada em escala comercial. Sua primeira fábrica teve lugar em Londres em 1792, produzindo a Schweppes Soda. ',
'Refrigerante',
3.79, 
true, 
'https://docs.google.com/uc?id=1Ha5x5l9ZUSDIVD3X5eouQNQFRHrpHwtS', 
true, 
true,
'Elaborado com água gaseificada, açúcar, suco de maçã, grapfruit e laranja, aroma natural e corante artificial tartrazina.',
'Pode ser misturada com outras bebidas como Vodka, Espumante e Rum', 
'0% Vol.', 
'350 ml'
);



# 10
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(10, 
'Sagres', 
'A Sagres é 100% natural, produzida segundo métodos tradicionais exclusivos a partir de água, malte, cereais não maltados e uma rigorosa selecção de lúpulos. No seu fabrico não são utilizados quaisquer aditivos ou conservantes. Cerveja 100% natural, medianamente encorpada, de carácter seco e um amargo agradável.',
'Cerveja',
3.79, 
true, 
'https://docs.google.com/uc?id=1263KmIshstF4mVelWAXRA8M9o9Je1B8h', 
true, 
true,
'É produzida com ingredientes naturais, sem uso de conservantes e uma coloração dourada.',
'Pode ser harmonizada com diferentes pratos de comida, como saladas e carnes, por exemplo.', 
'5% Vol.', 
'330 ml'
);


# 11
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(11, 
'Royal Salute', 
'Royal Salute foi criado em 1953 para celebrar a coroação da Rainha Elizabeth II. Ele é referência em sofisticação e excepcionalidade em todo o mundo.',
'Uísque',
999.00, 
true, 
'https://docs.google.com/uc?id=1s0qkPIAo_CFJ54DBfrj8v_K0hlpBBouA', 
true, 
true,
'É composto por uma mistura de whiskies single malt e whiskies de grão de diferentes idades, sendo que o whisky mais jovem utilizado descansou em barris de carvalho por 21 anos.',
'Chocolate Amargo, queijos, frutas secas e nozes, carne grelhada, bolo de carne, salmão defumado, crumble de maçã.', 
'40% Vol.', 
'700 ml'
);


# 12
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(12, 
'Ron Viejo De Caldas', 
'Cor âmbar intensa com viscosidade. Cheiro profundo e nariz maduro com notas de pêssego e mel, apresentando o aroma típico de rum escuro bem envelhecido. Na boca surge-nos a casca de laranja, gengibre e notas de especiarias leves. Maduro, redondo, liso e harmonioso com sabores delicados a amêndoa, caramelo, baunilha e madeira.',
'Rum',
153.99, 
true, 
'https://docs.google.com/uc?id=1eai4vOU8ZIac_JR7tOBE1s7Wo9EG87No', 
true, 
true,
'Feito de melaço de cana destilado com a água mais pura das florestas tropicais dos Andes, é criado o Ron Viejo de Caldas, envelhecido em barris de carvalho bourbon a mais de 2.200 metros de altitude.',
'Chocolate Amargo, chocolate trufado ou uma trufa.', 
'37,5% Vol.', 
'700 ml'
);


# 13
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(13, 
'RedBull', 
'Desenvolvida especialmente para casos de esforço físico e mental, Red Bull aumenta a perfomance, a concentração, melhorando o estado de bem-estar, além de estimular o metabolismo.',
'Energético',
13.98, 
true, 
'https://docs.google.com/uc?id=1oUD01hUXe1hN4N_cehAU5Mlx8_TOFymt', 
true, 
true,
'Água gaseificada, taurina (1000mg/250ml), cafeína (80mg/250ml), vitaminas (B3, B5, B6, B2, B12), acidulante ácido cítrico.',
'Suco de maçã. gelo, canela e rodelas de maçã.', 
'0% Vol.', 
'100 ml'
);


# 14
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(14, 
'Johnnie Walker Platinum Label', 
'De cor âmbar profundo. Aroma rico e refinado, com um toque de frutas frescas e elegantes notas defumadas. Paladar de um blend moderno, intenso e complexo, com sabores ricos e marcantes de frutas, cereais e amêndoas, elegantemente combinados com um final suave e defumado.',
'Uísque',
13.98, 
true, 
'https://docs.google.com/uc?id=1W9JfFggrJJ2c7zLLiljkKkeC7r3V7WDV', 
true, 
true,
'Destilado alcoólico de malte envelhecido, destilado alcoólico de cereais envelhecido, água, corante caramelo.',
'Rodela de limão, gelo e club soda ou água gaseificada para completar o copo.', 
'40% Vol.', 
'750 ml'
);


# 15
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(15, 
'Petra', 
'A Petra Origem Puro Malte 350 ml é uma cerveja de cor dourada, colarinho branco bem formado e persistente. Sua espuma é cremosa e seu sabor é refrescante, com notas de lúpulo e malte.',
'Cerveja',
3.99, 
true, 
'https://docs.google.com/uc?id=1V_cjBWEVFZo3lAoi7rTNOVjisZARc98j', 
true, 
true,
'Água, malte de cevada e lúpulo.',
'Amendoim, Figo, Pinhão, abóbora, salada de salmão são algumas opções de harmonização.', 
'4,8% Vol.', 
'350 ml'
);


# 16
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(16, 
'Pepsi', 
'Pepsi é um refrigerante sabor Cola com aroma natural à base de concentrado, água e gás carbônico. É um refrigerante muito apreciado pelo sabor suave e pela refrescância.',
'Refrigerante',
2.59, 
true, 
'https://docs.google.com/uc?id=19MJBllsC3f89AfgbiLVeYj6bt68hBYOp', 
true, 
true,
'Água gaseificada, açúcar, cafeína, extrato de noz de cola, corante caramelo IV, aromatizante, acidulante ácido fosfórico e edulcorantes: sucralose (8,3mg/100ml) e acessulfame de potássio (5,5mg/100ml).',
'Suco de limão com rodelas de limão e gelo.', 
'0% Vol.', 
'350 ml'
);


# 17
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(17, 
'Passport Scotch', 
'O whisky Passport é composto predominantemente por maltes oriundos da renomada região de Speyside e de uma seleção especial de outros whiskies. É um whisky suave, com um tremendo equilíbrio entre frutas e maltes.',
'Uísque',
57.80, 
true, 
'https://docs.google.com/uc?id=161Z9yEoIQKh6MydpD6D3-WDCi70zjfyY', 
true, 
true,
'Malte whisky e destilado alcoólico de cereais (grain whisky) envelhecidos, água e corante caramelo INS 150a.',
'Chocolate Amargo, queijos, frutas secas e nozes, carne grelhada, bolo de carne, salmão defumado, crumble de maçã.', 
'40% Vol.', 
'1L'
);


# 18
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(18, 
'Oban Whisky', 
'Produzido em Western Highlands (Escócia). De cor dourada, com tons de verde, com aroma frutado, marcado por diversas especiarias, com notas esfumaçados. O paladar é untuoso desenvolve-se sobre a turfa com um final sobre a cevada preparada com malte fumado e frutos exóticos, é elegante, ligeiro e equilibrado, com um final longo.',
'Uísque',
340.99, 
true, 
'https://docs.google.com/uc?id=1SniLYUFohrnXHlOU0xgcdQ0XnC0shdYo', 
true, 
true,
'Oban é feito usando apenas a melhor cevada, maltada de acordo com as especificações específicas da destilaria. A cevada parcialmente germinada é suavemente seca em um forno onde uma leve fumaça de turfa dá ao malte um caráter e sabor distintos.',
'Chocolate Amargo.', 
'43% Vol.', 
'750 ml'
);


# 19
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(19, 
'Monster Energy', 
'A Bebida Energética Monster Energy é a dose de disposição que sua rotina precisa. Com guaraná em sua composição, ela fornece duas vezes mais energia que os energéticos comuns. É ideal para melhorar o foco, a concentração e retardar a fadiga, perfeito para atletas e estudantes.',
'Energético',
17.50, 
true, 
'https://docs.google.com/uc?id=1i1laJO9eGdHG8Cb3MjLyggIkOy_CISb4', 
true, 
true,
'Água gaseificada, açúcar, xarope de glicose, taurina (800mg/200ml), cafeína (65mg/200ml), vitaminas (B3, B6, B2 e B12), extrato de guaraná (8,4mg/200ml), cloreto de sódio, glucoronolactona (4,2mg/200ml), inositol (4,2mg/200ml).',
'Ostras, sushi, frutos do mar e queijos leves.', 
'0% Vol.', 
'473 ml'
);


# 20
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(20, 
'Martini Biano', 
'Bebida composta de vinho branco e ervas aromáticas. Produzida desde 1910, possui cor palha bastante suave, aroma intenso, adocicado, e suave, com a presença da baunilha bem marcante. Quanto ao sabor: trata-se engenhosamente de uma mistura de doce e amargo, medidos em perfeita proporção.',
'Vermute',
42.29, 
true, 
'https://docs.google.com/uc?id=1xhl-sCzDITca0_OnzqchI6Sq7WgJcECW', 
true, 
true,
'É produzido com vinhos brancos de uvas Trebbiano e uma mistura de ervas, especiarias e frutas mantida em segredo até hoje, apenas três pessoas sabem a receita. O vermute Martini Bianco possui coloração amarelo palha com nuances verdes.',
'Este aperitivo pode ser tomado com gelo e uma rodela de limão.', 
'16% Vol.', 
'750 ml'
);


# 21
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(21, 
'Martell Cordon Bleu', 
'Um Cognac com personalidade única, que combina corpo com excelente equilíbrio.',
'Conhaque',
598.41, 
true, 
'https://docs.google.com/uc?id=1FSpTtkm_iHVuFTKLojbQcSlQNFZFZsMM', 
true, 
true,
'A doçura leve de frutas cristalizadas equilibra nozes secas, carvalho delicadamente temperado e notas de café mocha com passas, banana madura e notas florais de violeta.',
'Filé mignon ou contrafilé.', 
'40% Vol.', 
'700 ml'
);

# 22
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(22, 
'Jack Daniels', 
'Whiskey Jack Daniels repousa nos barris do meio dos armazéns da destilaria, até que chegue ao ponto perfeito para se tornar um verdadeiro Tennessee Whiskey.',
'Uísque',
148.39, 
true, 
'https://docs.google.com/uc?id=16lq9R06brwa8lz1MsaTwCN3bqsXST_eb', 
true, 
true,
'O Jack Daniels Tennessee Whiskey é feito com o melhor milho, centeio e malte de cevada. Seu caráter diferenciado é o resultado da fermentação natural, da cuidadosa destilação e do uso da água livre de ferro da Destilaria que nasce na Cave Spring e corre à uma temperatura constante de 13°C.',
'Puro, com gelo e devido ao seu toque cítrico combina bem em drinks como o Jack & Cola, Jack & Citrus.', 
'40% Vol.', 
'1L'
);

# 23
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(23, 
'Itaipava', 
'Produzida com ingredientes 100% selecionados, água 100% cristalina e respeitando o tempo certo, a Itaipava é uma cerveja clara, leve, saborosa e refrescante.',
'Cerveja',
2.99, 
true, 
'https://docs.google.com/uc?id=1NLqOKCP2j_zQ2ccR0cvgLRb_IdhsGiW8', 
true, 
true,
'Água, Malte De Cevada, Cereais Não Malteados, Carboidratos E Lúpulo.',
'Churrasco, porções variadas, saladas e  carnes grelhadas.', 
'4,5% Vol.', 
'350 ml'
);

# 24
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(24, 
'Hennessy Very Special', 
'Hennessy Very Special é referência na arte da mixologia. Conhaque francês, produzido pela Maison Hennessy, a pioneira na arte da elaboração do cognac, fundada em 1765. Hoje, presente em mais de 130 países é líder mundial e a razão deste sucesso internacional, deve-se à escolha dos melhores terrenos da região de Cognac.',
'Conhaque',
428.87, 
true, 
'https://docs.google.com/uc?id=1nb8_Q80es363QGBVq2CGRt2amPNgB7_K', 
true, 
true,
'É composto de uma mistura de eaux-de-vies produzidas a partir de vinhos provenientes de quatro sub-regiões de Cognac: Grande Champagne, Petite Champagne, Borderies e Fins Bois, com no mínimo 2 anos de envelhecimento, podendo conter aguardentes maturadas por mais tempo na sua composição. ',
'Ideal para ser apreciado puro, com gelo ou em deliciosos drinks.', 
'40% Vol.', 
'700 ml'
);

# 25
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(25, 
'Heineken', 
'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado, produzida com ingredientes 100% naturais.',
'Cerveja',
6.99, 
true, 
'https://docs.google.com/uc?id=1SbH7jsxay0Fsdz6isYvo0lOOBsjXOBqC', 
true, 
true,
'É composto de água, malte e lúpulo. ',
'Pratos natalinos, desde a entrada até o prato principal.', 
'5% Vol.', 
'330 ml'
);

# 26
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(26, 
'Guinness Draught', 
'A guinness draught é uma cerveja tipo stout, de alta fermentação, feita com percentual de malte torrado, que lhe confere sua marcante cor rubi vermelho escura e um paladar tostado.',
'Cerveja',
69.90, 
true, 
'https://docs.google.com/uc?id=17DC4kKD6wHjTTXwkbh93MHnXDcDpjA87', 
true, 
true,
'‎Água, malte, cevada torrada e extrato de lúpulo.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'4,2% Vol.', 
'440 ml'
);


# 27
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(27, 
'Guaraná Antarctica', 
'Produzido com uma frutinha amazonense de sabor agradável, é um refrigerante natural, leve e original, que conquistou o mercado exterior, particularmente Japão, onde lidera um ranking de dez diferentes marcas.',
'Refrigerante',
2.85, 
true, 
'https://docs.google.com/uc?id=1n7ftLnd1v4W5FEZdJoJDmkbaK8QH64Ey', 
true, 
true,
'‎Água gaseificada, açúcar, extrato de guaraná, acidulante ácido cítrico, conservadores: benzoato de sódio e sorbato de potássio, aromatizante e corante caramelo.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'0% Vol.', 
'350 ml'
);

# 28
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(28, 
'Grey Goose Vodka', 
'Todos os passos na criação da vodka super premium Grey Goose são perfeitamente conduzidos para produzir uma vodka de sabor e qualidade extraordinários. É a marca pioneira na categoria de Vodka Super Premium, sendo a principal referência no mundo, com o título “The World’s Best Tasting Vodka” de acordo com o Chicago Beverage State Institute.',
'Vodca',
140.99, 
true, 
'https://docs.google.com/uc?id=1a8_xYgjqodQo8sXPKMM8Kye8ft59pnr-', 
true, 
true,
'Feita através de duas matérias primas franscesas altamente selecionadas pelo Maître de Chai: trigo de inverno da região norte da Fraça (Picardie) e água natural da fonte Gensac-La-Pallue.',
'Gelo com tônica e uma fatia de limão.', 
'40% Vol.', 
'750 ml'
);

# 29
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(29, 
'Grants Blended Scotch', 
'O whisky Grants Blended Scotch faz parte de uma nova linha de whiskies lançado em 2018 pela destilaria. A maturação do Grants Blended Scotch é feita em três tipos diferentes de madeira: barril de Carvalho virgem, responsável por fornecer robustez e notas picantes, o Carvalho American empresta a suavidade da baunilha e os barris de reuso, antes utilizados na maturação de bourbon whiskey, oferece doçura de açúcar mascavo, resultando em um sabor mais suave, rico e aveludado.',
'Uísque',
99.99, 
true, 
'https://docs.google.com/uc?id=1t4iG1ZtJI8Ka0abqFbm-CPN2OqQcmrbu', 
true, 
true,
'Os aromas não são muito proeminentes, mas pode-se notar caramelo, pão com manteiga e um pouco de canela. Em boca é adocicado, possui um moderado sabor de canela, mel e cereais, além de notas de caramelo. É um whisky suave e agradável ao paladar. ',
'Aperitivos.', 
'40% Vol.', 
'750 ml'
);

# 30
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(30, 
'Fanta', 
'Fanta é a bebida refrescante com sumo de frutas preferida pelos jovens do nosso país. Jovem, alegre, extrovertida e sempre associada a um sentimento universal: a diversão com os amigos.',
'Refrigerante',
3.99, 
true, 
'https://docs.google.com/uc?id=1eD5EPdR8AyyKJUYd1x8409lg1noqoC4_', 
true, 
true,
'Elaborado a base de água gaseificada, açúcar, 5,2% de suco natural de laranja, vitamina C, reguladores de acidez ácido cítrico e citrato de sódio.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'0% Vol.', 
'350 ml'
);


# 31
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(31, 
'Erdinger', 
'A cerveja de trigo mais conhecida e consumida do mundo. Refrescante, encorpada, aromática e levemente frutada é a ícone entre as cervejas de trigo.',
'Cerveja',
23.92, 
true, 
'https://docs.google.com/uc?id=1_FHkJJixUPHjK22GCOatNPwstXZauLZ7', 
true, 
true,
'‎Água, malte de cevada, lúpulo e levedura.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'5,3% Vol.', 
'500 ml'
);


# 32
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(32, 
'Double Black', 
'Johnnie walker double black é inspirado nos sabores icônicos do johnnie walker black label, transformando-os em um blend com com intensidade sem igual. Fortemente influenciado pelos poderosos whiskies da costa oeste e das ilhas das escócia, johnnie walker double black é melhor apreciado com água para desvendar suas complexas camadas de sabor defumado e rico em especiarias.',
'Uísque',
239.90, 
true, 
'https://docs.google.com/uc?id=1_D1zcEnZAsD3teMVgp3xTMgJ5nq4TPYn', 
true, 
true,
'‎Destilado alcóolico de malte envelhecido e destilado alcóolico de cereais não malteados, água e corante caramelo',
'Pode ser harmonizado com pratos e carnes mais intensas.', 
'40% Vol.', 
'1L'
);

# 33
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(33, 
'Crystal', 
'Crystal é uma cerveja leve, cristalina, preparada com ingredientes cuidadosamente selecionados e matérias-primas especiais. Além de todos esses atributos, ela também é pioneira: foi a primeira cerveja do Brasil a receber o selo de proteção no bocal das suas latas.',
'Cerveja',
2.90, 
true, 
'https://docs.google.com/uc?id=1XCdrbIIRSxEepTcNPqNnrjHEyuw99ocp', 
true, 
true,
'‎Água, malte de cevada, cereais não malteados, carboidratos e lúpulo.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'5% Vol.', 
'250 ml'
);

# 34
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(34, 
'Corona Extra', 
'Cerveja Corona Long Neck. Cerveja mexicana clara. A inconfundível cor, o gosto único e o incomparável sabor de relaxamento: tudo em uma das mais reconhecíveis garrafas do mundo. Há algo sobre beber uma Corona que é diferente de beber qualquer outra cerveja! Corona é mais do que uma cerveja, é uma filosofia de vida.',
'Cerveja',
2.90, 
true, 
'https://docs.google.com/uc?id=1xXciQZR312unGGbU0S0S51wmvr_KCPsR', 
true, 
true,
'‎Água, malte, arroz e lúpulo.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'5% Vol.', 
'330 ml'
);

# 35
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(35, 
'Coca-Cola', 
'Refresque-se com uma Coca-Cola! O sabor que você já conhece, ideal para matar sua sede, para acompanhar refeições ou tomar ao longo do dia.',
'Refrigerante',
3.79, 
true, 
'https://docs.google.com/uc?id=1tkpS57l0oMJbRc-TFCR_ri-SGeLlgacd', 
true, 
true,
'‎Água gaseificada, açúcar, extrato de noz de cola, cafeína, corante caramelo IV, acidulante ácido fosfórico e aroma natural.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'0% Vol.', 
'310 ml'
);

# 36
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(36, 
'Ciroc Red Berry', 
'Deliciosamente suave e sofisticada, a vodka cîroc é um compromisso com o gosto superior, qualidade e um estilo de vida divertido. As frutas são caracterizados por frutas vermelhas e silvestres, com uma ênfase específica nas notas de framboesa, criando uma leve doçura.',
'Vodca',
199.90, 
true, 
'https://docs.google.com/uc?id=1qSfJ1x0nlKpWW7PYpsGw3i0l2YL8Tx7r', 
true, 
true,
'‎Destilado alcoólico simples de uva retificado, água, aroma natural de framboesa e açúcar.',
'Ideal para coquetéis, drinks e caipirinhas, pode ser apreciada pura também.', 
'35% Vol.', 
'750 ml'
);


# 37
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(37, 
'Chivas Regal 12 anos', 
'Com notas de mel, baunilha e maçãs, chivas 12 anos é o blended scotch whisky ideal para seu drink favorito ou on the rocks - acompanhado de algumas pedras de gelo.',
'Uísque',
199.90, 
true, 
'https://docs.google.com/uc?id=1Cm1ovoqEox-tHN55fFqbedf_WfqUBCQo', 
true, 
true,
'‎Combinação de malte whiskies e destilado alcoólico simples de cereais (grain whisky) envelhecidos, corante caramelo e água.',
'Carnes brancas, peixes, avelãs, caramelo.', 
'40% Vol.', 
'1L'
);

# 38
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(38, 
'Candelaria', 
'Clássica cerveja inglesa, loira, leve e com aroma de fibra suave. Cor dourada e baixo amargor.',
'Cerveja',
19.90, 
true, 
'https://docs.google.com/uc?id=16JLdqeSSSrPE9Tk8Tv-zNRfnwyWjyF7v', 
true, 
true,
'‎Água, malte de cevada, carboidratos e lúpulo.',
'Perfeita para acompanhar refeições ligeiras.', 
'6,1% Vol.', 
'1L'
);


# 39
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(39, 
'Budweiser', 
'Budweiser é feita do seu próprio jeito desde 1876. Fabricada com água, malte de cevada, arroz, lúpulo e nada mais. Maturada com madeira Beechwood, pra um sabor marcante no começo e suave no final. Depois de produzida no Brasil, lotes da cerveja são enviados para a cervejaria da Budweiser em St. Louis, nos EUA, onde passam por um rígido processo de degustação. Esse processo garante o mesmo sabor autêntico de Budweiser em qualquer lugar do mundo.',
'Cerveja',
19.90, 
true, 
'https://docs.google.com/uc?id=1BjgfUm-PrwQawS74aDJEGiHTCZpvAQNl', 
true, 
true,
'‎Água, arroz, malte de cevada, carboidratos e lúpulo.',
'Perfeita para acompanhar refeições ligeiras.', 
'5% Vol.', 
'330 ml'
);


# 40
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(40, 
'Brahma Duplo Malte', 
'Brahma Duplo Malte possui dois tipos de malte, uma combinação surpreendente entre a leveza do Malte Pilsen ​e o sabor do Malte Munich: equlíbrio perfeito entre sabor e refrescância. Temos uma cerveja puro malte dourada e com aquela espuma cremosa que você já ama.',
'Cerveja',
3.79, 
true, 
'https://docs.google.com/uc?id=13ZLmMDHPRCH-NCBKLmKEdlWEQ5dSpS3i', 
true, 
true,
'‎‎Água, malte e lúpulo.',
'Churrasco, porções variadas, saladas e carnes grelhadas.', 
'4.7% Vol.', 
'350 ml'
);

# 41
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(41, 
'Bombay Sapphire', 
'Produzido na Inglaterra, Bombay Sapphire é o gin premium mais vendido do mundo. Com sua icônica garrafa azul reconhecida mundialmente, Bombay Sapphire é um gin com 100% de infusão a vapor, o que lhe confere um sabor incrivelmente equilibrado, resultado da cuidadosa seleção de 10 botânicos provenientes de diversas partes do mundo. ',
'Gin',
113.71, 
true, 
'https://docs.google.com/uc?id=1P_BjBl1kQLvmcgZzWpdDoZ3Pdf_ruNOY', 
true, 
true,
'‎Extraído através de uma metódo de destilação inovador que infusiona seus 10 botânicos em vapor (Zimbro, casca de limão siciliano, grãos do paraíso, sementes de coentro, bagas de cubeba, raíz de lírio, amêndoa, cássia, alcaçuz, angélica).',
'Gelo com tônica e uma fatia de limão.', 
'47% Vol.', 
'750 ml'
);

# 42
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(42, 
'Blue Label', 
'Apenas 1 em cada 10.000 barris tem a indescritível qualidade, caráter e experiência para entregar o sabor marcante de Johnnie Walker Blue Label.',
'Uísque',
1065.70, 
true, 
'https://docs.google.com/uc?id=10l_ER_DHkjx1_oIE_dPZemcBmeojzVP2', 
true, 
true,
'‎‎Destilado alcóolico de malte envelhecido e destilado alcóolico de cereais não malteados, água e corante caramelo.',
'Churrasco, porções variadas, saladas e carnes grelhadas.', 
'40% Vol.', 
'750 ml'
);

# 43
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(43, 
'Black Label 12 anos', 
'Johnnie walker black label é um verdadeiro ícone, reconhecido como uma inspiração para todas as outras marcas da categoria. Desenvolvido à partir de whiskies de, no mínimo, 12 anos vindos dos quatro cantos da escócia, johnnie walker black label é um blend de caráter profundo, suave e complexo. Um whisky impressionante para compartilhar em qualquer ocasião, seja um encontro com amigos ou uma noite inesquecível.',
'Uísque',
109.90, 
true, 
'https://docs.google.com/uc?id=1H-nSgFwdvhKaFLT4yi6fY2gcTIBvUQrv', 
true, 
true,
'‎Destilado do alcoól simple de cereais envelhecidos, água, corante de caramelo.',
'Carne marmorizada, tábua de queijo, salmão defumado, chocolate ou hambúrgueres.', 
'40% Vol.', 
'750 ml'
);


# 44
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(44, 
'Black Dog', 
'Assim como a destilação de uísque, a outra grande paixão de Sir Walter, a pesca com mosca, exige paciência e trabalho com a natureza para influenciar o melhor resultado, inspirando-o a batizar a mistura de Black Dog, em homenagem a sua mosca de pesca favorita. À medida que o mundo avança, a Black Dog continua a dedicar seu tempo para aperfeiçoar seu uísque.',
'Uísque',
899.90, 
true, 
'https://docs.google.com/uc?id=1JmaiJaT9EbUIR2aGV4Zq42D5m6jjiBOQ', 
true, 
true,
'É misturado à perfeição com uma infinidade de destilados de malte escolhidos nas várias regiões da Escócia.',
'Carne marmorizada, tábua de queijo, salmão defumado, chocolate ou hambúrgueres.', 
'43% Vol.', 
'1L'
);

# 45
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(45, 
'Belvedere Vodka', 
'O vodka belvedere pure 700 ml é o vodka ideal para curtir bons momentos. Sua embalagem vem com 700 ml. é um produto na categoria de destilados.',
'Vodca',
169.90, 
true, 
'https://docs.google.com/uc?id=11Gf9naqNQ4uPCd-XV-e00FGsQEeLIRPP', 
true, 
true,
'Produzida a partir do centeio polonês Dankowskie Gold Rye.',
'Chocolates, castanhas, amendoins, queijos suaves, frutos do mar, salmão e carnes vermelhas.', 
'40% Vol.', 
'700 ml'
);


# 46
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(46, 
'Baileys', 
'Baileys é um dos autênticos ícones da irlanda. Uma bebida versátil, delicada e doce, que pode ser combinada com uma infinidade de outros ingredientes para criar drinks e receitas saborosas, que aguçam todos os sentidos.',
'Licor',
97.90, 
true, 
'https://docs.google.com/uc?id=1s70RFgOCPIw0ybphmSqqMwYYyxqb_-Kn', 
true, 
true,
'É uma típica combinação irlandesa, feito a partir de leite fresco, uísque irlandês, cacau, baunilha, açúcar e destilado neutro',
'Chocolates, queijos suaves, sobremesas.', 
'17% Vol.', 
'750 ml'
);


# 47
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(47, 
'Beefeater London', 
'Destilaria no coração de londres, 9 alambiques e quatro destiladores fazem o gin mais premiado do mundo, sob a supervisão do master distiller mais experiente do mundo. Baseado na premiação internacional de destilados de 2004 a 2019.',
'Gin',
89.90, 
true, 
'https://docs.google.com/uc?id=1pErvR87ut8iDetOZGdCT0aW5kLtcHLE3', 
true, 
true,
'Possui notas de 9 botânicos em sua receita, todas colhidos e processados à mão, que são: zimbro, semente de coentro, casca de limão siciliano, casca de laranja sevilha, amêndoa, raíz de angélica, semente de angélica, alcaçúz e raíz de lírio.',
'Salsichas, salames, presuntos, bacon, entre outros.', 
'47% Vol.', 
'750 ml'
);

# 48
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(48, 
'Becks', 
'A Cerveja Becks é uma legítima German Lager Puro Malte que segue a risca a Lei da Pureza da Cerveja desde 1873. Seu IBU (Unidade Internacional de Amargor) é 20. O resultado é uma cerveja de amargor intenso, sabor marcante e excepcional pureza. Ela é provocante, cheia de personalidade com um sabor característico e único. É a German Lager mais vendida no mundo.',
'Cerveja',
4.90, 
true, 
'https://docs.google.com/uc?id=1EKTOTTFQw_hqDGUqO0mGU0X-iVn_fYAR', 
true, 
true,
'Água, malte e lúpulo.',
'A cerveja é a escolha ideal para acompanhar as suas refeições ou mesmo os momentos de descontração e comemoração, como churrascos, festas e muito mais.', 
'5% Vol.', 
'350 ml'
);

# 49
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(49, 
'Becherovka', 
'Becherovka é um licor amargo herbatico feito em Karlovy Varia na República Checa.',
'Licor',
101.90, 
true, 
'https://docs.google.com/uc?id=1T40-6ojCLz1r9aq4LkeAwRRmYhSB6L3B', 
true, 
true,
'Misturado com sementes de anis, canela, e aproximadamente 32 outras ervas.',
'É servido normalmente frio, e é usado frequentemente como digestivo.', 
'38% Vol.', 
'70 ml'
);

# 50
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(50, 
'Bavaria', 
'Bavaria Clássica é uma cerveja produzida seguindo os mais rigorosos padrões de qualidade na fabricação e seleção dos ingredientes.',
'Cerveja',
2.20, 
true, 
'https://docs.google.com/uc?id=1u65e5Bhttk70i8sInX_pHXxnbXRXw8ss', 
true, 
true,
'Água, malte e lúpulo.',
'Churrasco, porções variadas, saladas e  carnes grelhadas.', 
'4,3% Vol.', 
'473 ml'
);

# 51
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(51, 
'Ballantines', 
'Nós fazemos o whisky, você faz do seu jeito como você gosta. Seja de, ou a noite, na praia ou na balada, ballantines convida você a pensar fora da caixa e ver que whisky também se mistura. Seja verdadeiro e a excelência sempre estará ao seu lado.',
'Uísque',
68.46, 
true, 
'https://docs.google.com/uc?id=10HUdQ4WFVdfb4N3dJpcXoyONRVMRFZjJ', 
true, 
true,
'Sua receita é composta de um blend com mais de 40 maltes e grãos cuidadosamente selecionados de 4 diferentes regiões da Escócia.',
'Churrasco, frutos do mar e doces', 
'45% Vol.', 
'750ml'
);

# 52
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(52, 
'Bacardi', 
'Bacardí é a marca de destilados mais premiada no mundo, com 550 prêmios ao longo de sua história. Seus runs são produzidos pelos maestros de rum Bacardí desde 1862, garantindo sua qualidade e características do líquido. Com perfil leve e suave, Bacardí Carta Blanca passa por um breve processo de envelhecimento barris de carvalho.',
'Rum',
43.00, 
true, 
'https://docs.google.com/uc?id=1QA3-RjhC7exRh3dOW0DXewyuJnvUT_zx', 
true, 
true,
'Melaço de cana, água e utilizando a linha de leveduras.',
'Um chocolate trufado ou uma trufa.', 
'38% Vol.', 
'980ml'
);

# 53
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(53, 
'Bacardi Razz', 
'Bacardí é a marca de destilados mais premiada no mundo, com 550 prêmios ao longo de sua história. Seus runs são produzidos pelos maestros de rum Bacardí desde 1862, garantindo sua qualidade e características do líquido. Com perfil leve e suave, Bacardí Carta Blanca passa por um breve processo de envelhecimento barris de carvalho.',
'Rum',
43.00, 
true, 
'https://docs.google.com/uc?id=1AnNnQCjRcY6bhzfAB4YYxS9IkDYpzBrJ', 
true, 
true,
'Melaço de cana, água e utilizando a linha de leveduras.',
'Um chocolate trufado ou uma trufa.', 
'35% Vol.', 
'750ml'
);

# 54
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(54, 
'Antarctica Sub Zero', 
'Antarctica surgiu como uma fábrica de gelo e passou a produzir cerveja um ano depois, em 1889. É o complemento perfeito para momentos de prazer e para descontrair em boa companhia. Seu aroma levemente frutado e o balanço entre a acidez e o dulçor são bastante característicos.',
'Cerveja',
3.99, 
true, 
'https://docs.google.com/uc?id=1Qq_bv_hCpj24T5jmNSkrYNEP5H-k6mtP', 
true, 
true,
'Água gaseificada,açúcar,semente de guaraná,aroma natural de guaraná,acidulante:ácido cítrico;conservadores:sorbato de potássio e benzoato de sódio;corante;caramelo tipo IV.',
'Pratos natalinos, desde a entrada até o prato principal.', 
'4,5% Vol.', 
'350ml'
);


# 55
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(55, 
'Absolut Vodka', 
'A absolut vodka é uma vodka sueca feita exclusivamente a partir de ingredientes naturais encontrados exclusivamente em ähus na Suécia, e, ao contrário de algumas outras vodkas, ela não contém açúcar. A ausência de açúcar é um dos pontos que mais diferencia a vodka absolut das demais, oferecendo sabor puro e único.',
'Vodca',
69.99, 
true, 
'https://docs.google.com/uc?id=1r3EpURXhG269qEmKVZKIa8FLfWggCrt0', 
true, 
true,
'Os principais ingredientes da absolut vodka são água e o trigo de inverno do sul da suécia.',
'Aves, peixes (em especial o Salmão) e o caviar.', 
'40% Vol.', 
'750ml'
);


# 56
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(56, 
'Absolut Lime', 
'A Absolut Lime é suave, rica e possui um frescor de limão recém espremido e um toque ligeiramente doce e frutado.',
'Vodca',
69.99, 
true, 
'https://docs.google.com/uc?id=1AAWiMV1iVV9k-oxk8kvk_8WjPwiT0d-o', 
true, 
true,
'A Absolut Vodka é feita a partir da água e um tipo de trigo do Hemisfério Norte.',
'Aves, peixes (em especial o Salmão) e o caviar.', 
'40% Vol.', 
'1L'
);


# 57
INSERT INTO `pi_dh`.`produto`
(`idProduto`, `nome`, `descricao`,`tipo` , `preco`, `alcoolico`, `imagem`, `ativo`, `estoque`, `ingredientes`, `harmonizacao`, `graduacao_alcoolica`, `volume`)
VALUES
(57, 
'Absolut Citron', 
'Lançada nos anos 80, foi a segunda vodka saborizada da marca. Trouxe um toque refrescante, agradando os fãs de vodka com limão.',
'Vodca',
87.99, 
true, 
'https://docs.google.com/uc?id=1KfaXgqX-ptNjsGMBaGSLfWBb6UAVZTf0', 
true, 
true,
'A Absolut Vodka é feita a partir da água e um tipo de trigo do Hemisfério Norte.',
'Aves, peixes (em especial o Salmão) e o caviar.', 
'40% Vol.', 
'1L'
);

UPDATE `pi_dh`.`produto`
SET `alcoolico` = false
WHERE idProduto in (5, 9, 13, 16, 19, 27, 30, 35);

/*********************
	 USUÁRIO
*********************/
INSERT INTO `pi_dh`.`usuario`
(`idUsuario`,
`nome`,
`email`,
`cpf`,
`telefone`,
`dtNascimento`,
`senha`,
`is_admin`)
VALUES
(1,
'Rafael Aparecido Silva de Oliveira',
'rafaelaparecido.oliveirasilva@gmail.com',
'45978945645',
'5511962807125',
'1999-12-15',
'$2a$12$7e6lbx.I9EhzYcY8.Bki4OVOH3NaxBug5fkp.8Tq/Wkdq7h4YxOaq',
false
);

DELETE FROM `pi_dh`.`usuario`
WHERE idUsuario = 1;

SELECT `endereco`.`idEndereco`,
    `endereco`.`rua`,
    `endereco`.`cep`,
    `endereco`.`numero`,
    `endereco`.`bairro`,
    `endereco`.`cidade`,
    `endereco`.`complemento`,
    `endereco`.`Usuario_idUsuario`
FROM `pi_dh`.`endereco`;


SELECT nome,
endereco.rua,
endereco.bairro
FROM usuario
inner join endereco on endereco.Usuario_idUsuario = usuario.idUsuario 
where usuario.idUsuario = 1;


/*********************
	 PAGAMENTOS
*********************/

INSERT INTO `pi_dh`.`pagamentos`
(`idPagamentos`,
`cartao`,
`validade`,
`cv`,
`nome`,
`Usuario_idUsuario`)
VALUES
(1,
5588442200889911,
'2029-02-01',
999,
'Itau',
1);

INSERT INTO `pi_dh`.`endereco`
(`idEndereco`,
`rua`,
`cep`,
`numero`,
`bairro`,
`cidade`,
`complemento`,
`Usuario_idUsuario`)
VALUES
(1,
'Rua Paulo Sergio',
'08596540',
201,
'Parque Residencial Souza Campos',
'Itaquaquecetuba',
'Casa',
1);



select 
usuario.nome,
pagamentos.cartao,
pagamentos.nome as nome_cartao
from usuario
inner join pagamentos
on pagamentos.Usuario_idUsuario = usuario.idUsuario
where pagamentos.Usuario_idUsuario = 1;

SELECT `pagamentos`.`idPagamentos`,
    `pagamentos`.`cartao`,
    `pagamentos`.`validade`,
    `pagamentos`.`cv`,
    `pagamentos`.`nome`,
    `pagamentos`.`Usuario_idUsuario`
FROM `pi_dh`.`pagamentos`;

UPDATE `pi_dh`.`produto`
SET `qtde_estoque` = 100
WHERE idProduto in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 
41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57);

SELECT `endereco`.`idEndereco`,
    `endereco`.`rua`,
    `endereco`.`cep`,
    `endereco`.`numero`,
    `endereco`.`bairro`,
    `endereco`.`cidade`,
    `endereco`.`complemento`,
    `endereco`.`Usuario_idUsuario`
FROM `pi_dh`.`endereco`;


UPDATE `pi_dh`.`usuario`
SET
`novidades` = true
WHERE `idUsuario` = 1;

SELECT `usuario`.`idUsuario`,
    `usuario`.`nome`,
    `usuario`.`email`,
    `usuario`.`cpf`,
    `usuario`.`telefone`,
    `usuario`.`dtNascimento`,
    `usuario`.`senha`,
    `usuario`.`is_admin`,
    `usuario`.`novidades`
FROM `pi_dh`.`usuario`;

DELETE FROM `pi_dh`.`usuario`
WHERE idUsuario = 0;


UPDATE `pi_dh`.`usuario`
SET
`nome` = 'Rafael Aparecido Silva de Oliveira'
WHERE `idUsuario` = 1;


