;macros
getFecha macro 
	MOV AH,2AH
	INT 21H
	mov dia,DL
	mov mes,DH
	mov ano,CX
endm

getHora macro
	MOV AH,2CH
	INT 21H
	mov hora,CH
	mov min,CL
	mov sec,DH
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
        imprimir aqui
    fin:
endm

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
        imprimir errorA
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


INICIOLEER macro buffer
	;xor ax,ax
	;xor bx,bx
	;xor dx,dx
	xor si,si
	xor di,di
	ID buffer
	HIJOS buffer
	;OPERACIONES buffer
	


endm



ID macro buffer
	LOCAL INICIO, FIN, COMILLA, IDEN,FINCOMILLA

	INICIO:
		cmp buffer[si], '"'
		;mov identificadores[di],buffer[si]
		je COMILLA
		INC si
		JMP INICIO

	COMILLA:
		xor dx,dx
		mov dl,'"'
		mov reporte[di],dl
		inc di 
		inc si
		jmp IDEN
	IDEN:
		xor dx, dx
		mov dl,buffer[si]
		mov reporte[di],dl
		inc di
		cmp buffer[si],'"'
		je	FINCOMILLA
		inc si
		jmp IDEN

	FINCOMILLA:
		inc si
		xor dx, dx
		mov dl,':'
		mov reporte[di],dl
		INC di
		xor dx, dx
		mov dl, '['
		mov reporte[di],dl
		INC di
		mov dl, 0ah
		mov reporte[di],dl
		INC di
		mov dl, 0dh
		mov reporte[di],dl
		jmp FIN


	FIN:

endm

HIJOS macro buffer
	LOCAL INICIO, FIN, OPER,COMILLA,FIN2,THEEND,COMA

	INICIO:
		cmp buffer[si], '"'
		;mov identificadores[di],buffer[si]
		je COMILLA
		INC si
		JMP INICIO
	COMILLA:
		inc di
		;push di
		;xor di, di

		mov dl, 0ah
		mov reporte[di],dl
		INC di
		mov dl, 0dh
		mov reporte[di],dl
		INC di

		mov dl,'{'
		mov reporte[di],dl
		inc di

		mov dl, 0ah
		mov reporte[di],dl
		INC di
		mov dl, 0dh
		mov reporte[di],dl
		INC di

		xor dx,dx
		inc si
		cmp buffer[si],'"'
		je FIN
		mov dl,'"'
		mov reporte[di],dl
		inc di
		mov dl, buffer[si]
		mov reporte[di],dl
		INC di
		JMP OPER
	OPER:
		xor dx,dx
		inc si
		cmp buffer[si],'"'
		je FIN
		mov dl, buffer[si]
		mov reporte[di],dl
		inc di
		JMP OPER


	FIN:
		mov dl,'"'
		mov reporte[di],dl
		inc di
		inc si
		xor dx, dx
		mov dl,':'
		mov reporte[di],dl
		INC di
		

		OPERACIONES buffer 

		dec di
		;dec di
		xor dx, dx
		mov dl, 0ah
		mov reporte[di],dl
		INC di
		mov dl, 0dh
		mov reporte[di],dl
		INC di

		mov dl, '}'
		mov reporte[di],dl
		INC di
		;xor dx, dx
		;mov dl, ','
		;mov reporte[di],dl
		;inc di

		jmp FIN2

		
		FIN2:
		inc si
		cmp buffer[si],','
		je COMA

		cmp buffer[si],'$'
		je THEEND
		jmp FIN2

		COMA:
			xor dx, dx
			mov dl, ','
			mov reporte[di],dl
			JMP INICIO
		THEEND:
			xor dx, dx

			mov dl, 0ah
			mov reporte[di],dl
			INC di
			mov dl, 0dh
			mov reporte[di],dl
			INC di

			mov dl, ']'
			mov reporte[di],dl
		;jmp FIN

		;POP di

		;compararArreglo MDSR cMul

endm

OPERACIONES macro buffer
	LOCAL INICIO, FIN, OPER,COMILLA,VERIFICAROP,MT,DV,RT,SM,SIGNOM,NUMN,NUM,INICION,MENOS,FINNUM,DIVIDIR,SAVEARR,MULTIPLICAR,SUMAR,RESTAR
	local RESULTADO4
	call INICIO
	;push si
	;xor si,si
	;mov si,contadorArN
	;mov ax,arregloNumeros[si]
	;pop si
	;ConvertirString2 reporte
	call RESULTADO4
	JMP FIN

	RESULTADO4:
		;call INICIO
		push si
		push di
		xor si,si
		mov si,contadorArN
		mov ax,arregloNumeros[si]
		xor di,di
		inc contadorArNAUX
		inc contadorArNAUX
		mov di,contadorArNAUX
		mov arregloNumerosAUX[di],ax
		push ax
		
		pop ax
		pop di
		pop si
		ConvertirString2 reporte
		ret
	INICIO:
		LimpiarOperacion
		mov indiceIgual,0b
		cmp buffer[si], '"'
		;mov identificadores[di],buffer[si]
		je COMILLA
		INC si
		JMP INICIO
	COMILLA:
		;inc di
		push di
		xor di, di
		
		inc si
		cmp buffer[si],'"'
		je FIN
		xor dx, dx
		mov dl, buffer[si]
		mov MDSR[di],dl
		INC di
		JMP OPER
	OPER:
		xor dx,dx
		inc si
		cmp buffer[si],'"'
		je VERIFICAROP
		xor dx, dx
		mov dl, buffer[si]
		mov MDSR[di],dl
		inc di
		JMP OPER

	VERIFICAROP:
		inc si
		POP di
		;cmp MDSR[0],'m'
		;cmp MDSR[0],'s'
		;cmp MDSR[0],'a'
		;cmp MDSR[0],'d'
		compararArreglo MDSR, cMul
		;imprimir aqui
		cmp indiceIgual,1b
		je MT
		compararArreglo MDSR, cDiv
		cmp indiceIgual,1b
		je DV
		compararArreglo MDSR, cSub
		cmp indiceIgual,1b
		je RT
		compararArreglo MDSR, cAdd
		cmp indiceIgual,1b
		je SM
		cmp MDSR[0],'+'
		je SM
		cmp MDSR[0],'*'
		je MT
		cmp MDSR[0],'/'
		je DV
		cmp MDSR[0],'-'
		je RT
		cmp MDSR[0],'#'
		je NM
		jmp FIN


	MT:
		;imprimir ejMT
		;imprimir MDSR
		call INICIO
		call INICIO
		call MULTIPLICAR
	;	jmp FIN
		ret
	MULTIPLICAR:
		push si
		xor si,si
		xor ax,ax
		mov si, contadorArN
		
		mov ax,arregloNumeros[si]
		mov bx,ax
		dec contadorArN
		dec contadorArN
		pop si


		push si
		xor si,si
		xor ax,ax
		mov si,contadorArN
		mov ax,arregloNumeros[si]
		pop si

		imul bl
		xor ah,ah
		push si
		xor si,si
		mov si,contadorArN
		mov arregloNumeros[si],ax
		
		pop si



		ret


	DV:
		;imprimir ejDV
		;imprimir MDSR
		call INICIO
		call INICIO
		call DIVIDIR
		


	;	jmp FIN
		ret
	DIVIDIR:
		push si
		xor si,si
		xor ax,ax
		mov si, contadorArN
		
		mov ax,arregloNumeros[si]
		mov bx,ax
		dec contadorArN
		dec contadorArN
		pop si


		push si
		xor si,si
		xor ax,ax
		mov si,contadorArN
		mov ax,arregloNumeros[si]
		pop si
		cwd
		idiv bx
		xor ah,ah
		push si
		xor si,si
		mov si,contadorArN
		mov arregloNumeros[si],ax
		
		pop si



		ret
	RT:
		;imprimir ejRT
		;imprimir MDSR
		call INICIO
		call INICIO
		call RESTAR
		;jmp FIN
		ret
	RESTAR:
		push si
		xor si,si
		xor ax,ax
		mov si, contadorArN
		
		mov ax,arregloNumeros[si]
		mov bx,ax
		dec contadorArN
		dec contadorArN
		pop si


		push si
		xor si,si
		xor ax,ax
		mov si,contadorArN
		mov ax,arregloNumeros[si]
		pop si

		SUB ax,bx
		;xor ah,ah
		push si
		xor si,si
		mov si,contadorArN
		mov arregloNumeros[si],ax
	
		pop si



		ret

	SM:
		;imprimir ejSM
		;imprimir MDSR
		call INICIO
		call INICIO
		call SUMAR
		;jmp FIN
		ret
	SUMAR:
		push si
		xor si,si
		xor ax,ax
		mov si, contadorArN
		
		mov ax,arregloNumeros[si]
		mov bx,ax
		dec contadorArN
		dec contadorArN
		pop si


		push si
		xor si,si
		xor ax,ax
		mov si,contadorArN
		mov ax,arregloNumeros[si]
		pop si

		add ax,bx
		;xor ah,ah
		push si
		xor si,si
		mov si,contadorArN
		mov arregloNumeros[si],ax
		
		pop si



		ret

	NM:

		mov indiceNUMN,0b 
		inc si
		CovertirAscii buffer
		;imprimir MDSR
		;inc si
		;push ax
		;push si
		;push ax
		;xor si,si

		;inc contadorArN
		;inc contadorArN

		;mov si,contadorArN
		;mov arregloNumeros[si],ax
		
		;pop ax
		;pop si
		CALL SAVEARR
		ConvertirString resultado
		;imprimir ejNM
		;imprimir aqui
		;imprimir saltoDeLinea
		;imprimir resultado
		;limpiarResultado
		LimpiarArreglo resultado
		;jmp SIGNOM
		;mov dl,ax
		;mov pruebaN[0],ax
		;ConvertirString numeros
		;imprimir numeros
		ret

	SAVEARR:
		push si
		push ax
		xor si,si

		inc contadorArN
		inc contadorArN

		mov si,contadorArN
		mov arregloNumeros[si],ax
		
		pop ax
		pop si
		RET

	FIN:
		;imprimir msgN9
		;jmp FIN

		;POP di
		;compararArreglo MDSR cMul
endm



CovertirAscii macro buffer
	local SIGNO,INICIO,FIN,CAMBIAR,SALIR,NUMN,CONVERTIRN
		;inc si
		xor ax,ax
		xor bx,bx
		xor cx,cx
		mov bx,10	;multiplicador 10
		;xor cx,cx
		;mov cl,buffer[si]
		;cmp cl,45
		cmp buffer[si],'-'
		je NUMN
		jmp INICIO
	NUMN:
		inc si
		;print msgNeg
		;imprimir aqui
		mov indiceNUMN,1b
		jmp INICIO
		
	CONVERTIRN:
		;mov cx,ax
		;xor ax,ax
		;sub ax,cx
		neg ax
		;mov indiceNUMN,0b
		jmp SALIR

	INICIO:
		mov cl,buffer[si] 
		cmp cl,48
		jl FIN
		cmp cl,57
		jg FIN
		inc si
		;printCL
		sub cl,48
		mul bx
		add ax,cx
		jmp INICIO
	FIN:
		
		cmp indiceNUMN,1b
		je CONVERTIRN
		jmp SALIR

	SALIR:

endm

printCL macro
    local p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,salir
    cmp cl,48
    je P0
    cmp cl,49
    je P1
    cmp cl,50
    je P2
    cmp cl,51
    je P3
    cmp cl,52
    je P4
    cmp cl,53
    je P5
    cmp cl,54
    je P6
    cmp cl,55
    je P7
    cmp cl,56
    je P8
    cmp cl,57
    je P9
    jmp salir
    p0:
        imprimir msgN0
        jmp salir
    p1:
        imprimir msgN1
        jmp salir
    p2:
        imprimir msgN2
        jmp salir
    p3:
        imprimir msgN3
        jmp salir
    p4:
        imprimir msgN4
        jmp salir
    p5:
        imprimir msgN5
        jmp salir
    p6:
        imprimir msgN6
        jmp salir
    p7:
        imprimir msgN7
        jmp salir
    p8:
        imprimir msgN8
        jmp salir
    p9:
        imprimir msgN9
        jmp salir
    salir:
endm

ConvertirString macro cadena
	LOCAL Dividir32,Dividir89,FinCr36,NEGATIVO10,FIN2,FIN76
		push si
		xor si,si
		xor cx,cx
		xor bx,bx
		xor dx,dx
		mov dl,0ah
		test ax,1000000000000000
		jnz NEGATIVO10
		jmp Dividir89
	NEGATIVO10:
		neg ax
		mov cadena[si],45
		inc si
		jmp Dividir89
	Dividir32:
		xor ah,ah
	Dividir89:
	;	print bandera
		div dl
		inc cx
		push ax
		cmp al,00h
		je FinCr36
		jmp Dividir32
	FinCr36:
		pop ax
		add ah,30h
		mov cadena[si],ah
		inc si
		loop FinCr36
		mov ah,24h
		mov cadena[si],ah
		inc si
	FIN76:
		pop si

endm

ConvertirString2 macro cadena
	LOCAL Dividir32,Dividir89,FinCr36,NEGATIVO10,FIN2,FIN76
		;push di
		;xor di,di
		xor cx,cx
		xor bx,bx
		xor dx,dx
		mov dl,0ah
		test ax,1000000000000000
		jnz NEGATIVO10
		jmp Dividir89
	NEGATIVO10:
		neg ax
		mov cadena[di],45
		inc di
		jmp Dividir89
	Dividir32:
		xor ah,ah
	Dividir89:
	;	print bandera
		div dl
		inc cx
		push ax
		cmp al,00h
		je FinCr36
		jmp Dividir32
	FinCr36:
		pop ax
		add ah,30h
		mov cadena[di],ah
		inc di
		loop FinCr36
		mov ah,24h
		mov cadena[di],ah
		inc di
	FIN76:
		;pop di

endm


compararArreglo macro buffer, oper
	local INICIO,DIFERENTE,IGUAL,TERMINAR,ULTIMO
	;mov x,0
	push di
	xor di,di
	mov di,0
	cmp buffer[0],'$'
	je TERMINAR
	INICIO:
	cmp oper[di],'$'
	je ULTIMO

	;MOV si, x
	MOV al, buffer[di]
	cmp oper[di],al
	jne DIFERENTE
	
	;inc x
	inc di
	jmp INICIO

	ULTIMO:
	cmp buffer[di],'$'
	je IGUAL
	JMP TERMINAR

	DIFERENTE:
	mov indiceIgual,0b
	jmp TERMINAR

	IGUAL:
	mov indiceIgual,1b
	jmp TERMINAR

	TERMINAR:
	pop di
endm 

LimpiarOperacion macro
	mov MDSR[0],'$'
	mov MDSR[1],'$'
	mov MDSR[2],'$'
	mov MDSR[3],'$'
	mov MDSR[4],'$'
	mov MDSR[5],'$'
	mov MDSR[6],'$'
	mov MDSR[7],'$'
	mov MDSR[8],'$'
	mov MDSR[9],'$'
	mov MDSR[10],'$'
	mov MDSR[11],'$'
	mov MDSR[12],'$'
	mov MDSR[13],'$'
	mov MDSR[14],'$'
	mov MDSR[15],'$'
	mov MDSR[16],'$'
	mov MDSR[17],'$'
	mov MDSR[18],'$'
	mov MDSR[19],'$'
endm
limpiarResultado macro
	mov resultado[0],'$'
	mov resultado[1],'$'
	mov resultado[2],'$'
	mov resultado[3],'$'
	mov resultado[4],'$'
	mov resultado[5],'$'
	mov resultado[6],'$'
	mov resultado[7],'$'
	mov resultado[8],'$'
	mov resultado[9],'$'

endm

LimpiarPadre macro
	mov bufferPadre[0],'$'
	mov bufferPadre[1],'$'
	mov bufferPadre[2],'$'
	mov bufferPadre[3],'$'
	mov bufferPadre[4],'$'
	mov bufferPadre[5],'$'
	mov bufferPadre[6],'$'
	mov bufferPadre[7],'$'
	mov bufferPadre[8],'$'
	mov bufferPadre[9],'$'
	mov bufferPadre[10],'$'
	mov bufferPadre[11],'$'
	mov bufferPadre[12],'$'
	mov bufferPadre[13],'$'
	mov bufferPadre[14],'$'
	mov bufferPadre[15],'$'
	mov bufferPadre[16],'$'
	mov bufferPadre[17],'$'
	mov bufferPadre[18],'$'
	mov bufferPadre[19],'$'
endm

LimpiarArreglo macro buffer
	local INICIO, FINAL
		push si
		xor si,si
	INICIO:
		cmp buffer[si],'$'
		je FINAL
		mov buffer[si],'$'
		inc si
		jmp INICIO
	FINAL:
		pop si
endm

buscarMayor macro
	local INICIO,FIN,COMPARAR,SETNUV
	push si
	push di
	xor si,si
	xor di,di

	xor ax,ax
	xor bx,bx
	INICIO:
		inc contadorEncN
		inc contadorEncN
		mov si, contadorArNAUX
		mov di, contadorEncN
		mov ax, arregloNumerosAUX[di]
	SETNUV:
		inc contadorEncN
		inc contadorEncN
		mov di,contadorEncN
		mov bx, arregloNumerosAUX[di]
		cmp bx,'$'
		je FIN
		cmp bx,ax
		jg COMPARAR
		jmp SETNUV

	COMPARAR:

		mov ax,bx
		jmp SETNUV

	FIN:
		pop di	
		pop si
		ConvertirString bufferMayor

endm

buscarMenor macro
	local INICIO,FIN,COMPARAR,SETNUV
	push si
	push di
	xor si,si
	xor di,di

	xor ax,ax
	xor bx,bx
	INICIO:
		inc contadorEncN
		inc contadorEncN
		mov si, contadorArNAUX
		mov di, contadorEncN
		mov ax, arregloNumerosAUX[di]
	SETNUV:
		inc contadorEncN
		inc contadorEncN
		mov di,contadorEncN
		mov bx, arregloNumerosAUX[di]
		cmp bx,'$'
		je FIN
		cmp bx,ax
		jl COMPARAR
		jmp SETNUV

	COMPARAR:

		mov ax,bx
		jmp SETNUV

	FIN:
		pop di	
		pop si
		ConvertirString bufferMayor

endm

buscarMedia macro
	local INICIO,FIN,COMPARAR,SETNUV,DIVID
	push si
	push di
	xor si,si
	xor di,di

	xor ax,ax
	xor bx,bx
	INICIO:

		inc contadorEncN
		inc contadorEncN
		inc contadorAUX
		mov si, contadorArNAUX
		mov di, contadorEncN
		mov ax, arregloNumerosAUX[di]
		;push ax
		;ConvertirString bufferMayor
		;imprimir saltoDeLinea
		;imprimir bufferMayor
		;pop ax

	SETNUV:

		inc contadorEncN
		inc contadorEncN
		inc contadorAUX
		mov di,contadorEncN
		mov bx, arregloNumerosAUX[di]
		cmp bx,'$'
		je DIVID
		cmp bx,'$'
		jne COMPARAR
		

	COMPARAR:
		;push ax
		;push bx
		;mov ax,bx
		;ConvertirString bufferMayor
		;imprimir saltoDeLinea
		;imprimir bufferMayor
		;pop bx
		;pop ax

		add ax,bx

		;push ax
		;ConvertirString bufferMayor
		;imprimir saltoDeLinea
		;imprimir bufferMayor
		;pop ax

		jmp SETNUV
	DIVID:

		dec contadorAUX
		mov bx, contadorAUX

		;push ax
		;push bx
		;mov ax,bx
		;ConvertirString bufferMayor
		;imprimir saltoDeLinea
		;imprimir bufferMayor
		;pop bx
		;pop ax
		cwd
		idiv bx
		;push ax
		;imprimir aqui
		;pop ax
		xor ah,ah
		
	FIN:
		;imprimir cMul
		pop di	
		pop si
		ConvertirString bufferMayor
endm
buscarMenor2 macro buffer
	local INICIO,FIN,COMPARAR,SETNUV
	push si
	push di
	xor si,si
	xor di,di

	;xor ax,ax
	;xor bx,bx
	INICIO:
		inc di
		inc di
		mov si, contadorArNAUX
		;mov di, contadorEncN
		mov ax, buffer[di]
	SETNUV:
		inc di
		inc di
		cmp di,si
		jg FIN
		;mov di,contadorEncN
		mov bx, buffer[di]
		cmp bx,'$'
		je SETNUV
		cmp bx,ax
		jl COMPARAR
		jmp SETNUV

	COMPARAR:

		mov ax,bx
		jmp SETNUV

	FIN:
		;mov contadorDI,di
		pop di	
		pop si
		;ConvertirString bufferMayor

endm

eliminarValor2 macro buffer
	local INICIO,FIN,ELIMINAR
	push si
	push di
	xor si,si
	xor di,di
	INICIO:
		inc si
		inc si
		cmp ax,buffer[si]
		je ELIMINAR
		jmp INICIO
	ELIMINAR:
		mov buffer[si],'$'
		jmp FIN
	FIN:
	pop di
	pop si
endm

buscarMediana macro 
local INICIO,FIN,AVANZAR
	INICIO:
	mov ax,valorGuardarArr
	mov bx,2
	cwd
	idiv bx
	xor ah,ah
	mov bx,1
	add ax,bx
	mov si,ax
	mov ax,arregloCopiaAUX[si]
	cmp ax,'$'
	je AVANZAR
	ConvertirString bufferMayor
	jmp FIN
	AVANZAR:
	imprimir aqui
	dec si 
	dec si
	mov ax,arregloCopiaAUX[si]
	ConvertirString bufferMayor
	jmp FIN
	FIN:
endm

ordenarDatos macro
	local INICIO,FIN,SIGUIENTE,COMP
	xor si,si
	;xor si,si
	xor di,di
	mov si, contadorArNAUX
	INICIO:
		

		inc di
		inc di
		mov ax,arregloNumerosAUX[di]
		cmp ax,'$'

		je SIGUIENTE

		mov arregloCopia[di],ax
		jmp INICIO

	SIGUIENTE:
		xor di,di
		jmp COMP

	COMP:
		;push ax
		;imprimir aqui
		;pop ax

		inc di
		inc di
		cmp di,si
		jg FIN
		buscarMenor2 arregloCopia
		push di
		inc valorGuardarArr
		inc valorGuardarArr
		mov di, valorGuardarArr
		mov arregloCopiaAUX[di],ax
		pop di
		eliminarValor2 arregloCopia
		
		;ConvertirString bufferMayor
		;push ax
		;imprimir saltoDeLinea
		;imprimir bufferMayor
		;pop ax
		
		jmp COMP
	FIN:


endm

buscarModa macro
	local INICIO21,FIN21,COMPARAR21,SETNUV21,DIVID21,DARVALOR21
	;push si
	;push di
	xor si,si
	xor di,di

	xor ax,ax
	xor bx,bx
	LimpiarArreglo2 arregloModa
	INICIO21:
		
		inc di
		inc di
		xor si,si
		mov contadorAUX,0
		;inc si
		;inc si
		;inc contadorAUX
		;mov si, contadorArNAUX
		;mov di, contadorEncN
		mov ax, arregloNumerosAUX[di]
		cmp ax,'$'
		je FIN21
		JMP SETNUV21
	SETNUV21:
		;push ax
		;ConvertirString bufferMayor
		
		;imprimir bufferMayor
		;pop ax
		inc si
		inc si
		;inc contadorAUX
		;mov di,contadorEncN
		mov bx, arregloNumerosAUX[si]
		cmp bx,'$'
		je DIVID21
		cmp ax,bx
		je COMPARAR21
		jmp SETNUV21

	COMPARAR21:;3
		inc contadorAUX
		jmp SETNUV21
	DIVID21:
		
		push di
		push si
		xor di,di
		xor si,si
		mov di,contadorAUX
		mov si, contadorEncN
		cmp si,di
		jl DARVALOR21

		pop si
		pop di
		JMP INICIO21
		;dec contadorAUX
		;mov bx, contadorAUX
		;idiv bl
		;xor ah,ah

	DARVALOR21:

		pop si
		pop di
		mov si,contadorAUX
		mov contadorEncN,si
		
		;xor di,di
		;LimpiarArreglo arregloModa
		mov arregloModa[0],ax
		;pop di
		;push ax
		;imprimir aqui
		;pop ax
		jmp INICIO21
	FIN21:
		;pop di	
		;pop si
		;push di
		;xor di,di
		mov ax, arregloModa[0]
		ConvertirString bufferMayor
		;pop di
endm

buscarID macro
	local INICIO,FIN,COMILLA,IDEN,FINCOMILLA,COMA,THEEND,INCR
	xor si,si
	xor di,di
	xor ax,ax
	xor bx,bx
	xor dx,dx
	INICIO:
		cmp reporte[si], '"'
		;mov identificadores[di],buffer[si]
		je COMILLA
		INC si
		JMP INICIO

	COMILLA:
		LimpiarArreglo arregloID
		;xor dx,dx
		;mov dl,'"'
		;mov reporte[di],dl
		;inc di 
		;inc si
		;jmp IDEN
		
	IDEN:
		inc si
		cmp reporte[si],'"'
		je	FINCOMILLA
		;xor di, di
		mov dl,reporte[si]
		mov arregloID[di],dl
		inc di
		
		;inc si
		jmp IDEN
	FINCOMILLA:

		compararArreglo bufferConsola, arregloID

		cmp indiceIgual,0b
		je INCR
		cmp indiceIgual,1b
		je THEEND
	INCR:
		inc contadorDI
		inc contadorDI
		JMP COMA
	COMA:

		xor di,di
		
		inc si
		cmp reporte[si],','
		je INICIO
		cmp reporte[si],'{'
		je INICIO

		cmp reporte[si],'$'
		je FIN
		

		jmp COMA
	THEEND:
		;imprimir aqui
		mov si,contadorDI
		mov ax, arregloNumerosAUX[si]
		ConvertirString bufferMayor
		;imprimir bufferMayor
		;xor di,di
		
		;cmp reporte[si],'}'
		;inc si
		;je FIN

		;mov dl,reporte[si]
		;mov bufferMayor[di],dl
		;inc di
		;jmp THEEND

	FIN:

endm

agregarJson macro 
	local INICIO, FIN,PUNTO
	push si
	xor si,si
	INICIO:
		
		cmp arregloID[si],'$'
		je PUNTO
		inc si
		jmp INICIO
	PUNTO:
		xor dx,dx
		mov dl,'.'
		mov arregloID[si],dl
		inc si 

		xor dx, dx
		mov dl,'j'
		mov arregloID[si],dl

		inc si 

		xor dx, dx
		mov dl,'s'
		mov arregloID[si],dl

		inc si 

		xor dx, dx
		mov dl,'o'
		mov arregloID[si],dl
		

		inc si 

		xor dx, dx
		mov dl,'n'
		mov arregloID[si],dl

		inc si 

		xor dx, dx
		mov dl,0
		mov arregloID[si],dl
	FIN:
		pop si
endm


contarNumBytes macro
	local INICIO,FIN
	push si
	xor si,si
	mov contadorBytes,0
	INICIO:
		cmp bufferMayor[si],'$'
		je FIN
		inc si
		inc contadorBytes
		jmp INICIO

	FIN:
	pop di
endm




contarNumBytesRepor macro
	local INICIO,FIN
	push si
	xor si,si
	mov contadorBytes,0
	INICIO:
		cmp reporte[si],'$'
		je FIN
		inc si
		inc contadorBytes
		jmp INICIO

	FIN:
	pop di
endm

llenarArchivo macro 
	escribirEnArchivo handleFichero,_openJson,sizeof _openJson ;cabecera
	escribirEnArchivo handleFichero,_diaJson,sizeof _diaJson   ;DIA
	mov al,dia
	ConvertirString arregloDia
	escribirEnArchivo handleFichero,arregloDia,sizeof arregloDia
	escribirEnArchivo handleFichero,_coma,sizeof _coma

	
	escribirEnArchivo handleFichero,_mesJson,sizeof _mesJson
	mov al,mes
	ConvertirString arregloMes
	escribirEnArchivo handleFichero,arregloMes,sizeof arregloMes
	escribirEnArchivo handleFichero,_coma,sizeof _coma

	escribirEnArchivo handleFichero,_anioJson,sizeof _anioJson
	mov ax,ano
	ConvertirString arregloAnio
	escribirEnArchivo handleFichero,arregloAnio,sizeof arregloAnio
	escribirEnArchivo handleFichero,_coma,sizeof _coma
	;LimpiarArreglo bufferMayor
	escribirEnArchivo handleFichero,_finFecha,sizeof _finFecha

	escribirEnArchivo handleFichero,_inicHora,sizeof _inicHora
	escribirEnArchivo handleFichero,_horaLLAVA,sizeof _horaLLAVA

	escribirEnArchivo handleFichero,_horaJson,sizeof _horaJson

	mov al,hora
	ConvertirString arregloHora
	escribirEnArchivo handleFichero,arregloHora,sizeof arregloHora
	escribirEnArchivo handleFichero,_coma,sizeof _coma

	escribirEnArchivo handleFichero,_minutosJson,sizeof _minutosJson
	mov al,min
	ConvertirString arregloMinutos
	escribirEnArchivo handleFichero,arregloMinutos,sizeof arregloMinutos
	escribirEnArchivo handleFichero,_coma,sizeof _coma

	escribirEnArchivo handleFichero,_segundosJson,sizeof _segundosJson
	mov al,sec
	ConvertirString arregloSegundos
	escribirEnArchivo handleFichero,arregloSegundos,sizeof arregloSegundos
	escribirEnArchivo handleFichero,_coma,sizeof _coma

	escribirEnArchivo handleFichero,_finHora,sizeof _finHora

	escribirEnArchivo handleFichero,_inicResultado,sizeof _inicResultado
	escribirEnArchivo handleFichero,_reLLAVA,sizeof _reLLAVA
	;mov contadorBytes,0

	escribirEnArchivo handleFichero,_mediaJson,sizeof _mediaJson

	mov indiceIgual,0b
	mov contadorBytes,0
	LimpiarArreglo bufferMayor
	LimpiarArreglo bufferConsola
	LimpiarArreglo2 arregloCopia
	LimpiarArreglo2 arregloCopiaAUX
	mov contadorAUX,0
	mov contadorEncN,0
	mov valorGuardarArr,0
	mov contadorDI,0

	buscarMedia
	contarNumBytes
	escribirEnArchivo handleFichero,bufferMayor,contadorBytes
	;mov contadorBytes,0
	;LimpiarArreglo bufferMayor
	escribirEnArchivo handleFichero,_coma,sizeof _coma
	



	escribirEnArchivo handleFichero,_medianaJson,sizeof _medianaJson
	mov indiceIgual,0b
	mov contadorBytes,0
	LimpiarArreglo bufferMayor
	LimpiarArreglo bufferConsola
	LimpiarArreglo2 arregloCopia
	LimpiarArreglo2 arregloCopiaAUX
	mov contadorAUX,0
	mov contadorEncN,0
	mov valorGuardarArr,0
	mov contadorDI,0

	ordenarDatos
	buscarMediana
	contarNumBytes
	escribirEnArchivo handleFichero,bufferMayor,contadorBytes
	LimpiarArreglo bufferMayor
	mov contadorBytes,0

	escribirEnArchivo handleFichero,_coma,sizeof _coma
	;-----

	escribirEnArchivo handleFichero,_modaJson,sizeof _modaJson

	mov indiceIgual,0b
	mov contadorBytes,0
	LimpiarArreglo bufferMayor
	LimpiarArreglo bufferConsola
	LimpiarArreglo2 arregloCopia
	LimpiarArreglo2 arregloCopiaAUX
	mov contadorAUX,0
	mov contadorEncN,0
	mov valorGuardarArr,0
	mov contadorDI,0

	buscarModa
	contarNumBytes
	escribirEnArchivo handleFichero,bufferMayor,contadorBytes
	LimpiarArreglo bufferMayor
	mov contadorBytes,0

	escribirEnArchivo handleFichero,_coma,sizeof _coma
	;------------

	escribirEnArchivo handleFichero,_menorJson,sizeof _menorJson


	mov indiceIgual,0b
	mov contadorBytes,0
	LimpiarArreglo bufferMayor
	LimpiarArreglo bufferConsola
	LimpiarArreglo2 arregloCopia
	LimpiarArreglo2 arregloCopiaAUX
	mov contadorAUX,0
	mov contadorEncN,0
	mov valorGuardarArr,0
	mov contadorDI,0

	buscarMenor
	contarNumBytes
	escribirEnArchivo handleFichero,bufferMayor,contadorBytes
	LimpiarArreglo bufferMayor
	mov contadorBytes,0


	escribirEnArchivo handleFichero,_coma,sizeof _coma
	;------------

	escribirEnArchivo handleFichero,_mayorJson,sizeof _mayorJson

	mov indiceIgual,0b
	mov contadorBytes,0
	LimpiarArreglo bufferMayor
	LimpiarArreglo bufferConsola
	LimpiarArreglo2 arregloCopia
	LimpiarArreglo2 arregloCopiaAUX
	mov contadorAUX,0
	mov contadorEncN,0
	mov valorGuardarArr,0
	mov contadorDI,0

	buscarMayor
	contarNumBytes
	escribirEnArchivo handleFichero,bufferMayor,contadorBytes
	LimpiarArreglo bufferMayor
	mov contadorBytes,0

	escribirEnArchivo handleFichero,_coma,sizeof _coma
	;------------


	escribirEnArchivo handleFichero,_finRE,sizeof _finRE

	contarNumBytesRepor
	escribirEnArchivo handleFichero,reporte,contadorBytes

	escribirEnArchivo handleFichero,_finLLavePadre,sizeof _finLLavePadre
	escribirEnArchivo handleFichero,_finLLavePrincipal,sizeof _finLLavePrincipal
endm



LimpiarArreglo2 macro buffer
	local INICIO, FINAL
		push si
		xor si,si
	INICIO:
		inc si
		inc si
		cmp buffer[si],'$'
		je FINAL
		mov buffer[si],'$'
		jmp INICIO
	FINAL:
		pop si
endm

.model small
.stack 100h 
.data
;================ SEGMENTO DE DATOS ==============================
encabezadoMenu db 		0ah,0dh,'UNIVERSIDAD DE SAN CARLOS DE GUATEMALA',
						0ah,0dh,'FACULTAD DE INGENIERIA',
						0ah,0dh,'CIENCIAS Y SISTEMAS',
						0ah,0dh,'ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1',
						0ah,0dh,'NOMBRE: JESUS ALEJANDRO MANSILLA VILLATORO',
						0ah,0dh,'CARNET: 201709396',
						0ah,0dh,'SECCION: A',
						0ah,0dh,'$'

menuPrincipal db 	0ah,0dh,'1) Cargar Archivo',
						0ah,0dh,'2) show',
						0ah,0dh,'3) Salir',
						0ah,0dh, 'Escoja una opcion: ',
						0ah,0dh,'$'				


menuConsola db			0ah,0dh,'----- Consola show -----',
						0ah,0dh,'>>',
						0ah,0dh,'> ','$'	


mensajeCarga db 0ah,0dh,'Ingrese nombre del archivo:','$'

indiceCarga db 0
handleFichero dw ?
inputbuffer db 50 dup('$')
;BUFFERRRRR
bufferLeer db 1000 dup('$')
identificadores db 1000 dup('$')
MDSR db 20 dup('$')
resultado db 10 dup('$')
pruebaN db 1 dup('$')
saltoDeLinea db 0ah,0dh,'$'

errorCargar db 0ah,0dh,'Error en la carga','$'
errorA db 0ah,0dh,'Error al abrir el archivo','$'
infoCarga db 0ah,0dh,'Informacion cargada con exito','$'

indiceIgual db 0b
indiceNUMN db 0b

cMul db 'mul','$'
cDiv db 'div','$'
cAdd db 'add','$'
cSub db 'sub','$'

ejMT db 0ah,0dh, 'ENTRO EN MULTIPLICAR','$'
ejDV db 0ah,0dh, 'ENTRO EN DIVIDIR','$'
ejRT db 0ah,0dh, 'ENTRO EN RESTAR','$'
ejSM db 0ah,0dh, 'ENTRO EN SUMAR','$'
ejNM db 0ah,0dh, 'ENTRO EN NUMERO','$'

aqui db 0ah,0dh, 'ENTRO AQUI','$'
contador dw 0




;====================== GUARDAR VALORES ==========
arregloNumeros dw 1000 dup('$')
arregloNumerosAUX dw 1000 dup('$')
reporte db 1000 dup('$')
bufferPadre db 20 dup('$')
contadorArN dw 0
contadorArNAUX dw 0
msgFin db 0ah, 0dh, 'bien hecho llegaste al final','$'



;================ARREGLO CONSOLA=================
bufferConsola db 1000 dup('$')

cMedia db 'media','$'
cModa db 'moda','$'
cMediana db 'mediana','$'
cMayor db 'mayor','$'
cMenor db 'menor','$'
cExit db 'exit','$'

indiceMayor db 0b
indiceMenor db 0b

contadorEncN dw 0
contadorAUX dw 0

arregloModa dw 1000 dup('$')
arregloCopia dw 1000 dup('$')
arregloCopiaAUX dw 1000 dup('$')

arregloID db 1000 dup('$')

bufferMayor db 1000 dup('$')
numMayor db 0ah,0dh, 'El numero mayor es: ','$'
numMenor db 0ah,0dh, 'El numero menor es: ','$'
numMedia db 0ah,0dh, 'La media es : ','$'
numModa db 0ah,0dh, 'La moda es : ','$'
numMediana db 0ah,0dh, 'La mediana es : ','$'
numID db 0ah,0dh, 'Resultado ','$'
espacio db ' ','$'

;numModa db 0ah,0dh, 'Con el numero ','$'

arregloDia db 0,0
arregloMes db 0,0
arregloAnio db 0,0,0,0

arregloHora db 0,0
arregloMinutos db 0,0
arregloSegundos db 0,0

contadorDI dw 0
valorGuardarArr dw 0

hora db 00h,00h, 'H '
min db 00h,00h, 'M '
sec db 00h,00h, 'S '
dia db 00h,00h, 'D '
ano dw 00h, 'A '
mes db 00h,00h, 'M '


AUXhora db 00h,00h, 'H '
AUXmin db 00h,00h, 'M '
AUXsec db 00h,00h, 'S '
AUXdia db 00h,00h, 'D '
AUXano db 00h,00h,00h,00h, '2020A '
AUXmes db 00h,00h, 'M '


contadorCModa db 0
mensajeNoModa db '"No hay"','$'

contadorBytes dw 0

;rutaArchivo db 'pr34.json',0


_openJson db 		'{',
			0ah,0dh,	' "reporte":',
			0ah,0dh,	' {',
			0ah,0dh,	'  "alumno":',
			0ah,0dh,	'  {',
			0ah,0dh,	'    "Nombre": "JESUS ALEJANDRO MANSILLA VILLATORO"',
			0ah,0dh,	'    "Carnet": "201709396"',
			0ah,0dh,	'    "Seccion":  "A"',
			0ah,0dh,	'    "Curso": "Arquitectura de Computadoras y Ensambladores 1"',
			0ah,0dh,	'  },',
			0ah,0dh,	'  "fecha":',
			0ah,0dh,	'   {'

_diaJson db 0ah,0dh,     '    "Dia":'	
_mesJson db 0ah,0dh,     '    "Mes":'	
_anioJson db 0ah,0dh,     '    "Año":'
_finFecha db 0ah,0dh,    '  },'

_inicHora db 0ah,0dh,    '  "hora":'
_horaLLAVA db 0ah,0dh,   '   {'

_horaJson db 0ah,0dh,     '    "Hora":'	
_minutosJson db 0ah,0dh,     '    "Minutos":'	
_segundosJson db 0ah,0dh,     '    "Segundos":'
_finHora db 0ah,0dh,    '  },'

_inicResultado db 0ah,0dh,    '  "resultado":'
_reLLAVA db 0ah,0dh,   '   {'

_mediaJson db 0ah,0dh,     '    "Media":'	
_medianaJson db 0ah,0dh,     '    "Mediana":'	
_modaJson db 0ah,0dh,     '    "Moda":'
_menorJson db 0ah,0dh,     '    "Menor":'	
_mayorJson db 0ah,0dh,     '    "Mayor":'	

_finRe db 0ah,0dh,    '  }'

_finLLavePadre db 0ah,0dh,    ' }'
_finLLavePrincipal db 0ah,0dh,    '}'

_coma db ','

todoBien db 0ah,0dh, 'El archivo se ha cargado con exito','$'




.code ;segmento de código
;================== SEGMENTO DE CODIGO ===========================
	main proc
			mov dx,@data
			mov ds,dx
			imprimir encabezadoMenu

		MENU:
			imprimir menuPrincipal
			obtenerDato
			;imprimir aqui
			cmp al, '1'
			je CARGARARCHIVO
			cmp al, '2'
			je CONSOLA
			cmp al, '3'
			je Salir
			jmp MENU

		CARGARARCHIVO:
			mov indiceCarga,0
			mov contadorArNAUX,0
			mov contadorArN,0
			LimpiarArreglo reporte
			LimpiarArreglo2 arregloNumeros
			LimpiarArreglo2 arregloNumerosAUX
			LimpiarArreglo bufferLeer
			imprimir mensajeCarga
			obtenerRuta inputbuffer
			abrirArchivo inputbuffer, handleFichero
			leerArchivo sizeof bufferLeer,bufferLeer,handleFichero
			cerrarArchivo handleFichero
			INICIOLEER bufferLeer
			imprimir saltoDeLinea
			;LimpiarArreglo reporte
			;imprimir todoBien
			;imprimir reporte
			;imprimir MDSR
			;
			cmp indiceCarga,0
			je ErrorCarga
			imprimir infoCarga
			imprimir saltoDeLinea
			jmp MENU

		CONSOLA:
			mov indiceIgual,0b
			mov contadorBytes,0
			LimpiarArreglo bufferMayor
			LimpiarArreglo bufferConsola
			LimpiarArreglo2 arregloCopia
			LimpiarArreglo2 arregloCopiaAUX
			mov contadorAUX,0
			mov contadorEncN,0
			mov valorGuardarArr,0
			mov contadorDI,0
			imprimir menuConsola
			obtenerTexto bufferConsola
			buscarID
			;compararArreglo bufferConsola, arregloID
			cmp indiceIgual,1b
			je COID
			compararArreglo bufferConsola,cMedia
			cmp indiceIgual,1b
			je COMEDIA
			compararArreglo bufferConsola,cModa

			cmp indiceIgual,1b
			je COMODA
			compararArreglo bufferConsola,cMediana
			cmp indiceIgual,1b
			je COMEDIANA
			compararArreglo bufferConsola,cMayor
			cmp indiceIgual,1b
			je COMAYOR 
			compararArreglo bufferConsola,cMenor
			cmp indiceIgual,1b
			je COMENOR
			compararArreglo bufferConsola,cExit
			cmp indiceIgual,1b
			je COEXIT
			jmp CONSOLA

		ErrorCarga:
			imprimir errorCargar
			mov indiceCarga,0
		ErrorAbrir:
			imprimir errorA
			jmp MENU

		otroError:
			imprimir errorCargar
			jmp MENU
		ErrorCrear:
			imprimir aqui
			jmp MENU

		COEXIT:
			jmp MENU

		COMAYOR:
			buscarMayor 
			push ax
			imprimir numMayor
			pop ax
			imprimir bufferMayor
			jmp CONSOLA
		COMENOR:
			buscarMenor
			push ax
			imprimir numMenor
			pop ax
			imprimir bufferMayor
			jmp CONSOLA
		COMEDIA:
			buscarMedia
			push ax
			imprimir numMedia
			pop ax
			imprimir bufferMayor
			jmp CONSOLA
		COMODA:
			buscarModa
			push ax
			imprimir numModa
			pop ax
			imprimir bufferMayor
			jmp CONSOLA
		COMEDIANA:	
			ordenarDatos
			buscarMediana
			push ax
			imprimir numMediana
			pop ax
			imprimir bufferMayor
			jmp CONSOLA
		COID:
			imprimir numID
			push ax
			imprimir arregloID
			;imprimir aqui
			imprimir espacio
			cmp contadorDI,0
			je CREARREPORTE
			imprimir bufferMayor
			pop ax
			jmp CONSOLA
		CREARREPORTE:
			agregarJson
			;imprimir arregloID
			;imprimir aqui
			;imprimir aqui
			getFecha
			getHora
			crearArchivo arregloID,handleFichero
			obtenerDato
			abrirArchivo arregloID,handleFichero
			escribirEnArchivo handleFichero,_openJson,sizeof _openJson
			llenarArchivo
			cerrarArchivo handleFichero
			;imprimir aqui
			jmp CONSOLA
		Salir: 
			MOV ah,4ch
			int 21h
	main endp
end  