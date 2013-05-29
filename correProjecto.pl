start :- carregaProjecto, desafios.
carregaProjecto :- ['metaforms.pl'], ['testes.pl'].
desafios :- writeln('teste 1'), desafio(1, Tabuleiro1), write(Tabuleiro1), nl, nl,
          writeln('teste 2'), desafio(2, Tabuleiro2), write(Tabuleiro2), nl, nl,
          writeln('teste 3'), desafio(3, Tabuleiro3), write(Tabuleiro3), nl, nl,
          writeln('teste 4'), desafio(4, Tabuleiro4), write(Tabuleiro4), nl, nl,
          writeln('teste 5'), desafio(5, Tabuleiro5), write(Tabuleiro5).
          
          