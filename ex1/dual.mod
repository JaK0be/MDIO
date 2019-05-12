/*********************************************
 * OPL 12.8.0.0 Model
 * Author: JoaoPimentel
 * Creation Date: 01/12/2018 at 18:34:57
 *********************************************/
int N = ...;

{int} Nodos = asSet(1..N);

tuple Arco
{
    int i;
    int j;
}

{Arco} Arcos with i in Nodos, j in Nodos = ...;

float Custos[Arcos] = ...;

dvar float+ y[Arcos];

minimize sum(<i,j> in Arcos) Custos[<i,j>] * y[<i,j>];

subject to
{
    forall (k in 2..N)
        sum(<i,k> in Arcos) y[<i,k>] - sum(<k,j> in Arcos) y[<k,j>] >= 1;
}

execute
{
    writeln();

    for (var a in Arcos)
        writeln("y[<", a.i, ",", a.j, ">] = ", y[a]);
}
