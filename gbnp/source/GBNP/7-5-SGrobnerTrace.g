# Ejemplo-SGrobnerTrace
# Para la lista de los siguientes dos polinomios en formato NP, se calcula una base de Gröbner trazada.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );