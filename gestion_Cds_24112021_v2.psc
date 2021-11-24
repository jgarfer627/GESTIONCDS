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
	Escribir "                LISTADO DE CDS";
	Escribir " TITULO               GRUPO                    TIPO         ESTANTERIA";
	Escribir "======================================================================================";
	Para i<-0 hasta numCds-1 hacer 
		Escribir i,":", Cds[i,0]," ", Cds[i,1]," ", Cds[i,2]," ",Cds[i,3]," ";
	FinPara
	Escribir "";
FinSubProceso

SubProceso ListarCDSAlquilados(dni,Cds,numCds,alquileres,numAlquileres)
	definir i,j,k Como Entero;
	Escribir "      LISTADO DE CDS alquilados";
	Escribir " TITULO               GRUPO           ";
	Escribir "======================================";
	k<-0;
	Para i<-0 hasta numAlquileres-1 hacer 
		Si((alquileres[i,2]="A") y (alquileres[i,0]=dni)) entonces
			Para j<-0 hasta numCds-1 hacer 
				Si(Cds[j,0]=alquileres[i,1]) Entonces
					Escribir j,":",Cds[j,0],"        ",Cds[j,1];
				FinSi
			FinPara
		FinSi
	FinPara
	Escribir "";
FinSubProceso
SubProceso EliminarCd(Cds Por Referencia,numCdspor Por referencia,Cd)
	Definir i Como Entero;
	Escribir "Que CD desea eliminar";
	Leer peticion;
	Para i<-peticion hasta numCds-2 Hacer
		Cds[i,0]<-Cds[i+1,0];
		Cds[i,1]<-Cds[i+1,1];
		Cds[i,2]<-Cds[i+1,2];
		Cds[i,3]<-Cds[i+1,3];
	FinPara
	numCds<-numCds-1;
FinSubProceso	
	
SubProceso ModificarCd(Cds,numCds,Cd)
	Definir Modificar como caracter;
	Escribir "Titulo actual:", Cds[Cd,0];
	Escribir "Quiere modificarlo(s/n):";
	Leer Modificar;
	si (Modificar="s") entonces
		Escribir "Introduzca el nuevo título";
		leer Cds[Cd,0];
	FinSi
	Escribir "Grupo o cantante actual:", Cds[Cd,1];
	Escribir "Quiere modificarlo(s/n):";
	Leer Modificar;
	si (Modificar="s") entonces
		Escribir "Introduzca el nuevo Grupo o cantante";
		leer Cds[Cd,1];
	FinSi
	Escribir "Tipo de música actual:", Cds[Cd,2];
	Escribir "Quiere modificarlo(s/n):";
	Leer Modificar;
	si (Modificar="s") entonces
		Escribir "Introduzca el nuevo Tipo de música";
		leer Cds[Cd,2];
	FinSi
	Escribir "Estantería:", Cds[Cd,3];
	Escribir "Quiere modificarlo(s/n):";
	Leer Modificar;
	si (Modificar="s") entonces
		Escribir "Introduzca la nueva Estantería";
		leer Cds[Cd,3];
	FinSi
FinSubProceso

SubProceso Datos(Clientes por referencia, numClientes por referencia,Cds  por referencia,numCds Por Referencia, Alquileres por referencia,numAlquileres Por Referencia)
	Clientes[numClientes,0]<-"22222222B";
	Clientes[numClientes,1]<-"Javier García Fernández";
	Clientes[numClientes,2]<-"C/Fragata nº 34 Bloque 3 3º D";
	Clientes[numClientes,3]<-"Jaén";
	Clientes[numClientes,4]<-"Jaén";
	numClientes<-1;
	Clientes[numClientes,0]<-"22222222B";
	Clientes[numClientes,1]<-"Pepe García Fernández";
	Clientes[numClientes,2]<-"C/Almirante nº 34 Bloque 3 3º D";
	Clientes[numClientes,3]<-"Mancha Real";
	Clientes[numClientes,4]<-"Jaén";
	numClientes<-numClientes+1;
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
	Alquileres[numAlquileres,0]<-Clientes[0,0];
	Alquileres[numAlquileres,1]<-Cds[0,0];
	Alquileres[numAlquileres,2]<-"A";
	numAlquileres<-numAlquileres+1;
FinSubProceso

SubProceso ListarClientes(Clientes,numClientes)
	definir i Como Entero;
	Escribir "                LISTADO DE CLIENTES        ";
	Escribir " DNI           NOMBRE     DIRECCION       LOCALIDAD    ";
	Escribir "=================================================================";
	Para i<-0 hasta numClientes-1 hacer 
		Escribir i,":", Clientes[i,0]," ", Clientes[i,1]," ", Clientes[i,2]," ",Clientes[i,3]," ";
	FinPara
	Escribir "";
	
FinSubProceso

SubProceso ListarAlquileres(Alquileres,numAlquileres)
	definir i Como Entero;
	Escribir "                LISTADO DE ALQUILERES";;
	Escribir " DNI           TITULO";
	Escribir "==========================";
	Para i<-0 hasta numAlquileres-1 hacer 
		Escribir i,":", Alquileres[i,0],"        ", Alquileres[i,1];
	FinPara
	Escribir "";
FinSubProceso

SubProceso AlquilarCd(dni,peticion,cds,alquileres por referencia,numAlquileres por referencia)
	alquileres[numAlquileres,0]<-cds[peticion,0];
	alquileres[numAlquileres,1]<-dni;
	alquileres[numAlquileres,2]<-"A";
	numAlquileres<-numAlquileres+1;
FinSubProceso

Subproceso EliminarCdAlquiler(dni,CdsTitulo,Alquileres,numAlquileres)
	definir i Como Entero;
	Para i<-0 hasta numAlquileres-1 hacer 
		Si((Alquileres[i,0]=dni)y(Alquileres[i,1]=CdsTitulo)) entonces
			Alquileres[i,2]<-"D";
		FinSi
	FinPara
	
FinSubProceso
Proceso gestion_Cds
	Definir dni,dniAdministrador,tecla_,aux Como Caracter;
	Definir Clientes,Cds,Alquileres Como Caracter;
	Definir i,numclientes,numCds,numAlquileres,resultado,peticion,cd Como Entero;
	Dimension Clientes[100,7];
	Dimension Cds[250,5];
	Dimension alquileres[25000,3];
	dniAdministrador<-"11111111A";
	numClientes<-0;
	numCds<-0;
	numAlquileres<-0;
	resultado<-2;
	Datos(Clientes,numClientes,Cds,numCds,alquileres,numAlquileres);
	Escribir "Introduce el dni";
	Leer dni;
	resultado<-TipoUsuario(dni,clientes,numClientes,dniAdministrador);
	Segun resultado hacer
		0:Repetir  
			Escribir "ADMINISTRADOR DEL SISTEMA";
			Escribir "============================";
			Escribir "1.-Añadir CD.";
			Escribir "2.-Eliminar CD.";
			Escribir "3.-Modificar CD.";
			Escribir "4.-Obtener listado de clientes.";
			Escribir "5.-Listado de Prestamos.";
			Escribir "Otra tecla para salir.";
			Leer tecla_;
			Si ( tecla_>"0" y tecla_<"6") entonces
				peticion<-ConvertirANumero(tecla_);
				Segun peticion hacer
					1:ListarCDS(Cds,numCds);
					  AnyadirCd(numCds,Cds); 
					  ListarCDS(Cds,numCds);
				  2:ListarCDS(Cds,numCds);
					  Escribir "Introduzca el numero de CD a eliminar:";//PEDIR EL CD A MODIFICAR
					  Leer cd;
					  EliminarCd(Cds,numCdspor,Cd);		
					  ListarCDS(Cds,numCds);
					3:ListarCDS(Cds,numCds);
					  Escribir "Introduzca el numero de CD a modificar:";//PEDIR EL CD A MODIFICAR
					  Leer cd;
					  ModificarCd(Cds,numCds,Cd);
					  ListarCDS(Cds,numCds);
					4:ListarClientes(Clientes,numClientes);
					5:ListarAlquileres(Alquileres,numAlquileres);
				FinSegun
			FinSi
			hasta que (( tecla_<"1") o (tecla_>"5"));
		101:Escribir "No existe el cliente";
			//PedirDatosCliente
		De Otro modo: Escribir "CLIENTE DEL SISTEMA";
			Escribir "============================";
			Escribir "1.-Alquilar CD.";
			Escribir "2.-Devolver CD.";
			Leer tecla_;
			Segun ConvertirANumero(tecla_) Hacer
				1:ListarCDS(Cds,numCds);
				  Escribir "Que CD quiere alquilar";
				  Leer peticion;
				  AlquilarCd(dni,peticion,cds,alquileres,numAlquileres);
			  2:ListarCDSAlquilados(dni,Cds,numCds,alquileres,numAlquileres);	
				  Escribir "Que CD quiere devolver";
				  Leer peticion;
				  EliminarCdAlquiler(dni,Cds[peticion,0],alquileres,numAlquileres);
				  ListarCDSAlquilados(dni,Cds,numCds,alquileres,numAlquileres);	
			FinSegun
	FinSegun
FinProceso
