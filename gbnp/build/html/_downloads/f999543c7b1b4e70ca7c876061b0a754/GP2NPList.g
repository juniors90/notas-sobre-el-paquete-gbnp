# Ejemplo-GP2NPList
# Sea A el álgebra asociativa libre con uno sobre los racionales de los
# generadores ay b. Sea e el del álgebra.
A:=FreeAssociativeAlgebraWithOne( Rationals, "a", "b" );;
a:=A.a;;
b:=A.b;;
e:=One( A );;
# Sea Lgp la lista de polinomios [a^2-e,b^2-e,ba-ab-e].
Lgp:=[ a^2-e, b^2-e, b*a-a*b-e ];
# El polinomio en formato NP correspondiente a gp se puede
# obtener con GP2NP:
GP2NPList( Lgp );
# El mismo resultado se obtiene mediante una simple aplicación
# de la función Lista estándar en GAP:
List( Lgp, GP2NP ) = GP2NPList( Lgp );