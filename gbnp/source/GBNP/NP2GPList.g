# Ejemplo-NP2GPList
# Sea A el álgebra asociativa libre con uno sobre los racionales de los generadores a y b.
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
# Sea Lnp una lista de polinomios en formato NP.
# Entonces Lnp se puede convertir a una lista de polinomios de A con NP2GPList:
Lnp:=[ [ [ [ 1, 1, 1 ], [ 1 ] ], [ 1, -1 ] ],
  [ [ [ 2, 2 ], [ ] ], [ 1, -1 ] ] ];;
NP2GPList(Lnp,A);
# Tiene el mismo efecto que la función List aplicada de la siguiente manera.
List(Lnp, p -> NP2GP(p,A));
# Ahora sea M un módulo de dimensión 2 sobre A y Lnp una lista de vectores en formato NPM.
# Entonces los polinomios Lnp se pueden convertir a los vectores correspondientes de M con NP2GPList:
M:=A^2;;
Lnp:=[ [ [ [ -2, 1, 1 ], [ -2, 1 ] ], [ 1, -1 ] ],
  [ [ [ -1, 1 ], [ -2 ] ], [ 1, -1 ] ] ];;
NP2GPList(Lnp,M);
# Se puede obtener el mismo resultado mediante la aplicación de la función List estándar:
List(Lnp, m -> NP2GP(m,M)) = NP2GPList(Lnp,M);