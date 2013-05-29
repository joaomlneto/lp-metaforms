%------------------------------
%
%             Testes
%
%------------------------------

% Teste com pistas básicas
desafio(1, Tabuleiro) :- 
	coloca(peca(quadrado, amarelo), top, left, Tabuleiro),
	coloca(peca(circulo, vermelho), top, middle, Tabuleiro),
	coloca(peca(triangulo, azul), top, right, Tabuleiro),
	coloca(peca(triangulo, vermelho), center, left, Tabuleiro),
	coloca(peca(triangulo, amarelo), center, middle, Tabuleiro),
	coloca(peca(circulo, azul), center, right, Tabuleiro),
	coloca(peca(quadrado, azul), bottom, left, Tabuleiro),
	coloca(peca(circulo, amarelo), bottom, middle, Tabuleiro),
	coloca(peca(quadrado, vermelho), bottom, right, Tabuleiro).

% Teste com pistas intermédias
desafio(2, Tabuleiro) :- 
	coloca(peca(circulo, amarelo), top, left, Tabuleiro),
	coloca(peca(quadrado, azul), center, right, Tabuleiro),
	coloca(peca(quadrado, vermelho), bottom, middle, Tabuleiro),
	coloca(peca(triangulo, vermelho), center, left, Tabuleiro),
	coloca(peca(quadrado, amarelo), top, middle, Tabuleiro),
	coloca(peca(triangulo, azul), bottom, right, Tabuleiro),
	linhaTriplaHorizontal(peca(triangulo, amarelo), right, Tabuleiro),
	linhaTriplaVertical(peca(circulo, vermelho), bottom, Tabuleiro),
	coloca(peca(circulo, azul), center, middle, Tabuleiro).


% Teste com pistas intermédias
desafio(3, Tabuleiro) :- 
	coloca(peca(quadrado, azul), top, right, Tabuleiro),
	rectanguloVertical(peca(triangulo, amarelo), top, right, Tabuleiro),
	rectanguloHorizontal(peca(circulo, vermelho), top, right, Tabuleiro),
	linhaTriplaHorizontal(peca(quadrado, vermelho), right, Tabuleiro),
	quadrado(peca(quadrado, amarelo), top, right, Tabuleiro),
	linhaTriplaVertical(peca(triangulo, vermelho), center, Tabuleiro),
	quadrado(peca(circulo, amarelo), top, left, Tabuleiro),
	linhaDuplaHorizontal(peca(triangulo, azul), right, Tabuleiro),
	coloca(peca(circulo, azul), bottom, left, Tabuleiro).

% Teste com pistas avançadas
desafio(4, Tabuleiro) :-
	coloca(peca(triangulo, vermelho), top, middle, Tabuleiro), 
	coloca(peca(triangulo, amarelo), center, left, Tabuleiro),
	matrizNeg(peca(triangulo, azul), 
      [(top, right), (center, middle), (center, right), 
      (bottom, left), (bottom, middle), (bottom, right)], Tabuleiro), 
	matrizNeg(peca(quadrado, vermelho),
      [(top, middle), (top, right), (center, middle), (center, right), 
      (bottom, middle), (bottom, right)], Tabuleiro), 
	matrizNeg(peca(quadrado, amarelo), 
      [(top, right), (center, right), (bottom, left), 
      (bottom, middle), (bottom, right)], Tabuleiro), 
	matrizNeg(peca(quadrado, azul), 
      [(top, right), (center, left), (center, middle), (center, right), 
      (bottom, right)], Tabuleiro), 
	matrizNeg(peca(circulo, vermelho), 
      [(top, left), (top, middle), (top, right), (center, left), 
      (center, right)], Tabuleiro), 
	matrizNeg(peca(circulo, amarelo), 
      [(top, right), (center, middle), (bottom, left)], Tabuleiro), 
	matrizNeg(peca(circulo, azul), 
      [(top, middle), (center, left), (center, middle), (center, right), 
      (bottom, middle)], Tabuleiro).

% Teste com pistas avançadas
desafio(5, Tabuleiro) :-
	coloca(peca(triangulo, vermelho), center, middle, Tabuleiro), 
	coloca(peca(triangulo, amarelo), bottom, middle, Tabuleiro),
	rectanguloHorizontalNeg(peca(triangulo, azul), 
      [(top, left), (bottom, left), (top, right), (bottom, right)], Tabuleiro), 
	rectanguloHorizontalNeg(peca(quadrado, vermelho),
      [(top, left), (top, right), (bottom, right)], Tabuleiro), 
	rectanguloVerticalNeg(peca(quadrado, amarelo), 
      [(top, left), (center, left), (center, right), 
      (bottom, right)], Tabuleiro), 
	rectanguloVerticalNeg(peca(quadrado, azul), 
      [(top, left), (center, left), (bottom, right)], Tabuleiro), 
	rectanguloVerticalNeg(peca(circulo, vermelho), 
      [(top, left), (center, right), 
      (bottom, right)], Tabuleiro), 
	rectanguloHorizontalNeg(peca(circulo, amarelo), 
      [(top, left), (bottom, middle), (top, right)], Tabuleiro), 
	rectanguloHorizontalNeg(peca(circulo, azul), 
      [(top, middle), (top, right), (bottom, left)], Tabuleiro).
