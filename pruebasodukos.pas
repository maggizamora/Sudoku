program sudokuresuelto;
uses crt;
const mag=1;
var z: integer;

var fila1: array [1..mag] of integer;
	a: integer;

{El inicio y darle una breve explicacion al usuario lo considero fundamental, 
  ademas de que se ve bonito y organizado. }
  
procedure inicio;
	begin
	writeln ('          Te doy la bienvenida al SUDOKU MAGGY & JUAN.');
	writeln ();
	writeln ('   El Sudoku es un juego de origen japones, en el cual se crea');
	writeln ('   una cuadricula de 9 x 9, y dividida en 9 cuadrantes de 3 x 3.');
	writeln ();
	writeln ('   Permite medir continuamente el desempeno y regular de manera ');
	writeln ('   automatica la complejidad de las tareas, optimizando asi, ');
	writeln ('   el entrenamiento cognitivo.');
	writeln ();
	writeln ();
	end;

{Quise agregarle esta funcion desde el principio. }
 
procedure abandonar;
	begin
	writeln ('              PULSA 1 PARA CONTINUAR EN EL JUEGO.');
	writeln ('              PULSA 0 PARA SALIR DEL JUEGO.');
	readln (z);
		if z = 0 then
		begin
		writeln ();
		writeln ('Hasta pronto.');
		exit;
		end;
	end;
	
	
{Te recomiendo que no muevas lo que esta en verde porque se movera absolutamente todo lo de esa fila.
 La estructura del soduko radica en esto. Lo quise llamar procedimiento porque presiento que es mas comodo de manejarlo}
 
procedure bloques;
begin
	WRITE ('    SUDOKO MAGGY & JUAN.          ');
	writeln ();
	writeln ();
	for a:=1 to mag do
	begin
	writeln (' -------  -------  -------');
	write (' |'); fila1 [a] := random(9); write (' |'); write (fila1[a],'| |  | | | |  |'); fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	write (' '); write ('| | | |  |'); fila1 [a] := random(9); write (fila1[a],'|'); fila1 [a] := random(9); write (fila1[a],'| |  |'); fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	write (' |'); fila1 [a] := random(9); write (fila1[a],'| | |  | |'); fila1 [a] := random(9); write (fila1[a],'| |  | | |'); fila1 [a] := random(9); write (fila1[a],'|');
	writeln ();
	writeln (' -------  -------  -------');
	write (' | | | |  |'); fila1 [a] := random(9); write (fila1[a],'|');fila1 [a] := random(9); write (fila1[a],'| |  |'); fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	write (' |'); fila1 [a] := random(9); write (fila1[a],'| | |  | |'); fila1 [a] := random(9); write (fila1[a],'| |  | | |'); fila1 [a] := random(9); write (fila1[a],'|');
	writeln ();
	write (' |'); write (fila1[a],'| | |  | | | |  |');  fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	writeln (' -------  -------  -------');
	write (' |'); write (fila1[a],'| | |  | | | |  |');  fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	write (' | | | |  |'); fila1 [a] := random(9); write (fila1[a],'|');fila1 [a] := random(9); write (fila1[a],'| |  |'); fila1 [a] := random(9); write (fila1[a],'| | |');
	writeln ();
	write (' |'); fila1 [a] := random(9); write (fila1[a],'| | |  | |'); fila1 [a] := random(9); write (fila1[a],'| |  | | |'); fila1 [a] := random(9); write (fila1[a],'|');
	writeln ();
	writeln (' -------  -------  -------');
	end;
end;

{Este es el codigo principal, le agregue ese color, si deseas cambiar algo, no hay problema, siempre y cuando, compile JAJJAJAJAJA }

begin
textcolor (cyan);
inicio;
abandonar;
clrscr;
if z = 1 then
bloques;
end.

{Mi meta era optimizarlo lo mas posible para no hacerlo tan tedioso, ademas, tenemos las herramientas para hacerlo. En fin, me avisai cualquier cosilla.}
