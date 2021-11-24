Funcion resultado<-TipoUsuario(dni,clientes,numClientes,dniAdministrador)
	definir i Como Entero;
	definir resultado Como Entero;
	resultado<-101;
	si (dni=dniAdministrador) entonces
		resultado<-0;
	SiNo
		Para i<-0 hasta numClientes-1 Hacer
			Si(dni=clientes[i,0]) entonces
				resultado<-i+1;
				i<-numclientes;
			FinSi
		FinPara
	FinSi
FinFuncion

SubProceso AnyadirCd(numCds por referencia,Cds por referencia) 
	Escribir "Introduce el titulo del CD";
	Leer Cds[numCds,0];	
	Escribir "Introduce el Grupo";
	Leer Cds[numCds,1];	
	repetir 
		Escribir "Introduce el Tipo de Música(Rock, Pop, Punk, Indie";
		Leer Cds[numCds,2];	
	Hasta Que ( Cds[numCds,2]="Rock" o Cds[numCds,2]="Pop" o Cds[numCds,2]="Punk" o Cds[numCds,2]="Indie")
	Escribir "Introduce la estantería donde se encuentra";
	Leer Cds[numCds,3];
	numCds<-numCds+1;
FinSubProceso

SubProceso ListarCDS(Cds,numCds)
	definir i Como Entero;
	Para i<-0 hasta numCds-1 hacer 
		Escribir i,":", Cds[i,0]," ", Cds[i,1]," ", Cds[i,2]," ",Cds[i,3]," ";
	FinPara
FinSubProceso

SubProceso EliminarCd(Cds Por Referencia,numCds Por Referencia,posicion)
	definir i Como Entero;
	Para i<-posicion hasta numCds-2 Hacer
		Cds[i,0]<-Cds[i+1,0];
		Cds[i,1]<-Cds[i+1,1];
		Cds[i,2]<-Cds[i+1,2];
		Cds[i,3]<-Cds[i+1,3];
	FinPara
	Cds[numCds-1,0]<-"";
	Cds[i,1]<-"";
	Cds[i,2]<-"";
	Cds[i,3]<-"";
	numCds<-numCds-1;
FinSubProceso

Proceso gestion_Cds
	Definir dni,dniAdministrador Como Caracter;
	Definir Clientes,Cds,Alquileres Como Caracter;
	Definir i,numclientes,numCds,numAlquileres,resultado,peticion Como Entero;
	Dimension Clientes[100,7];
	Dimension Cds[250,5];
	Dimension Alquileres[25000,2];
	dniAdministrador<-"11111111A";
	numClientes<-0;
	numCds<-0;
	numAlquileres<-0;
	resultado<-2;
	Clientes[0,0]<-"22222222B";
	numClientes<-1;
	Cds[numCds,0]<-"Aire";	
	Cds[numCds,1]<-"Mecano";	
	Cds[numCds,2]<-"Pop";	
	Cds[numCds,3]<-"5";
	numCds<-numCds+1;
	Cds[numCds,0]<-"Luz";	
	Cds[numCds,1]<-"Depeche";	
	Cds[numCds,2]<-"Rock";	
	Cds[numCds,3]<-"2";
	numCds<-numCds+1;
	Cds[numCds,0]<-"Agua";	
	Cds[numCds,1]<-"lori Meyers";	
	Cds[numCds,2]<-"Indie";	
	Cds[numCds,3]<-"3";
	numCds<-numCds+1;
	Cds[numCds,0]<-"Triste";	
	Cds[numCds,1]<-"Lus Casal";	
	Cds[numCds,2]<-"Rock";	
	Cds[numCds,3]<-"2";
	numCds<-numCds+1;
	
	Escribir "Introduce el dni";
	Leer dni;
	resultado<-TipoUsuario(dni,clientes,numClientes,dniAdministrador);
	Segun resultado hacer
		0:Escribir "ADMINISTRADOR DEL SISTEMA";
			Escribir "============================";
			Escribir "1.-Añadir CD.";
			Escribir "2.-Eliminar CD.";
			Escribir "3.-Modificar CD.";
			Escribir "4.-Obtener listado de clientes.";
			Escribir "5.-Listado de Prestamos.";
			Leer peticion;
			Segun peticion hacer
				1:AnyadirCd(numCds,Cds); 
				2:ListarCDS(Cds,numCds);
				  Escribir "Que CD desea eliminar";
				  Leer peticion;
				  EliminarCd(Cds,numCds,peticion);
				  ListarCDS(Cds,numCds);
				3:ListarCDS(Cds,numCds);
					//Escribir "Que CD desea modificar";
					//Leer posicion;
					//ListarCDS(Cds,numCds,posicion,posicion);
					//Escribir "Que campo desea modificar";
				4:
				5:
					
			FinSegun
			
			
		101:Escribir "No esxite el cliente";
			
		De Otro modo: Escribir "ALQUILER DE CDS";
			Escribir "============================";
			ListarCDS(Cds,numCds);
			Escribir "Que CD quiere alquilar";
			Leer peticion;
			Alquileres[numAlquileres,0]<-cds[0,0];
			Alquileres[numAlquileres,1]<-Clientes[resultado-1,0];
			numAlquileres<-numAlquileres+1;
	FinSegun
FinProceso
