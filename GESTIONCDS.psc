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
	Escribir "Bienvenido a la Tienda. Introduce tu DNI";
	Leer dni;
	Si (numUsuarios=0) entonces
		usuarios[numUsuarios,6]<-"A";
		pedirDatosUsuario(usuarios,dni,numUsuarios);
	SiNo
		Tipo<-buscarDni(usuarios,dni,numUsuarios);
		si(Tipo="N") Entonces
			usuarios[numUsuarios,6]<-"C";
			pedirDatosUsuario(usuarios,dni,numUsuarios);
		//Introducir que haría el cliente en un sino
		FinSi
	FinSi
	
	
	
	
	
	
	
	
	
FinProceso
