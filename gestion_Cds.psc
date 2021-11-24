Funcion resultado<-BuscarTipoCliente(dni,clientes,numclientes,dniAdministrador)
	Definir resultado Como Entero;//0, si es administrador ; 1, si existe el cleinte ; 2, sino existe
	Definir i Como Entero;//
	resultado<-2;
	si (dni=dniAdministrador) entonces
		resultado<-0;
	SiNo
		Para i<-0 hasta numClientes-1 Hacer
			Si(dni=clientes[i,0]) entonces
				resultado<-1;
				i<-numclientes;
			FinSi
		FinPara
	FinSi
FinFuncion

Proceso gestion_Cds
	Definir dni,dniAdministrador Como Caracter;
	Definir Clientes,Cds,Alquileres Como Caracter;
	Definir i,numclientes Como Entero;
	Dimension Clientes[100,7];
	Dimension Cds[250,5];
	Dimension Alquileres[25000,2];
	dniAdministrador<-"11111111A";
	numClientes<-0;
	
	
	Escribir "Introduce el dni";
	Leer dni;
	i<-BuscarTipoCliente(dni,Clientes,numclientes,dniAdministrador);
	segun i Hacer
		0:          //Administrador
			
		1:         //Cleinte existe    
			
		2:         //Cleinte no existe    
			
			
		
	FinSegun
FinProceso
