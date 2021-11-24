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
				2://listado de Cds
					//Pedir la posicion
					//Borrar esa posicion
				//0: aire mecano pop
				//1: reloj ole,ole rock
				//2:no respires oasis indie( Subproceso LIStadoCds)
						
					//Cual quieres eliminar: 1
						//Eliminar el de la posición 1 ( Subproceso Elimar CD de la posición 1)

				3:
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
			Alquileres[numAlquileres,1]<-Clientes[resultado,0];
			numAlquileres<-numAlquileres+1;
	FinSegun
FinProceso
