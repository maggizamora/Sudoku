program sudokumaggyjuan;

uses sysutils, crt;

type
  mapa = array[1..9, 1..9] of integer;

var
  sudoku: mapa;

procedure impsud(const sudoku: mapa);
var
  i, j: integer;
begin
  clrscr;
  writeln('-------------------------');
  for i := 1 to 9 do
  begin
    for j := 1 to 9 do
    begin
      if (j = 1) then
        write('| ');

      if sudoku[i, j] = 0 then
        write('  ')
      else
        write(sudoku[i, j], ' ');

      if (j mod 3 = 0) and (j <> 9) then
        write('| ');
    end;

    writeln('|');

    if (i mod 3 = 0) and (i <> 9) then
      writeln('-------------------------');
  end;
  writeln('-------------------------');
end;

function esnumerocorrecto(const sudoku: mapa; fila, columna, numero: integer): boolean;
var
  i, j, iniciarfila, iniciarcoluma: integer;
begin
  for i := 1 to 9 do
  begin
    if (sudoku[fila, i] = numero) or (sudoku[i, columna] = numero) then
      exit(false);
  end;

  iniciarfila := ((fila - 1) div 3) * 3 + 1;
  iniciarcoluma := ((columna - 1) div 3) * 3 + 1;

  for i := iniciarfila to iniciarfila + 2 do
  begin
    for j := iniciarcoluma to iniciarcoluma + 2 do
    begin
      if sudoku[i, j] = numero then
        exit(false);
    end;
  end;

  exit(true);
end;
begin
end.
