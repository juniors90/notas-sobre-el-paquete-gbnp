# Ejemplo-MulQA
# Considere la siguiente base de Gröbner.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
G := Grobner( [ p1, p2 ] );;
PrintNPList(G);
# Imprima el producto en el álgebra del cociente de los polinomios a-2 y b-3 mediante el uso de MulQA:
s1 := [ [ [ 1 ], [ ] ], [ 1, -2 ] ];;
s2 := [ [ [ 2 ], [ ] ], [ 1, -3 ] ];;
PrintNP( MulQA( s1, s2, G ) );
# El resultado debe ser igual a la forma normal fuerte del producto de a-2 y b-3 con respecto a G:
MulQA( s1, s2, G ) = StrongNormalFormNP( MulNP( s1, s2 ), G );