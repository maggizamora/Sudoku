program sudokuresuelto;
uses crt;
const mag=1;
var z: integer;

var fila1: array [1..mag] of integer;
	a: integer;

procedure bloque1;
begin
	randomize;
	WRITE ('             SUDOKO MAGGY & JUAN.          ');
	writeln ();
	writeln ();
	write ('');
	write (' '); write ('|'); write (' '); 
	for a:=1 to mag do
	begin
	fila1 [a] := random(9);
	write ('|'); write (fila1[a],'','|'); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write ('  '); write ('|');;fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	end;
	writeln ();
	write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|'); write (' '); write ('|');write (' '); write (' '); write ('|'); write (''); fila1 [a] := random(9); write (fila1[a],'','|');fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|');write (' '); write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|'); write (' '); write ('|'); write (' '); write ('|');
	writeln ();
	write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');write (' '); write ('|');	write (' '); write ('|');write ('  '); write ('|');write (' '); write ('|');write (''); fila1 [a] := random(9); write (fila1[a],'','|');write (''); write (' '); write ('|'); write ('  '); write ('|'); write (' '); write ('|');write (' '); write ('|'); fila1 [a] := random(9); write (fila1[a],'','|');
end;

begin
textcolor (cyan);
bloque1;
gotoxy(3,4);
readln (z);
end.
