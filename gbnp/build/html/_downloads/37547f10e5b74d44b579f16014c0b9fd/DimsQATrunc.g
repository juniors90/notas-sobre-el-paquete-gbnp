# Ejemplo-DimsQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
# La información sobre las dimensiones de las partes homogéneas del álgebra del cociente
# se encuentra de la siguiente manera,
DimsQATrunc( GB, 12, wtv );