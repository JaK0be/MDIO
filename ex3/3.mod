/*********************************************
 * OPL 12.8.0.0 Model
 * Author: JoaoPimentel
 * Creation Date: 05/12/2018 at 19:31:42
 *********************************************/
int N = ...;

{int} Nodos = asSet(1..N);

tuple Arco{
    int i;
    int j;
}

{Arco} Arcos with i in Nodos, j in Nodos = ...;

float Custos[Arcos] = ...;

int delta=...;
int b=...;
int d=...;
float p[Nodos]=...; 


dvar boolean R[Nodos];
dvar int tempo[Nodos][Nodos];
dvar boolean A[Nodos][Nodos];


minimize sum (i in Nodos, j in Nodos) p[i]*A[i][j];

subject to {

	forall(i in Nodos) tempo[i][i] == 0;
	
	forall (i in Nodos){
		  forall(<k,j> in Arcos) tempo[i][j] <= tempo[i][k] + Custos[<k,j>] + delta*R[k];	
		
	}	
	
	forall (i in Nodos){
		forall (j in Nodos) A[i][j] >= (d-tempo[i][j])/d;	
	}
    
	sum (j in Nodos) R[j] <=b;
}

execute{
    writeln();

    for(var j in Nodos)
       	writeln("R[",j,"] = ", R[j]);
    
    for (var i in Nodos)
    	for(var j in Nodos)
        	writeln("A[",i,"][",j,"] = ", A[i][j]);
    
    for (var i in Nodos)
    	for(var j in Nodos)
        	writeln("tempo[",i,"][",j,"] = ", tempo[i][j]);
   
}
