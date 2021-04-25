# Ejemplo-SGrobner
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ],[ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ],[ 1, -1 ] ];;
PrintNPList([p1,p2]);
# Su base de Gröbner se puede calcular mediante la función Grobner.
G := SGrobner( [ p1, p2 ] );;
PrintNPList( G );
# Se invoca una iteración de los cálculos de Gröbner mediante el uso del parámetro max:
R := SGrobner( [ p1, p2 ], 1 );;
PrintNPList( R.G );
PrintNPList( R.todo );
R.iterations;
R.completed;
# La lista anterior R.todo se puede utilizar para reanudar el cálculo del cálculo de la
# base de Gröbner con el par de Gröbner R.G, R.todo:
PrintNPList( SGrobner( R.G, R.todo ) );