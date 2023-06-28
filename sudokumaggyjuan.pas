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

procedure mapasud(var sudoku: mapa);
var
  fila, columna, numero, pistasgeneradas, i, j: integer;
  numerosvalidos: array[1..9] of boolean;
begin
  randomize;

  for fila := 1 to 9 do
  begin
    for columna := 1 to 9 do
      sudoku[fila, columna] := 0;
  end;

  pistasgeneradas := 0;
  while pistasgeneradas < 17 do
  begin
    fila := random(9) + 1;
    columna := random(9) + 1;

    for numero := 1 to 9 do
      numerosvalidos[numero] := true;

    for numero := 1 to 9 do
    begin
      if sudoku[fila, numero] <> 0 then
        numerosvalidos[sudoku[fila, numero]] := false;
      if sudoku[numero, columna] <> 0 then
        numerosvalidos[sudoku[numero, columna]] := false;
    end;

    for i := 1 to 3 do
    begin
      for j := 1 to 3 do
      begin
        numero := sudoku[((fila - 1) div 3) * 3 + i, ((columna - 1) div 3) * 3 + j];
        if numero <> 0 then
          numerosvalidos[numero] := false;
      end;
    end;

    numero := random(9) + 1;
    while not numerosvalidos[numero] do
      numero := random(9) + 1;

    if sudoku[fila, columna] = 0 then
    begin
      sudoku[fila, columna] := numero;
      inc(pistasgeneradas);
    end;
  end;
end;

procedure ingresarnumero(var sudoku: mapa);
var
  fila, columna, numero: integer;
begin
  write('Ingresa la fila (1-9): ');
  readln(fila);
  write('Ingresa la columna (1-9): ');
  readln(columna);
  write('Ingresa el numero (1-9): ');
  readln(numero);

  if (fila >= 1) and (fila <= 9) and (columna >= 1) and (columna <= 9) and (numero >= 1) and (numero <= 9) then
  begin
    if sudoku[fila, columna] = 0 then
    begin
      if esnumerocorrecto(sudoku, fila, columna, numero) then
      begin
        sudoku[fila, columna] := numero;
        impsud(sudoku);
      end
      else
        writeln('El numero ingresado no es valido en esa posicion.');
    end
    else
      writeln('La posicion ya esta ocupada.');
  end
  else
    writeln('Valores ingresados invalidos.');
end;

