program sudokuresuelto;
uses crt;
const mag=1;
var z: integer;

var fila1: array [1..mag] of integer;
	a: integer;

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
	
procedure bloques;
begin
	WRITE ('    SUDOKO MAGGY & JUAN.          ');
	writeln ();
	writeln ();
	for a:=1 to mag do
	begin
	writeln (' -------  -------  -------');
	write ('');	write (' '); write ('|'); write (' '); fila1 [a] := random(9); write ('|'); write (fila1[a],'','|'); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|');;fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|');write (' '); write (' '); write ('|'); write (''); fila1 [a] := random(9); write (fila1[a],'','|');fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|');write (' '); write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');write (' '); write ('|');	write (' '); write ('|');write ('  '); write ('|');write (' '); write ('|');write (''); fila1 [a] := random(9); write (fila1[a],'','|');write (''); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|');write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');
	writeln ();
	writeln (' -------  -------  -------');
	write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|');write (' '); write (' '); write ('|'); write (''); fila1 [a] := random(9); write (fila1[a],'','|');fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|');write (' '); write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');write (' '); write ('|');	write (' '); write ('|');write ('  '); write ('|');write (' '); write ('|');write (''); fila1 [a] := random(9); write (fila1[a],'','|');write (''); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|');write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');
	writeln ();
	write (' '); write ('|'); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|');  fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	writeln (' -------  -------  -------');
	write (' '); write ('|'); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|');  fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|');write (' '); write (' '); write ('|'); write (''); fila1 [a] := random(9); write (fila1[a],'','|');fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|');write (' '); write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');write (' '); write ('|');	write (' '); write ('|');write ('  '); write ('|');write (' '); write ('|');write (''); fila1 [a] := random(9); write (fila1[a],'','|');write (''); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|');write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');
	writeln ();
	writeln (' -------  -------  -------');
	end;
end;

begin
textcolor (cyan);
inicio;
abandonar;
clrscr;
if z = 1 then
bloques;
end.
