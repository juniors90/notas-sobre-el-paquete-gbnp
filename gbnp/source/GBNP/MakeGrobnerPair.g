# Ejemplo-MakeGrobnerPair
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
# La función MakeGrobnerPair convierte la lista con estos dos polinomios en
# un par de Gröbner, una vez que se agrega la lista vacía como segundo argumento.
# El resultado es un registro cuyos campos G y todo
GP := MakeGrobnerPair( [ p1, p2 ], [ ] );;
PrintNPList( GP.G );
PrintNPList( GP.todo );
# Estos campos están listos para su uso en Grobner
GB := Grobner( GP.G, GP.todo );;
PrintNPList( GB );