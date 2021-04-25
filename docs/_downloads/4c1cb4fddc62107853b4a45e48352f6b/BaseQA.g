# Ejemplo-BaseQA
# Considere la siguiente base de Gröbner.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
G := Grobner( [ p1, p2 ] );;
PrintNPList( G );
# La función BaseQA calcula una base para el álgebra cociente del álgebra libre sobre
# los racionales con generadores a y b por el ideal bilateral generado por G
PrintNPList( G );
BaseQA( G, 2, 0 );
PrintNPList( BaseQA( G, 2, 0 ) );
# Es necesario para un resultado correcto que el primer argumento sea una base Gröbner,
# como se verá claramente en la siguiente invocación de BaseQA.
PrintNPList( BaseQA( [ p1, p2 ], 2, 10 ) );