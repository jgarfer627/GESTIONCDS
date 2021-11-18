SubProceso mostrarClientes(usuarios,numUsuarios)
	Definir i,j Como Entero;
	para i<-0 hasta numUsuarios hacer
		para j<-0 hasta 6 hacer
			Escribir "usuarios[",i,"]=",usuarios[i,j];
		FinPara
	FinPara
FinSubProceso

Funcion resultado<-buscarDni(usuarios,dni,numUsuarios)
	Definir i como entero;
	resultado<-"N";
	Para i<-0 hasta numUsuarios Hacer
		Si(dni=usuarios[i,0]) Entonces
			resultado<-usuarios[i,6];
			i<-numUsuarios;
		FinSi
	FinPara
FinFuncion


SubProceso pedirDatosUsuario(usuarios Por Referencia,dni,numUsuarios)
	Definir i Como Entero;
	
	usuarios[numUsuarios,0]<-dni;
	Escribir "Introduce tu nombre : ";
	Leer usuarios[numUsuarios,1];
	Escribir "Introduce tus apellidos : ";
	Leer usuarios[numUsuarios,2];
	Escribir "Introduce tu domicilio : ";
	Leer usuarios[numUsuarios,3];
	Escribir "Introduce tu Localidad : ";
	Leer usuarios[numUsuarios,4];
	Escribir "Introduce tu Provincia : ";
	Leer usuarios[numUsuarios,5];
	numUsuarios<-numUsuarios+1;
FinSubProceso

Subproceso resultado<-BuscarCds(cd,numCds,Cds,anyadir)
	Definir i como entero;
	Definir resultado Como Entero;
	resultado<-0;
	Para i<-0 hasta numCds Hacer
		Si (Cds[i,1]=cd) Entonces
			Si (anyadir=1) entonces
				Cds[i,4]<-ConvertirAtexto(ConvertirAnumero(Cds[i,4])+1);
			FinSi
			resultado<-resultado+1;
		FinSi
	FinPara
FinSubProceso

SubProceso anyadirCd(cDS Por Referencia,numCds por referencia)
	Definir numcopias como Entero;
	Escribir "Introduce el titulo del CD : ";
	Leer cDS[numCds,1];
	Escribir "Introduce el grupo o cantante : ";
	Leer cDS[numCds,2];
	Escribir "Introduce la localizacion(0-25) : ";
	Leer cDS[numCds,3];
	Si (numCds>0) entonces
		numCopias<-BuscarCds(cDS[numCds,1],numCds,Cds,1);
	SiNo
		numCopias<-0;
	FinSi
	cDS[numCds,4]<-numCopias+1;
	cDS[numCds,0]<-concatenar(cDS[numCds,1],ConvertirATexto(numCopias));
	numCds<-numCds+1;
FinSubProceso

SubProceso mostrarCds(cDS,numCds)
	Definir i,j Como Entero;
	para i<-0 hasta numCds hacer
		para j<-0 hasta 6 hacer
			Escribir "cDS[",i,"]=",cDS[i,j];
		FinPara
	FinPara
FinSubProceso

Proceso GESTIONCDS
	Definir usuarios Como Caracter;
	Dimension usuarios[100,7];//dni,nombre,apellidos,direccion,localidad ,provincia,Tipo(A, administrador; C, cliente)
	Definir numUsuarios Como Entero;
	Definir cDS Como Caracter;
	Dimension cDS[250,5];//Codigo, Titulo, Grupo o cantante, Genero, Localizacion
	Definir numCds Como Entero;
	Definir alquileres Como Caracter;
	Dimension alquileres[250,1000];
	Definir numAlquileres Como Entero;
	Definir dni como caracter;
	
	numUsuarios<-0;
	numCds<-0;
	Escribir "Bienvenido a la Tienda. Introduce tu DNI";
	Leer dni;
	Si (numUsuarios=0) entonces
		usuarios[numUsuarios,6]<-"A";
		pedirDatosUsuario(usuarios,dni,numUsuarios);
		anyadirCd(cDS,numCds);
	SiNo
		Tipo<-buscarDni(usuarios,dni,numUsuarios);
		si(Tipo="N") Entonces
			usuarios[numUsuarios,6]<-"C";
			pedirDatosUsuario(usuarios,dni,numUsuarios);
		//Introducir que haría el cliente en un sino
		FinSi
	FinSi
	//mostrarClientes(usuarios,numUsuarios);
	mostrarCds(cDS,numCds);
	
	
	
	
	
	
	
	
FinProceso
