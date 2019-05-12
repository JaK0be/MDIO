/*********************************************
 * OPL 12.8.0.0 Model
 * Author: JoaoPimentel
 * Creation Date: 01/12/2018 at 16:55:23
 *********************************************/

int N = ...;
{int} Nodos = asSet(1..N);

tuple Arco{
    int i;
    int j;
}

{Arco} Arcos with i in Nodos, j in Nodos = ...;

float Custos[Arcos] = ...;


dvar float+ x[Nodos];

maximize sum(i in Nodos) x[i];

subject to{
    m: x[1] == 0;

    forall (<i,j> in Arcos) n:
        x[j] <= x[i] + Custos[<i,j>];
}


execute{
    writeln();

    for (var i in Nodos)
        writeln("x[", i, "] = ", x[i]);
}
