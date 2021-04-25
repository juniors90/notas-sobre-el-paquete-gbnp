# Ejemplo-MatricesQA
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# La función MatricesQA da la lista de matrices encontradas por MatrixQA cuando el primer
# argumento toma los valores enteros entre 1 y el número de todos los generadores de álgebra.
GB := Grobner( [ p1, p2 ] );;
B := BaseQA( GB, 2, 0 );;
mats := MatricesQA( 2, B, GB );;
for mat in mats do Display( mat ); Print("\n"); od;
# El resultado también se puede obtener mediante el uso de la función Lista:
MatricesQA( 2, B, GB ) = List([1,2], q -> MatrixQA( q, B, GB ) );