program sudokumaggyjuan;

Uses 
SysUtils, Crt;

Type 
  tablero = array[1..9, 1..9] Of Integer;

Var 
  sudoku: tablero;

Procedure imprimir(Const sudoku: tablero);

Var 
  i, j: Integer;
Begin
  ClrScr;
  Writeln('-------------------------');
  For i := 1 To 9 Do
    Begin
      For j := 1 To 9 Do
        Begin
          If (j = 1) Then
            Write('| ');

          If sudoku[i, j] = 0 Then
            Write('  ')
          Else
            Write(sudoku[i, j], ' ');

          If (j Mod 3 = 0) And (j <> 9) Then
            Write('| ');
        End;

      Writeln('|');

      If (i Mod 3 = 0) And (i <> 9) Then
        Writeln('-------------------------');
    End;
  Writeln('-------------------------');
End;

Function numcorrect(Const sudoku: tablero; fila, colum, num: Integer): Boolean;

Var 
  i, j, inicf, inicc: Integer;
Begin
  // Comprueba si el número es válido en la fila y colum
  For i := 1 To 9 Do
    Begin
      If (sudoku[fila, i] = num) Or (sudoku[i, colum] = num) Then
        Exit(False);
    End;

  // Comprueba si el número es válido en el subcuadro 3x3
  inicf := ((fila - 1) Div 3) * 3 + 1;
  inicc := ((colum - 1) Div 3) * 3 + 1;

  For i := inicf To inicf + 2 Do
    Begin
      For j := inicc To inicc + 2 Do
        Begin
          If sudoku[i, j] = num Then
            Exit(False);
        End;
    End;

  Exit(True);
End;

Procedure generar(Var sudoku: tablero);

Var 
  fila, colum, num, pista, i ,j: Integer;
  corrnum: array[1..9] Of Boolean;
Begin
  Randomize;

  // Inicializa el tablero con ceros
  For fila := 1 To 9 Do
    Begin
      For colum := 1 To 9 Do
        sudoku[fila, colum] := 0;
    End;

  pista := 0;
  While pista < 17 Do
    Begin
      fila := Random(9) + 1;
      colum := Random(9) + 1;

      // Inicializa el arreglo de números válidos
      For num := 1 To 9 Do
        corrnum[num] := True;

      // Comprueba los números en la fila y colum actual
      For num := 1 To 9 Do
        Begin
          If sudoku[fila, num] <> 0 Then
            corrnum[sudoku[fila, num]] := False;
          If sudoku[num, colum] <> 0 Then
            corrnum[sudoku[num, colum]] := False;
        End;

      // Comprueba los números en el subcuadro 3x3 actual
      For i := 1 To 3 Do
        Begin
          For j := 1 To 3 Do
            Begin
              num := sudoku[((fila - 1) Div 3) * 3 + i, ((colum - 1) Div 3) * 3 + j];
              If num <> 0 Then
                corrnum[num] := False;
            End;
        End;

      Repeat
        num := Random(9) + 1;
      Until corrnum[num];

      // Si la celda está vacía, asigna un número válido a la celda y aumenta el contador de pistas generadas
      If sudoku[fila, colum] = 0 Then
        Begin
          sudoku[fila, colum] := num;
          Inc(pista);
        End;
    End;
End;

Procedure ingresarnum(Var sudoku: tablero);

Var 
  fila, colum, num: Integer;
Begin
  Write('Ingresa la fila (1-9): ');
  ReadLn(fila);
  Write('Ingresa la colum (1-9): ');
  ReadLn(colum);
  Write('Ingresa el num (1-9): ');
  ReadLn(num);

  If (fila >= 1) And (fila <= 9) And (colum >= 1) And (colum <= 9) And (num >= 1) And (num <= 9) Then
    Begin
      // Comprueba si la posición está ocupada
      If sudoku[fila, colum] = 0 Then
        Begin
          // Comprueba si el número ingresado es válido en esa posición
          If numcorrect(sudoku, fila, colum, num) Then
            Begin
              sudoku[fila, colum] := num;
              imprimir(sudoku);
            End
          Else
            Writeln('El num ingresado no es valido en esa posicion.');
        End
      Else
        Writeln('La posicion ya esta ocupada.');
    End
  Else
    Writeln('Valores ingresados invalidos.');
End;

Function resolvsud(Var sudoku: tablero): Boolean;

Var 
  fila, colum, num: Integer;
  espvacio: Boolean;
Begin
  fila := 1;
  colum := 1;
  espvacio := False;

  // Encuentra la primera celda vacía
  While (fila <= 9) And (Not espvacio) Do
    Begin
      colum := 1;

      While (colum <= 9) And (Not espvacio) Do
        Begin
          If sudoku[fila, colum] = 0 Then
            espvacio := True
          Else
            Inc(colum);
        End;

      If Not espvacio Then
        Inc(fila);
    End;

  // Si no se encuentra ninguna celda vacía, el sudoku está resuelto
  If Not espvacio Then
    Exit(True);

  num := 1;
  While num <= 9 Do
    Begin
      // Si el número es válido en esa posición, se asigna y se intenta resolver el sudoku recursivamente
      If numcorrect(sudoku, fila, colum, num) Then
        Begin
          sudoku[fila, colum] := num;

          If resolvsud(sudoku) Then
            Exit(True);

          sudoku[fila, colum] := 0;
        End;

      Inc(num);
    End;

  Exit(False);
End;

Procedure verifsud(Const sudoku: tablero);
Var 
  i, j: Integer;
Function vgrupo(inicf, finalf, inicc, finalc: Integer): Boolean;

Var 
  i, j, num: Integer;
  corrnum: array[1..9] Of Boolean;
Begin
  FillChar(corrnum, SizeOf(corrnum), True);

  For i := inicf To finalf Do
    Begin
      For j := inicc To finalc Do
        Begin
          num := sudoku[i, j];
          If (num < 1) Or (num > 9) Then
            Exit(False);
          If Not corrnum[num] Then
            Exit(False);
          corrnum[num] := False;
        End;
    End;

  Exit(True);
End;

Begin
  // Verificar filas
  For i := 1 To 9 Do
    Begin
      If Not vgrupo(i, i, 1, 9) Then
        Begin
          Writeln('El sudoku no esta completo o no es valido.');
          Exit;
        End;
    End;

  // Verificar colums
  For j := 1 To 9 Do
    Begin
      If Not vgrupo(1, 9, j, j) Then
        Begin
          Writeln('El sudoku no esta completo o no es valido.');
          Exit;
        End;
    End;

  // Verificar subcuadros
  For i := 0 To 2 Do
    Begin
      For j := 0 To 2 Do
        Begin
          If Not vgrupo(i * 3 + 1, i * 3 + 3, j * 3 + 1, j * 3 + 3) Then
            Begin
              Writeln('El sudoku no esta completo o no es valido.');
              Exit;
            End;
        End;
    End;

  // Si todas las filas, colums y subcuadros son válidos, el sudoku está completo y válido
  Writeln('Felicidades, has completado el sudoku correctamente');
  Halt;
End;



Procedure juguemos;

Var 
  opc: integer;
Begin
  Repeat
    WriteLn('Presiona 1 para ingresar un numero.');
    WriteLn('Presiona 2 para mostrar la solucion.');
    WriteLn('Presiona 3 para salir.');
    Write('opc: ');
    Readln(opc);
    verifsud(sudoku);

    Case opc Of 
      1: ingresarnum(sudoku);

      2:
           Begin
             Writeln('Mostrando solucion...');
             resolvsud(sudoku);
             imprimir(sudoku);
             verifsud(sudoku);
           End;
      3: 
      begin
      WriteLn('Saliendo del juego...');
      halt;
      end;
      Else
        WriteLn('opc invalida.');
    End;
  Until opc = 0;
End;

Begin
  ClrScr;

  WriteLn('Bienvenido al SUDOKU MAGGY & JUAN!');
  WriteLn;
  WriteLn('El sudoku es un juego de logica en el cual debes completar una cuadricula de 9x9');
  WriteLn('dividida en subcuadros de 3x3 con nums del 1 al 9, de modo que cada fila,');
  WriteLn('cada columna y cada subcuadro contengan todos los numeros del 1 al 9 sin repetir.');
  WriteLn;
  WriteLn('Diviertete jugando al sudoku');
  WriteLn;
  WriteLn('Presiona ENTER para comenzar...');
  ReadLn;

  ClrScr;
  generar(sudoku);
  imprimir(sudoku);
  juguemos;
End.
