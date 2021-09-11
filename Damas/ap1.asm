;=====================IMPORTACIONES==================
;▓▓▓▓	  ▓  ▓▓▓▓▓▓   
;▓   ▓    ▓  ▓
;▓   ▓    ▓  ▓
;▓▓▓▓     ▓  ▓▓▓▓▓▓☺
;▓▓▓▓     ▓  ▓
;▓   ▓    ▓  ▓
;▓   ▓    ▓  ▓
;▓▓▓▓     ▓  ▓▓▓▓▓▓ 

;===================== MACROS
; IMPRIME UNA CADENA
imprimir macro cad				
	MOV ah, 09h
	lea dx, cad
	int 21h
endm

printChar macro dato
	mov ah,02h
	mov dl, dato
	int 21h
endm

obtenerDato macro op
	Mov ah, 01h
	int 21h
endm

obtenerRuta macro buffer
	LOCAL INICIO,FIN
		xor si,si
	INICIO:
		obtenerDato
		cmp al,0dh
		je FIN
		mov buffer[si],al
		inc si
		jmp INICIO
	FIN:
		mov buffer[si],00h
endm

verEBlanco macro
comment #	local VF1,VF2,VF3,VF4,VF5,VF6,VF7,VF8,INICIO,ERROR,FINAL,VERTABLERO1,VERTABLERO2,VERTABLERO3,VERTABLERO4,VERTABLERO5,VERTABLERO6,VERTABLERO7,VERTABLERO8,SIGUIENTE,FINALERROR,VALIDARMOV,VALIDARMOV2,VALIDARMOV3
	local VERA1,VERC1,VERE1,VERG1
	local VERB2,VERD2,VERF2,VERH2
	local VERA3,VERC3,VERE3,VERG3
	local VERB4,VERD4,VERF4,VERH4
	local VERA5,VERC5,VERE5,VERG5
	local VERB6,VERD6,VERF6,VERH6
	local VERA7,VERC7,VERE7,VERG7
	local VERB8,VERD8,VERF8,VERH8
	local VF1S,VF2S,VF3S,VF4S,VF5S,VF6S,VF7S,VF8S,VERTABLERO1S,VERTABLERO2S,VERTABLERO3S,VERTABLERO4S,VERTABLERO5S,VERTABLERO6S,VERTABLERO7S,VERTABLERO8S,EXISTEFICHAS
	local VERA1S,VERC1S,VERE1S,VERG1S
	local VERB2S,VERD2S,VERF2S,VERH2S
	local VERA3S,VERC3S,VERE3S,VERG3S
	local VERB4S,VERD4S,VERF4S,VERH4S
	local VERA5S,VERC5S,VERE5S,VERG5S
	local VERB6S,VERD6S,VERF6S,VERH6S
	local VERA7S,VERC7S,VERE7S,VERG7S
	local VERB8S,VERD8S,VERF8S,VERH8S

	local MOVERFICHAB,QUITARFICHAT,QF1,QF2,QF3,QF4,QF5,QF6,QF7,QF8
	local QF1,QF2,QF3,QF4,QF5,QF6,QF7,QF8

	local QUIA1,QUIC1,QUIE1,QUIG1
	local QUIB2,QUID2,QUIF2,QUIH2
	local QUIA3,QUIC3,QUIE3,QUIG3
	local QUIB4,QUID4,QUIF4,QUIH4
	local QUIA5,QUIC5,QUIE5,QUIG5
	local QUIB6,QUID6,QUIF6,QUIH6
	local QUIA7,QUIC7,QUIE7,QUIG7
	local QUIB8,QUID8,QUIF8,QUIH8
	local QSIGUIENTE#
	local FINAL
	;local QUIA1S,QUIC1S,QUIE1S,QUIG1S
	;local QUIB2S,QUID2S,QUIF2S,QUIH2S
	;local QUIA3S,QUIC3S,QUIE3S,QUIG3S
	;local QUIB4S,QUID4S,QUIF4S,QUIH4S
	;local QUIA5S,QUIC5S,QUIE5S,QUIG5S
	;local QUIB6S,QUID6S,QUIF6S,QUIH6S
	;local QUIA7S,QUIC7S,QUIE7S,QUIG7S
	;local QUIB8S,QUID8S,QUIF8S,QUIH8S

	MULTIPLE:
		mov indiceComer,0b
		mov indiceSEVUELTA,0b
		mov indiceComer2,0b
		;mov filaMTN,0
		mov filaSAux,0
		mov colSAux,0
		mov colMTN,0
		mov colMTN2,0
		mov filaMTN2,0

		;xor al,al
		;xor ax,ax
		;MOV al,filaSig
		;mov filaMTN, al



		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaSAux, al


		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov colSAux, al
		
	VALIDARMOV2:

		mov indiceQuitar,0b
		xor al,al
		xor ax,ax 

		mov al,columnaActual
		sub al,columnaSig
		cmp al,1
		je VALIDARMOV
		
		

		xor al,al
		xor ax,ax 
		mov al,columnaSig
		sub al,columnaActual
		cmp al,1
		je VALIDARMOV

		xor al,al
		xor ax,ax
		mov al,columnaSig
		sub al,columnaActual
		cmp al,2
		je COMERN

		xor al,al
		xor ax,ax
		mov al,columnaActual
		sub al,columnaSig
		cmp al,2
		je COMERN2
		
		
		jmp ERROR



	VALIDARMOV3:
		
		xor al,al
		xor ax,ax 
		mov al,filaActual
		sub al,filaSig
		cmp al,1
		je INICIO
		
		jmp ERROR
	VALIDARMOV:
		
		xor al,al
		xor ax,ax 
		mov al, filaSig
		sub al,filaActual
		cmp al,1
		je INICIO
		jmp ERROR

	COMERN:
		
		xor al,al
		xor ax,ax 
		mov al, filaSig
		sub al,filaActual
		cmp al,2
		je VALIDARCOLAUXDER
		
		jmp ERROR

	COMERN2:
		
		xor al,al
		xor ax,ax 
		mov al, filaSig
		sub al,filaActual
		cmp al,2
		je VALIDARCOLAUXIZQ
		jmp ERROR

	VALIDARCOLAUXIZQ:
		
		xor al,al
		xor ax,ax
		mov al,columnaActual
		mov auxCol,al
		;mov auxCol,columnaActual
		DEC auxCol
		;cmp al,2
		jMP VALIDARFILAAUX 
		

	VALIDARCOLAUXDER:
		
		xor al,al
		xor ax,ax
		mov al,columnaActual
		mov auxCol,al

		;mov auxCol,columnaActual
		INC auxCol
		jMP VALIDARFILAAUX 



	VALIDARFILAAUX:
		
		xor al,al
		xor ax,ax
		mov al,filaActual
		mov auxFila,al
		;mov auxFila,filaActual
		inc auxFila
		jmp CFAUX

	CFAUX:
		cmp auxFila,0
		je VF1AUX
		cmp auxFila,1
		je VF2AUX
		cmp auxFila,2
		je VF3AUX
		cmp auxFila,3
		je VF4AUX
		cmp auxFila,4
		je VF5AUX
		cmp auxFila,5
		je VF6AUX
		cmp auxFila,6
		je VF7AUX
		cmp auxFila,7
		je VF8AUX
		JMP ERROR

	VF1AUX:
		cmp auxCol,0
		JE VERAUXA1
		cmp auxCol,2
		JE VERAUXC1
		cmp auxCol,4
		JE VERAUXE1
		cmp auxCol,6
		JE VERAUXG1
		JMP ERROR

	VERAUXA1:
		cmp tablero1[0],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXC1:
		cmp tablero1[2],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXE1:
		cmp tablero1[4],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXG1:
		cmp tablero1[6],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VF2AUX:
		cmp auxCol,1
		JE VERAUXB2
		cmp auxCol,3
		JE VERAUXD2
		cmp auxCol,5
		JE VERAUXF2
		cmp auxCol,7
		JE VERAUXH2
		JMP ERROR
	VERAUXB2:
		cmp tablero2[1],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXD2:
		cmp tablero2[3],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXF2:
		cmp tablero2[5],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXH2:
		cmp tablero2[7],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VF3AUX:
		cmp auxCol,0
		JE VERAUXA3
		cmp auxCol,2
		JE VERAUXC3
		cmp auxCol,4
		JE VERAUXE3
		cmp auxCol,6
		JE VERAUXG3
		JMP ERROR

	VERAUXA3:
		cmp tablero3[0],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXC3:
		cmp tablero3[2],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXE3:
		cmp tablero3[4],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXG3:
		cmp tablero3[6],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VF4AUX:
		cmp auxCol,1
		JE VERAUXB4
		cmp auxCol,3
		JE VERAUXD4
		cmp auxCol,5
		JE VERAUXF4
		cmp auxCol,7
		JE VERAUXH4
		JMP ERROR

	VERAUXB4:
		cmp tablero4[1],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXD4:
		cmp tablero4[3],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXF4:
		cmp tablero4[5],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXH4:
		cmp tablero4[7],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VF5AUX:
		cmp auxCol,0
		JE VERAUXA5
		cmp auxCol,2
		JE VERAUXC5
		cmp auxCol,4
		JE VERAUXE5
		cmp auxCol,6
		JE VERAUXG5
		JMP ERROR
	VERAUXA5:
		cmp tablero5[0],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXC5:
		cmp tablero5[2],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXE5:
		cmp tablero5[4],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXG5:
		cmp tablero5[6],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VF6AUX:
		cmp auxCol,1
		JE VERAUXB6
		cmp auxCol,3
		JE VERAUXD6
		cmp auxCol,5
		JE VERAUXF6
		cmp auxCol,7
		JE VERAUXH6
		JMP ERROR

	VERAUXB6:
		cmp tablero6[1],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXD6:
		cmp tablero6[3],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXF6:
		cmp tablero6[5],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXH6:
		cmp tablero6[7],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VF7AUX:
		cmp auxCol,0
		JE VERAUXA7
		cmp auxCol,2
		JE VERAUXC7
		cmp auxCol,4
		JE VERAUXE7
		cmp auxCol,6
		JE VERAUXG7
		JMP ERROR

	VERAUXA7:
		cmp tablero7[0],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXC7:
		cmp tablero7[2],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXE7:
		cmp tablero7[4],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXG7:
		cmp tablero7[6],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VF8AUX:
		cmp auxCol,1
		JE VERAUXB8
		cmp auxCol,3
		JE VERAUXD8
		cmp auxCol,5
		JE VERAUXF8
		cmp auxCol,7
		JE VERAUXH8
		JMP ERROR

	VERAUXB8:
		cmp tablero8[1],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR

	VERAUXD8:
		cmp tablero8[3],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXF8:
		cmp tablero8[5],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR
	VERAUXH8:
		cmp tablero8[7],011b
		mov indiceQuitar,1b
		je INICIO
		JMP ERROR




		

	INICIO:

		cmp filaActual,0
		je VF1
		cmp filaActual,1
		je VF2
		cmp filaActual,2
		je VF3
		cmp filaActual,3
		je VF4
		cmp filaActual,4
		je VF5
		cmp filaActual,5
		je VF6
		cmp filaActual,6
		je VF7
		cmp filaActual,7
		je VF8
		JMP ERROR
	VF1:
		cmp columnaActual,0
		JE VERA1
		cmp columnaActual,2
		JE VERC1
		cmp columnaActual,4
		JE VERE1
		cmp columnaActual,6
		JE VERG1
		JMP ERROR

	VERA1:
		cmp tablero1[0],001b
		je SIGUIENTE
		JMP ERROR

	VERC1:
		cmp tablero1[2],001b
		je SIGUIENTE
		JMP ERROR
	VERE1:
		cmp tablero1[4],001b
		je SIGUIENTE
		JMP ERROR
	VERG1:
		cmp tablero1[6],001b
		je SIGUIENTE
		JMP ERROR

	VF2:
		cmp columnaActual,1
		JE VERB2
		cmp columnaActual,3
		JE VERD2
		cmp columnaActual,5
		JE VERF2
		cmp columnaActual,7
		JE VERH2
		JMP ERROR

	VERB2:
		cmp tablero2[1],001b
		je SIGUIENTE
		JMP ERROR

	VERD2:
		cmp tablero2[3],001b
		je SIGUIENTE
		JMP ERROR
	VERF2:
		cmp tablero2[5],001b
		je SIGUIENTE
		JMP ERROR
	VERH2:
		cmp tablero2[7],001b
		je SIGUIENTE
		JMP ERROR


	VF3:
		cmp columnaActual,0
		JE VERA3
		cmp columnaActual,2
		JE VERC3
		cmp columnaActual,4
		JE VERE3
		cmp columnaActual,6
		JE VERG3
		JMP ERROR

	VERA3:
		cmp tablero3[0],001b
		je SIGUIENTE
		JMP ERROR

	VERC3:
		cmp tablero3[2],001b
		je SIGUIENTE
		JMP ERROR
	VERE3:
		cmp tablero3[4],001b
		je SIGUIENTE
		JMP ERROR
	VERG3:
		cmp tablero3[6],001b
		je SIGUIENTE
		JMP ERROR

	VF4:
		cmp columnaActual,1
		JE VERB4
		cmp columnaActual,3
		JE VERD4
		cmp columnaActual,5
		JE VERF4
		cmp columnaActual,7
		JE VERH4
		JMP ERROR

	VERB4:
		cmp tablero4[1],001b
		je SIGUIENTE
		JMP ERROR

	VERD4:
		cmp tablero4[3],001b
		je SIGUIENTE
		JMP ERROR
	VERF4:
		cmp tablero4[5],001b
		je SIGUIENTE
		JMP ERROR
	VERH4:
		cmp tablero4[7],001b
		je SIGUIENTE
		JMP ERROR

	VF5:
		cmp columnaActual,0
		JE VERA5
		cmp columnaActual,2
		JE VERC5
		cmp columnaActual,4
		JE VERE5
		cmp columnaActual,6
		JE VERG5
		JMP ERROR

	VERA5:
		cmp tablero5[0],001b
		je SIGUIENTE
		JMP ERROR

	VERC5:
		cmp tablero5[2],001b
		je SIGUIENTE
		JMP ERROR
	VERE5:
		cmp tablero5[4],001b
		je SIGUIENTE
		JMP ERROR
	VERG5:
		cmp tablero5[6],001b
		je SIGUIENTE
		JMP ERROR

	VF6:
		cmp columnaActual,1
		JE VERB6
		cmp columnaActual,3
		JE VERD6
		cmp columnaActual,5
		JE VERF6
		cmp columnaActual,7
		JE VERH6
		JMP ERROR

	VERB6:
		cmp tablero6[1],001b
		je SIGUIENTE
		JMP ERROR

	VERD6:
		cmp tablero6[3],001b
		je SIGUIENTE
		JMP ERROR
	VERF6:
		cmp tablero6[5],001b
		je SIGUIENTE
		JMP ERROR
	VERH6:
		cmp tablero6[7],001b
		je SIGUIENTE
		JMP ERROR

	VF7:
		cmp columnaActual,0
		JE VERA7
		cmp columnaActual,2
		JE VERC7
		cmp columnaActual,4
		JE VERE7
		cmp columnaActual,6
		JE VERG7
		JMP ERROR

	VERA7:
		cmp tablero7[0],001b
		je SIGUIENTE
		JMP ERROR

	VERC7:
		cmp tablero7[2],001b
		je SIGUIENTE
		JMP ERROR
	VERE7:
		cmp tablero7[4],001b
		je SIGUIENTE
		JMP ERROR
	VERG7:
		cmp tablero7[6],001b
		je SIGUIENTE
		JMP ERROR

	VF8:
		cmp columnaActual,1
		JE VERB8
		cmp columnaActual,3
		JE VERD8
		cmp columnaActual,5
		JE VERF8
		cmp columnaActual,7
		JE VERH8
		JMP ERROR

	VERB8:
		cmp tablero8[1],001b
		je SIGUIENTE
		JMP ERROR

	VERD8:
		cmp tablero8[3],001b
		je SIGUIENTE
		JMP ERROR
	VERF8:
		cmp tablero8[5],001b
		je SIGUIENTE
		JMP ERROR
	VERH8:
		cmp tablero8[7],001b
		je SIGUIENTE
		JMP ERROR



	SIGUIENTE:
	cmp filaSig,0
	je VF1S
	cmp filaSig,1
	je VF2S
	cmp filaSig,2
	je VF3S
	cmp filaSig,3
	je VF4S
	cmp filaSig,4
	je VF5S
	cmp filaSig,5
	je VF6S
	cmp filaSig,6
	je VF7S
	cmp filaSig,7
	je VF8S

	VF1S:
		cmp columnaSig,0
		JE VERA1S
		cmp columnaSig,2
		JE VERC1S
		cmp columnaSig,4
		JE VERE1S
		cmp columnaSig,6
		JE VERG1S
		JMP ERROR

	VERA1S:
		cmp tablero1[0],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERC1S:
		cmp tablero1[2],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERE1S:
		cmp tablero1[4],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERG1S:
		cmp tablero1[6],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF2S:
		cmp columnaSig,1
		JE VERB2S
		cmp columnaSig,3
		JE VERD2S
		cmp columnaSig,5
		JE VERF2S
		cmp columnaSig,7
		JE VERH2S
		JMP ERROR

	VERB2S:
		cmp tablero2[1],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERD2S:
		cmp tablero2[3],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERF2S:
		cmp tablero2[5],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERH2S:
		cmp tablero2[7],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS


	VF3S:
		cmp columnaSig,0
		JE VERA3S
		cmp columnaSig,2
		JE VERC3S
		cmp columnaSig,4
		JE VERE3S
		cmp columnaSig,6
		JE VERG3S
		JMP ERROR

	VERA3S:
		cmp tablero3[0],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERC3S:
		cmp tablero3[2],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERE3S:
		cmp tablero3[4],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERG3S:
		cmp tablero3[6],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF4S:
		cmp columnaSig,1
		JE VERB4S
		cmp columnaSig,3
		JE VERD4S
		cmp columnaSig,5
		JE VERF4S
		cmp columnaSig,7
		JE VERH4S
		JMP ERROR

	VERB4S:
		cmp tablero4[1],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERD4S:
		cmp tablero4[3],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERF4S:
		cmp tablero4[5],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERH4S:
		cmp tablero4[7],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF5S:
		cmp columnaSig,0
		JE VERA5S
		cmp columnaSig,2
		JE VERC5S
		cmp columnaSig,4
		JE VERE5S
		cmp columnaSig,6
		JE VERG5S
		JMP ERROR

	VERA5S:
		cmp tablero5[0],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERC5S:
		cmp tablero5[2],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERE5S:
		cmp tablero5[4],000b
		je QUITARFICHAT
		JMP ERROR
	VERG5S:
		cmp tablero5[6],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF6S:
		cmp columnaSig,1
		JE VERB6S
		cmp columnaSig,3
		JE VERD6S
		cmp columnaSig,5
		JE VERF6S
		cmp columnaSig,7
		JE VERH6S
		JMP ERROR

	VERB6S:
		cmp tablero6[1],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERD6S:
		cmp tablero6[3],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERF6S:
		cmp tablero6[5],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERH6S:
		cmp tablero6[7],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF7S:
		cmp columnaSig,0
		JE VERA7S
		cmp columnaSig,2
		JE VERC7S
		cmp columnaSig,4
		JE VERE7S
		cmp columnaSig,6
		JE VERG7S
		JMP ERROR

	VERA7S:
		cmp tablero7[0],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERC7S:
		cmp tablero7[2],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERE7S:
		cmp tablero7[4],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERG7S:
		cmp tablero7[6],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VF8S:
		cmp columnaSig,1
		JE VERB8S
		cmp columnaSig,3
		JE VERD8S
		cmp columnaSig,5
		JE VERF8S
		cmp columnaSig,7
		JE VERH8S
		JMP ERROR

	VERB8S:
		cmp tablero8[1],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	VERD8S:
		cmp tablero8[3],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERF8S:
		cmp tablero8[5],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS
	VERH8S:
		cmp tablero8[7],000b
		je QUITARFICHAT
		JMP EXISTEFICHAS

	
	


	QUITARFICHAT:
		cmp filaActual,0
		je QF1
		cmp filaActual,1
		je QF2
		cmp filaActual,2
		je QF3
		cmp filaActual,3
		je QF4
		cmp filaActual,4
		je QF5
		cmp filaActual,5
		je QF6
		cmp filaActual,6
		je QF7
		cmp filaActual,7
		je QF8

	QF1:
		cmp columnaActual,0
		JE QUIA1
		cmp columnaActual,2
		JE QUIC1
		cmp columnaActual,4
		JE QUIE1
		cmp columnaActual,6
		JE QUIG1

	QUIA1:
		mov tablero1[0],000b
		;cmp tablero1[0],001b
		jmp QSIGUIENTE
		

	QUIC1:
		mov tablero1[2],000b
		;cmp tablero1[2],001b
		je QSIGUIENTE
		
	QUIE1:
		mov tablero1[4],000b
		;cmp tablero1[4],001b
		je QSIGUIENTE
		
	QUIG1:
		mov tablero1[6],000b
		;cmp tablero1[6],001b
		je QSIGUIENTE
	QF2:	
        cmp columnaActual,1
		JE QUIB2
		cmp columnaActual,3
		JE QUID2
		cmp columnaActual,5
		JE QUIF2
		cmp columnaActual,7
		JE QUIH2
	QUIB2:
		MOV tablero2[1],000b
		JMP QSIGUIENTE
		

	QUID2:
		MOV tablero2[3],000b
		JMP QSIGUIENTE
	QUIF2:
		MOV tablero2[5],000b
		JMP QSIGUIENTE
		
	QUIH2:
		MOV tablero2[7],000b
		JMP QSIGUIENTE
		
		
	QF3:
		cmp columnaActual,0
		JE QUIA3
		cmp columnaActual,2
		JE QUIC3
		cmp columnaActual,4
		JE QUIE3
		cmp columnaActual,6
		JE QUIG3

	QUIA3:
		mov tablero3[0],000b
		jmp QSIGUIENTE
		

	QUIC3:
		mov tablero3[2],000b
		jmp QSIGUIENTE
		
	QUIE3:
		mov tablero3[4],000b
		jmp QSIGUIENTE
		
	QUIG3:
		mov tablero3[6],000b
		jmp QSIGUIENTE
		

	QF4:
		cmp columnaActual,1
		JE QUIB4
		cmp columnaActual,3
		JE QUID4
		cmp columnaActual,5
		JE QUIF4
		cmp columnaActual,7
		JE QUIH4
	QUIB4:
		MOV tablero4[1],000b
		jMP QSIGUIENTE
		

	QUID4:
		MOV tablero4[3],000b
		jMP QSIGUIENTE
		
	QUIF4:
		MOV tablero4[5],000b
		JMP QSIGUIENTE
		
	QUIH4:
		MOV tablero4[7],000b
		JMP QSIGUIENTE
		

	QF5:
		cmp columnaActual,0
		JE QUIA5
		cmp columnaActual,2
		JE QUIC5
		cmp columnaActual,4
		JE QUIE5
		cmp columnaActual,6
		JE QUIG5

	QUIA5:
		mov tablero5[0],000b
		jmp QSIGUIENTE
		

	QUIC5:
		mov tablero5[2],000b
		jmp QSIGUIENTE
		
	QUIE5:
		mov tablero5[4],000b
		jmp QSIGUIENTE
		
	QUIG5:
		mov tablero5[6],000b
		jmp QSIGUIENTE
		
		
	QF6:
		cmp columnaActual,1
		JE QUIB6
		cmp columnaActual,3
		JE QUID6
		cmp columnaActual,5
		JE QUIF6
		cmp columnaActual,7
		JE QUIH6

	QUIB6:
		mov tablero6[1],000b
		jmp QSIGUIENTE
		

	QUID6:
		mov tablero6[3],000b
		jmp QSIGUIENTE
		
	QUIF6:
		mov tablero6[5],000b
		jmp QSIGUIENTE
		
	QUIH6:
		mov tablero6[7],000b
		jmp QSIGUIENTE
		
		
	QF7:
		cmp columnaActual,0
		JE QUIA7
		cmp columnaActual,2
		JE QUIC7
		cmp columnaActual,4
		JE QUIE7
		cmp columnaActual,6
		JE QUIG7

	QUIA7:
		MOV tablero7[0],000b
		jmp QSIGUIENTE
		

	QUIC7:
		MOV tablero7[2],000b
		jmp QSIGUIENTE
		
	QUIE7:
		MOV tablero7[4],000b
		jmp QSIGUIENTE
		
	QUIG7:
		MOV tablero7[6],000b
		jmp QSIGUIENTE
		
	QF8:
		cmp columnaActual,1
		JE QUIB8
		cmp columnaActual,3
		JE QUID8
		cmp columnaActual,5
		JE QUIF8
		cmp columnaActual,7
		JE QUIH8
		
	QUIB8:
		mov tablero8[1],000b
		jmp QSIGUIENTE
		

	QUID8:
		mov tablero8[3],000b
		jmp QSIGUIENTE
		
	QUIF8:
		mov tablero8[5],000b
		jmp QSIGUIENTE
		
	QUIH8:
		mov tablero8[7],000b
		jmp QSIGUIENTE
		

	QSIGUIENTE:
		cmp filaSig,0
		je PF1S
		cmp filaSig,1
		je PF2S
		cmp filaSig,2
		je PF3S
		cmp filaSig,3
		je PF4S
		cmp filaSig,4
		je PF5S
		cmp filaSig,5
		je PF6S
		cmp filaSig,6
		je PF7S
		cmp filaSig,7
		je PF8S
		;imprimir bMov
		;jmp FINAL
	PF1S:
		cmp columnaSig,0
		JE PINTA1S
		cmp columnaSig,2
		JE PINTC1S
		cmp columnaSig,4
		JE PINTE1S
		cmp columnaSig,6
		JE PINTG1S

	PINTA1S:
		MOV tablero1[0],001b
		
		JMP MOVEXITOSO

	PINTC1S:
		MOV tablero1[2],001b
		
		JMP MOVEXITOSO
	PINTE1S:
		MOV tablero1[4],001b
		
		JMP MOVEXITOSO
	PINTG1S:
		MOV tablero1[6],001b
		
		JMP MOVEXITOSO
		
	PF2S:
		cmp columnaSig,1
		JE PINTB2S
		cmp columnaSig,3
		JE PINTD2S
		cmp columnaSig,5
		JE PINTF2S
		cmp columnaSig,7
		JE PINTH2S
		
	PINTB2S:
		MOV tablero2[1],001b
		
		JMP MOVEXITOSO

	PINTD2S:
		MOV tablero2[3],001b
		
		JMP MOVEXITOSO
	PINTF2S:
		MOV tablero2[5],001b
		
		JMP MOVEXITOSO
	PINTH2S:
		MOV tablero2[7],001b
		
		JMP MOVEXITOSO

	PF3S:
		cmp columnaSig,0
		JE PINTA3S
		cmp columnaSig,2
		JE PINTC3S
		cmp columnaSig,4
		JE PINTE3S
		cmp columnaSig,6
		JE PINTG3S
	PINTA3S:
		MOV tablero3[0],001b
		
		JMP MOVEXITOSO

	PINTC3S:
		MOV tablero3[2],001b
		
		JMP MOVEXITOSO
	PINTE3S:
		MOV tablero3[4],001b
		
		JMP MOVEXITOSO
	PINTG3S:
		MOV tablero3[6],001b
		
		JMP MOVEXITOSO

	PF4S:
		cmp columnaSig,1
		JE PINTB4S
		cmp columnaSig,3
		JE PINTD4S
		cmp columnaSig,5
		JE PINTF4S
		cmp columnaSig,7
		JE PINTH4S
	PINTB4S:
		MOV tablero4[1],001b
		
		JMP MOVEXITOSO

	PINTD4S:
		MOV tablero4[3],001b
		
		JMP MOVEXITOSO
	PINTF4S:
		MOV tablero4[5],001b
		
		JMP MOVEXITOSO
	PINTH4S:
		MOV tablero4[7],001b
		
		JMP MOVEXITOSO
		
	PF5S:
		cmp columnaSig,0
		JE PINTA5S
		cmp columnaSig,2
		JE PINTC5S
		cmp columnaSig,4
		JE PINTE5S
		cmp columnaSig,6
		JE PINTG5S
	PINTA5S:
		MOV tablero5[0],001b
		
		JMP MOVEXITOSO

	PINTC5S:
		MOV tablero5[2],001b
		
		JMP MOVEXITOSO
	PINTE5S:
		MOV tablero5[4],001b
		
		JMP MOVEXITOSO
	PINTG5S:
		MOV tablero5[6],001b
		
		JMP MOVEXITOSO
	PF6S:
		cmp columnaSig,1
		JE PINTB6S
		cmp columnaSig,3
		JE PINTD6S
		cmp columnaSig,5
		JE PINTF6S
		cmp columnaSig,7
		JE PINTH6S
	PINTB6S:
		mov tablero6[1],001b
		
		JMP MOVEXITOSO

	PINTD6S:
		mov tablero6[3],001b
		
		JMP MOVEXITOSO
	PINTF6S:
		mov tablero6[5],001b
		
		JMP MOVEXITOSO
	PINTH6S:
		mov tablero6[7],001b
		
		JMP MOVEXITOSO
		
	PF7S:
		cmp columnaSig,0
		JE PINTA7S
		cmp columnaSig,2
		JE PINTC7S
		cmp columnaSig,4
		JE PINTE7S
		cmp columnaSig,6
		JE PINTG7S
		JMP ERROR
	PINTA7S:
		mov tablero7[0],001b
		
		JMP MOVEXITOSO
	PINTC7S:
		mov tablero7[2],001b
		
		JMP MOVEXITOSO
	PINTE7S:
		mov tablero7[4],001b
		
		JMP MOVEXITOSO
	PINTG7S:
		mov tablero7[6],001b
		
		JMP MOVEXITOSO

	PF8S:
		cmp columnaSig,1
		JE PINTB8S
		cmp columnaSig,3
		JE PINTD8S
		cmp columnaSig,5
		JE PINTF8S
		cmp columnaSig,7
		JE PINTH8S
		
	PINTB8S:
		mov tablero8[1],111b
		
		JMP MOVEXITOSO

	PINTD8S:
		mov tablero8[3],111b
		
		JMP MOVEXITOSO
	PINTF8S:
		mov tablero8[5],111b
		
		JMP MOVEXITOSO
	PINTH8S:
		mov tablero8[7],111b
		
		JMP MOVEXITOSO




	;=================================================


	QUITARFICHATAUX:
		mov indiceComer,1b
		mov indiceComer2,1b
		cmp auxFila,0
		je QF1AUX
		cmp auxFila,1
		je QF2AUX
		cmp auxFila,2
		je QF3AUX
		cmp auxFila,3
		je QF4AUX
		cmp auxFila,4
		je QF5AUX
		cmp auxFila,5
		je QF6AUX
		cmp auxFila,6
		je QF7AUX
		cmp auxFila,7
		je QF8AUX

	QF1AUX:
		cmp auxCol,0
		JE QUIA1AUX
		cmp auxCol,2
		JE QUIC1AUX
		cmp auxCol,4
		JE QUIE1AUX
		cmp auxCol,6
		JE QUIG1AUX

	QUIA1AUX:
		mov tablero1[0],000b
		;cmp tablero1[0],001b
		jmp FINAL
		

	QUIC1AUX:
		mov tablero1[2],000b
		;cmp tablero1[2],001b
		je FINAL
		
	QUIE1AUX:
		mov tablero1[4],000b
		;cmp tablero1[4],001b
		je FINAL
		
	QUIG1AUX:
		mov tablero1[6],000b
		;cmp tablero1[6],001b
		je FINAL
	QF2AUX:	
        cmp auxCol,1
		JE QUIB2AUX
		cmp auxCol,3
		JE QUID2AUX
		cmp auxCol,5
		JE QUIF2AUX
		cmp auxCol,7
		JE QUIH2AUX
	QUIB2AUX:
		MOV tablero2[1],000b
		JMP FINAL
		

	QUID2AUX:
		MOV tablero2[3],000b
		JMP FINAL
	QUIF2AUX:
		MOV tablero2[5],000b
		JMP FINAL
		
	QUIH2AUX:
		MOV tablero2[7],000b
		JMP FINAL
		
		
	QF3AUX:
		cmp auxCol,0
		JE QUIA3AUX
		cmp auxCol,2
		JE QUIC3AUX
		cmp auxCol,4
		JE QUIE3AUX
		cmp auxCol,6
		JE QUIG3AUX

	QUIA3AUX:
		mov tablero3[0],000b
		jmp FINAL
		

	QUIC3AUX:
		mov tablero3[2],000b
		jmp FINAL
		
	QUIE3AUX:
		mov tablero3[4],000b
		jmp FINAL
		
	QUIG3AUX:
		mov tablero3[6],000b
		jmp FINAL
		

	QF4AUX:
		cmp auxCol,1
		JE QUIB4AUX
		cmp auxCol,3
		JE QUID4AUX
		cmp auxCol,5
		JE QUIF4AUX
		cmp auxCol,7
		JE QUIH4AUX
	QUIB4AUX:
		MOV tablero4[1],000b
		jMP FINAL
		

	QUID4AUX:
		MOV tablero4[3],000b
		jMP FINAL
		
	QUIF4AUX:
		MOV tablero4[5],000b
		JMP FINAL
		
	QUIH4AUX:
		MOV tablero4[7],000b
		JMP FINAL
		

	QF5AUX:
		cmp auxCol,0
		JE QUIA5AUX
		cmp auxCol,2
		JE QUIC5AUX
		cmp auxCol,4
		JE QUIE5AUX
		cmp auxCol,6
		JE QUIG5AUX

	QUIA5AUX:
		mov tablero5[0],000b
		jmp FINAL
		

	QUIC5AUX:
		mov tablero5[2],000b
		jmp FINAL
		
	QUIE5AUX:
		mov tablero5[4],000b
		jmp FINAL
		
	QUIG5AUX:
		mov tablero5[6],000b
		jmp FINAL
		
		
	QF6AUX:
		cmp auxCol,1
		JE QUIB6AUX
		cmp auxCol,3
		JE QUID6AUX
		cmp auxCol,5
		JE QUIF6AUX
		cmp auxCol,7
		JE QUIH6AUX

	QUIB6AUX:
		mov tablero6[1],000b
		jmp FINAL
		

	QUID6AUX:
		mov tablero6[3],000b
		jmp FINAL
		
	QUIF6AUX:
		mov tablero6[5],000b
		jmp FINAL
		
	QUIH6AUX:
		mov tablero6[7],000b
		jmp FINAL
		
		
	QF7AUX:
		cmp auxCol,0
		JE QUIA7AUX
		cmp auxCol,2
		JE QUIC7AUX
		cmp auxCol,4
		JE QUIE7AUX
		cmp auxCol,6
		JE QUIG7AUX

	QUIA7AUX:
		MOV tablero7[0],000b
		jmp FINAL
		

	QUIC7AUX:
		MOV tablero7[2],000b
		jmp FINAL
		
	QUIE7AUX:
		MOV tablero7[4],000b
		jmp FINAL
		
	QUIG7AUX:
		MOV tablero7[6],000b
		jmp FINAL
		
	QF8AUX:
		cmp auxCol,1
		JE QUIB8AUX
		cmp auxCol,3
		JE QUID8AUX
		cmp auxCol,5
		JE QUIF8AUX
		cmp auxCol,7
		JE QUIH8AUX
		
	QUIB8AUX:
		mov tablero8[1],000b
		jmp FINAL

	QUID8AUX:
		mov tablero8[3],000b
		jmp FINAL
		
	QUIF8AUX:
		mov tablero8[5],000b
		jmp FINAL
		
	QUIH8AUX:
		mov tablero8[7],000b
		jmp FINAL












	;----------------------------------
	;=========================================
	VERIFICAREXFN:

	;	inc filaMTN
	;	inc filaMTN
		;imprimir uno
		comment #
		xor al,al
		xor ax,ax
		MOV al,filaSAux
		mov filaSig, al

		xor al,al
		xor ax,ax
		MOV al,colSAux
		mov columnaSig,al#


		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer,0b
		jmp verColumna
		

	verColumna:
	;imprimir dos
		inc filaSig
		inc filaSig

		inc columnaSig
		inc columnaSig

		cmp indiceComer, 0b
		je VALIDARMOV2
		jmp FINAL
		;xor al,al
		;xor ax,ax
		;MOV al,filaSAux
		;mov filaSig, al

		;xor al,al
		;;xor ax,ax
		;MOV al,colSAux
		;mov columnaSig, al

	;	je verColumna2
	;	cmp indiceComer, 1b
	;	je MOVEXITOSO

	VERIFICAREXFN2:
	;imprimir tres
	;	inc filaMTN
	;	inc filaMTN
		
		xor al,al
		xor ax,ax
		MOV al,filaSAux
		mov filaSig, al

		xor al,al
		xor ax,ax
		MOV al,colSAux
		mov columnaSig, al


		mov indiceSEVUELTA,1b

		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer2,0b
		jmp verColumna2
		


	verColumna2:
		;imprimir cuatro

		inc filaSig
		inc filaSig

		dec columnaSig
		dec columnaSig

		cmp indiceComer2, 0b
		je VALIDARMOV2
		jmp FINAL

		VERIFICAREXFN3:
		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer2,0b
		jmp verColumna23

		verColumna23:
		;imprimir ocho

		inc filaSig
		inc filaSig

		dec columnaSig
		dec columnaSig

		;cmp indiceSEVUELTA, 1b
		mov indiceSEVUELTA, 0b
		jmp VALIDARMOV2
		jmp FINAL
	;===========================================

	MOVEXITOSO:
		;imprimir cinco
		cmp indiceQuitar,1b
		je QUITARFICHATAUX
		imprimir movBien
		JMP FINAL

	EXISTEFICHAS:
		;imprimir bExiste2



		JMP FINALERROR
	MOVERFICHAB:
		;imprimir bMov
		JMP FINAL
	ERROR:
		;imprimir errorV
		JMP FINALERROR
	FINAL:
		;imprimir seis
		cmp indiceComer,1b
		je VERIFICAREXFN
		cmp indiceComer2,1b
		je VERIFICAREXFN2
		;cmp indiceTurno2,0b
		;mov indiceTurno2,1b

		;cmp indiceTurno2,1b
		;mov indiceTurno2,0b

	FINALERROR:
		;imprimir siete
		

		cmp indiceComer,1b
		je VERIFICAREXFN
		cmp indiceComer2,1b
		je VERIFICAREXFN2
		cmp indiceSEVUELTA,1b
		je VERIFICAREXFN3
endm

;convertir numero a string
convertirAscci macro numero 
	local inicio,fin 
	xor ax,ax 
	xor bx,bx
	xor cx,cx
	mov bx,10
	xor si,si
	inicio:
		mov cl,numero[si]
		cmp cl,48
		jl fin 
		cmp cl,57
		jg fin
		inc si 
		sub cl,48
		mul bx
		add ax,cx
		jmp INICIO


endm


;Convertir STRING A NUMERO

convertirString macro buffer
	Local dividir, dividir2, fincr3,negativo,fin2,fin
	xor	si,si
	xor cx,cx
	xor bx,bx
	xor dx,dx
	mov dl,0ah
	test ax,1000000000000000
	jnz negativo
	jmp dividir2
	negativo: 
		neg ax
		mov buffer[si],45
		inc si
		jmp dividir2
	dividir:
		xor ah,ah
	dividir2:
		div dl 
		inc cx 
		push ax
		cmp al,00h
		je fincr3
		jmp dividir
	fincr3:
		pop ax
		add ah,30h
		mov buffer[si],ah
		inc si
		loop fincr3
		mov ah,24h
		mov buffer[si],ah
		inc si

	fin:


endm






verENegro macro
comment #	local VF1NN,VF2NN,VF3N,VF4NN,VF5N,VF6NN,VF7N,VF8NN,INICION,ERRORN,FINALN,VERTABLERO1N,VERTABLERO2N,VERTABLERO3N,VERTABLERO4N,VERTABLERO5N,VERTABLERO6N,VERTABLERO7N,VERTABLERO8N,SIGUIENTEN,FINALNERRORN,VALIDARMOVN,VALIDARMOVN2,VALIDARMOVN3
	local VERA1N,VERC1N,VERE1N,VERG1N
	local VERB2N,VERD2N,VERF2NN,VERH2N
	local VERA3N,VERC3N,VERE3N,VERG3N
	local VERB4N,VERD4N,VERF4NN,VERH4N
	local VERA5N,VERC5N,VERE5N,VERG5N
	local VERB6N,VERD6N,VERF6NN,VERH6N
	local VERA7N,VERC7N,VERE7N,VERG7N
	local VERB8N,VERD8N,VERF8NN,VERH8N
	local VF1NNS,VF2NNS,VF3NS,VF4NNS,VF5NS,VF6NNS,VF7NS,VF8NNS,VERTABLERO1NS,VERTABLERO2NS,VERTABLERO3NS,VERTABLERO4NS,VERTABLERO5NS,VERTABLERO6NS,VERTABLERO7NS,VERTABLERO8NS,EXISTEFICHASN
	local VERA1NS,VERC1NS,VERE1NS,VERG1NS
	local VERB2NS,VERD2NS,VERF2NNS,VERH2NS
	local VERA3NS,VERC3NS,VERE3NS,VERG3NS
	local VERB4NS,VERD4NS,VERF4NNS,VERH4NS
	local VERA5NS,VERC5NS,VERE5NS,VERG5NS
	local VERB6NS,VERD6NS,VERF6NNS,VERH6NS
	local VERA7NS,VERC7NS,VERE7NS,VERG7NS
	local VERB8NS,VERD8NS,VERF8NNS,VERH8NS

	local MOVERFICHABN,QUITARFICHATN,QF1NN,QF2NN,QF3N,QF4NN,QF5N,QF6NN,QF7N,QF8NN
	local QF1NN,QF2NN,QF3N,QF4NN,QF5N,QF6NN,QF7N,QF8NN

	local QUIA1N,QUIC1N,QUIE1N,QUIG1N
	local QUIB2N,QUID2N,QUIF2NN,QUIH2N
	local QUIA3N,QUIC3N,QUIE3N,QUIG3N
	local QUIB4N,QUID4N,QUIF4NN,QUIH4N
	local QUIA5N,QUIC5N,QUIE5N,QUIG5N
	local QUIB6N,QUID6N,QUIF6NN,QUIH6N
	local QUIA7N,QUIC7N,QUIE7N,QUIG7N
	local QUIB8N,QUID8N,QUIF8NN,QUIH8N
	local QSIGUIENTEN#
	local FINALN
	;local QUIA1NS,QUIC1NS,QUIE1NS,QUIG1NS
	;local QUIB2NS,QUID2NS,QUIF2NNS,QUIH2NS
	;local QUIA3NS,QUIC3NS,QUIE3NS,QUIG3NS
	;local QUIB4NS,QUID4NS,QUIF4NNS,QUIH4NS
	;local QUIA5NS,QUIC5NS,QUIE5NS,QUIG5NS
	;local QUIB6NS,QUID6NS,QUIF6NNS,QUIH6NS
	;local QUIA7NS,QUIC7NS,QUIE7NS,QUIG7NS
	;local QUIB8NS,QUID8NS,QUIF8NNS,QUIH8NS

	MULTIPLEN:
		mov indiceComer,0b
		mov indiceSEVUELTA,0b
		mov indiceComer2,0b
		;mov filaMTN,0
		mov filaSAux,0
		mov colSAux,0
		mov colMTN,0
		mov colMTN2,0
		mov filaMTN2,0

		;xor al,al
		;xor ax,ax
		;MOV al,filaSig
		;mov filaMTN, al



		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaSAux, al


		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov colSAux, al


	VALIDARMOVN2:
		mov indiceQuitar,0b
		xor al,al
		xor ax,ax 

		mov al,columnaActual
		sub al,columnaSig
		cmp al,1
		je VALIDARMOVN3
		
		

		xor al,al
		xor ax,ax 
		mov al,columnaSig
		sub al,columnaActual
		cmp al,1
		je VALIDARMOVN3

		xor al,al
		xor ax,ax
		mov al,columnaSig
		sub al,columnaActual
		cmp al,2
		je COMERB

		xor al,al
		xor ax,ax
		mov al,columnaActual
		sub al,columnaSig
		cmp al,2
		je COMERB2
		
		jmp ERRORN

	VALIDARMOVN3:
		xor al,al
		xor ax,ax 
		mov al,filaActual
		sub al,filaSig
		cmp al,1
		je INICION
		
		jmp ERRORN
	VALIDARMOVN:
		xor al,al
		xor ax,ax 
		mov al, filaSig
		sub al,filaActual
		cmp al,1
		je INICION
		jmp ERRORN

	COMERB:
		;imprimir uno
		xor al,al
		xor ax,ax 
		mov al, filaActual
		sub al, filaSig
		cmp al,2
		je VALIDARCOLAUXDERN
		
		jmp ERRORN

	COMERB2:
		;imprimir dos
		xor al,al
		xor ax,ax 
		mov al, filaActual
		sub al,filaSig
		cmp al,2
		je VALIDARCOLAUXIZQN
		jmp ERRORN






	;===========================



	VALIDARCOLAUXIZQN:
		;imprimir tres
		xor al,al
		xor ax,ax
		mov al,columnaActual
		mov auxCol,al
		;mov auxCol,columnaActual
		DEC auxCol
		;cmp al,2
		jMP VALIDARFILAAUXN 
		

	VALIDARCOLAUXDERN:
		;imprimir cuatro
		xor al,al
		xor ax,ax
		mov al,columnaActual
		mov auxCol,al

		;mov auxCol,columnaActual
		INC auxCol
		jMP VALIDARFILAAUXN



	VALIDARFILAAUXN:
		;imprimir cinco
		xor al,al
		xor ax,ax
		mov al,filaActual
		mov auxFila,al
		;mov auxFila,filaActual
		DEC auxFila
		jmp CFAUXN

	CFAUXN:
		;imprimir seis
		cmp auxFila,0
		je VF1AUXN
		cmp auxFila,1
		je VF2AUXN
		cmp auxFila,2
		je VF3AUXN
		cmp auxFila,3
		je VF4AUXN
		cmp auxFila,4
		je VF5AUXN
		cmp auxFila,5
		je VF6AUXN
		cmp auxFila,6
		je VF7AUXN
		cmp auxFila,7
		je VF8AUXN
		JMP ERRORN

	VF1AUXN:
		cmp auxCol,0
		JE VERAUXA1N
		cmp auxCol,2
		JE VERAUXC1N
		cmp auxCol,4
		JE VERAUXE1N
		cmp auxCol,6
		JE VERAUXG1N
		JMP ERRORN

	VERAUXA1N:
		cmp tablero1[0],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXC1N:
		cmp tablero1[2],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXE1N:
		cmp tablero1[4],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXG1N:
		cmp tablero1[6],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VF2AUXN:
		cmp auxCol,1
		JE VERAUXB2N
		cmp auxCol,3
		JE VERAUXD2N
		cmp auxCol,5
		JE VERAUXF2N
		cmp auxCol,7
		JE VERAUXH2N
		JMP ERRORN
	VERAUXB2N:
		cmp tablero2[1],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXD2N:
		cmp tablero2[3],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXF2N:
		cmp tablero2[5],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXH2N:
		cmp tablero2[7],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VF3AUXN:
		cmp auxCol,0
		JE VERAUXA3N
		cmp auxCol,2
		JE VERAUXC3N
		cmp auxCol,4
		JE VERAUXE3N
		cmp auxCol,6
		JE VERAUXG3N
		JMP ERRORN

	VERAUXA3N:
		cmp tablero3[0],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXC3N:
		cmp tablero3[2],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXE3N:
		cmp tablero3[4],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXG3N:
		cmp tablero3[6],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VF4AUXN:
		cmp auxCol,1
		JE VERAUXB4N
		cmp auxCol,3
		JE VERAUXD4N
		cmp auxCol,5
		JE VERAUXF4N
		cmp auxCol,7
		JE VERAUXH4N
		JMP ERRORN

	VERAUXB4N:
		cmp tablero4[1],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXD4N:
		cmp tablero4[3],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXF4N:
		cmp tablero4[5],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXH4N:
		cmp tablero4[7],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VF5AUXN:
		cmp auxCol,0
		JE VERAUXA5N
		cmp auxCol,2
		JE VERAUXC5N
		cmp auxCol,4
		JE VERAUXE5N
		cmp auxCol,6
		JE VERAUXG5N
		JMP ERRORN
	VERAUXA5N:
		cmp tablero5[0],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXC5N:
		cmp tablero5[2],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXE5N:
		cmp tablero5[4],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXG5N:
		cmp tablero5[6],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VF6AUXN:
		cmp auxCol,1
		JE VERAUXB6N
		cmp auxCol,3
		JE VERAUXD6N
		cmp auxCol,5
		JE VERAUXF6N
		cmp auxCol,7
		JE VERAUXH6N
		JMP ERRORN

	VERAUXB6N:
		cmp tablero6[1],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXD6N:
		cmp tablero6[3],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXF6N:
		cmp tablero6[5],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXH6N:
		cmp tablero6[7],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VF7AUXN:
		cmp auxCol,0
		JE VERAUXA7N
		cmp auxCol,2
		JE VERAUXC7N
		cmp auxCol,4
		JE VERAUXE7N
		cmp auxCol,6
		JE VERAUXG7N
		JMP ERRORN

	VERAUXA7N:
		cmp tablero7[0],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXC7N:
		cmp tablero7[2],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXE7N:
		cmp tablero7[4],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXG7N:
		cmp tablero7[6],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VF8AUXN:
		cmp auxCol,1
		JE VERAUXB8N
		cmp auxCol,3
		JE VERAUXD8N
		cmp auxCol,5
		JE VERAUXF8N
		cmp auxCol,7
		JE VERAUXH8N
		JMP ERRORN

	VERAUXB8N:
		cmp tablero8[1],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN

	VERAUXD8N:
		cmp tablero8[3],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXF8N:
		cmp tablero8[5],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN
	VERAUXH8N:
		cmp tablero8[7],001b
		mov indiceQuitar,1b
		je INICION
		JMP ERRORN


	;============================

	INICION:

		cmp filaActual,0
		je VF1NN
		cmp filaActual,1
		je VF2NN
		cmp filaActual,2
		je VF3N
		cmp filaActual,3
		je VF4NN
		cmp filaActual,4
		je VF5N
		cmp filaActual,5
		je VF6NN
		cmp filaActual,6
		je VF7N
		cmp filaActual,7
		je VF8NN
		JMP ERRORN
	VF1NN:
		cmp columnaActual,0
		JE VERA1N
		cmp columnaActual,2
		JE VERC1N
		cmp columnaActual,4
		JE VERE1N
		cmp columnaActual,6
		JE VERG1N
		JMP ERRORN

	VERA1N:
		cmp tablero1[0],011b
		je SIGUIENTEN
		JMP ERRORN

	VERC1N:
		cmp tablero1[2],011b
		je SIGUIENTEN
		JMP ERRORN
	VERE1N:
		cmp tablero1[4],011b
		je SIGUIENTEN
		JMP ERRORN
	VERG1N:
		cmp tablero1[6],011b
		je SIGUIENTEN
		JMP ERRORN

	VF2NN:
		cmp columnaActual,1
		JE VERB2N
		cmp columnaActual,3
		JE VERD2N
		cmp columnaActual,5
		JE VERF2NN
		cmp columnaActual,7
		JE VERH2N
		JMP ERRORN

	VERB2N:
		cmp tablero2[1],011b
		je SIGUIENTEN
		JMP ERRORN

	VERD2N:
		cmp tablero2[3],011b
		je SIGUIENTEN
		JMP ERRORN
	VERF2NN:
		cmp tablero2[5],011b
		je SIGUIENTEN
		JMP ERRORN
	VERH2N:
		cmp tablero2[7],011b
		je SIGUIENTEN
		JMP ERRORN


	VF3N:
		cmp columnaActual,0
		JE VERA3N
		cmp columnaActual,2
		JE VERC3N
		cmp columnaActual,4
		JE VERE3N
		cmp columnaActual,6
		JE VERG3N
		JMP ERRORN

	VERA3N:
		cmp tablero3[0],011b
		je SIGUIENTEN
		JMP ERRORN

	VERC3N:
		cmp tablero3[2],011b
		je SIGUIENTEN
		JMP ERRORN
	VERE3N:
		cmp tablero3[4],011b
		je SIGUIENTEN
		JMP ERRORN
	VERG3N:
		cmp tablero3[6],011b
		je SIGUIENTEN
		JMP ERRORN

	VF4NN:
		cmp columnaActual,1
		JE VERB4N
		cmp columnaActual,3
		JE VERD4N
		cmp columnaActual,5
		JE VERF4NN
		cmp columnaActual,7
		JE VERH4N
		JMP ERRORN

	VERB4N:
		cmp tablero4[1],011b
		je SIGUIENTEN
		JMP ERRORN

	VERD4N:
		cmp tablero4[3],011b
		je SIGUIENTEN
		JMP ERRORN
	VERF4NN:
		cmp tablero4[5],011b
		je SIGUIENTEN
		JMP ERRORN
	VERH4N:
		cmp tablero4[7],011b
		je SIGUIENTEN
		JMP ERRORN

	VF5N:
		cmp columnaActual,0
		JE VERA5N
		cmp columnaActual,2
		JE VERC5N
		cmp columnaActual,4
		JE VERE5N
		cmp columnaActual,6
		JE VERG5N
		JMP ERRORN

	VERA5N:
		cmp tablero5[0],011b
		je SIGUIENTEN
		JMP ERRORN

	VERC5N:
		cmp tablero5[2],011b
		je SIGUIENTEN
		JMP ERRORN
	VERE5N:
		cmp tablero5[4],011b
		je SIGUIENTEN
		JMP ERRORN
	VERG5N:
		cmp tablero5[6],011b
		je SIGUIENTEN
		JMP ERRORN

	VF6NN:
		cmp columnaActual,1
		JE VERB6N
		cmp columnaActual,3
		JE VERD6N
		cmp columnaActual,5
		JE VERF6NN
		cmp columnaActual,7
		JE VERH6N
		JMP ERRORN

	VERB6N:
		cmp tablero6[1],011b
		je SIGUIENTEN
		JMP ERRORN

	VERD6N:
		cmp tablero6[3],011b
		je SIGUIENTEN
		JMP ERRORN
	VERF6NN:
		cmp tablero6[5],011b
		je SIGUIENTEN
		JMP ERRORN
	VERH6N:
		cmp tablero6[7],011b
		je SIGUIENTEN
		JMP ERRORN

	VF7N:
		cmp columnaActual,0
		JE VERA7N
		cmp columnaActual,2
		JE VERC7N
		cmp columnaActual,4
		JE VERE7N
		cmp columnaActual,6
		JE VERG7N
		JMP ERRORN

	VERA7N:
		cmp tablero7[0],011b
		je SIGUIENTEN
		JMP ERRORN

	VERC7N:
		cmp tablero7[2],011b
		je SIGUIENTEN
		JMP ERRORN
	VERE7N:
		cmp tablero7[4],011b
		je SIGUIENTEN
		JMP ERRORN
	VERG7N:
		cmp tablero7[6],011b
		je SIGUIENTEN
		JMP ERRORN

	VF8NN:
		cmp columnaActual,1
		JE VERB8N
		cmp columnaActual,3
		JE VERD8N
		cmp columnaActual,5
		JE VERF8NN
		cmp columnaActual,7
		JE VERH8N
		JMP ERRORN

	VERB8N:
		cmp tablero8[1],011b
		je SIGUIENTEN
		JMP ERRORN

	VERD8N:
		cmp tablero8[3],011b
		je SIGUIENTEN
		JMP ERRORN
	VERF8NN:
		cmp tablero8[5],011b
		je SIGUIENTEN
		JMP ERRORN
	VERH8N:
		cmp tablero8[7],011b
		je SIGUIENTEN
		JMP ERRORN



	SIGUIENTEN:
	cmp filaSig,0
	je VF1NNS
	cmp filaSig,1
	je VF2NNS
	cmp filaSig,2
	je VF3NS
	cmp filaSig,3
	je VF4NNS
	cmp filaSig,4
	je VF5NS
	cmp filaSig,5
	je VF6NNS
	cmp filaSig,6
	je VF7NS
	cmp filaSig,7
	je VF8NNS

	VF1NNS:
		cmp columnaSig,0
		JE VERA1NS
		cmp columnaSig,2
		JE VERC1NS
		cmp columnaSig,4
		JE VERE1NS
		cmp columnaSig,6
		JE VERG1NS
		JMP ERRORN

	VERA1NS:
		cmp tablero1[0],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERC1NS:
		cmp tablero1[2],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERE1NS:
		cmp tablero1[4],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERG1NS:
		cmp tablero1[6],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF2NNS:
		cmp columnaSig,1
		JE VERB2NS
		cmp columnaSig,3
		JE VERD2NS
		cmp columnaSig,5
		JE VERF2NNS
		cmp columnaSig,7
		JE VERH2NS
		JMP ERRORN

	VERB2NS:
		cmp tablero2[1],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERD2NS:
		cmp tablero2[3],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERF2NNS:
		cmp tablero2[5],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERH2NS:
		cmp tablero2[7],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN


	VF3NS:
		cmp columnaSig,0
		JE VERA3NS
		cmp columnaSig,2
		JE VERC3NS
		cmp columnaSig,4
		JE VERE3NS
		cmp columnaSig,6
		JE VERG3NS
		JMP ERRORN

	VERA3NS:
		cmp tablero3[0],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERC3NS:
		cmp tablero3[2],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERE3NS:
		cmp tablero3[4],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERG3NS:
		cmp tablero3[6],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF4NNS:
		cmp columnaSig,1
		JE VERB4NS
		cmp columnaSig,3
		JE VERD4NS
		cmp columnaSig,5
		JE VERF4NNS
		cmp columnaSig,7
		JE VERH4NS
		JMP ERRORN

	VERB4NS:
		cmp tablero4[1],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERD4NS:
		cmp tablero4[3],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERF4NNS:
		cmp tablero4[5],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERH4NS:
		cmp tablero4[7],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF5NS:
		cmp columnaSig,0
		JE VERA5NS
		cmp columnaSig,2
		JE VERC5NS
		cmp columnaSig,4
		JE VERE5NS
		cmp columnaSig,6
		JE VERG5NS
		JMP ERRORN

	VERA5NS:
		cmp tablero5[0],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERC5NS:
		cmp tablero5[2],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERE5NS:
		cmp tablero5[4],000b
		je QUITARFICHATN
		JMP ERRORN
	VERG5NS:
		cmp tablero5[6],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF6NNS:
		cmp columnaSig,1
		JE VERB6NS
		cmp columnaSig,3
		JE VERD6NS
		cmp columnaSig,5
		JE VERF6NNS
		cmp columnaSig,7
		JE VERH6NS
		JMP ERRORN

	VERB6NS:
		cmp tablero6[1],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERD6NS:
		cmp tablero6[3],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERF6NNS:
		cmp tablero6[5],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERH6NS:
		cmp tablero6[7],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF7NS:
		cmp columnaSig,0
		JE VERA7NS
		cmp columnaSig,2
		JE VERC7NS
		cmp columnaSig,4
		JE VERE7NS
		cmp columnaSig,6
		JE VERG7NS
		JMP ERRORN

	VERA7NS:
		cmp tablero7[0],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERC7NS:
		cmp tablero7[2],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERE7NS:
		cmp tablero7[4],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERG7NS:
		cmp tablero7[6],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VF8NNS:
		cmp columnaSig,1
		JE VERB8NS
		cmp columnaSig,3
		JE VERD8NS
		cmp columnaSig,5
		JE VERF8NNS
		cmp columnaSig,7
		JE VERH8NS
		JMP ERRORN

	VERB8NS:
		cmp tablero8[1],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	VERD8NS:
		cmp tablero8[3],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERF8NNS:
		cmp tablero8[5],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN
	VERH8NS:
		cmp tablero8[7],000b
		je QUITARFICHATN
		JMP EXISTEFICHASN

	
	


	QUITARFICHATN:
		cmp filaActual,0
		je QF1NN
		cmp filaActual,1
		je QF2NN
		cmp filaActual,2
		je QF3N
		cmp filaActual,3
		je QF4NN
		cmp filaActual,4
		je QF5N
		cmp filaActual,5
		je QF6NN
		cmp filaActual,6
		je QF7N
		cmp filaActual,7
		je QF8NN

	QF1NN:
		cmp columnaActual,0
		JE QUIA1N
		cmp columnaActual,2
		JE QUIC1N
		cmp columnaActual,4
		JE QUIE1N
		cmp columnaActual,6
		JE QUIG1N

	QUIA1N:
		mov tablero1[0],000b
		;cmp tablero1[0],011b
		jmp QSIGUIENTEN
		

	QUIC1N:
		mov tablero1[2],000b
		;cmp tablero1[2],011b
		je QSIGUIENTEN
		
	QUIE1N:
		mov tablero1[4],000b
		;cmp tablero1[4],011b
		je QSIGUIENTEN
		
	QUIG1N:
		mov tablero1[6],000b
		;cmp tablero1[6],011b
		je QSIGUIENTEN
	QF2NN:	
        cmp columnaActual,1
		JE QUIB2N
		cmp columnaActual,3
		JE QUID2N
		cmp columnaActual,5
		JE QUIF2NN
		cmp columnaActual,7
		JE QUIH2N
	QUIB2N:
		MOV tablero2[1],000b
		JMP QSIGUIENTEN
		

	QUID2N:
		MOV tablero2[3],000b
		JMP QSIGUIENTEN
	QUIF2NN:
		MOV tablero2[5],000b
		JMP QSIGUIENTEN
		
	QUIH2N:
		MOV tablero2[7],000b
		JMP QSIGUIENTEN
		
		
	QF3N:
		cmp columnaActual,0
		JE QUIA3N
		cmp columnaActual,2
		JE QUIC3N
		cmp columnaActual,4
		JE QUIE3N
		cmp columnaActual,6
		JE QUIG3N

	QUIA3N:
		mov tablero3[0],000b
		jmp QSIGUIENTEN
		

	QUIC3N:
		mov tablero3[2],000b
		jmp QSIGUIENTEN
		
	QUIE3N:
		mov tablero3[4],000b
		jmp QSIGUIENTEN
		
	QUIG3N:
		mov tablero3[6],000b
		jmp QSIGUIENTEN
		

	QF4NN:
		cmp columnaActual,1
		JE QUIB4N
		cmp columnaActual,3
		JE QUID4N
		cmp columnaActual,5
		JE QUIF4NN
		cmp columnaActual,7
		JE QUIH4N
	QUIB4N:
		MOV tablero4[1],000b
		jMP QSIGUIENTEN
		

	QUID4N:
		MOV tablero4[3],000b
		jMP QSIGUIENTEN
		
	QUIF4NN:
		MOV tablero4[5],000b
		JMP QSIGUIENTEN
		
	QUIH4N:
		MOV tablero4[7],000b
		JMP QSIGUIENTEN
		

	QF5N:
		cmp columnaActual,0
		JE QUIA5N
		cmp columnaActual,2
		JE QUIC5N
		cmp columnaActual,4
		JE QUIE5N
		cmp columnaActual,6
		JE QUIG5N

	QUIA5N:
		mov tablero5[0],000b
		jmp QSIGUIENTEN
		

	QUIC5N:
		mov tablero5[2],000b
		jmp QSIGUIENTEN
		
	QUIE5N:
		mov tablero5[4],000b
		jmp QSIGUIENTEN
		
	QUIG5N:
		mov tablero5[6],000b
		jmp QSIGUIENTEN
		
		
	QF6NN:
		cmp columnaActual,1
		JE QUIB6N
		cmp columnaActual,3
		JE QUID6N
		cmp columnaActual,5
		JE QUIF6NN
		cmp columnaActual,7
		JE QUIH6N

	QUIB6N:
		mov tablero6[1],000b
		jmp QSIGUIENTEN
		

	QUID6N:
		mov tablero6[3],000b
		jmp QSIGUIENTEN
		
	QUIF6NN:
		mov tablero6[5],000b
		jmp QSIGUIENTEN
		
	QUIH6N:
		mov tablero6[7],000b
		jmp QSIGUIENTEN
		
		
	QF7N:
		cmp columnaActual,0
		JE QUIA7N
		cmp columnaActual,2
		JE QUIC7N
		cmp columnaActual,4
		JE QUIE7N
		cmp columnaActual,6
		JE QUIG7N

	QUIA7N:
		MOV tablero7[0],000b
		jmp QSIGUIENTEN
		

	QUIC7N:
		MOV tablero7[2],000b
		jmp QSIGUIENTEN
		
	QUIE7N:
		MOV tablero7[4],000b
		jmp QSIGUIENTEN
		
	QUIG7N:
		MOV tablero7[6],000b
		jmp QSIGUIENTEN
		
	QF8NN:
		cmp columnaActual,1
		JE QUIB8N
		cmp columnaActual,3
		JE QUID8N
		cmp columnaActual,5
		JE QUIF8NN
		cmp columnaActual,7
		JE QUIH8N
		
	QUIB8N:
		mov tablero8[1],000b
		jmp QSIGUIENTEN
		

	QUID8N:
		mov tablero8[3],000b
		jmp QSIGUIENTEN
		
	QUIF8NN:
		mov tablero8[5],000b
		jmp QSIGUIENTEN
		
	QUIH8N:
		mov tablero8[7],000b
		jmp QSIGUIENTEN
		

	QSIGUIENTEN:
		cmp filaSig,0
		je PF1NNS
		cmp filaSig,1
		je PF2NNS
		cmp filaSig,2
		je PF3NS
		cmp filaSig,3
		je PF4NNS
		cmp filaSig,4
		je PF5NS
		cmp filaSig,5
		je PF6NNS
		cmp filaSig,6
		je PF7NS
		cmp filaSig,7
		je PF8NNS
		;imprimir bMov
		;jmp FINALN
	PF1NNS:
		cmp columnaSig,0
		JE PINTA1NS
		cmp columnaSig,2
		JE PINTC1NS
		cmp columnaSig,4
		JE PINTE1NS
		cmp columnaSig,6
		JE PINTG1NS

	PINTA1NS:
		MOV tablero1[0],110b
		
		JMP MOVEXITOSON

	PINTC1NS:
		MOV tablero1[2],110b
		
		JMP MOVEXITOSON
	PINTE1NS:
		MOV tablero1[4],110b
		
		JMP MOVEXITOSON
	PINTG1NS:
		MOV tablero1[6],110b
		
		JMP MOVEXITOSON
		
	PF2NNS:
		cmp columnaSig,1
		JE PINTB2NS
		cmp columnaSig,3
		JE PINTD2NS
		cmp columnaSig,5
		JE PINTF2NNS
		cmp columnaSig,7
		JE PINTH2NS
		
	PINTB2NS:
		MOV tablero2[1],011b
		
		JMP MOVEXITOSON

	PINTD2NS:
		MOV tablero2[3],011b
		
		JMP MOVEXITOSON
	PINTF2NNS:
		MOV tablero2[5],011b
		
		JMP MOVEXITOSON
	PINTH2NS:
		MOV tablero2[7],011b
		
		JMP MOVEXITOSON

	PF3NS:
		cmp columnaSig,0
		JE PINTA3NS
		cmp columnaSig,2
		JE PINTC3NS
		cmp columnaSig,4
		JE PINTE3NS
		cmp columnaSig,6
		JE PINTG3NS
	PINTA3NS:
		MOV tablero3[0],011b
		
		JMP MOVEXITOSON

	PINTC3NS:
		MOV tablero3[2],011b
		
		JMP MOVEXITOSON
	PINTE3NS:
		MOV tablero3[4],011b
		
		JMP MOVEXITOSON
	PINTG3NS:
		MOV tablero3[6],011b
		
		JMP MOVEXITOSON

	PF4NNS:
		cmp columnaSig,1
		JE PINTB4NS
		cmp columnaSig,3
		JE PINTD4NS
		cmp columnaSig,5
		JE PINTF4NNS
		cmp columnaSig,7
		JE PINTH4NS
	PINTB4NS:
		MOV tablero4[1],011b
		
		JMP MOVEXITOSON

	PINTD4NS:
		MOV tablero4[3],011b
		
		JMP MOVEXITOSON
	PINTF4NNS:
		MOV tablero4[5],011b
		
		JMP MOVEXITOSON
	PINTH4NS:
		MOV tablero4[7],011b
		
		JMP MOVEXITOSON
		
	PF5NS:
		cmp columnaSig,0
		JE PINTA5NS
		cmp columnaSig,2
		JE PINTC5NS
		cmp columnaSig,4
		JE PINTE5NS
		cmp columnaSig,6
		JE PINTG5NS
	PINTA5NS:
		MOV tablero5[0],011b
		
		JMP MOVEXITOSON

	PINTC5NS:
		MOV tablero5[2],011b
		
		JMP MOVEXITOSON
	PINTE5NS:
		MOV tablero5[4],011b
		
		JMP MOVEXITOSON
	PINTG5NS:
		MOV tablero5[6],011b
		
		JMP MOVEXITOSON
	PF6NNS:
		cmp columnaSig,1
		JE PINTB6NS
		cmp columnaSig,3
		JE PINTD6NS
		cmp columnaSig,5
		JE PINTF6NNS
		cmp columnaSig,7
		JE PINTH6NS
	PINTB6NS:
		mov tablero6[1],011b
		
		JMP MOVEXITOSON

	PINTD6NS:
		mov tablero6[3],011b
		
		JMP MOVEXITOSON
	PINTF6NNS:
		mov tablero6[5],011b
		
		JMP MOVEXITOSON
	PINTH6NS:
		mov tablero6[7],011b
		
		JMP MOVEXITOSON
		
	PF7NS:
		cmp columnaSig,0
		JE PINTA7NS
		cmp columnaSig,2
		JE PINTC7NS
		cmp columnaSig,4
		JE PINTE7NS
		cmp columnaSig,6
		JE PINTG7NS
		JMP ERRORN
	PINTA7NS:
		mov tablero7[0],011b
		
		JMP MOVEXITOSON
	PINTC7NS:
		mov tablero7[2],011b
		
		JMP MOVEXITOSON
	PINTE7NS:
		mov tablero7[4],011b
		
		JMP MOVEXITOSON
	PINTG7NS:
		mov tablero7[6],011b
		
		JMP MOVEXITOSON

	PF8NNS:
		cmp columnaSig,1
		JE PINTB8NS
		cmp columnaSig,3
		JE PINTD8NS
		cmp columnaSig,5
		JE PINTF8NNS
		cmp columnaSig,7
		JE PINTH8NS
		
	PINTB8NS:
		mov tablero8[1],011b
		
		JMP MOVEXITOSON

	PINTD8NS:
		mov tablero8[3],011b
		
		JMP MOVEXITOSON
	PINTF8NNS:
		mov tablero8[5],011b
		
		JMP MOVEXITOSON
	PINTH8NS:
		mov tablero8[7],011b
		
		JMP MOVEXITOSON

	;=================================================


	QUITARFICHATAUXN:
		mov indiceComer,1b
		mov indiceComer2,1b
		cmp auxFila,0
		je QF1AUXN
		cmp auxFila,1
		je QF2AUXN
		cmp auxFila,2
		je QF3AUXN
		cmp auxFila,3
		je QF4AUXN
		cmp auxFila,4
		je QF5AUXN
		cmp auxFila,5
		je QF6AUXN
		cmp auxFila,6
		je QF7AUXN
		cmp auxFila,7
		je QF8AUXN

	QF1AUXN:
		cmp auxCol,0
		JE QUIA1AUXN
		cmp auxCol,2
		JE QUIC1AUXN
		cmp auxCol,4
		JE QUIE1AUXN
		cmp auxCol,6
		JE QUIG1AUXN

	QUIA1AUXN:
		mov tablero1[0],000b
		;cmp tablero1[0],001b
		jmp FINALN
		

	QUIC1AUXN:
		mov tablero1[2],000b
		;cmp tablero1[2],001b
		je FINALN
		
	QUIE1AUXN:
		mov tablero1[4],000b
		;cmp tablero1[4],001b
		je FINALN
		
	QUIG1AUXN:
		mov tablero1[6],000b
		;cmp tablero1[6],001b
		je FINALN
	QF2AUXN:	
        cmp auxCol,1
		JE QUIB2AUXN
		cmp auxCol,3
		JE QUID2AUXN
		cmp auxCol,5
		JE QUIF2AUXN
		cmp auxCol,7
		JE QUIH2AUXN
	QUIB2AUXN:
		MOV tablero2[1],000b
		JMP FINALN
		

	QUID2AUXN:
		MOV tablero2[3],000b
		JMP FINALN
	QUIF2AUXN:
		MOV tablero2[5],000b
		JMP FINALN
		
	QUIH2AUXN:
		MOV tablero2[7],000b
		JMP FINALN
		
		
	QF3AUXN:
		cmp auxCol,0
		JE QUIA3AUXN
		cmp auxCol,2
		JE QUIC3AUXN
		cmp auxCol,4
		JE QUIE3AUXN
		cmp auxCol,6
		JE QUIG3AUXN

	QUIA3AUXN:
		mov tablero3[0],000b
		jmp FINALN
		

	QUIC3AUXN:
		mov tablero3[2],000b
		jmp FINALN
		
	QUIE3AUXN:
		mov tablero3[4],000b
		jmp FINALN
		
	QUIG3AUXN:
		mov tablero3[6],000b
		jmp FINALN
		

	QF4AUXN:
		cmp auxCol,1
		JE QUIB4AUXN
		cmp auxCol,3
		JE QUID4AUXN
		cmp auxCol,5
		JE QUIF4AUXN
		cmp auxCol,7
		JE QUIH4AUXN
	QUIB4AUXN:
		MOV tablero4[1],000b
		jMP FINALN
		

	QUID4AUXN:
		MOV tablero4[3],000b
		jMP FINALN
		
	QUIF4AUXN:
		MOV tablero4[5],000b
		JMP FINALN
		
	QUIH4AUXN:
		MOV tablero4[7],000b
		JMP FINALN
		

	QF5AUXN:
		cmp auxCol,0
		JE QUIA5AUXN
		cmp auxCol,2
		JE QUIC5AUXN
		cmp auxCol,4
		JE QUIE5AUXN
		cmp auxCol,6
		JE QUIG5AUXN

	QUIA5AUXN:
		mov tablero5[0],000b
		jmp FINALN
		

	QUIC5AUXN:
		mov tablero5[2],000b
		jmp FINALN
		
	QUIE5AUXN:
		mov tablero5[4],000b
		jmp FINALN
		
	QUIG5AUXN:
		mov tablero5[6],000b
		jmp FINALN
		
		
	QF6AUXN:
		cmp auxCol,1
		JE QUIB6AUXN
		cmp auxCol,3
		JE QUID6AUXN
		cmp auxCol,5
		JE QUIF6AUXN
		cmp auxCol,7
		JE QUIH6AUXN

	QUIB6AUXN:
		mov tablero6[1],000b
		jmp FINALN
		

	QUID6AUXN:
		mov tablero6[3],000b
		jmp FINALN
		
	QUIF6AUXN:
		mov tablero6[5],000b
		jmp FINALN
		
	QUIH6AUXN:
		mov tablero6[7],000b
		jmp FINALN
		
		
	QF7AUXN:
		cmp auxCol,0
		JE QUIA7AUXN
		cmp auxCol,2
		JE QUIC7AUXN
		cmp auxCol,4
		JE QUIE7AUXN
		cmp auxCol,6
		JE QUIG7AUXN

	QUIA7AUXN:
		MOV tablero7[0],000b
		jmp FINALN
		

	QUIC7AUXN:
		MOV tablero7[2],000b
		jmp FINALN
		
	QUIE7AUXN:
		MOV tablero7[4],000b
		jmp FINALN
		
	QUIG7AUXN:
		MOV tablero7[6],000b
		jmp FINALN
		
	QF8AUXN:
		cmp auxCol,1
		JE QUIB8AUXN
		cmp auxCol,3
		JE QUID8AUXN
		cmp auxCol,5
		JE QUIF8AUXN
		cmp auxCol,7
		JE QUIH8AUXN
		
	QUIB8AUXN:
		mov tablero8[1],000b
		jmp FINALN

	QUID8AUXN:
		mov tablero8[3],000b
		jmp FINALN
		
	QUIF8AUXN:
		mov tablero8[5],000b
		jmp FINALN
		
	QUIH8AUXN:
		mov tablero8[7],000b
		jmp FINALN

	;=======================================
		VERIFICAREXFB:

	;	inc filaMTN
	;	inc filaMTN
		imprimir uno
		comment #
		xor al,al
		xor ax,ax
		MOV al,filaSAux
		mov filaSig, al

		xor al,al
		xor ax,ax
		MOV al,colSAux
		mov columnaSig,al#


		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer,0b
		jmp verColumnaN
		

	verColumnaN:
	imprimir dos
		dec filaSig
		dec filaSig

		inc columnaSig
		inc columnaSig

		cmp indiceComer, 0b
		je VALIDARMOVN2
		jmp FINALN
		;xor al,al
		;xor ax,ax
		;MOV al,filaSAux
		;mov filaSig, al

		;xor al,al
		;;xor ax,ax
		;MOV al,colSAux
		;mov columnaSig, al

	;	je verColumna2
	;	cmp indiceComer, 1b
	;	je MOVEXITOSO

	VERIFICAREXFB2:
	imprimir tres
	;	inc filaMTN
	;	inc filaMTN
		
		xor al,al
		xor ax,ax
		MOV al,filaSAux
		mov filaSig, al

		xor al,al
		xor ax,ax
		MOV al,colSAux
		mov columnaSig, al


		mov indiceSEVUELTA,1b

		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer2,0b
		jmp verColumna2N
		


	verColumna2N:
		imprimir cuatro

		dec filaSig
		dec filaSig

		dec columnaSig
		dec columnaSig

		cmp indiceComer2, 0b
		je VALIDARMOVN2
		jmp FINALN

		VERIFICAREXFB3:
		xor al,al
		xor ax,ax
		MOV al,filaSig
		mov filaActual, al

		xor al,al
		xor ax,ax
		MOV al,columnaSig
		mov columnaActual, al
		mov indiceComer2,0b
		jmp verColumna23N

		verColumna23N:
		imprimir ocho

		dec filaSig
		dec filaSig

		dec columnaSig
		dec columnaSig

		;cmp indiceSEVUELTA, 1b
		mov indiceSEVUELTA, 0b
		jmp VALIDARMOVN2
		jmp FINALN

	;========================================

	MOVEXITOSON:
		cmp indiceQuitar,1b
		je QUITARFICHATAUXN
		imprimir movBien
		JMP FINALN

	EXISTEFICHASN:
		imprimir bExiste2



		JMP FINALNERRORN
	MOVERFICHABN:
		imprimir bMov
		JMP FINALN
	ERRORN:
		imprimir errorV
		JMP FINALNERRORN
	FINALN:

		cmp indiceComer,1b
		je VERIFICAREXFB
		cmp indiceComer2,1b
		je VERIFICAREXFB2
		;cmp indiceTurno2,0b
		;mov indiceTurno2,1b

		;cmp indiceTurno2,1b
		;mov indiceTurno2,0b

	FINALNERRORN:
		cmp indiceComer,1b
		je VERIFICAREXFB
		cmp indiceComer2,1b
		je VERIFICAREXFB2
		cmp indiceSEVUELTA,1b
		je VERIFICAREXFB3

endm



validarExistencia macro 
	local INICIO, VERIFICARCOL, VERIFICARFIL,OPCION,VERIFICARCOLSIG,VERIFICARFILSIG,FINAL,ERROR,FINAL2
	mov row,0
	mov col,0
	xor si,si

	INICIO:

	VERIFICARCOL:
		cmp arreglo[0],'A'
		mov columnaActual,0 
		je VERIFICARFIL
		cmp arreglo[0],'B'
		mov columnaActual,1 
		je VERIFICARFIL
		cmp arreglo[0],'C'
		mov columnaActual,2 
		je VERIFICARFIL
		cmp arreglo[0],'D'
		mov columnaActual,3 
		je VERIFICARFIL
		cmp arreglo[0],'E'
		mov columnaActual,4 
		je VERIFICARFIL
		cmp arreglo[0],'F'
		mov columnaActual,5 
		je VERIFICARFIL
		cmp arreglo[0],'G'
		mov columnaActual,6
		je VERIFICARFIL
		cmp arreglo[0],'H'
		mov columnaActual,7
		je VERIFICARFIL
		
		jmp ERROR
	VERIFICARFIL:
		cmp arreglo[1],'1'
		mov filaActual,0
		je OPCION
		cmp arreglo[1],'2'
		mov filaActual,1
		je OPCION
		cmp arreglo[1],'3'
		mov filaActual,2
		je OPCION
		cmp arreglo[1],'4'
		mov filaActual,3
		je OPCION
		cmp arreglo[1],'5'
		mov filaActual,4
		je OPCION
		cmp arreglo[1],'6'
		mov filaActual,5
		je OPCION
		cmp arreglo[1],'7'
		mov filaActual,6
		je OPCION
		cmp arreglo[1],'8'
		mov filaActual,7
		je OPCION
		
		JMP ERROR
	OPCION:
		cmp arreglo[2],','
		je VERIFICARCOLSIG
		
		jmp FINAL

	VERIFICARCOLSIG:
		cmp arreglo[3],'A'
		mov columnaSig,0
		je VERIFICARFILSIG
		cmp arreglo[3],'B'
		mov columnaSig,1
		je VERIFICARFILSIG
		cmp arreglo[3],'C'
		mov columnaSig,2
		je VERIFICARFILSIG
		cmp arreglo[3],'D'
		mov columnaSig,3
		je VERIFICARFILSIG
		cmp arreglo[3],'E'
		mov columnaSig,4
		je VERIFICARFILSIG
		cmp arreglo[3],'F'
		mov columnaSig,5
		je VERIFICARFILSIG
		cmp arreglo[3],'G'
		mov columnaSig,6
		je VERIFICARFILSIG
		cmp arreglo[3],'H'
		mov columnaSig,7
		je VERIFICARFILSIG
		
		JMP ERROR 
	VERIFICARFILSIG:
		cmp arreglo[4],'1'
		mov filaSig,0
		je FINAL	
		cmp arreglo[4],'2'
		mov filaSig,1
		je FINAL
		cmp arreglo[4],'3'
		mov filaSig,2
		je FINAL
		cmp arreglo[4],'4'
		mov filaSig,3
		je FINAL
		cmp arreglo[4],'5'
		mov filaSig,4
		je FINAL
		cmp arreglo[4],'6'
		mov filaSig,5
		je FINAL
		cmp arreglo[4],'7'
		mov filaSig,6
		je FINAL
		cmp arreglo[4],'8'
		mov filaSig,7
		je FINAL
		
		JMP ERROR

		ERROR:
		imprimir mensajeError
		limpiarArreglo
		;mov fila,0
		;mov columna,0
		;mov filaSig,0
		;mov columnaActual,0
		jmp FINAL2

		FINAL:
		imprimir cambioTurno
		cmp indiceTurno,0b
		
		mov indiceTurno,1b
		JE FINAL2
		cmp indiceTurno,1b
		
		mov indiceTurno,0b
		je FINAL2
		FINAL2: 
endm



obtenerTexto macro buffer
	local CONTINUE, FIN 
	PUSH SI
	PUSH AX
	xor si,si
	CONTINUE:
	obtenerDato
	cmp al,0dh
	je FIN
	mov buffer[si],al
	inc si 
	jmp CONTINUE

	FIN:
	mov al,'$'
	mov buffer[si],al

	POP AX
	POP SI

endm


compararArreglo macro
	local INICIO,DIFERENTE,IGUAL,TERMINAR,ULTIMO
	mov x,0
	xor si,si
	cmp arreglo[0],'$'
	je TERMINAR
	INICIO:
	cmp exit[si],'$'
	je ULTIMO

	MOV si, x
	MOV al, arreglo[si]
	cmp exit[si],al
	jne DIFERENTE
	
	inc x
	jmp INICIO

	ULTIMO:
	cmp arreglo[si],'$'
	je IGUAL
	JMP TERMINAR

	DIFERENTE:
	mov indiceIgual,0b
	jmp TERMINAR

	IGUAL:
	mov indiceIgual,1b
	jmp TERMINAR

	TERMINAR:

endm 

limpiarArreglo macro
	mov arreglo[0],'$' 
	mov arreglo[1],'$' 
	mov arreglo[2],'$' 
	mov arreglo[3],'$' 
	mov arreglo[4],'$' 
	mov arreglo[5],'$' 
	mov arreglo[6],'$' 
	mov arreglo[7],'$' 
	mov arreglo[8],'$' 
	mov arreglo[9],'$' 
	mov arreglo[10],'$' 
	mov arreglo[11],'$' 
	mov arreglo[12],'$' 
	mov arreglo[13],'$' 
	mov arreglo[14],'$' 
	mov arreglo[15],'$' 
	mov arreglo[16],'$' 
	mov arreglo[17],'$' 
	mov arreglo[18],'$' 
	mov arreglo[19],'$' 
endm

tableroInicial macro
	 imprimir saltoDeLinea
	 imprimir dobleEspacio     
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir ocho
	 imprimirF1
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir siete
	 imprimirF2 
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir seis
	 imprimirF3
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir cinco
	 imprimirF4
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir cuatro
	 imprimirF5
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir tres
	 imprimirF6
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir dos
	 imprimirF7
	 imprimir saltoDeLinea
	 imprimir dobleEspacio
	 imprimir lineaSeparacion
	 imprimir saltoDeLinea
	 imprimir uno
	 imprimirF8
	 imprimir saltoDeLinea
	 imprimir espacio
endm

;=====IMPRIMIR FILA 8
imprimirF1 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO,IMPRIMIRFRN,IMPRIMIRFRB

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero8[0],000b
	je IMPRIMIRVACIO
	cmp tablero8[0],001b
	je IMPRIMIRFB
	cmp tablero8[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero8[1],000b
	je IMPRIMIRVACIO
	cmp tablero8[1],001b
	je IMPRIMIRFB
	cmp tablero8[1],011b
	je IMPRIMIRFN
	cmp tablero8[1],111b
	je IMPRIMIRFRB

	CELDAC8:
	cmp tablero8[2],000b
	je IMPRIMIRVACIO
	cmp tablero8[2],001b
	je IMPRIMIRFB
	cmp tablero8[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero8[3],000b
	je IMPRIMIRVACIO
	cmp tablero8[3],001b
	je IMPRIMIRFB
	cmp tablero8[3],011b
	je IMPRIMIRFN
	cmp tablero8[3],111b
	je IMPRIMIRFRB

	CELDAE8:
	cmp tablero8[4],000b
	je IMPRIMIRVACIO
	cmp tablero8[4],001b
	je IMPRIMIRFB
	cmp tablero8[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero8[5],000b
	je IMPRIMIRVACIO
	cmp tablero8[5],001b
	je IMPRIMIRFB
	cmp tablero8[5],011b
	je IMPRIMIRFN
	cmp tablero8[5],111b
	je IMPRIMIRFRB

	CELDAG8:
	cmp tablero8[6],000b
	je IMPRIMIRVACIO
	cmp tablero8[6],001b
	je IMPRIMIRFB
	cmp tablero8[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero8[7],000b
	je IMPRIMIRVACIO
	cmp tablero8[7],001b
	je IMPRIMIRFB
	cmp tablero8[7],011b
	je IMPRIMIRFN
	cmp tablero8[7],111b
	je IMPRIMIRFRB

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	IMPRIMIRFRB:
	inc columna
	imprimir rb
	JMP INICIO

	IMPRIMIRFRN:
	inc columna
	imprimir rn
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm


;===========================================
imprimirF2 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero7[0],000b
	je IMPRIMIRVACIO
	cmp tablero7[0],001b
	je IMPRIMIRFB
	cmp tablero7[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero7[1],000b
	je IMPRIMIRVACIO
	cmp tablero7[1],001b
	je IMPRIMIRFB
	cmp tablero7[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero7[2],000b
	je IMPRIMIRVACIO
	cmp tablero7[2],001b
	je IMPRIMIRFB
	cmp tablero7[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero7[3],000b
	je IMPRIMIRVACIO
	cmp tablero7[3],001b
	je IMPRIMIRFB
	cmp tablero7[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero7[4],000b
	je IMPRIMIRVACIO
	cmp tablero7[4],001b
	je IMPRIMIRFB
	cmp tablero7[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero7[5],000b
	je IMPRIMIRVACIO
	cmp tablero7[5],001b
	je IMPRIMIRFB
	cmp tablero7[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero7[6],000b
	je IMPRIMIRVACIO
	cmp tablero7[6],001b
	je IMPRIMIRFB
	cmp tablero7[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero7[7],000b
	je IMPRIMIRVACIO
	cmp tablero7[7],001b
	je IMPRIMIRFB
	cmp tablero7[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm

;====================================================
imprimirF3 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero6[0],000b
	je IMPRIMIRVACIO
	cmp tablero6[0],001b
	je IMPRIMIRFB
	cmp tablero6[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero6[1],000b
	je IMPRIMIRVACIO
	cmp tablero6[1],001b
	je IMPRIMIRFB
	cmp tablero6[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero6[2],000b
	je IMPRIMIRVACIO
	cmp tablero6[2],001b
	je IMPRIMIRFB
	cmp tablero6[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero6[3],000b
	je IMPRIMIRVACIO
	cmp tablero6[3],001b
	je IMPRIMIRFB
	cmp tablero6[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero6[4],000b
	je IMPRIMIRVACIO
	cmp tablero6[4],001b
	je IMPRIMIRFB
	cmp tablero6[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero6[5],000b
	je IMPRIMIRVACIO
	cmp tablero6[5],001b
	je IMPRIMIRFB
	cmp tablero6[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero6[6],000b
	je IMPRIMIRVACIO
	cmp tablero6[6],001b
	je IMPRIMIRFB
	cmp tablero6[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero6[7],000b
	je IMPRIMIRVACIO
	cmp tablero6[7],001b
	je IMPRIMIRFB
	cmp tablero6[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm

;=======================================================================
imprimirF4 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero5[0],000b
	je IMPRIMIRVACIO
	cmp tablero5[0],001b
	je IMPRIMIRFB
	cmp tablero5[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero5[1],000b
	je IMPRIMIRVACIO
	cmp tablero5[1],001b
	je IMPRIMIRFB
	cmp tablero5[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero5[2],000b
	je IMPRIMIRVACIO
	cmp tablero5[2],001b
	je IMPRIMIRFB
	cmp tablero5[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero5[3],000b
	je IMPRIMIRVACIO
	cmp tablero5[3],001b
	je IMPRIMIRFB
	cmp tablero5[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero5[4],000b
	je IMPRIMIRVACIO
	cmp tablero5[4],001b
	je IMPRIMIRFB
	cmp tablero5[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero5[5],000b
	je IMPRIMIRVACIO
	cmp tablero5[5],001b
	je IMPRIMIRFB
	cmp tablero5[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero5[6],000b
	je IMPRIMIRVACIO
	cmp tablero5[6],001b
	je IMPRIMIRFB
	cmp tablero5[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero5[7],000b
	je IMPRIMIRVACIO
	cmp tablero5[7],001b
	je IMPRIMIRFB
	cmp tablero5[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm
;==========================================================
imprimirF5 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero4[0],000b
	je IMPRIMIRVACIO
	cmp tablero4[0],001b
	je IMPRIMIRFB
	cmp tablero4[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero4[1],000b
	je IMPRIMIRVACIO
	cmp tablero4[1],001b
	je IMPRIMIRFB
	cmp tablero4[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero4[2],000b
	je IMPRIMIRVACIO
	cmp tablero4[2],001b
	je IMPRIMIRFB
	cmp tablero4[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero4[3],000b
	je IMPRIMIRVACIO
	cmp tablero4[3],001b
	je IMPRIMIRFB
	cmp tablero4[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero4[4],000b
	je IMPRIMIRVACIO
	cmp tablero4[4],001b
	je IMPRIMIRFB
	cmp tablero4[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero4[5],000b
	je IMPRIMIRVACIO
	cmp tablero4[5],001b
	je IMPRIMIRFB
	cmp tablero4[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero4[6],000b
	je IMPRIMIRVACIO
	cmp tablero4[6],001b
	je IMPRIMIRFB
	cmp tablero4[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero4[7],000b
	je IMPRIMIRVACIO
	cmp tablero4[7],001b
	je IMPRIMIRFB
	cmp tablero4[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm
;===================================================
imprimirF6 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero3[0],000b
	je IMPRIMIRVACIO
	cmp tablero3[0],001b
	je IMPRIMIRFB
	cmp tablero3[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero3[1],000b
	je IMPRIMIRVACIO
	cmp tablero3[1],001b
	je IMPRIMIRFB
	cmp tablero3[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero3[2],000b
	je IMPRIMIRVACIO
	cmp tablero3[2],001b
	je IMPRIMIRFB
	cmp tablero3[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero3[3],000b
	je IMPRIMIRVACIO
	cmp tablero3[3],001b
	je IMPRIMIRFB
	cmp tablero3[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero3[4],000b
	je IMPRIMIRVACIO
	cmp tablero3[4],001b
	je IMPRIMIRFB
	cmp tablero3[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero3[5],000b
	je IMPRIMIRVACIO
	cmp tablero3[5],001b
	je IMPRIMIRFB
	cmp tablero3[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero3[6],000b
	je IMPRIMIRVACIO
	cmp tablero3[6],001b
	je IMPRIMIRFB
	cmp tablero3[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero3[7],000b
	je IMPRIMIRVACIO
	cmp tablero3[7],001b
	je IMPRIMIRFB
	cmp tablero3[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm
;===========================================
imprimirF7 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero2[0],000b
	je IMPRIMIRVACIO
	cmp tablero2[0],001b
	je IMPRIMIRFB
	cmp tablero2[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero2[1],000b
	je IMPRIMIRVACIO
	cmp tablero2[1],001b
	je IMPRIMIRFB
	cmp tablero2[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero2[2],000b
	je IMPRIMIRVACIO
	cmp tablero2[2],001b
	je IMPRIMIRFB
	cmp tablero2[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero2[3],000b
	je IMPRIMIRVACIO
	cmp tablero2[3],001b
	je IMPRIMIRFB
	cmp tablero2[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero2[4],000b
	je IMPRIMIRVACIO
	cmp tablero2[4],001b
	je IMPRIMIRFB
	cmp tablero2[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero2[5],000b
	je IMPRIMIRVACIO
	cmp tablero2[5],001b
	je IMPRIMIRFB
	cmp tablero2[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero2[6],000b
	je IMPRIMIRVACIO
	cmp tablero2[6],001b
	je IMPRIMIRFB
	cmp tablero2[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero2[7],000b
	je IMPRIMIRVACIO
	cmp tablero2[7],001b
	je IMPRIMIRFB
	cmp tablero2[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm
;===================================
imprimirF8 macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO,IMPRIMIRFRN

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero1[0],000b
	je IMPRIMIRVACIO
	cmp tablero1[0],001b
	je IMPRIMIRFB
	cmp tablero1[0],011b
	je IMPRIMIRFN
	cmp tablero1[0],110b
	je IMPRIMIRFRN


	CELDAB8:
	cmp tablero1[1],000b
	je IMPRIMIRVACIO
	cmp tablero1[1],001b
	je IMPRIMIRFB
	cmp tablero1[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero1[2],000b
	je IMPRIMIRVACIO
	cmp tablero1[2],001b
	je IMPRIMIRFB
	cmp tablero1[2],011b
	je IMPRIMIRFN
	cmp tablero1[2],110b
	je IMPRIMIRFRN

	CELDAD8:
	cmp tablero1[3],000b
	je IMPRIMIRVACIO
	cmp tablero1[3],001b
	je IMPRIMIRFB
	cmp tablero1[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero1[4],000b
	je IMPRIMIRVACIO
	cmp tablero1[4],001b
	je IMPRIMIRFB
	cmp tablero1[4],011b
	je IMPRIMIRFN
	cmp tablero1[4],110b
	je IMPRIMIRFRN

	CELDAF8:
	cmp tablero1[5],000b
	je IMPRIMIRVACIO
	cmp tablero1[5],001b
	je IMPRIMIRFB
	cmp tablero1[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero1[6],000b
	je IMPRIMIRVACIO
	cmp tablero1[6],001b
	je IMPRIMIRFB
	cmp tablero1[6],011b
	je IMPRIMIRFN
	cmp tablero1[6],110b
	je IMPRIMIRFRN
	CELDAH8:
	cmp tablero1[7],000b
	je IMPRIMIRVACIO
	cmp tablero1[7],001b
	je IMPRIMIRFB
	cmp tablero1[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	imprimir blanco
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	imprimir fn
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	imprimir fb
	JMP INICIO

	IMPRIMIRFRN:
	inc columna
	imprimir rn
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm

comandoSHOW macro
	local INICIO,DIFERENTE,IGUAL,TERMINAR,ULTIMO
	mov x,0
	xor si,si
	cmp arreglo[0],'$'
	je TERMINAR
	INICIO:
	cmp show[si],'$'
	je ULTIMO

	MOV si, x
	MOV al, arreglo[si]
	cmp show[si],al
	jne DIFERENTE
	
	inc x
	jmp INICIO

	ULTIMO:
	cmp arreglo[si],'$'
	je IGUAL
	JMP TERMINAR

	DIFERENTE:
	mov indiceShow,0b
	jmp TERMINAR

	IGUAL:
	mov indiceShow,1b
	jmp TERMINAR

	TERMINAR:

endm 


comandoSAVE macro
	local INICIO,DIFERENTE,IGUAL,TERMINAR,ULTIMO
	mov x,0
	xor si,si
	cmp arreglo[0],'$'
	je TERMINAR
	INICIO:
	cmp save[si],'$'
	je ULTIMO

	MOV si, x
	MOV al, arreglo[si]
	cmp save[si],al
	jne DIFERENTE
	
	inc x
	jmp INICIO

	ULTIMO:
	cmp arreglo[si],'$'
	je IGUAL
	JMP TERMINAR

	DIFERENTE:
	mov indiceSave,0b
	jmp TERMINAR

	IGUAL:
	mov indiceSave,1b
	jmp TERMINAR

	TERMINAR:

endm 


;============================FECHAYHORA
getHora2 macro hora,min,sec,dia,mes,ano
	getHoraa hora,min,sec
	xor cx,cx
	xor ax,ax
	xor dx,dx
	Mov ah,2Ah
	int 21h
	push ax
	push dx
	push dx
	mov ax,cx
	printHexh ano
	mov ah,00h
	pop dx
	mov al,dl
	
	printHex dia
	pop dx
	mov ah, 00h
	mov al,dh
	printHex mes
	pop ax
	mov ax,ax
	mov ah,00h
	;printHex
endm

getHoraa macro hora,min,sec
	mov ah,02ch
	int 21h
	xor ax,ax
	xor bx,bx
	mov al,ch
	xor si,si
	push cx
	push ax
	printHex hora
	pop ax
	pop cx
	xor ax,ax
	mov al,cl
	push cx
	printHex min
	pop cx
endm

printHex macro param
	Local L1,L2
		push dx
		xor dx,dx
		mov di,00h
		mov si,1
	L1:
		mov bl,0ah
		div bl
		mov dh,ah
		add dh,30h
		add ah,30h
		mov param[si],ah
		mov ah,00h
		cmp al,00h
		je L2
		dec si 
		jmp L1
	L2:
		pop dx
endm

printHexH macro param
	Local L1,L2
		push dx
		xor dx,dx
		mov di,00h
		mov si,3
	L1:
		mov bl,0ah
		div bl 
		mov dh,ah
		add dh,30h
		add ah,30h
		mov param[si],ah
		mov ah,00h
		cmp al,00h
		je L2
		dec si 
		jmp L1
	L2:
		pop dx
endm

getFecha macro 
	MOV AH,2AH
	INT 21H
	mov dia,DL
	mov mes,DH
	;mov ano,CX
endm

getHora macro
	MOV AH,2CH
	INT 21H
	mov hora,CH
	mov min,CL
	mov sec,DH
endm
convertirsec macro
    MOV AL,[sec]
    MOV CL,10
    MOV AH,0
    DIV CL
    OR AX,3030H
    MOV BX,offset AUXsec
    MOV [BX],AL
    INC BX
    MOV [BX],AH
    
endm

convertirmes macro
    MOV AL,[mes]
    MOV CL,10
    MOV AH,0
    DIV CL
    OR AX,3030H
    MOV BX,offset AUXmes
    MOV [BX],AL
    INC BX
    MOV [BX],AH
    
endm

convertirmin macro
    MOV AL,[min]
    MOV CL,10
    MOV AH,0
    DIV CL
    OR AX,3030H
    MOV BX,offset AUXmin
    MOV [BX],AL
    INC BX
    MOV [BX],AH
    
endm


convertirhora macro
    MOV AL,[hora]
    MOV CL,10
    MOV AH,0
    DIV CL
    OR AX,3030H
    MOV BX,offset AUXhora
    MOV [BX],AL
    INC BX
    MOV [BX],AH
    
endm
convertirDia macro
    MOV AL,[dia]
    MOV CL,10
    MOV AH,0
    DIV CL
    OR AX,3030H
    MOV BX,offset AUXdia
    MOV [BX],AL
    INC BX
    MOV [BX],AH
    
endm


;=======================================crear,abrir,cerrar,escribir,leer
crearArchivo macro buffer,handle
	;mov ah,3ch
	;mov cx,00h
	;lea dx,buffer
	;int 21h
	xor ax,ax
	mov ah,3ch
    mov cx,00000000b
    lea dx,buffer
    int 21h
    jc ErrorCrear ;error al crear archivo

    mov handle,ax

endm

abrirArchivo macro buffer, handler ;ABRE EL ARCHIVO
    mov ah,3dh
    mov al,02h
    lea dx,buffer
    int 21h

    jc ErrorAbrir
    mov indiceCarga,1
    mov handler,ax
endm

cerrarArchivo macro handler ;CIERRA EL ARCHIVO
    mov ah,3eh
    mov handler,bx
    int 21h
endm

escribirEnArchivo macro handle,buffer,numbytes ;macro para la creacion de archivo
	LOCAL ErrorEscribir,fin
    mov ah, 40h
    mov bx,handle
    mov cx,numbytes      ;------arreglo SIZE OFF del arreglo 
    lea dx,buffer		;-------arreglo que se manda a escribir
    int 21h
    jc ErrorEscribir
    JMP fin
    ErrorEscribir:
        imprimir dos
    fin:
endm

leerArchivo macro numbytes,buffer,handle
	mov ah,3fh
	mov bx,handle
	mov cx,numbytes
	lea dx,buffer
	int 21h
	jc otroError
endm

escribirTexto macro _handle,_buffer
    mov ah,40h
    mov bx,_handle
    mov cx, sizeof _buffer
    lea dx,_buffer
    int 21h
    jc otroError
endm
;===============================TABLEROHTML===================================


tableroInicialHTML macro
	 escribirEnArchivo handleFichero,_openHtml,sizeof _openHtml
	 escribirEnArchivo handleFichero,_tabla,sizeof _tabla
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 escribirEnArchivo handleFichero,_h1,sizeof _h1
	 escribirEnArchivo handleFichero,AUXdia,sizeof AUXdia
	 escribirEnArchivo handleFichero,AUXmes,sizeof AUXmes
	 escribirEnArchivo handleFichero,AUXano,sizeof AUXano
	 escribirEnArchivo handleFichero,AUXhora,sizeof AUXhora
	 escribirEnArchivo handleFichero,AUXmin,sizeof AUXmin
	 escribirEnArchivo handleFichero,AUXsec,sizeof AUXsec
	 escribirEnArchivo handleFichero,_h1fin,sizeof _h1fin
	 imprimirF1HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF2HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF3HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF4HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF5HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF6HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF7HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tr,sizeof _tr
	 imprimirF8HTML
	 escribirEnArchivo handleFichero,_trFin,sizeof _trFin
	 escribirEnArchivo handleFichero,_tablaFin,sizeof _tablaFin
	 escribirEnArchivo handleFichero,_finhtml,sizeof _finhtml
	 
endm

;=====IMPRIMIR FILA 8
imprimirF1HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO,IMPRIMIRFRN,IMPRIMIRFRB

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero8[0],000b
	je IMPRIMIRVACIO
	cmp tablero8[0],001b
	je IMPRIMIRFB
	cmp tablero8[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero8[1],000b
	je IMPRIMIRVACIO
	cmp tablero8[1],001b
	je IMPRIMIRFB
	cmp tablero8[1],011b
	je IMPRIMIRFN
	cmp tablero8[1],111b
	je IMPRIMIRFRB

	CELDAC8:
	cmp tablero8[2],000b
	je IMPRIMIRVACIO
	cmp tablero8[2],001b
	je IMPRIMIRFB
	cmp tablero8[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero8[3],000b
	je IMPRIMIRVACIO
	cmp tablero8[3],001b
	je IMPRIMIRFB
	cmp tablero8[3],011b
	je IMPRIMIRFN
	cmp tablero8[3],111b
	je IMPRIMIRFRB

	CELDAE8:
	cmp tablero8[4],000b
	je IMPRIMIRVACIO
	cmp tablero8[4],001b
	je IMPRIMIRFB
	cmp tablero8[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero8[5],000b
	je IMPRIMIRVACIO
	cmp tablero8[5],001b
	je IMPRIMIRFB
	cmp tablero8[5],011b
	je IMPRIMIRFN
	cmp tablero8[5],111b
	je IMPRIMIRFRB

	CELDAG8:
	cmp tablero8[6],000b
	je IMPRIMIRVACIO
	cmp tablero8[6],001b
	je IMPRIMIRFB
	cmp tablero8[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero8[7],000b
	je IMPRIMIRVACIO
	cmp tablero8[7],001b
	je IMPRIMIRFB
	cmp tablero8[7],011b
	je IMPRIMIRFN
	cmp tablero8[7],111b
	je IMPRIMIRFRB

	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFRB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_frb,sizeof _frb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFRN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_frn,sizeof _frn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm


;===========================================
imprimirF2HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero7[0],000b
	je IMPRIMIRVACIO
	cmp tablero7[0],001b
	je IMPRIMIRFB
	cmp tablero7[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero7[1],000b
	je IMPRIMIRVACIO
	cmp tablero7[1],001b
	je IMPRIMIRFB
	cmp tablero7[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero7[2],000b
	je IMPRIMIRVACIO
	cmp tablero7[2],001b
	je IMPRIMIRFB
	cmp tablero7[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero7[3],000b
	je IMPRIMIRVACIO
	cmp tablero7[3],001b
	je IMPRIMIRFB
	cmp tablero7[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero7[4],000b
	je IMPRIMIRVACIO
	cmp tablero7[4],001b
	je IMPRIMIRFB
	cmp tablero7[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero7[5],000b
	je IMPRIMIRVACIO
	cmp tablero7[5],001b
	je IMPRIMIRFB
	cmp tablero7[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero7[6],000b
	je IMPRIMIRVACIO
	cmp tablero7[6],001b
	je IMPRIMIRFB
	cmp tablero7[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero7[7],000b
	je IMPRIMIRVACIO
	cmp tablero7[7],001b
	je IMPRIMIRFB
	cmp tablero7[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	

	REINICIO:
	mov columna, 0b

endm

;====================================================
imprimirF3HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero6[0],000b
	je IMPRIMIRVACIO
	cmp tablero6[0],001b
	je IMPRIMIRFB
	cmp tablero6[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero6[1],000b
	je IMPRIMIRVACIO
	cmp tablero6[1],001b
	je IMPRIMIRFB
	cmp tablero6[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero6[2],000b
	je IMPRIMIRVACIO
	cmp tablero6[2],001b
	je IMPRIMIRFB
	cmp tablero6[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero6[3],000b
	je IMPRIMIRVACIO
	cmp tablero6[3],001b
	je IMPRIMIRFB
	cmp tablero6[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero6[4],000b
	je IMPRIMIRVACIO
	cmp tablero6[4],001b
	je IMPRIMIRFB
	cmp tablero6[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero6[5],000b
	je IMPRIMIRVACIO
	cmp tablero6[5],001b
	je IMPRIMIRFB
	cmp tablero6[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero6[6],000b
	je IMPRIMIRVACIO
	cmp tablero6[6],001b
	je IMPRIMIRFB
	cmp tablero6[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero6[7],000b
	je IMPRIMIRVACIO
	cmp tablero6[7],001b
	je IMPRIMIRFB
	cmp tablero6[7],011b
	je IMPRIMIRFN

	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO


	REINICIO:
	mov columna, 0b

endm

;=======================================================================
imprimirF4HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero5[0],000b
	je IMPRIMIRVACIO
	cmp tablero5[0],001b
	je IMPRIMIRFB
	cmp tablero5[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero5[1],000b
	je IMPRIMIRVACIO
	cmp tablero5[1],001b
	je IMPRIMIRFB
	cmp tablero5[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero5[2],000b
	je IMPRIMIRVACIO
	cmp tablero5[2],001b
	je IMPRIMIRFB
	cmp tablero5[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero5[3],000b
	je IMPRIMIRVACIO
	cmp tablero5[3],001b
	je IMPRIMIRFB
	cmp tablero5[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero5[4],000b
	je IMPRIMIRVACIO
	cmp tablero5[4],001b
	je IMPRIMIRFB
	cmp tablero5[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero5[5],000b
	je IMPRIMIRVACIO
	cmp tablero5[5],001b
	je IMPRIMIRFB
	cmp tablero5[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero5[6],000b
	je IMPRIMIRVACIO
	cmp tablero5[6],001b
	je IMPRIMIRFB
	cmp tablero5[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero5[7],000b
	je IMPRIMIRVACIO
	cmp tablero5[7],001b
	je IMPRIMIRFB
	cmp tablero5[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO


	REINICIO:
	mov columna, 0b

endm
;==========================================================
imprimirF5HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero4[0],000b
	je IMPRIMIRVACIO
	cmp tablero4[0],001b
	je IMPRIMIRFB
	cmp tablero4[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero4[1],000b
	je IMPRIMIRVACIO
	cmp tablero4[1],001b
	je IMPRIMIRFB
	cmp tablero4[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero4[2],000b
	je IMPRIMIRVACIO
	cmp tablero4[2],001b
	je IMPRIMIRFB
	cmp tablero4[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero4[3],000b
	je IMPRIMIRVACIO
	cmp tablero4[3],001b
	je IMPRIMIRFB
	cmp tablero4[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero4[4],000b
	je IMPRIMIRVACIO
	cmp tablero4[4],001b
	je IMPRIMIRFB
	cmp tablero4[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero4[5],000b
	je IMPRIMIRVACIO
	cmp tablero4[5],001b
	je IMPRIMIRFB
	cmp tablero4[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero4[6],000b
	je IMPRIMIRVACIO
	cmp tablero4[6],001b
	je IMPRIMIRFB
	cmp tablero4[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero4[7],000b
	je IMPRIMIRVACIO
	cmp tablero4[7],001b
	je IMPRIMIRFB
	cmp tablero4[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO


	REINICIO:
	mov columna, 0b

endm
;===================================================
imprimirF6HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero3[0],000b
	je IMPRIMIRVACIO
	cmp tablero3[0],001b
	je IMPRIMIRFB
	cmp tablero3[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero3[1],000b
	je IMPRIMIRVACIO
	cmp tablero3[1],001b
	je IMPRIMIRFB
	cmp tablero3[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero3[2],000b
	je IMPRIMIRVACIO
	cmp tablero3[2],001b
	je IMPRIMIRFB
	cmp tablero3[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero3[3],000b
	je IMPRIMIRVACIO
	cmp tablero3[3],001b
	je IMPRIMIRFB
	cmp tablero3[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero3[4],000b
	je IMPRIMIRVACIO
	cmp tablero3[4],001b
	je IMPRIMIRFB
	cmp tablero3[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero3[5],000b
	je IMPRIMIRVACIO
	cmp tablero3[5],001b
	je IMPRIMIRFB
	cmp tablero3[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero3[6],000b
	je IMPRIMIRVACIO
	cmp tablero3[6],001b
	je IMPRIMIRFB
	cmp tablero3[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero3[7],000b
	je IMPRIMIRVACIO
	cmp tablero3[7],001b
	je IMPRIMIRFB
	cmp tablero3[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	

	REINICIO:
	mov columna, 0b

endm
;===========================================
imprimirF7HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero2[0],000b
	je IMPRIMIRVACIO
	cmp tablero2[0],001b
	je IMPRIMIRFB
	cmp tablero2[0],011b
	je IMPRIMIRFN


	CELDAB8:
	cmp tablero2[1],000b
	je IMPRIMIRVACIO
	cmp tablero2[1],001b
	je IMPRIMIRFB
	cmp tablero2[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero2[2],000b
	je IMPRIMIRVACIO
	cmp tablero2[2],001b
	je IMPRIMIRFB
	cmp tablero2[2],011b
	je IMPRIMIRFN

	CELDAD8:
	cmp tablero2[3],000b
	je IMPRIMIRVACIO
	cmp tablero2[3],001b
	je IMPRIMIRFB
	cmp tablero2[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero2[4],000b
	je IMPRIMIRVACIO
	cmp tablero2[4],001b
	je IMPRIMIRFB
	cmp tablero2[4],011b
	je IMPRIMIRFN

	CELDAF8:
	cmp tablero2[5],000b
	je IMPRIMIRVACIO
	cmp tablero2[5],001b
	je IMPRIMIRFB
	cmp tablero2[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero2[6],000b
	je IMPRIMIRVACIO
	cmp tablero2[6],001b
	je IMPRIMIRFB
	cmp tablero2[6],011b
	je IMPRIMIRFN
	CELDAH8:
	cmp tablero2[7],000b
	je IMPRIMIRVACIO
	cmp tablero2[7],001b
	je IMPRIMIRFB
	cmp tablero2[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	
	REINICIO:
	mov columna, 0b

endm
;===================================
imprimirF8HTML macro
local CELDAA8,CELDAB8,CELDAC8,CELDAD8,CELDAE8,CELDAF8,CELDAG8,CELDAH8,IMPRIMIRVACIO,IMPRIMIRFN,IMPRIMIRFB,REINICIO,INICIO,IMPRIMIRFRN4

	INICIO:
		cmp columna,0b
		je CELDAA8
		cmp columna,1b
		je CELDAB8
		cmp columna,10b
		je CELDAC8
		cmp columna,11b
		je CELDAD8
		cmp columna,100b
		je CELDAE8
		cmp columna,101b
		je CELDAF8
		cmp columna,110b
		je CELDAG8
		cmp columna,111b
		je CELDAH8
		cmp columna,1000b
		je REINICIO
	


	CELDAA8:
	cmp tablero1[0],000b
	je IMPRIMIRVACIO
	cmp tablero1[0],001b
	je IMPRIMIRFB
	cmp tablero1[0],011b
	je IMPRIMIRFN
	cmp tablero1[0],110b
	je IMPRIMIRFRN4


	CELDAB8:
	cmp tablero1[1],000b
	je IMPRIMIRVACIO
	cmp tablero1[1],001b
	je IMPRIMIRFB
	cmp tablero1[1],011b
	je IMPRIMIRFN

	CELDAC8:
	cmp tablero1[2],000b
	je IMPRIMIRVACIO
	cmp tablero1[2],001b
	je IMPRIMIRFB
	cmp tablero1[2],011b
	je IMPRIMIRFN
	cmp tablero1[2],110b
	je IMPRIMIRFRN4

	CELDAD8:
	cmp tablero1[3],000b
	je IMPRIMIRVACIO
	cmp tablero1[3],001b
	je IMPRIMIRFB
	cmp tablero1[3],011b
	je IMPRIMIRFN

	CELDAE8:
	cmp tablero1[4],000b
	je IMPRIMIRVACIO
	cmp tablero1[4],001b
	je IMPRIMIRFB
	cmp tablero1[4],011b
	je IMPRIMIRFN
	cmp tablero1[4],110b
	je IMPRIMIRFRN4

	CELDAF8:
	cmp tablero1[5],000b
	je IMPRIMIRVACIO
	cmp tablero1[5],001b
	je IMPRIMIRFB
	cmp tablero1[5],011b
	je IMPRIMIRFN
	CELDAG8:
	cmp tablero1[6],000b
	je IMPRIMIRVACIO
	cmp tablero1[6],001b
	je IMPRIMIRFB
	cmp tablero1[6],011b
	je IMPRIMIRFN
	cmp tablero1[6],110b
	je IMPRIMIRFRN4
	CELDAH8:
	cmp tablero1[7],000b
	je IMPRIMIRVACIO
	cmp tablero1[7],001b
	je IMPRIMIRFB
	cmp tablero1[7],011b
	je IMPRIMIRFN

	
	IMPRIMIRVACIO:
	inc columna
	escribirEnArchivo handleFichero,_tdI2,sizeof _tdI2
	JMP INICIO

	IMPRIMIRFN:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fn,sizeof _fn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	IMPRIMIRFB:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_fb,sizeof _fb
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO


	IMPRIMIRFRN4:
	inc columna
	escribirEnArchivo handleFichero,_tdI,sizeof _tdI
	escribirEnArchivo handleFichero,_frn,sizeof _frn
	escribirEnArchivo handleFichero,_tdFin,sizeof _tdFin
	JMP INICIO

	REINICIO:
	mov columna, 0b

endm

;====================================CONVERTIR_TABLA=====================

convertir_tabla macro tabla
	local inicio,final,vacio,blanco,negro,reinaN,reinaB
	push si
	push ax
	xor si, si
	inicio:
		cmp tabla[si],000b
			je vacio
		cmp tabla[si],011b
			je negro
		cmp tabla[si],001b
			je blanco
		cmp tabla[si],110b
			je reinaN
		cmp tabla[si],111b
			je reinaB
		jmp final
	vacio:
		inc si
			escribirEnArchivo handleFichero,VACIOL,sizeof VACIOL ;'v'
		jmp inicio
	blanco:
		inc si
			escribirEnArchivo handleFichero,BLANCOL,sizeof BLANCOL ;'b'
		jmp inicio
	negro:
		inc si
			escribirEnArchivo handleFichero,NEGROL,sizeof NEGROL ;'b'
		jmp inicio
	reinaN:
		inc si
			escribirEnArchivo handleFichero,REINANL,sizeof REINANL ;'x'
		jmp inicio
	reinaB:
		inc si
			escribirEnArchivo handleFichero,REINABL,sizeof REINABL ;'O'
		jmp inicio
	final:


endm

pasar_Datos macro tablero
	local inicio,final,vacio,blanco,negro,reinaN,reinaB,inicio2;,tablero8L,tablero7L,tablero6L,tablero5L,tablero4L,tablero3L,tablero2L,tablero1L
	;local tablero8L1,tablero8L2,tablero8L3,tablero8L4,tablero8L5,tablero8L6,tablero8L7,tablero8L8
	;local T8vacio0,T8blanco0,T8negro0,T8rn0,T8rb0
	;local T8vacio1,T8blanco1,T8negro2,T8rn1,T8rb1
	;local T8vacio2,T8blanco2,T8negro2,T8rn2,T8rb2
	;local T8vacio3,T8blanco3,T8negro3,T8rn3,T8rb3
	;local T8vacio4,T8blanco4,T8negro4,T8rn4,T8rb4
	;local T8vacio5,T8blanco5,T8negro5,T8rn5,T8rb5
	;local T8vacio6,T8blanco6,T8negro6,T8rn6,T8rb6
	;local T8vacio7,T8blanco7,T8negro7,T8rn7,T8rb7
	;local 
	push si
	push ax
	xor si, si
	mov si,0
	inicio2:
		cmp si,0
		 je tablero8L1
		cmp si,1
		je tablero8L2
		cmp si,2
		je tablero8L3
		cmp si,3
		je tablero8L4
		cmp si,4
		je tablero8L5
		cmp si,5
		je tablero8L6
		cmp si,6
		je tablero8L7
		cmp si,7
		je tablero8L8
		;===================7
		cmp si,8
		je tablero7L1
		cmp si,9
		je tablero7L2
		cmp si,10
		je tablero7L3
		cmp si,11
		je tablero7L4
		cmp si,12
		je tablero7L5
		cmp si,13
		je tablero7L6
		cmp si,14
		je tablero7L7
		cmp si,15
		je tablero7L8
		;==================6
		cmp si,16
		je tablero6L1
		cmp si,17
		je tablero6L2
		cmp si,18
		je tablero6L3
		cmp si,19
		je tablero6L4
		cmp si,20
		je tablero6L5
		cmp si,21
		je tablero6L6
		cmp si,22
		je tablero6L7
		cmp si,23
		je tablero6L8
		;==================5
		cmp si,24
		je tablero5L1
		cmp si,25
		je tablero5L2
		cmp si,26
		je tablero5L3
		cmp si,27
		je tablero5L4
		cmp si,28
		je tablero5L5
		cmp si,29
		je tablero5L6
		cmp si,30
		je tablero5L7
		cmp si,31
		je tablero5L8
		;==================4
		cmp si,32
		je tablero4L1
		cmp si,33
		je tablero4L2
		cmp si,34
		je tablero4L3
		cmp si,35
		je tablero4L4
		cmp si,36
		je tablero4L5
		cmp si,37
		je tablero4L6
		cmp si,38
		je tablero4L7
		cmp si,39
		je tablero4L8
		;==================3
		cmp si,40
		je tablero3L1
		cmp si,41
		je tablero3L2
		cmp si,42
		je tablero3L3
		cmp si,43
		je tablero3L4
		cmp si,44
		je tablero3L5
		cmp si,45
		je tablero3L6
		cmp si,46
		je tablero3L7
		cmp si,47
		je tablero3L8
		;==================2
		cmp si,48
		je tablero2L1
		cmp si,49
		je tablero2L2
		cmp si,50
		je tablero2L3
		cmp si,51
		je tablero2L4
		cmp si,52
		je tablero2L5
		cmp si,53
		je tablero2L6
		cmp si,54
		je tablero2L7
		cmp si,55
		je tablero2L8
		;==================1
		cmp si,56
		je tablero1L1
		cmp si,57
		je tablero1L2
		cmp si,58
		je tablero1L3
		cmp si,59
		je tablero1L4
		cmp si,60
		je tablero1L5
		cmp si,61
		je tablero1L6
		cmp si,62
		je tablero1L7
		cmp si,63
		je tablero1L8

		jmp final

	tablero8L1:
		imprimir ocho	
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb0

	T8vacio0:
		;imprimir seis
		inc si
		mov tablero8[0],000b ;'v'
		jmp inicio2
	T8blanco0:
		;imprimir cinco
		inc si
		mov tablero8[0],001b ;'n'
		jmp inicio2
	T8negro0:
		;imprimir cuatro
		inc si
		mov tablero8[0],011b ;'b'
		jmp inicio2
	T8rn0:
		;imprimir tres
		inc si
		mov tablero8[0],110b ;'x'
		jmp inicio2
	T8rb0:
		;imprimir dos
		inc si
		mov tablero8[0],111b ;'O'
		jmp inicio2

	tablero8L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb1

	T8vacio1:
		inc si
		mov tablero8[1],000b ;'v'
		jmp inicio2
	T8blanco1:
		inc si
		mov tablero8[1],001b ;'n'
		jmp inicio2
	T8negro1:
		inc si
		mov tablero8[1],011b ;'b'
		jmp inicio2
	T8rn1:
		inc si
		mov tablero8[1],110b ;'x'
		jmp inicio2
	T8rb1:
		inc si
		mov tablero8[1],111b ;'O'
		jmp inicio2

	tablero8L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb2

	T8vacio2:
		inc si
		mov tablero8[2],000b ;'v'
		jmp inicio2
	T8blanco2:
		inc si
		mov tablero8[2],001b ;'n'
		jmp inicio2
	T8negro2:
		inc si
		mov tablero8[2],011b ;'b'
		jmp inicio2
	T8rn2:
		inc si
		mov tablero8[2],110b ;'x'
		jmp inicio2
	T8rb2:
		inc si
		mov tablero8[2],111b ;'O'
		jmp inicio2

	tablero8L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb3

	T8vacio3:
		inc si
		mov tablero8[3],000b ;'v'
		jmp inicio2
	T8blanco3:
		inc si
		mov tablero8[3],001b ;'n'
		jmp inicio2
	T8negro3:
		inc si
		mov tablero8[3],011b ;'b'
		jmp inicio2
	T8rn3:
		inc si
		mov tablero8[3],110b ;'x'
		jmp inicio2
	T8rb3:
		inc si
		mov tablero8[3],111b ;'O'
		jmp inicio2


	tablero8L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb4
	T8vacio4:
		inc si
		mov tablero8[4],000b ;'v'
		jmp inicio2
	T8blanco4:
		inc si
		mov tablero8[4],001b ;'n'
		jmp inicio2
	T8negro4:
		inc si
		mov tablero8[4],011b ;'b'
		jmp inicio2
	T8rn4:
		inc si
		mov tablero8[4],110b ;'x'
		jmp inicio2
	T8rb4:
		inc si
		mov tablero8[4],111b ;'O'
		jmp inicio2

	tablero8L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb5
	T8vacio5:
		inc si
		mov tablero8[5],000b ;'v'
		jmp inicio2
	T8blanco5:
		inc si
		mov tablero8[5],001b ;'n'
		jmp inicio2
	T8negro5:
		inc si
		mov tablero8[5],011b ;'b'
		jmp inicio2
	T8rn5:
		inc si
		mov tablero8[5],110b ;'x'
		jmp inicio2
	T8rb5:
		inc si
		mov tablero8[5],111b ;'O'
		jmp inicio2

	tablero8L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb6

	T8vacio6:
		inc si
		mov tablero8[6],000b ;'v'
		jmp inicio2
	T8blanco6:
		inc si
		mov tablero8[6],001b ;'n'
		jmp inicio2
	T8negro6:
		inc si
		mov tablero8[6],011b ;'b'
		jmp inicio2
	T8rn6:
		inc si
		mov tablero8[6],110b ;'x'
		jmp inicio2
	T8rb6:
		inc si
		mov tablero8[6],111b ;'O'
		jmp inicio2

	tablero8L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T8vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T8negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T8blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T8rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T8rb7
	T8vacio7:
		inc si
		mov tablero8[7],000b ;'v'
		jmp inicio2
	T8blanco7:
		inc si
		mov tablero8[7],001b ;'n'
		jmp inicio2
	T8negro7:
		inc si
		mov tablero8[7],011b ;'b'
		jmp inicio2
	T8rn7:
		inc si
		mov tablero8[7],110b ;'x'
		jmp inicio2
	T8rb7:
		inc si
		mov tablero8[7],111b ;'O'
		jmp inicio2
	
		;======================
	tablero7L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb0

	T7vacio0:
		inc si
		mov tablero7[0],000b ;'v'
		jmp inicio2
	T7blanco0:
		inc si
		mov tablero7[0],001b ;'n'
		jmp inicio2
	T7negro0:
		inc si
		mov tablero7[0],011b ;'b'
		jmp inicio2
	T7rn0:
		inc si
		mov tablero7[0],110b ;'x'
		jmp inicio2
	T7rb0:
		inc si
		mov tablero7[0],111b ;'O'
		jmp inicio2

	tablero7L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb1

	T7vacio1:
		inc si
		mov tablero7[1],000b ;'v'
		jmp inicio2
	T7blanco1:
		inc si
		mov tablero7[1],001b ;'n'
		jmp inicio2
	T7negro1:
		inc si
		mov tablero7[1],011b ;'b'
		jmp inicio2
	T7rn1:
		inc si
		mov tablero7[1],110b ;'x'
		jmp inicio2
	T7rb1:
		inc si
		mov tablero7[1],111b ;'O'
		jmp inicio2

	tablero7L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb2

	T7vacio2:
		inc si
		mov tablero7[2],000b ;'v'
		jmp inicio2
	T7blanco2:
		inc si
		mov tablero7[2],001b ;'n'
		jmp inicio2
	T7negro2:
		inc si
		mov tablero7[2],011b ;'b'
		jmp inicio2
	T7rn2:
		inc si
		mov tablero7[2],110b ;'x'
		jmp inicio2
	T7rb2:
		inc si
		mov tablero7[2],111b ;'O'
		jmp inicio2

	tablero7L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb3

	T7vacio3:
		inc si
		mov tablero7[3],000b ;'v'
		jmp inicio2
	T7blanco3:
		inc si
		mov tablero7[3],001b ;'n'
		jmp inicio2
	T7negro3:
		inc si
		mov tablero7[3],011b ;'b'
		jmp inicio2
	T7rn3:
		inc si
		mov tablero7[3],110b ;'x'
		jmp inicio2
	T7rb3:
		inc si
		mov tablero7[3],111b ;'O'
		jmp inicio2


	tablero7L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb4
	T7vacio4:
		inc si
		mov tablero7[4],000b ;'v'
		jmp inicio2
	T7blanco4:
		inc si
		mov tablero7[4],001b ;'n'
		jmp inicio2
	T7negro4:
		inc si
		mov tablero7[4],011b ;'b'
		jmp inicio2
	T7rn4:
		inc si
		mov tablero7[4],110b ;'x'
		jmp inicio2
	T7rb4:
		inc si
		mov tablero7[4],111b ;'O'
		jmp inicio2

	tablero7L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb5
	T7vacio5:
		inc si
		mov tablero7[5],000b ;'v'
		jmp inicio2
	T7blanco5:
		inc si
		mov tablero7[5],001b ;'n'
		jmp inicio2
	T7negro5:
		inc si
		mov tablero7[5],011b ;'b'
		jmp inicio2
	T7rn5:
		inc si
		mov tablero7[5],110b ;'x'
		jmp inicio2
	T7rb5:
		inc si
		mov tablero7[5],111b ;'O'
		jmp inicio2

	tablero7L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb6

	T7vacio6:
		inc si
		mov tablero7[6],000b ;'v'
		jmp inicio2
	T7blanco6:
		inc si
		mov tablero7[6],001b ;'n'
		jmp inicio2
	T7negro6:
		inc si
		mov tablero7[6],011b ;'b'
		jmp inicio2
	T7rn6:
		inc si
		mov tablero7[6],110b ;'x'
		jmp inicio2
	T7rb6:
		inc si
		mov tablero7[6],111b ;'O'
		jmp inicio2

	tablero7L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T7vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T7negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T7blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T7rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T7rb7
	T7vacio7:
		inc si
		mov tablero7[7],000b ;'v'
		jmp inicio2
	T7blanco7:
		inc si
		mov tablero7[7],001b ;'n'
		jmp inicio2
	T7negro7:
		inc si
		mov tablero7[7],011b ;'b'
		jmp inicio2
	T7rn7:
		inc si
		mov tablero7[7],110b ;'x'
		jmp inicio2
	T7rb7:
		inc si
		mov tablero7[7],111b ;'O'
		jmp inicio2

	;======================
	tablero6L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb0

	T6vacio0:
		inc si
		mov tablero6[0],000b ;'v'
		jmp inicio2
	T6blanco0:
		inc si
		mov tablero6[0],001b ;'n'
		jmp inicio2
	T6negro0:
		inc si
		mov tablero6[0],011b ;'b'
		jmp inicio2
	T6rn0:
		inc si
		mov tablero6[0],110b ;'x'
		jmp inicio2
	T6rb0:
		inc si
		mov tablero6[0],111b ;'O'
		jmp inicio2

	tablero6L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb1

	T6vacio1:
		inc si
		mov tablero6[1],000b ;'v'
		jmp inicio2
	T6blanco1:
		inc si
		mov tablero6[1],001b ;'n'
		jmp inicio2
	T6negro1:
		inc si
		mov tablero6[1],011b ;'b'
		jmp inicio2
	T6rn1:
		inc si
		mov tablero6[1],110b ;'x'
		jmp inicio2
	T6rb1:
		inc si
		mov tablero6[1],111b ;'O'
		jmp inicio2

	tablero6L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb2

	T6vacio2:
		inc si
		mov tablero6[2],000b ;'v'
		jmp inicio2
	T6blanco2:
		inc si
		mov tablero6[2],001b ;'n'
		jmp inicio2
	T6negro2:
		inc si
		mov tablero6[2],011b ;'b'
		jmp inicio2
	T6rn2:
		inc si
		mov tablero6[2],110b ;'x'
		jmp inicio2
	T6rb2:
		inc si
		mov tablero6[2],111b ;'O'
		jmp inicio2

	tablero6L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb3

	T6vacio3:
		inc si
		mov tablero6[3],000b ;'v'
		jmp inicio2
	T6blanco3:
		inc si
		mov tablero6[3],001b ;'n'
		jmp inicio2
	T6negro3:
		inc si
		mov tablero6[3],011b ;'b'
		jmp inicio2
	T6rn3:
		inc si
		mov tablero6[3],110b ;'x'
		jmp inicio2
	T6rb3:
		inc si
		mov tablero6[3],111b ;'O'
		jmp inicio2


	tablero6L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb4
	T6vacio4:
		inc si
		mov tablero6[4],000b ;'v'
		jmp inicio2
	T6blanco4:
		inc si
		mov tablero6[4],001b ;'n'
		jmp inicio2
	T6negro4:
		inc si
		mov tablero6[4],011b ;'b'
		jmp inicio2
	T6rn4:
		inc si
		mov tablero6[4],110b ;'x'
		jmp inicio2
	T6rb4:
		inc si
		mov tablero6[4],111b ;'O'
		jmp inicio2

	tablero6L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb5
	T6vacio5:
		inc si
		mov tablero6[5],000b ;'v'
		jmp inicio2
	T6blanco5:
		inc si
		mov tablero6[5],001b ;'n'
		jmp inicio2
	T6negro5:
		inc si
		mov tablero6[5],011b ;'b'
		jmp inicio2
	T6rn5:
		inc si
		mov tablero6[5],110b ;'x'
		jmp inicio2
	T6rb5:
		inc si
		mov tablero6[5],111b ;'O'
		jmp inicio2

	tablero6L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb6

	T6vacio6:
		inc si
		mov tablero6[6],000b ;'v'
		jmp inicio2
	T6blanco6:
		inc si
		mov tablero6[6],001b ;'n'
		jmp inicio2
	T6negro6:
		inc si
		mov tablero6[6],011b ;'b'
		jmp inicio2
	T6rn6:
		inc si
		mov tablero6[6],110b ;'x'
		jmp inicio2
	T6rb6:
		inc si
		mov tablero6[6],111b ;'O'
		jmp inicio2

	tablero6L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T6vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T6negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T6blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T6rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T6rb7
	T6vacio7:
		inc si
		mov tablero6[7],000b ;'v'
		jmp inicio2
	T6blanco7:
		inc si
		mov tablero6[7],001b ;'n'
		jmp inicio2
	T6negro7:
		inc si
		mov tablero6[7],011b ;'b'
		jmp inicio2
	T6rn7:
		inc si
		mov tablero6[7],110b ;'x'
		jmp inicio2
	T6rb7:
		inc si
		mov tablero6[7],111b ;'O'
		jmp inicio2

	;======================
	tablero5L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb0

	T5vacio0:
		inc si
		mov tablero5[0],000b ;'v'
		jmp inicio2
	T5blanco0:
		inc si
		mov tablero5[0],001b ;'n'
		jmp inicio2
	T5negro0:
		inc si
		mov tablero5[0],011b ;'b'
		jmp inicio2
	T5rn0:
		inc si
		mov tablero5[0],110b ;'x'
		jmp inicio2
	T5rb0:
		inc si
		mov tablero5[0],111b ;'O'
		jmp inicio2

	tablero5L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb1

	T5vacio1:
		inc si
		mov tablero5[1],000b ;'v'
		jmp inicio2
	T5blanco1:
		inc si
		mov tablero5[1],001b ;'n'
		jmp inicio2
	T5negro1:
		inc si
		mov tablero5[1],011b ;'b'
		jmp inicio2
	T5rn1:
		inc si
		mov tablero5[1],110b ;'x'
		jmp inicio2
	T5rb1:
		inc si
		mov tablero5[1],111b ;'O'
		jmp inicio2

	tablero5L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb2

	T5vacio2:
		inc si
		mov tablero5[2],000b ;'v'
		jmp inicio2
	T5blanco2:
		inc si
		mov tablero5[2],001b ;'n'
		jmp inicio2
	T5negro2:
		inc si
		mov tablero5[2],011b ;'b'
		jmp inicio2
	T5rn2:
		inc si
		mov tablero5[2],110b ;'x'
		jmp inicio2
	T5rb2:
		inc si
		mov tablero5[2],111b ;'O'
		jmp inicio2

	tablero5L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb3

	T5vacio3:
		inc si
		mov tablero5[3],000b ;'v'
		jmp inicio2
	T5blanco3:
		inc si
		mov tablero5[3],001b ;'n'
		jmp inicio2
	T5negro3:
		inc si
		mov tablero5[3],011b ;'b'
		jmp inicio2
	T5rn3:
		inc si
		mov tablero5[3],110b ;'x'
		jmp inicio2
	T5rb3:
		inc si
		mov tablero5[3],111b ;'O'
		jmp inicio2


	tablero5L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb4
	T5vacio4:
		inc si
		mov tablero5[4],000b ;'v'
		jmp inicio2
	T5blanco4:
		inc si
		mov tablero5[4],001b ;'n'
		jmp inicio2
	T5negro4:
		inc si
		mov tablero5[4],011b ;'b'
		jmp inicio2
	T5rn4:
		inc si
		mov tablero5[4],110b ;'x'
		jmp inicio2
	T5rb4:
		inc si
		mov tablero5[4],111b ;'O'
		jmp inicio2

	tablero5L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb5
	T5vacio5:
		inc si
		mov tablero5[5],000b ;'v'
		jmp inicio2
	T5blanco5:
		inc si
		mov tablero5[5],001b ;'n'
		jmp inicio2
	T5negro5:
		inc si
		mov tablero5[5],011b ;'b'
		jmp inicio2
	T5rn5:
		inc si
		mov tablero5[5],110b ;'x'
		jmp inicio2
	T5rb5:
		inc si
		mov tablero5[5],111b ;'O'
		jmp inicio2

	tablero5L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb6

	T5vacio6:
		inc si
		mov tablero5[6],000b ;'v'
		jmp inicio2
	T5blanco6:
		inc si
		mov tablero5[6],001b ;'n'
		jmp inicio2
	T5negro6:
		inc si
		mov tablero5[6],011b ;'b'
		jmp inicio2
	T5rn6:
		inc si
		mov tablero5[6],110b ;'x'
		jmp inicio2
	T5rb6:
		inc si
		mov tablero5[6],111b ;'O'
		jmp inicio2

	tablero5L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T5vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T5negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T5blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T5rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T5rb7
	T5vacio7:
		inc si
		mov tablero5[7],000b ;'v'
		jmp inicio2
	T5blanco7:
		inc si
		mov tablero5[7],001b ;'n'
		jmp inicio2
	T5negro7:
		inc si
		mov tablero5[7],011b ;'b'
		jmp inicio2
	T5rn7:
		inc si
		mov tablero5[7],110b ;'x'
		jmp inicio2
	T5rb7:
		inc si
		mov tablero5[7],111b ;'O'
		jmp inicio2


	;======================
	tablero4L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb0

	T4vacio0:
		inc si
		mov tablero4[0],000b ;'v'
		jmp inicio2
	T4blanco0:
		inc si
		mov tablero4[0],001b ;'n'
		jmp inicio2
	T4negro0:
		inc si
		mov tablero4[0],011b ;'b'
		jmp inicio2
	T4rn0:
		inc si
		mov tablero4[0],110b ;'x'
		jmp inicio2
	T4rb0:
		inc si
		mov tablero4[0],111b ;'O'
		jmp inicio2

	tablero4L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb1

	T4vacio1:
		inc si
		mov tablero4[1],000b ;'v'
		jmp inicio2
	T4blanco1:
		inc si
		mov tablero4[1],001b ;'n'
		jmp inicio2
	T4negro1:
		inc si
		mov tablero4[1],011b ;'b'
		jmp inicio2
	T4rn1:
		inc si
		mov tablero4[1],110b ;'x'
		jmp inicio2
	T4rb1:
		inc si
		mov tablero4[1],111b ;'O'
		jmp inicio2

	tablero4L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb2

	T4vacio2:
		inc si
		mov tablero4[2],000b ;'v'
		jmp inicio2
	T4blanco2:
		inc si
		mov tablero4[2],001b ;'n'
		jmp inicio2
	T4negro2:
		inc si
		mov tablero4[2],011b ;'b'
		jmp inicio2
	T4rn2:
		inc si
		mov tablero4[2],110b ;'x'
		jmp inicio2
	T4rb2:
		inc si
		mov tablero4[2],111b ;'O'
		jmp inicio2

	tablero4L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb3

	T4vacio3:
		inc si
		mov tablero4[3],000b ;'v'
		jmp inicio2
	T4blanco3:
		inc si
		mov tablero4[3],001b ;'n'
		jmp inicio2
	T4negro3:
		inc si
		mov tablero4[3],011b ;'b'
		jmp inicio2
	T4rn3:
		inc si
		mov tablero4[3],110b ;'x'
		jmp inicio2
	T4rb3:
		inc si
		mov tablero4[3],111b ;'O'
		jmp inicio2


	tablero4L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb4
	T4vacio4:
		inc si
		mov tablero4[4],000b ;'v'
		jmp inicio2
	T4blanco4:
		inc si
		mov tablero4[4],001b ;'n'
		jmp inicio2
	T4negro4:
		inc si
		mov tablero4[4],011b ;'b'
		jmp inicio2
	T4rn4:
		inc si
		mov tablero4[4],110b ;'x'
		jmp inicio2
	T4rb4:
		inc si
		mov tablero4[4],111b ;'O'
		jmp inicio2

	tablero4L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb5
	T4vacio5:
		inc si
		mov tablero4[5],000b ;'v'
		jmp inicio2
	T4blanco5:
		inc si
		mov tablero4[5],001b ;'n'
		jmp inicio2
	T4negro5:
		inc si
		mov tablero4[5],011b ;'b'
		jmp inicio2
	T4rn5:
		inc si
		mov tablero4[5],110b ;'x'
		jmp inicio2
	T4rb5:
		inc si
		mov tablero4[5],111b ;'O'
		jmp inicio2

	tablero4L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb6

	T4vacio6:
		inc si
		mov tablero4[6],000b ;'v'
		jmp inicio2
	T4blanco6:
		inc si
		mov tablero4[6],001b ;'n'
		jmp inicio2
	T4negro6:
		inc si
		mov tablero4[6],011b ;'b'
		jmp inicio2
	T4rn6:
		inc si
		mov tablero4[6],110b ;'x'
		jmp inicio2
	T4rb6:
		inc si
		mov tablero4[6],111b ;'O'
		jmp inicio2

	tablero4L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T4vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T4negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T4blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T4rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T4rb7
	T4vacio7:
		inc si
		mov tablero4[7],000b ;'v'
		jmp inicio2
	T4blanco7:
		inc si
		mov tablero4[7],001b ;'n'
		jmp inicio2
	T4negro7:
		inc si
		mov tablero4[7],011b ;'b'
		jmp inicio2
	T4rn7:
		inc si
		mov tablero4[7],110b ;'x'
		jmp inicio2
	T4rb7:
		inc si
		mov tablero4[7],111b ;'O'
		jmp inicio2


	;======================
	tablero3L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb0

	T3vacio0:
		inc si
		mov tablero3[0],000b ;'v'
		jmp inicio2
	T3blanco0:
		inc si
		mov tablero3[0],001b ;'n'
		jmp inicio2
	T3negro0:
		inc si
		mov tablero3[0],011b ;'b'
		jmp inicio2
	T3rn0:
		inc si
		mov tablero3[0],110b ;'x'
		jmp inicio2
	T3rb0:
		inc si
		mov tablero3[0],111b ;'O'
		jmp inicio2

	tablero3L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb1

	T3vacio1:
		inc si
		mov tablero3[1],000b ;'v'
		jmp inicio2
	T3blanco1:
		inc si
		mov tablero3[1],001b ;'n'
		jmp inicio2
	T3negro1:
		inc si
		mov tablero3[1],011b ;'b'
		jmp inicio2
	T3rn1:
		inc si
		mov tablero3[1],110b ;'x'
		jmp inicio2
	T3rb1:
		inc si
		mov tablero3[1],111b ;'O'
		jmp inicio2

	tablero3L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb2

	T3vacio2:
		inc si
		mov tablero3[2],000b ;'v'
		jmp inicio2
	T3blanco2:
		inc si
		mov tablero3[2],001b ;'n'
		jmp inicio2
	T3negro2:
		inc si
		mov tablero3[2],011b ;'b'
		jmp inicio2
	T3rn2:
		inc si
		mov tablero3[2],110b ;'x'
		jmp inicio2
	T3rb2:
		inc si
		mov tablero3[2],111b ;'O'
		jmp inicio2

	tablero3L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb3

	T3vacio3:
		inc si
		mov tablero3[3],000b ;'v'
		jmp inicio2
	T3blanco3:
		inc si
		mov tablero3[3],001b ;'n'
		jmp inicio2
	T3negro3:
		inc si
		mov tablero3[3],011b ;'b'
		jmp inicio2
	T3rn3:
		inc si
		mov tablero3[3],110b ;'x'
		jmp inicio2
	T3rb3:
		inc si
		mov tablero3[3],111b ;'O'
		jmp inicio2


	tablero3L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb4
	T3vacio4:
		inc si
		mov tablero3[4],000b ;'v'
		jmp inicio2
	T3blanco4:
		inc si
		mov tablero3[4],001b ;'n'
		jmp inicio2
	T3negro4:
		inc si
		mov tablero3[4],011b ;'b'
		jmp inicio2
	T3rn4:
		inc si
		mov tablero3[4],110b ;'x'
		jmp inicio2
	T3rb4:
		inc si
		mov tablero3[4],111b ;'O'
		jmp inicio2

	tablero3L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb5
	T3vacio5:
		inc si
		mov tablero3[5],000b ;'v'
		jmp inicio2
	T3blanco5:
		inc si
		mov tablero3[5],001b ;'n'
		jmp inicio2
	T3negro5:
		inc si
		mov tablero3[5],011b ;'b'
		jmp inicio2
	T3rn5:
		inc si
		mov tablero3[5],110b ;'x'
		jmp inicio2
	T3rb5:
		inc si
		mov tablero3[5],111b ;'O'
		jmp inicio2

	tablero3L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb6

	T3vacio6:
		inc si
		mov tablero3[6],000b ;'v'
		jmp inicio2
	T3blanco6:
		inc si
		mov tablero3[6],001b ;'n'
		jmp inicio2
	T3negro6:
		inc si
		mov tablero3[6],011b ;'b'
		jmp inicio2
	T3rn6:
		inc si
		mov tablero3[6],110b ;'x'
		jmp inicio2
	T3rb6:
		inc si
		mov tablero3[6],111b ;'O'
		jmp inicio2

	tablero3L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T3vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T3negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T3blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T3rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T3rb7
	T3vacio7:
		inc si
		mov tablero3[7],000b ;'v'
		jmp inicio2
	T3blanco7:
		inc si
		mov tablero3[7],001b ;'n'
		jmp inicio2
	T3negro7:
		inc si
		mov tablero3[7],011b ;'b'
		jmp inicio2
	T3rn7:
		inc si
		mov tablero3[7],110b ;'x'
		jmp inicio2
	T3rb7:
		inc si
		mov tablero3[7],111b ;'O'
		jmp inicio2


	;======================
	tablero2L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb0

	T2vacio0:
		inc si
		mov tablero2[0],000b ;'v'
		jmp inicio2
	T2blanco0:
		inc si
		mov tablero2[0],001b ;'n'
		jmp inicio2
	T2negro0:
		inc si
		mov tablero2[0],011b ;'b'
		jmp inicio2
	T2rn0:
		inc si
		mov tablero2[0],110b ;'x'
		jmp inicio2
	T2rb0:
		inc si
		mov tablero2[0],111b ;'O'
		jmp inicio2

	tablero2L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb1

	T2vacio1:
		inc si
		mov tablero2[1],000b ;'v'
		jmp inicio2
	T2blanco1:
		inc si
		mov tablero2[1],001b ;'n'
		jmp inicio2
	T2negro1:
		inc si
		mov tablero2[1],011b ;'b'
		jmp inicio2
	T2rn1:
		inc si
		mov tablero2[1],110b ;'x'
		jmp inicio2
	T2rb1:
		inc si
		mov tablero2[1],111b ;'O'
		jmp inicio2

	tablero2L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb2

	T2vacio2:
		inc si
		mov tablero2[2],000b ;'v'
		jmp inicio2
	T2blanco2:
		inc si
		mov tablero2[2],001b ;'n'
		jmp inicio2
	T2negro2:
		inc si
		mov tablero2[2],011b ;'b'
		jmp inicio2
	T2rn2:
		inc si
		mov tablero2[2],110b ;'x'
		jmp inicio2
	T2rb2:
		inc si
		mov tablero2[2],111b ;'O'
		jmp inicio2

	tablero2L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb3

	T2vacio3:
		inc si
		mov tablero2[3],000b ;'v'
		jmp inicio2
	T2blanco3:
		inc si
		mov tablero2[3],001b ;'n'
		jmp inicio2
	T2negro3:
		inc si
		mov tablero2[3],011b ;'b'
		jmp inicio2
	T2rn3:
		inc si
		mov tablero2[3],110b ;'x'
		jmp inicio2
	T2rb3:
		inc si
		mov tablero2[3],111b ;'O'
		jmp inicio2


	tablero2L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb4
	T2vacio4:
		inc si
		mov tablero2[4],000b ;'v'
		jmp inicio2
	T2blanco4:
		inc si
		mov tablero2[4],001b ;'n'
		jmp inicio2
	T2negro4:
		inc si
		mov tablero2[4],011b ;'b'
		jmp inicio2
	T2rn4:
		inc si
		mov tablero2[4],110b ;'x'
		jmp inicio2
	T2rb4:
		inc si
		mov tablero2[4],111b ;'O'
		jmp inicio2

	tablero2L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb5
	T2vacio5:
		inc si
		mov tablero2[5],000b ;'v'
		jmp inicio2
	T2blanco5:
		inc si
		mov tablero2[5],001b ;'n'
		jmp inicio2
	T2negro5:
		inc si
		mov tablero2[5],011b ;'b'
		jmp inicio2
	T2rn5:
		inc si
		mov tablero2[5],110b ;'x'
		jmp inicio2
	T2rb5:
		inc si
		mov tablero2[5],111b ;'O'
		jmp inicio2

	tablero2L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb6

	T2vacio6:
		inc si
		mov tablero2[6],000b ;'v'
		jmp inicio2
	T2blanco6:
		inc si
		mov tablero2[6],001b ;'n'
		jmp inicio2
	T2negro6:
		inc si
		mov tablero2[6],011b ;'b'
		jmp inicio2
	T2rn6:
		inc si
		mov tablero2[6],110b ;'x'
		jmp inicio2
	T2rb6:
		inc si
		mov tablero2[6],111b ;'O'
		jmp inicio2

	tablero2L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T2vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T2negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T2blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T2rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T2rb7
	T2vacio7:
		inc si
		mov tablero2[7],000b ;'v'
		jmp inicio2
	T2blanco7:
		inc si
		mov tablero2[7],001b ;'n'
		jmp inicio2
	T2negro7:
		inc si
		mov tablero2[7],011b ;'b'
		jmp inicio2
	T2rn7:
		inc si
		mov tablero2[7],110b ;'x'
		jmp inicio2
	T2rb7:
		inc si
		mov tablero2[7],111b ;'O'
		jmp inicio2


	;======================
	tablero1L1:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio0
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro0
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco0
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn0
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb0

	T1vacio0:
		inc si
		mov tablero1[0],000b ;'v'
		jmp inicio2
	T1blanco0:
		inc si
		mov tablero1[0],001b ;'n'
		jmp inicio2
	T1negro0:
		inc si
		mov tablero1[0],011b ;'b'
		jmp inicio2
	T1rn0:
		inc si
		mov tablero1[0],110b ;'x'
		jmp inicio2
	T1rb0:
		inc si
		mov tablero1[0],111b ;'O'
		jmp inicio2

	tablero1L2:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio1
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro1
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco1
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn1
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb1

	T1vacio1:
		inc si
		mov tablero1[1],000b ;'v'
		jmp inicio2
	T1blanco1:
		inc si
		mov tablero1[1],001b ;'n'
		jmp inicio2
	T1negro1:
		inc si
		mov tablero1[1],011b ;'b'
		jmp inicio2
	T1rn1:
		inc si
		mov tablero1[1],110b ;'x'
		jmp inicio2
	T1rb1:
		inc si
		mov tablero1[1],111b ;'O'
		jmp inicio2

	tablero1L3:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio2
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro2
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco2
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn2
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb2

	T1vacio2:
		inc si
		mov tablero1[2],000b ;'v'
		jmp inicio2
	T1blanco2:
		inc si
		mov tablero1[2],001b ;'n'
		jmp inicio2
	T1negro2:
		inc si
		mov tablero1[2],011b ;'b'
		jmp inicio2
	T1rn2:
		inc si
		mov tablero1[2],110b ;'x'
		jmp inicio2
	T1rb2:
		inc si
		mov tablero1[2],111b ;'O'
		jmp inicio2

	tablero1L4:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio3
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro3
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco3
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn3
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb3

	T1vacio3:
		inc si
		mov tablero1[3],000b ;'v'
		jmp inicio2
	T1blanco3:
		inc si
		mov tablero1[3],001b ;'n'
		jmp inicio2
	T1negro3:
		inc si
		mov tablero1[3],011b ;'b'
		jmp inicio2
	T1rn3:
		inc si
		mov tablero1[3],110b ;'x'
		jmp inicio2
	T1rb3:
		inc si
		mov tablero1[3],111b ;'O'
		jmp inicio2


	tablero1L5:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio4
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro4
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco4
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn4
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb4
	T1vacio4:
		inc si
		mov tablero1[4],000b ;'v'
		jmp inicio2
	T1blanco4:
		inc si
		mov tablero1[4],001b ;'n'
		jmp inicio2
	T1negro4:
		inc si
		mov tablero1[4],011b ;'b'
		jmp inicio2
	T1rn4:
		inc si
		mov tablero1[4],110b ;'x'
		jmp inicio2
	T1rb4:
		inc si
		mov tablero1[4],111b ;'O'
		jmp inicio2

	tablero1L6:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio5
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro5
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco5
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn5
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb5
	T1vacio5:
		inc si
		mov tablero1[5],000b ;'v'
		jmp inicio2
	T1blanco5:
		inc si
		mov tablero1[5],001b ;'n'
		jmp inicio2
	T1negro5:
		inc si
		mov tablero1[5],011b ;'b'
		jmp inicio2
	T1rn5:
		inc si
		mov tablero1[5],110b ;'x'
		jmp inicio2
	T1rb5:
		inc si
		mov tablero1[5],111b ;'O'
		jmp inicio2

	tablero1L7:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio6
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro6
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco6
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn6
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb6

	T1vacio6:
		inc si
		mov tablero1[6],000b ;'v'
		jmp inicio2
	T1blanco6:
		inc si
		mov tablero1[6],001b ;'n'
		jmp inicio2
	T1negro6:
		inc si
		mov tablero1[6],011b ;'b'
		jmp inicio2
	T1rn6:
		inc si
		mov tablero1[6],110b ;'x'
		jmp inicio2
	T1rb6:
		inc si
		mov tablero1[6],111b ;'O'
		jmp inicio2

	tablero1L8:
		mov al,tablero[si]
		cmp al,VACIOL
			JE T1vacio7
		mov al,tablero[si]
		cmp al,NEGROL
			JE T1negro7
		mov al,tablero[si]
		cmp al,BLANCOL
			JE T1blanco7
		mov al,tablero[si]
		cmp al,REINANL
			JE T1rn7
		mov al,tablero[si]
		cmp al,REINABL
			JE T1rb7
	T1vacio7:
		inc si
		mov tablero1[7],000b ;'v'
		jmp inicio2
	T1blanco7:
		inc si
		mov tablero1[7],001b ;'n'
		jmp inicio2
	T1negro7:
		inc si
		mov tablero1[7],011b ;'b'
		jmp inicio2
	T1rn7:
		inc si
		mov tablero1[7],110b ;'x'
		jmp inicio2
	T1rb7:
		inc si
		mov tablero1[7],111b ;'O'
		jmp inicio2


	;======================
	final:
	imprimir uno

endm

;================================================================================
.model small
.stack 100h
.data 
;================================================SEGMENTO DE DATOS======================

	encabezadoMenu db 	0ah,0dh,'UNIVERSIDAD DE SAN CARLOS DE GUATEMALA',
						0ah,0dh,'FACULTAD DE INGENIERIA',
						0ah,0dh,'CIENCIAS Y SISTEMAS',
						0ah,0dh,'ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1',
						0ah,0dh,'NOMBRE: JESUS MANSILLA',
						0ah,0dh,'CARNET: 201709396',
						0ah,0dh,'SECCION: A',
						0ah,0dh,'$'
					
	menuPrincipal db 	0ah,0dh,'1) Iniciar Juego',
						0ah,0dh,'2) Cargar Juego',
						0ah,0dh,'3) Salir',
						0ah,0dh, 'Escoja una opcion: ',
						0ah,0dh,'$'


	lineaSeparacion db 	196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,'$'
	indiceColumna db 	'   A  B  C  D  E  F  G  H',0ah,0dh,'$'
	fb db  	'FB',179,'$'
	fn db  	'FN',179,'$'
	rb db  	'RB',179,'$'
	rn db  	'RN',179,'$'
	lineaColumna db '|','$'
	saltoDeLinea db 0ah,0dh,'$'
	columna db 0b
	fila db 0b

	;======================espacios
	blanco db '  ',179,'$'
	dobleEspacio db '  ','$'
	espacio db ' ','$'

	;=============================NUMEROS FILAS
	uno db '1 ',179,'$'
	dos db '2 ',179,'$'
	tres db '3 ',179,'$'
	cuatro db '4 ',179,'$'
	cinco db '5 ',179,'$'
	seis db '6 ',179,'$'
	siete db '7 ',179,'$'
	ocho db '8 ',179,'$'

	;======tablero
	;000b -> espacio en blanco
	;011b -> ficha negra
	;001b -> ficha blanca
	;111b -> reina Blanca
	;110b -> reina Negra
	comment #
	tablero8 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero7 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero6 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero5 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero4 db 000b,011b,000b,011b,000b,000b,000b,000b
	tablero3 db 000b,000b,001b,000b,000b,000b,000b,000b
	tablero2 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero1 db 000b,000b,000b,000b,000b,000b,000b,000b#
	comment #
	tablero8 db 000b,011b,000b,011b,000b,011b,000b,011b
	tablero7 db 011b,000b,011b,000b,011b,000b,011b,000b
	tablero6 db 000b,011b,000b,011b,000b,011b,000b,011b
	tablero5 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero4 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero3 db 001b,000b,001b,000b,001b,000b,001b,000b
	tablero2 db 000b,001b,000b,001b,000b,001b,000b,001b
	tablero1 db 001b,000b,001b,000b,000b,000b,001b,000b
	#
	comment #
	tablero8 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero7 db 000b,000b,000b,000b,000b,000b,011b,000b
	tablero6 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero5 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero4 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero3 db 000b,000b,000b,000b,011b,000b,000b,000b
	tablero2 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero1 db 000b,000b,000b,000b,001b,000b,000b,000b#
	comment #
	tablero8 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero7 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero6 db 000b,000b,000b,000b,000b,011b,000b,000b
	tablero5 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero4 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero3 db 000b,000b,000b,000b,011b,000b,000b,000b
	tablero2 db 000b,000b,000b,011b,000b,000b,000b,000b
	tablero1 db 000b,000b,000b,000b,001b,000b,000b,000b#

	



	;Principa
	tablero8 db 000b,011b,000b,011b,000b,011b,000b,011b
	tablero7 db 011b,000b,011b,000b,011b,000b,011b,000b
	tablero6 db 000b,011b,000b,011b,000b,011b,000b,011b
	tablero5 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero4 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero3 db 001b,000b,001b,000b,001b,000b,001b,000b
	tablero2 db 000b,001b,000b,001b,000b,001b,000b,001b
	tablero1 db 001b,000b,001b,000b,001b,000b,001b,000b

	comment #
	tablero8 db 000b,011b,000b,011b,000b,011b,000b,011b
	tablero7 db 000b,000b,001b,000b,000b,000b,000b,000b
	tablero6 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero5 db 000b,000b,000b,000b,001b,000b,000b,000b
	tablero4 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero3 db 000b,000b,000b,000b,001b,000b,000b,000b
	tablero2 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero1 db 110b,000b,110b,000b,000b,000b,000b,000b#

	comment#
	tablero8 db 000b,000b,000b,000b,000b,000b,000b,011b
	tablero7 db 000b,000b,000b,000b,011b,000b,001b,000b
	tablero6 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero5 db 000b,000b,000b,000b,001b,000b,000b,000b
	tablero4 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero3 db 000b,000b,001b,000b,000b,000b,011b,000b
	tablero2 db 000b,000b,000b,000b,000b,000b,000b,001b
	tablero1 db 000b,000b,000b,000b,000b,000b,000b,000b#
	comment#
	tablero8 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero7 db 000b,000b,000b,000b,011b,000b,011b,000b
	tablero6 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero5 db 000b,000b,000b,000b,011b,000b,000b,000b
	tablero4 db 000b,000b,000b,000b,000b,000b,000b,000b
	tablero3 db 000b,000b,011b,000b,000b,000b,011b,000b
	tablero2 db 000b,001b,000b,000b,000b,000b,000b,001b
	tablero1 db 000b,000b,000b,000b,000b,000b,000b,000b#

	; =====ARREGLO

	arreglo db 20 dup('$'),'$'
	exit db 'EXIT','$'
	show db 'SHOW','$'
	save db 'SAVE', '$'
	x dw 0	
	indiceIgual db 0b
	indiceShow db 0b
	indiceSave db 0b

	;=======TURNOS
	tBlanco db 0ah,0dh,'Turno Blancas: ','$'
	tNegra db 0ah,0dh,'Turno Negras: ','$'
	;========MOVIMIENTO
	filaActual db 0
	columnaActual db 0
	filaSig db 0 
	columnaSig db 0
	mensajeError db 0ah,0dh,'Parametros fuera de los limites','$'
	cambioTurno db 0ah,0dh,'Cambio Turno','$'
	row db 0
	col db 0
	indiceTurno db 0b
	;======================
	;==========VERIFICAR MOVIMIENTO
	indiceVerificar db 0
	filaVla db 0
	bMov db 0ah,0dh,'Se puede realizar el movimiento','$'
	bExiste2 db 0ah,0dh,'Hay una ficha en la siguiente Posicion','$'
	bExiste db 0ah,0dh,'Hay una ficha en esta Posicion','$'
	errorV db 0ah,0dh,'ERROR VERIFICAR MOVIMIENTO','$'
	indiceTurno2 db 0b
	movBien db 0ah,0dh,'Movimiento realizado con exito','$'
	auxCol db 0 
	auxFila db 0
	indiceQuitar db 0b
	indiceSEVUELTA db 0b
	filaMTN2 db 0
	colMTN db 0
	colMTN2 db 0
	filaSAux db 0
	colSAux db 0
	indiceComer db 0b
	indiceComer2 db 0b

	;==============SHOW==================
	handleFichero dw ?
	rutaArchivo db 'estadoT.html',0
	errorCrearArch db 0ah,0dh,'Error, no se creo el archivo','$'

	;============FECHAYHORA

	hora db 00h,00h, 'H '
	min db 00h,00h, 'M '
	sec db 00h,00h, 'S '
	dia db 00h,00h, 'D '
	ano db 00h, 'A 2020 '
	mes db 00h,00h, 'M '

	AUXhora db 00h,00h, 'H '
	AUXmin db 00h,00h, 'M '
	AUXsec db 00h,00h, 'S '
	AUXdia db 00h,00h, 'D '
	AUXano db 00h,00h,00h,00h, '2020A '
	AUXmes db 00h,00h, 'M '


	;============================HTML========================
	_openHtml db 		'<html>',
			0ah,0dh,	'<head> <title> 201709396 </title> </head>',
			0ah,0dh,	'<body bgcolor=#d1d5d4>',
			0ah,0dh,	' 	NOMBRE: JESUS MANSILLA <br> CARNET: 201709396 <br> SECCION: A <br> PRACTICA 3 <br>',
			0ah,0dh,	'	<div align=center>'
	;_fech db 			'		<h1> Fecha: 00/00/2000 Hora: 00:00:00 </h1>'
	_h1	db				'<h1>'

	_h1fin	db			'</h1>'
	;_fech2 db 			'		<h3> Fecha: 00/00/2000 Hora: 00:00:00 </h3>'
	;_winN db 			'		<h2> Ganador: NEGRO </h2>'
	;_WinB db 			'		<h2> Ganador: BLANCO </h2>'
	_titulo db			'		<h1> Reporte </h1>'
	_tabla	db			' <table border=0 cellspacing=2 cellpadding=2 bgcolor=#005b96>'
	_tr 	db          '<tr align=center>'
	_tdI     db          '<td width=47px; height=47px;>'
	_fb     db          '<img src=fb.png style=max-height:100%; max-width:100%/>'
	_tdFin  db 			'</td>'
	_tdI2   db          ' <td bgcolor=#b3cde0 width=47px; height=47px;></td>'
	_trFin  db          '</tr>'
	_fn     db           '<img src=fn.png style=max-height:100%; max-width:100%/>'
	_frb    db 			'<img src=rb.png style=max-height:100%; max-width:100%/>'
	_frn    db          '<img src=rn.png style=max-height:100%; max-width:100%/>'
	_bodyFin db          '</body>'
	_tablaFin db          '</table>'
	_finhtml  db          '</html>'
	handleCrear dw ?
	;========================================================

	;======================================================= leerArchivo

	bufferLeer db 65 dup('$'),'$'
	inputbuffer db 50 dup('$'),'$'
	mensajeSave db 0ah,0dh,'Ingrese nombre para guardar:','$'
	VACIOL db 'V'
	NEGROL db 'N'
	BLANCOL db 'B'
	REINANL db 'X'
	REINABL db 'O'
	;===================================CARGAR=======================
	mensajeCarga db 0ah,0dh,'Ingrese nombre del archivo:','$'
	infoCarga db 0ah,0dh,'Informacion cargada con exito','$'
	errorCargar db 0ah,0dh,'Error en la carga','$'
	errorA db 0ah,0dh,'Error al abrir el archivo','$'
	indiceCarga db 0


;=========================================SEGMENTO DE CODIGO============================================
.code

	main proc
			mov dx,@data
			mov ds,dx
			imprimir encabezadoMenu

		Menu:
			limpiarArreglo
			imprimir menuPrincipal
			obtenerDato
			cmp al, '1'
			je Juego
			cmp al, '2'
			je Carga
			cmp al, '3'
			je Salir

			jmp Menu

		Juego:
			

			;tableroInicial
			;imprimir espacio
			;imprimir lineaSeparacion
			;imprimir saltoDeLinea
			;imprimir espacio
			;imprimir indiceColumna
			
			

			jmp TurnoBlancas;

		TurnoBlancas:
			tableroInicial
			imprimir espacio
			imprimir lineaSeparacion
			imprimir saltoDeLinea
			imprimir espacio
			imprimir indiceColumna

			mov indiceIgual,0b
			mov indiceShow,0b
			mov indiceSave,0b
			
			imprimir tBlanco
			obtenerTexto arreglo
			obtenerDato
			compararArreglo
			comandoSHOW
			comandoSAVE
			validarExistencia
			verEBlanco
			limpiarArreglo
			cmp indiceIgual,1b
			je Menu
			cmp indiceShow,1b
			
			JE cSHOWB
			cmp indiceSave,1b
			je cSAVEB
			cmp indiceTurno,1b
			je TurnoNegras
			cmp indiceTurno,0b
			je TurnoBlancas

		TurnoNegras:
			tableroInicial
			imprimir espacio
			imprimir lineaSeparacion
			imprimir saltoDeLinea
			imprimir espacio
			imprimir indiceColumna

			mov indiceIgual,0b
			mov indiceShow,0b
			mov indiceSave,0b
			
			imprimir tNegra
			obtenerTexto arreglo
			obtenerDato
			compararArreglo
			comandoSHOW
			comandoSAVE
			validarExistencia
			verENegro
			limpiarArreglo
			cmp indiceIgual,1b
			je Menu
			cmp indiceShow,1b
			
			JE cSHOWN 
			cmp indiceSave,1b
			je cSAVEN
			cmp indiceTurno,1b
			je TurnoNegras
			cmp indiceTurno,0b
			je TurnoBlancas
			

		
		cSHOWB:
			getFecha
			getHora
			convertirhora
			convertirmin
			convertirmes
			;convertirano
			convertirhora
			convertirsec
			convertirDia
			crearArchivo rutaArchivo,handleFichero
			obtenerDato
			abrirArchivo rutaArchivo,handleFichero
			;escribirEnArchivo handleFichero,_openHtml,sizeof _openHtml
			tableroInicialHTML
			cerrarArchivo handleFichero
			obtenerDato 
			jmp TurnoBlancas
		cSHOWN:
			getFecha
			getHora
			convertirhora
			convertirmin
			convertirmes
			;convertirano
			convertirhora
			convertirsec
			convertirDia
			crearArchivo rutaArchivo,handleFichero
			obtenerDato
			abrirArchivo rutaArchivo,handleFichero
			;escribirEnArchivo handleFichero,_openHtml,sizeof _openHtml
			tableroInicialHTML
			cerrarArchivo handleFichero
			obtenerDato 
			jmp TurnoNegras
		cSAVEB:
			imprimir mensajeSave
			obtenerRuta inputbuffer
			crearArchivo inputbuffer,handleFichero
			abrirArchivo inputbuffer,handleFichero
			;escribirEnArchivo handleFichero,tablero8,sizeof tablero8
			convertir_tabla tablero8
			;escribirTexto handleFichero,tablero8
			cerrarArchivo handleFichero
			jmp TurnoBlancas

		cSAVEN:
			imprimir mensajeSave
			obtenerRuta inputbuffer
			crearArchivo inputbuffer,handleFichero
			abrirArchivo inputbuffer,handleFichero
			;escribirEnArchivo handleFichero,tablero8,sizeof tablero8
			convertir_tabla tablero8
			;escribirTexto handleFichero,tablero8
			cerrarArchivo handleFichero
			jmp TurnoNegras
		Carga:
			mov indiceCarga,0
			imprimir mensajeCarga
			obtenerRuta inputbuffer
			abrirArchivo inputbuffer, handleFichero
			leerArchivo sizeof bufferLeer,bufferLeer,handleFichero
			;imprimir bufferLeer
			cmp indiceCarga,0
			je ErrorCarga
			pasar_Datos bufferLeer
			cerrarArchivo handleFichero
			imprimir infoCarga
			jmp Menu


		ErrorCrear:
			;getHora hora,min,sec,dia,mes,ano

			imprimir errorCrearArch
			;imprimir ocho
			jmp Menu
		ErrorCarga:
			imprimir errorCargar
			mov indiceCarga,0
		ErrorAbrir:
			imprimir errorA
			jmp Menu
		otroError:
			imprimir uno
			imprimir ocho
		Salir:
			mov ah,4ch
			int 21h
	main endp


end


