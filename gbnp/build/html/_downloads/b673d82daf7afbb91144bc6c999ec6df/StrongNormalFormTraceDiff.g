# Ejemplo-StrongNormalFormTraceDiff
# Primero calculamos la base de Gröbner trazada de la lista de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
# Del polinomio a^6 calculamos su diferencia con la forma normal.
# El resultado se imprime mediante el uso de PrintNP y PrintTraceList.
f := [ [ [1, 1, 1, 1, 1, 1 ] ], [ 1 ] ];;
sf := StrongNormalFormTraceDiff( f, GBT );;
PrintNP( sf.pol );
PrintTraceList( [ sf ] );