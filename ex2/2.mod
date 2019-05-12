/*********************************************
 * OPL 12.8.0.0 Model
 * Author: filipafaria
 * Creation Date: 09/12/2018 at 18:16:24
 *********************************************/
int N = ...;
{ int } Nodos = asSet (1.. N);

tuple Arco {
	int i;
	int j;
}

{Arco} Arcos with i in Nodos , j in Nodos = ...;
float Custos [Arcos] = ...;

int s = 1;
int t = 49;

int b = 8;
int delta = 8;

dvar float+ x[Nodos];
dvar boolean y[Nodos];

maximize x[t];

subject to {
	x[s] == 0;

	forall (<i,j> in Arcos )
		x[j] <= x[i] + Custos [<i,j >] + delta * y[i];

	sum (i in Nodos ) y[i] <= b;
}


execute{
    writeln();

	for(var i in Nodos)
       	writeln("x[",i,"] = ", x[i]);
    for(var i in Nodos)
       	writeln("y[",i,"] = ", y[i]);
    
}
