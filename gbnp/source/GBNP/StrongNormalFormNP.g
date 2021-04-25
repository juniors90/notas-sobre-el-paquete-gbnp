# Ejemplo-StrongNormalFormNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
# La forma normal fuerte del polinomio
p := [ [ [ 1, 1, 1, 2 ], [ 2, 1 ],[ ] ], [ 1, -1, 3 ] ];;
# con respecto a la lista [p1, p2] se calcula mediante el uso de la función StrongNormalFormNP:
PrintNP( StrongNormalFormNP( p, [ p1, p2 ] ) );