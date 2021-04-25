# Ejemplo-NP2GP
# Sea A el álgebra asociativa libre con uno sobre los racionales de
# los generadores a y b. 
A:=FreeAssociativeAlgebraWithOne(GF(3),"a","b");;
# Sea np un polinomio en formato NP.
np:=[ [ [ 2, 1 ], [ 1, 2 ], [  ] ], [ Z(3)^0, Z(3), Z(3) ] ];;
# El polinomio se puede convertir al elemento correspondiente de A
# con NP2GP:
NP2GP(np,A);
# Tenga en cuenta que parte de la información del campo de coeficientes
# de un polinomio np en formato NP se puede obtener de la segunda
# lista de np.
One(np[2][1]);
# Ahora bien, sea M el módulo A^2 y sea npm un polinomio sobre
# ese módulo en forma NPM.
M:=A^2;;
npm:=[ [ [ -1, 1 ], [ -2, 2 ] ], [ Z(3)^0, Z(3)^0 ] ];;
# El elemento de M correspondiente a npm es
NP2GP(npm,M);
# Si M es un módulo de dimensión 2 sobre A y Lnp es una lista de
# polinomios en formato NPM, entonces los polinomios se pueden convertir
# a los polinomios correspondientes de M de la siguiente manera:
M:=A^2;;
Lnp:=[ [ [ [ -2, 1, 1 ], [ -2, 1 ] ], [ 1, -1 ] ],
  [ [ [ -1, 2, 2], [-2, 1 ] ], [ 1, -1 ]*Z(3)^0 ] ];;
List(Lnp, m -> NP2GP(m,M));