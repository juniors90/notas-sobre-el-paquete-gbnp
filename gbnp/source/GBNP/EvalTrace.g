# Ejemplo-EvalTrace
# Primero calculamos la base de Gröbner trazada de la lista de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ],[ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
Lnp := [ p1, p2 ];;
GBT := SGrobnerTrace( Lnp );;
# Para comprobar que los polinomios en GBT pertenecen al ideal generado por
# p1 y p2, evaluamos la traza.
# Para cada polinomio p trazado en GBT, el polinomio p.pol se equipara a la
# expresión evaluada p.trace, en la que cada aparición de G(i) se reemplaza por
# Lnp[i] mediante el uso de EvalTrace.
ForAll( GBT, q -> EvalTrace( q, Lnp ) = q.pol );