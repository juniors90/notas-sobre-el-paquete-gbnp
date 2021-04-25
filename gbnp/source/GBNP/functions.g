######################### BEGIN COPYRIGHT MESSAGE #########################
# GBNP - computing Gröbner bases of noncommutative polynomials
# Copyright 2001-2010 by Arjeh M. Cohen, Dié A.H. Gijsbers, Jan Willem
# Knopper, Chris Krook. Address: Discrete Algebra and Geometry (DAM) group
# at the Department of Mathematics and Computer Science of Eindhoven
# University of Technology.
# 
# For acknowledgements see the manual. The manual can be found in several
# formats in the doc subdirectory of the GBNP distribution. The
# acknowledgements formatted as text can be found in the file chap0.txt.
# 
# GBNP is free software; you can redistribute it and/or modify it under
# the terms of the Lesser GNU General Public License as published by the
# Free Software Foundation (FSF); either version 2.1 of the License, or
# (at your option) any later version. For details, see the file 'LGPL' in
# the doc subdirectory of the GBNP distribution or see the FSF's own site:
# http://www.gnu.org/licenses/lgpl.html
########################## END COPYRIGHT MESSAGE ##########################

# Primero cargamos el paquete gap (antes del ejemplo)
LoadPackage("GBNP","0",false);
# Ejemplo-GP2NP
# Sea A el álgebra asociativa libre con uno sobre los
# racionales de los generadores a y b. Sea e el uno del álgebra.
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
a:=A.a;;
b:=A.b;;
e:=One(A);;
z:=Zero(A);;
# Ahora sea gp el polinomio ba-ab-e.
gp:=b*a-a*b-e;
# El polinomio en formato NP, correspondiente a gp ahora se
# puede obtener con GP2NP:
GP2NP(gp);
# Sea D el álgebra asociativa libre sobre A de rango 2.
D := A^2;;
# Tomamos la siguiente lista R de dos elementos de D.
R := [ [b-e, z], [e+a*(e+a+b), -e-a*(e+a+b)] ];;
# Convertimos la lista R a una lista de vectores en formato NPM.
List(R,GP2NP);


# Ejemplo-GP2NPList
# Sea A el álgebra asociativa libre con uno sobre los racionales de los
# generadores ay b. Sea e el del álgebra.
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
a:=A.a;;
b:=A.b;;
e:=One(A);;
# Sea Lgp la lista de polinomios [a^2-e,b^2-e,ba-ab-e].
Lgp:=[a^2-e,b^2-e,b*a-a*b-e];
# El polinomio en formato NP correspondiente a gp se puede
# obtener con GP2NP:
GP2NPList(Lgp);
# El mismo resultado se obtiene mediante una simple aplicación
# de la función Lista estándar en GAP:
List(Lgp,GP2NP) = GP2NPList(Lgp);

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


# Ejemplo-PrintNP
# Considere el siguiente polinomio en formato NP.
p := [ [ [ 1, 1, 2 ], [ 1, 2, 2 ],[ ] ], [ 1, -2 , 3 ] ];;
# Se puede imprimir en forma de polinomio en a y b mediante la función PrintNP:
PrintNP( p );


# Ejemplo-ConfigPrint
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ],[ ] ],[ 1,-1 ] ];;
p2 := [ [ [ 1, 2, 2 ],[ ] ],[ 1,-1 ] ];;
# Ellos pueden ser impresos por la función PrintNP.
PrintNP( p1 );
PrintNP( p2 );
# Podemos dejar que las variables se impriman como xey en lugar de a y b
# mediante GBNP.ConfigPrint
GBNP.ConfigPrint( "x" , "y" );
PrintNP( p1 );
PrintNP( p2 );
# También podemos dejar que las variables se impriman como x.1 y x.2 en
# lugar de a y b mediante GBNP.ConfigPrint.
GBNP.ConfigPrint( 2 , "x" );
PrintNP( p1 );
PrintNP( p2 );
# Incluso podemos asignar cadenas a las variables a imprimir como alice y bob
# en lugar de ayb mediante GBNP.ConfigPrint.
GBNP.ConfigPrint( "alice" , "bob" );
PrintNP( p1 );
PrintNP( p2 );
# Alternativamente, podemos introducir el álgebra libre A con dos generadores
# e imprimir los polinomios como miembros de A:
A:=FreeAssociativeAlgebraWithOne(Rationals, "a" , "b" );;
GBNP.ConfigPrint( A );
PrintNP( p1 );
PrintNP( p2 );


# Ejemplo-PrintNPList
# Ponemos dos polinomios en formato NP en la lista Lnp.
p1 := [ [ [ 1, 1, 2 ] , [ ] ] , [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ] , [ ] ] , [ 1, -1 ] ];;
Lnp := [p1,p2];;
# Podemos imprimir la lista con PrintNPList.
PrintNPList(Lnp);
# Alternativamente, usando la función GBNP.ConfigPrint, podemos introducir el álgebra
# libre A con dos generadores e imprimir los polinomios de la lista como miembros de A:
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
GBNP.ConfigPrint(A);
PrintNPList(Lnp);


# Ejemplo-AddNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
# El segundo se puede restar del primero mediante la función AddNP.
PrintNP( AddNP( p1, p2, 1, -1 ) );


# Ejemplo-BimulNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
# Multiplicar p1 de la derecha por by multiplicar p2 de
# la izquierda por a es posible con la función BimulNP:
PrintNP( BimulNP( [ ], p1, [2] ) );
PrintNP( BimulNP( [ 1 ], p2, [ ] ) );


# Ejemplo-CleanNP
# Considere el siguiente polinomio en formato NP.
p := [[[1,1,2],[],[1,1,2],[]],[1,-3,-2,3]];;
PrintNP(p);
# Los monomios [1,1,2] y [] aparecen dos veces cada uno.
# Para muchas funciones esta representación de un polinomio en formato NP no está permitida.
# Necesita ser limpiado, como por CleanNP:
PrintNP(CleanNP(p));
# Para definir un polinomio sobre GF (2), los coeficientes deben definirse sobre este campo.
# Esta lista de coeficientes se puede obtener en GAP a partir de una lista de números enteros
# multiplicando por el elemento de identidad del campo.
# El polinomio resultante no necesita estar limpio, por lo que debe limpiarse nuevamente con CleanNP.
p := [[[1,1,2],[]],One(GF(2))*[1,-2]];;
CleanNP(p);


# Ejemplo-GtNP
# Consideremos los dos siguientes monomios.
u := [1,1,2];
v := [2,2,1];
# Probamos si u es mayor que v.
GtNP(u,v);


# Ejemplo-LtNP
# Considere los siguientes dos monomios.
u := [1,1,2];
v := [2,2,1];
# Probamos si u es menor que v.
LtNP(u,v);


# Ejemplo-LMonsNP
# Ponemos dos polinomios en formato NP en la lista Lnp.
p1 := [[[1,1,2],[]],[1,-1]];;
p2 := [[[1,2,2],[]],[1,-1]];;
Lnp := [p1,p2];;
# LMonsNP calcula la lista de los principales monomios:
LMonsNP(Lnp);
# Para una mejor impresión, los monomios se pueden convertir en polinomios en formato NP y
# luego enviarlos a PrintNPList:
PrintNPList(List(LMonsNP(Lnp), q -> [[q],[1]]));


# Ejemplo-MkMonicNP 
# Considere el siguiente polinomio en formato NP.
p := [ [ [ 1, 1, 2 ], [ ] ], [ 2, -1 ] ];;
PrintNP(p);
# El coeficiente del término principal es 2. La función MkMonicNP encuentra este coeficiente y
# divide todos los términos por él:
PrintNP( MkMonicNP( p ) );


# Ejemplo-MulNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
# La función MulNP multiplica los dos polinomios.
PrintNP( MulNP( p1, p2 ) );
# El hecho de que esta multiplicación no es conmutativa se ilustra con la siguiente comparación,
# usando MulNP dos veces y AddNP una vez.
PrintNP( AddNP( MulNP( p1, p2 ), MulNP( p2, p1 ), 1, -1 ) );


# Ejemplo-StrongNormalFormNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
# La forma normal fuerte del polinomio
p := [ [ [ 1, 1, 1, 2 ], [ 2, 1 ],[ ] ], [ 1, -1, 3 ] ];;
# con respecto a la lista [p1, p2] se calcula mediante el uso de la función StrongNormalFormNP:
PrintNP( StrongNormalFormNP( p, [ p1, p2 ] ) );


# Ejemplo-Grobner
# Considere los siguientes dos polinomios en formato NP.
p1 := [[[1,1,2],[]],[1,-1]];;
p2 := [[[1,2,2],[]],[1,-1]];;
PrintNPList([p1,p2]);
# Su base de Gröbner se puede calcular mediante la función Grobner.
G := Grobner([p1,p2]);;
PrintNPList(G);
# Se invoca una iteración de los cálculos de Gröbner mediante el uso del parámetro max:
R := Grobner([p1,p2],1);;
PrintNPList(R.G);
PrintNPList(R.todo);
R.iterations;
R.completed;
# La lista anterior R.todo se puede utilizar para reanudar el cálculo del cálculo de la
# base de Gröbner con el par de Gröbner R.G, R.todo:
PrintNPList(Grobner(R.G,R.todo));
# Para realizar el cálculo de la base de Gröbner con polinomios en un álgebra libre sobre
# el campo GF (2), es necesario definir los coeficientes de los polinomios sobre ese campo.
PrintNPList(Grobner([[p1[1],One(GF(2))*p1[2]],[p2[1],One(GF(2))*p1[2]]]));


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


# Ejemplo-DimQA
# Considere la siguiente base de Gröbner.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -2 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -2 ] ];;
G := Grobner( [ p1, p2 ] );;
PrintNPList( G );
# La función DimQA calcula la dimensión del álgebra cociente del álgebra libre sobre
# los racionales con generadores a y b por el ideal bilateral generado por G.
DimQA( G, 2 );


# Ejemplo-MulQA
# Considere la siguiente base de Gröbner.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
G := Grobner( [ p1, p2 ] );;
PrintNPList(G);
# Imprima el producto en el álgebra del cociente de los polinomios a-2 y b-3 mediante el uso de MulQA:
s1 := [ [ [ 1 ], [ ] ], [ 1, -2 ] ];;
s2 := [ [ [ 2 ], [ ] ], [ 1, -3 ] ];;
PrintNP( MulQA( s1, s2, G ) );
# El resultado debe ser igual a la forma normal fuerte del producto de a-2 y b-3 con respecto a G:
MulQA( s1, s2, G ) = StrongNormalFormNP( MulNP( s1, s2 ), G );


# Ejemplo-StrongNormalFormNPM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
PrintNPList( [ v1, v2 ] );
# SGrobnerModule encuentra el registro base de Gröbner para estos datos:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
PrintNPList( GBR.ts );
PrintNPList( GBR.p );
# El vector w adquiere una forma normal fuerte con respecto a GBR:
w := [ [ [ -1, 2 ], [ -2, 1 ] ], [ 1, -4 ] ];;
PrintNP( w );
v := StrongNormalFormNPM( w, GBR );;
PrintNP( v );


# Ejemplo-IsStrongGrobnerBasis
# Considere la siguiente lista de dos polinomios en formato NP.
Lnp := [[[[1,1,2],[]],[1,-1]], [[[1,2,2],[]],[1,-1]]];;
PrintNPList(Lnp);
# La función IsStrongGrobner comprueba si la lista tiene una base sólida de Gröbner.
IsStrongGrobnerBasis(Lnp);
# Pero la respuesta debería ser cierta para el resultado de un cálculo sólido de Gröbner:
IsStrongGrobnerBasis(SGrobner(Lnp));
# Una base de Gröbner que no es una base de Gröbner fuerte:
B := SGrobner(Lnp);;
Add(B,AddNP(Lnp[1],B[1],1,-1));;
PrintNPList(B);
IsGrobnerBasis(B);
IsStrongGrobnerBasis(B);


# Ejemplo-IsGrobnerBasis
# Considere la siguiente lista de dos polinomios en formato NP.
Lnp := [[[[1,1,2],[]],[1,-1]], [[[1,2,2],[]],[1,-1]]];;
PrintNPList(Lnp);
# La función IsGrobner comprueba si la lista es una base Gröbner.
IsGrobnerBasis(Lnp);
# Entonces, la respuesta debería ser cierta para el resultado de un cálculo de Gröbner:
IsGrobnerBasis(Grobner(Lnp));


# Ejemplo-IsGrobnerPair
# Considere los siguientes cuatro polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ],[ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [1, -1 ] ];;
q1 := [ [ [ 2 ], [ 1 ] ], [ 1, -1 ] ];;
q2 := [ [ [ 1, 1, 1 ], [ ] ], [ 1, -1 ] ];;
# La función IsGrobnerPair se utiliza para comprobar si algunas combinaciones de estos polinomios
# en dos listas proporcionan pares de Gröbner.
IsGrobnerPair( [ p1, p2, q1 ], [ q2 ] );
IsGrobnerPair( [ q1, q2 ], [ p1, p2 ] );
# La función IsGrobnerPair aplicada con una lista vacía como segundo argumento es una verificación
# de si el primer argumento es una base de Gröbner.
IsGrobnerPair( [ p1, p2 ], [ ] ) = IsGrobnerBasis( [ p1, p2 ] );


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


# Ejemplo-SGrobnerModule
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -2 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -3 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
# El registro GBR tiene dos campos, p para relaciones de prefijo (vectores en el módulo)
# y ts para relaciones de dos lados (polinomios en el álgebra):
PrintNPList( GBR.p );
PrintNPList( GBR.ts );


# Ejemplo-MulQM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
PrintNPList( [ v1, v2 ] );
# SGrobnerModule encuentra el registro base de Gröbner para estos datos:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
PrintNPList( GBR.ts );
PrintNPList( GBR.p );
# La función MulQM calcula el producto del vector w con el polinomio q.
w := [ [ [ -1, 2 ], [ -2, 1 ] ], [ 1, -4 ] ];;
PrintNP( w );
q := [ [ [ 2, 2, 1 ], [ 1 ] ], [ 2, 3 ] ];;
PrintNP( q );
wq := MulQM( w, q, GBR );;
PrintNP( wq );


# Ejemplo-BaseQM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [[[-1,1,2],[-1]],[1,-1]];;
v2 := [[[-2,2,2],[-2]],[1,-2]];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos
GBR := SGrobnerModule([v1,v2],[p1,p2]);;
PrintNPList(GBR.ts);
PrintNPList(GBR.p);
# La función BaseQM calcula una base.
B := BaseQM(GBR,2,2,0);;
PrintNPList(B);
# La función BaseQM con argumentos para que el número de dimensiones del
# módulo y el número de variables sean mínimos.
B := BaseQM(GBR,0,0,0);;
PrintNPList(B);
# La función BaseQM también se puede utilizar para calcular los tres primeros elementos de una base.
B := BaseQM(GBR,2,2,3);;
PrintNPList(B);


# Ejemplo-DimQM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -2 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -1 ] ], [ 1, -2 ] ];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
# La función DimQM calcula la dimensión sobre los racionales del cociente del módulo libre
# sobre el álgebra libre en dos generadores por el submódulo generado por los vectores
# v1, v2, [p, q], donde p y q corren sobre todos los elementos de el ideal de dos caras
# en el álgebra libre generado por p1 y p2.
SetInfoLevel( InfoGBNP, 2 );
DimQM( GBR, 2, 2 );
# La respuesta debe ser igual al tamaño de BaseQM (GBR, t, mt, 0).
DimQM( GBR, 2, 2 ) = Length( BaseQM( GBR, 2, 2, 0 ) );
SetInfoLevel( InfoGBNP, 0 );


# Ejemplo-MatrixQA
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# La matriz de multiplicación correcta por el primer indeterminado a en el álgebra
# del cociente con respecto al ideal generado por p1 y p2 se obtiene aplicando MatrixQA
# a la base de Gröbner de estos generadores y una base del álgebra del cociente como se
# encuentra en BaseQA
GB := Grobner( [ p1, p2 ] );;
B := BaseQA( GB, 2, 0 );;
PrintNPList( B );
Display( MatrixQA( 1, B, GB ) );
# La función también es aplicable a los registros base de Gröbner para módulos.
# Considere los siguientes dos vectores.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [1, -2 ] ];;
# SGrobnerModule encuentra el registro de la base de Gröbner para estos datos y BaseQM
# una base de módulo de cociente:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
B := BaseQM( GBR, 2, 2, 0 );;
# La matriz de multiplicación correcta por a, el primer generador del álgebra libre, es
Display( MatrixQA( 1, B, GBR ) );


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


# Ejemplo-MatrixQAC
# Consider the following two polynomials in NP format.
F := GF(256);
z := GeneratorsOfField(F)[1];
p1 := [[[1,1,1,2],[]],[z,1]];;
p2 := [[[2,2,2,1],[]],[1,z]];;
# The polynomials p1 and p2 have coefficients in the field F of order 256.
# The matrix of right multiplication by the first indeterminate a on the quotient algebra is obtained by applying MatrixQAC just like MatrixQA. The difference is that the result is in another format.
GB := Grobner([p1,p2]);
B := BaseQA(GB,2,0);
MatrixQAC(1, B,GB);


# example-MatricesQAC
# Consider the following two polynomials in NP format.
F := GF(256);
z := GeneratorsOfField(F)[1];
p1 := [[[1,1,1,2],[]],[z,1]];;
p2 := [[[2,2,2,1],[]],[1,z]];;
# The polynomials p1 and p2 have coefficients in the field F of order 256.
# The matrices of right multiplication by the indeterminates on the quotient algebra  are just like for MatricesQA except for the format of the result.
GB := Grobner([p1,p2]);
B := BaseQA(GB,2,0);
MatricesQAC(2,B,GB);


# Ejemplo-PreprocessAnalysisQA
# Considere los siguientes dos polinomios en formato NP de los cuales se calcula una base de Gröbner.
F := GF(256);
z := GeneratorsOfField(F)[1];
p1 := [[[1,1,1,1,2],[]],[1,-1]];;
p2 := [[[2,2,2,1,1,1],[]],[1,-1]];;
GB := Grobner([p1,p2]);;
PrintNPList(GB);
# La aplicación de PreprocessAnalysisQA se lleva a cabo en los términos principales de GB,
# con 2, 4, 8, recursiones, respectivamente.
L := LMonsNP(GB);
L1 := PreprocessAnalysisQA(L,2,2);
L2 := PreprocessAnalysisQA(L1,2,4);


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


# Ejemplo-SGrobnerTrace
# Para la lista de los siguientes dos polinomios en formato NP, se calcula una base de Gröbner trazada.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );


# Ejemplo-StrongNormalFormTraceDiff
# Primero calculamos la base de Gröbner trazada de la lista de los siguientes dos polinomios en formato NP.
p1 := [[[1,1,2],[]],[1,-1]];;
p2 := [[[2,2,1],[]],[1,-1]];;
GBT := SGrobnerTrace([p1,p2]);;
# Del polinomio a^6 calculamos su diferencia con la forma normal.
# El resultado se imprime mediante el uso de PrintNP y PrintTraceList.
f := [[[1,1,1,1,1,1]],[1]];;
sf := StrongNormalFormTraceDiff(f,GBT);;
PrintNP(sf.pol);
PrintTraceList([sf]);


# Ejemplo-SGrobnerTrunc
# Considere los siguientes dos polinomios en formato NP.
p1 := [[[1,2,2,1],[2,1,1,2]],[1,-1]];;
p2 := [[[2,2,2],[1,1]],[1,-1]];;
PrintNPList([p1,p2]);
# Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
# La base de Gröbner truncada por encima del grado 12 de la lista [p1, p2] se calcula y
# posteriormente se imprime como sigue.
PrintNPList(SGrobnerTrunc([p1,p2],12,[3,2]));


# Ejemplo-CheckHomogeneousNPs
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
# Esto se verifica de la siguiente manera.
CheckHomogeneousNPs( [ p1, p2 ], [ 3, 2 ] );


# Ejemplo-BaseQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ],[ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
GBNP.ConfigPrint( "a", "b" );
PrintNPList( GB );
# Se encuentra e imprime una base de monomios estándar de la siguiente manera.
BT := BaseQATrunc( GB, 12, wtv );;
for degpart in BT do 
  for mon in degpart do PrintNP( [ [ mon ], [ 1 ] ] ); od;
od;


# Ejemplo-DimsQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
# La información sobre las dimensiones de las partes homogéneas del álgebra del cociente
# se encuentra de la siguiente manera,
DimsQATrunc( GB, 12, wtv );


# Ejemplo-FreqsQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
PrintNPList( GB );
# Las multiplicidades de las frecuencias de monomios en una base estándar del álgebra
# del cociente con respecto al ideal generado por GB se encuentran de la siguiente manera,
# para pesos hasta 8 inclusive.
F := FreqsQATrunc( GB, 8, wtv );
# La interpretación de estos datos viene dada por las siguientes líneas de código.
for f in F do
  if f[1][1] <> [] then
    Print("A nivel ", wtv * (f[1][1]), " las multiplicidades son\n");
    for x in f do
      Print("  para ",x[1],": ",x[2],"\n");
    od;
  else
    Print("A nivel ", 0 , " la multiplicidad de [] es ",f[1][2],"\n");
  fi;
  Print("\n");
od;


# Ejemplo-PrintTraceList
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP
# y luego la imprimimos usando PrintTraceList.
p1 := [[[1,1,2],[]],[1,-1]];;
p2 := [[[2,2,1],[]],[1,-1]];;
GBT := SGrobnerTrace([p1,p2]);;
PrintTraceList(GBT);


# Ejemplo-PrintTracePol
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
# A continuación, imprimimos el polinomio de trazas de los miembros de la lista mediante el
# uso de PrintTracePol.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
for np in GBT do PrintTracePol( np ); Print("\n"); od;


# Ejemplo-PrintNPListTrace
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
# A continuación, imprimimos los polinomios encontrados mediante el uso de PrintNPListTrace.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
PrintNPListTrace( GBT );


# Ejemplo-DetermineGrowthQA
# Para la lista de monomios que consta de una sola variable en un álgebra libre
# generada por dos variables, el crecimiento es claramente polinomio de grado 1.

# Esto se verifica invocando DetermineGrowthQA con argumentos [[1]] (la lista del
# monomio único que consta de la primera variable), el número de generadores del
# álgebra libre a la que pertenecen los monomios (que es 2 aquí) y booleano true
# que indica que deseamos un grado preciso en caso de crecimiento polinomial.
DetermineGrowthQA( [ [ 1 ] ], 2, true);
# Aquí hay un ejemplo de crecimiento polinomial de grado 2:
L := [ [ 1, 2, 1 ], [ 2, 2, 1 ] ];
DetermineGrowthQA(L,2,true);
# Para mostrar cómo aplicar la función a polinomios arbitrarios, considere los
# siguientes dos polinomios en formato NP.
F := GF(256);
z := GeneratorsOfField( F )[1];
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ z, 1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, z ] ];;
# Los polinomios p1 y p2 tienen coeficientes en el campo F de orden 256.
# Para estudiar el crecimiento del álgebra del cociente, primero calculamos la
# lista de los principales monomios de los elementos básicos de Gröbner y luego
# aplicamos DetermineGrowthQA.
GB := Grobner( [ p1, p2 ] );;
L := LMonsNP( GB );;
for lm  in L  do PrintNP( [ [ lm ], [ 1 ] ] ); od;
DetermineGrowthQA( L, 2, true );


# Ejemplo-FinCheckQA
# Considere la siguiente lista L de dos monomios.
L := [ [ 1, 2, 1 ], [ 2, 2, 1 ] ];;
# La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
# por estos dos monomios se puede decidir mediante FinCheckQA.
# Sus argumentos son L y el número de generadores del álgebra libre en los que residen los monomios.
FinCheckQA( L, 2 );
# Este ejemplo resulta ser de dimensión infinita.
# Aquí hay un ejemplo de dimensión finita.
FinCheckQA( [ [ 1 ], [ 2, 2 ] ], 2 );


# Ejemplo-HilbertSeriesQA
# Considere la siguiente lista L de dos monomios.
L := [ [ 1, 2, 1], [ 2, 2, 1 ] ];;
# La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
# por estos dos monomios se puede decidir mediante FinCheckQA.
# Sus argumentos son L y el número de generadores del álgebra libre en los que residen
# los monomios.
HilbertSeriesQA( L, 2, 10 );
# Esto indica que el crecimiento puede ser polinomial.
# DetermineGrowthQA se puede utilizar para comprobar esto.

# restablecer la impresión; nota que no está dentro de una parte GAPDoc aquí
GBNP.ConfigPrint();


# Ejemplo-NumAlgGensNP
# Considere el siguiente polinomio en formato NP.
np := [[[2,2,2,1,1,1],[4],[3,2,3]],[1,-3,2]];;
PrintNP(np);
NumAlgGensNP(np);


# Ejemplo-NumAlgGensNPList
# Considere los siguientes dos polinomios en formato NP.
p1 := [[[1,1,2,3,1],[2],[1]],[1,-2,1]];;
p2 := [[[2,2,1,4,3],[]],[1,-1]];;
PrintNPList([p1,p2]);
NumAlgGensNPList([p1,p2]);


# Ejemplo-NumModGensNP
# Considere el siguiente polinomio en formato NPM.
np := [ [ [ -1, 1, 2, 3, 1 ], [ -2 ], [ -1 ] ], [ 1, -2, 1 ] ];;
PrintNP( np );
NumModGensNP( np );


# Ejemplo-NumModGensNPList
# Considere los siguientes dos polinomios en formato NPM.
v1 := [ [ [ -1, 1, 2, 3, 1 ], [ -2 ], [ -1 ] ], [ 1, -2, 1 ] ];;
v2 := [ [ [ -2, 2, 1, 4, 3 ], [ -3 ] ],[ 1, -1 ] ];;
PrintNPList( [ v1, v2 ] );
NumModGensNPList( [ v1, v2 ] );