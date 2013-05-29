%%%%%%%%%%%%%%
%% Grupo 46 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 64787 Joao Miguel Louro Neto           %%
%% 66326 Fernando Antonio Lopes Rodrigues %%
%% 67077 Rui Miguel Baptista Botelho      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%
%% Estrutura peca %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Afirmacoes %%

% formas validas para uma peca
forma(triangulo).
forma(circulo).
forma(quadrado).

% cores validas para uma peca
cor(azul).
cor(amarelo).
cor(vermelho).

%% Construtor %%

% faz_peca(Forma, Cor, Peca)
%
% Peca e a peca com uma determinada Forma e Cor
faz_peca(Forma, Cor, peca(Forma, Cor)) :- forma(Forma), cor(Cor).

%% Selectores %%

% forma_peca(Peca, Forma)
%
% Forma e a forma de Peca
forma_peca(peca(Forma, _), Forma).

% cor_peca(Peca, Cor)
%
% Cor e a cor de Peca
cor_peca(peca(_, Cor), Cor).

%% Modificadores %%

% muda_forma(Forma, Peca, PecaAlterada)
%
% PecaAlterada representa Peca com forma Forma
muda_forma(Forma, peca(_, Cor), peca(Forma, Cor)) :- forma(Forma).

% muda_cor(Cor, Peca, PecaAlterada)
%
% PecaAlterada representa Peca com cor Cor
muda_cor(Cor, peca(Forma, _), peca(Forma, Cor)) :- cor(Cor).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estrutura tabuleiro %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Afirmacoes %%

% linhas validas para um tabuleiro
linha(top).
linha(center).
linha(bottom).

% colunas validas para um tabuleiro
coluna(left).
coluna(middle).
coluna(right).

% converteDuaslinhas(LinhaTab2Linhas, LinhaTabCompleto)
%
% LinhaTabCompleto representa as linhas possiveis no tabuleiro
% completo quando apenas temos uma pista cujo tabuleiro tem
% apenas duas linhas.
converteDuaslinhas(top, top).
converteDuaslinhas(top, center).
converteDuaslinhas(bottom, center).
converteDuaslinhas(bottom, bottom).

% converteDuasColunas(ColunaTab2Colunas, ColunaTabCompleto)
%
% analogo a converteDuaslinhas, mas aplicado as colunas dos
% tabuleiros, e nao as suas linhas.
% ColunaTabCompleto representa as colunas possiveis no tabuleiro
% completo quando apenas temos uma pista cujo tabuleiro tem
% apenas duas colunas
converteDuasColunas(left, left).
converteDuasColunas(left, middle).
converteDuasColunas(right, middle).
converteDuasColunas(right, right).

% escolheLinha(Linha, Tabuleiro, LinhaTabuleiro)
%
% LinhaTabuleiro e a linha Linha do Tabuleiro
escolheLinha(top,[A,B,C,_,_,_,_,_,_],[A,B,C]).
escolheLinha(center,[_,_,_,A,B,C,_,_,_],[A,B,C]).
escolheLinha(bottom,[_,_,_,_,_,_,A,B,C],[A,B,C]).

% colocaPecaEmColuna(Coluna, Peca, LinhaTabuleiro
%
% Coloca a peca Peca na coluna indicada por Coluna
% numa linha do tabuleiro (LinhaTabuleiro)
colocaPecaEmColuna(left,Peca,[Peca,_,_]).
colocaPecaEmColuna(middle,Peca,[_,Peca,_]).
colocaPecaEmColuna(right,Peca,[_,_,Peca]).

%%%%%%%%%%%%
%% Pistas %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%% Pistas basicas %%

% coloca(Peca, Linha, Coluna, Tabuleiro)
%
% Coloca a Peca na linha Linha e coluna Coluna
% no Tabuleiro (caso nao tenha ja sido colocada
% uma peca nessa posicao)
coloca(Peca, Linha, Coluna, Tabuleiro) :-
	faz_peca(_,_,Peca),
	linha(Linha),
	coluna(Coluna),
	escolheLinha(Linha, Tabuleiro, LinhaTabuleiro),
	colocaPecaEmColuna(Coluna, Peca, LinhaTabuleiro).

%%%%%%%%%%%%%%%%%%%%%%%%
%% Pistas intermedias %%

% rectanguloVertical(Peca, Linha, Coluna, Tabuleiro)
%
% Esta pista indica a Linha, Coluna onde esta uma Peca
% num subconjunto de Tabuleiro com 3 linhas e 2 colunas.
% Tenta colocar a Peca em qualquer posicao possivel do
% Tabuleiro que seja tambem indicada pela pista.
rectanguloVertical(Peca, Linha, Coluna, Tabuleiro) :-
	converteDuasColunas(Coluna, ColunaConvertida),
	coloca(Peca, Linha, ColunaConvertida, Tabuleiro).

% rectanguloHorizontal(Peca, Linha, Coluna, Tabuleiro)
%
% Esta pista indica a Linha, Coluna onde esta uma Peca
% num subconjunto de Tabuleiro com 2 linhas e 3 colunas.
% Tenta colocar a Peca em qualquer posicao possivel do
% Tabuleiro que seja tambem indicada pela pista.
rectanguloHorizontal(Peca, Linha, Coluna, Tabuleiro) :-
	converteDuaslinhas(Linha, LinhaConvertida),
	coloca(Peca, LinhaConvertida, Coluna, Tabuleiro).

% linhaTriplaVertical(Peca, Linha, Tabuleiro)
%
% Tenta colocar a Peca no Tabuleiro em qualquer posicao
% cuja sua linha e Linha.
linhaTriplaVertical(Peca, Linha, Tabuleiro) :-
	coluna(Coluna),
	coloca(Peca, Linha, Coluna, Tabuleiro).

% linhaTriplaHorizontal(Peca, Coluna, Tabuleiro)
%
% Tenta colocar a Peca no Tabuleiro em qualquer posicao
% cuja sua coluna e Coluna.
linhaTriplaHorizontal(Peca, Coluna, Tabuleiro) :-
	linha(Linha),
	coloca(Peca, Linha, Coluna, Tabuleiro).

% quadrado(Peca, Linha, Coluna, Tabuleiro)
%
% Esta pista indica a Linha, Coluna onde esta uma Peca
% num subconjunto de Tabuleiro com 2 linhas e 2 colunas.
% Tenta colocar a Peca em qualquer posicao possivel do
% Tabuleiro que seja tambem indicada pela pista.
quadrado(Peca, Linha, Coluna, Tabuleiro) :-
	converteDuaslinhas(Linha, LinhaConvertida),
	converteDuasColunas(Coluna, ColunaConvertida),
	coloca(Peca, LinhaConvertida, ColunaConvertida, Tabuleiro).

% linhaDuplaVertical(Peca, Linha, Tabuleiro)
%
% Esta pista indica a Linha onde esta uma Peca num
% subconjunto de Tabuleiro com 2 linhas e 1 coluna.
% Tenta colocar a Peca em qualquer posicao possivel do
% Tabuleiro que seja tambem indicada pela pista.
linhaDuplaVertical(Peca, Linha, Tabuleiro) :-
	converteDuaslinhas(Linha, LinhaConvertida),
	coluna(Coluna),
	coloca(Peca, LinhaConvertida, Coluna, Tabuleiro).

% linhaDuplaHorizontal(Peca, Coluna, Tabuleiro)
%
% Esta pista indica a Coluna onde esta uma Peca num
% subconjunto de Tabuleiro com 1 linha e 2 colunas.
% Tenta colocar a peca em qualquer posicao possivel do
% Tabuleiro que seja tambem indicada pela pista.
linhaDuplaHorizontal(Peca, Coluna, Tabuleiro) :-
	converteDuasColunas(Coluna, ColunaConvertida),
	linha(Linha),
	coloca(Peca, Linha, ColunaConvertida, Tabuleiro).

%%%%%%%%%%%%%%%%%%%%%%
%% pistas avancadas %%

% matrizNeg(Peca, ListaNeg, Tabuleiro)
% Coloca a Peca no Tabuleiro, em qualquer posicao
% livre que nao esteja em ListaNeg
matrizNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	coluna(Coluna),
	not(member((Linha, Coluna), ListaNeg)),
	coloca(Peca, Linha, Coluna, Tabuleiro).

% rectanguloVerticalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% rectanguloVertical(Peca, Linha, Coluna, Tabuleiro)
% em que (Linha, Coluna) nao ocorre em ListaNeg e sao
% linhas e colunas (respectivamente) validas num tabuleiro.
rectanguloVerticalNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	coluna(Coluna),
	not(member((Linha, Coluna), ListaNeg)),
	rectanguloVertical(Peca, Linha, Coluna, Tabuleiro).

% rectanguloHorizontalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% rectanguloHorizontal(Peca, Linha, Coluna, Tabuleiro)
% em que (Linha, Coluna) nao ocorre em ListaNeg e sao
% linhas e colunas (respectivamente) validas num tabuleiro.
rectanguloHorizontalNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	coluna(Coluna),
	not(member((Linha, Coluna), ListaNeg)),
	rectanguloHorizontal(Peca, Linha, Coluna, Tabuleiro).

% linhaTriplaVerticalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% linhaTriplaVertical(Peca, Linha, Tabuleiro)
% em que Linha nao ocorre em ListaNeg e representa
% uma linha valida num tabuleiro.
linhaTriplaVerticalNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	not(member(Linha, ListaNeg)),
	linhaTriplaVertical(Peca, Linha, Tabuleiro).

% linhaTriplaHorizontalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% linhaTriplaHorizontal(Peca, Coluna, Tabuleiro)
% em que Coluna nao ocorre em ListaNeg e representa
% uma coluna valida num tabuleiro.
linhaTriplaHorizontalNeg(Peca, ListaNeg, Tabuleiro) :-
	coluna(Coluna),
	not(member(Coluna, ListaNeg)),
	linhaTriplaHorizontal(Peca, Coluna, Tabuleiro).

% quadradoNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% quadrado(Peca, Linha, Coluna, Tabuleiro)
% em que (Linha, Coluna) nao ocorre em ListaNeg e sao
% linhas e colunas (respectivamente) validas num tabuleiro.
quadradoNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	coluna(Coluna),
	not(member((Linha, Coluna), ListaNeg)),
	quadrado(Peca, Linha, Coluna, Tabuleiro).

% linhaDuplaVerticalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% linhaDuplaVertical(Peca, Linha, Tabuleiro)
% em que Linha nao ocorre em ListaNeg e representa
% uma linha valida num tabuleiro.
linhaDuplaVerticalNeg(Peca, ListaNeg, Tabuleiro) :-
	linha(Linha),
	not(member(Linha, ListaNeg)),
	linhaDuplaVertical(Peca, Linha, Tabuleiro).

% linhaDuplaHorizontalNeg(Peca, ListaNeg, Tabuleiro)
% Tenta todas as combinacoes de
% linhaDuplaHorizontal(Peca, Coluna, Tabuleiro)
% em que Coluna nao ocorre em ListaNeg e representa
% uma coluna valida num tabuleiro.
linhaDuplaHorizontalNeg(Peca, ListaNeg, Tabuleiro) :-
	coluna(Coluna),
	not(member(Coluna, ListaNeg)),
	linhaDuplaHorizontal(Peca, Coluna, Tabuleiro).

