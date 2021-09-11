
ExtraerCadena macro buffer
	LOCAL Dividir,DIVIDIR2,FINALCr3,NEGATIVO,FINAL2,FINAL
	XOR si,si
	XOR cx,cx
	XOR bx,bx
	XOR dx,dx
	MOV dl,0ah
	JNE NEGATIVO
	JMP DIVIDIR2

	NEGATIVO:
		neg ax
		MOV buffer[si],45
		INC si
		JMP DIVIDIR2
	Dividir:
		XOR ah,ah
	DIVIDIR2:
		div dl
		INC cx
		PUSH ax
		CMP al,00h
		JE FINALCr3
		JMP Dividir
	FINALCr3:
		POP ax
		add ah,30h
		MOV buffer[si],ah
		INC si
		LOOP FINALCr3
		MOV ah,24h
		MOV buffer[si],ah
		INC si
	FINAL:
endm


Estados macro buffer
	LOCAL ENCICLAR, FINAL
		ENCICLAR:
			MOV si, variable_indices_bf
			MOV ah, buffer[si]
			MOV di, SIZEOF buffer
			CMP si, di
			JGE FINAL
			CMP ah, 0
			JE IS_NULL
			CMP ah, 20h
			JE IS_NULL
			CMP ah, 7bh
			JE IS_NULL
			CMP ah, 7dh
			JE IS_NULL
			CMP ah, 5bh
			JE IS_NULL
			CMP ah, 5bh
			JE IS_NULL
			CMP ah, 9h
			JE IS_NULL
			CMP ah, dh
			JE IS_NULL
			CMP ah, 2ch
			JE IS_NULL
			CMP ah, 22h
			JE IS_COMILLA
			MOV si, variable_IS_letter
			CMP si, 1
			JE  IS_letter
			MOV si, variable_indices_bf
			INC si
			MOV variable_indices_bf, si
			JMP ENCICLAR	
		A_OPERADOR:
			PUSH si
			MOV si, variable_indices_bf
			INC si
			INC si
			MOV variable_indices_bf, si
			MOV variable_contador_opr, 0	
			JMP ENCICLAR
		
		IS_NULL:
			MOV si, variable_indices_bf
			INC si
			MOV variable_indices_bf, si
			JMP ENCICLAR
		
		IS_COMILLA:
			MOV di, variable_IS_letter
			CMP di, 1
			JE ACEPT_letter
			
			MOV si, variable_indices_bf
			INC si
			MOV variable_indices_bf, si
			
			MOV ah, buffer[si]
			
			CMP ah, 23h
			JE IS_NUMERO
			
			MOV si, 2bh
			CMP ah, 2bh;es suma
			JE A_OPERADOR
			
			MOV si, 2ah
			CMP ah, 2ah;es multi
			JE IS_NULL			
			
			MOV si, 2fh
			CMP ah, 2fh;es div
			JE IS_NULL
			
			MOV si, 2dh
			CMP ah, 2dh;es resta
			JE A_OPERADOR 	
			
			CMP ah, 23h;
			JE IS_NULL
			
			JMP IS_letter_VALIDACION1
			JMP ENCICLAR
		
		IS_NUMERO:
			MOV si, variable_indices_bf
			add si, 3
			MOV variable_indices_bf, si
			MOV si, variable_contador_opr
			CMP si, 0
			JE ADD_OP_left
			CMP si, 1
			JE ADD_OP_right
			JMP ENCICLAR
		ADD_OP_right:
			Clear variable_ope_right_let
			IS_NUMERO buffer, variable_ope_right_let
			ToAscii variable_ope_right_let
			PUSH ax
			Print variable_ope_right_let
			JMP OPERAR	
		ADD_OP_left:
			Clear variable_ope_left_let
			IS_NUMERO buffer, variable_ope_left_let
			ToAscii variable_ope_left_let
			PUSH ax
			Print variable_ope_left_let
			MOV variable_contador_opr, 1
			JMP ENCICLAR
		OPERAR:
			METODO_OPERAR
			JMP ENCICLAR	
		
		ACEPT_letter:	
			MOV si, variable_indices_bf
			INC si
			MOV variable_indices_bf, si	
				
			MOV di, variable_indices_ids
			MOV variable_ids[di], 3bh
			INC di
			
			MOV variable_indices_ids, di
			MOV variable_IS_letter, 00
			
			MOV si, variable_indices_res
			CMP si, 00
			JE INCE
			
			XOR ax,ax
			XOR bx,bx
			POP ax
			CMP ax,23h
			jne arrayR_VALOR
			POP ax	
			JMP ENCICLAR
		INCE:
			MOV variable_indices_res, 5
			JMP ENCICLAR
		arrayR_VALOR:
			
			MOV si, variable_indices_res
			MOV variable_array_res[si], ax
			MOV variable_array_rIS_aux[si], ax
			MOV bx, variable_array_res[si]
				
			MOV si, variable_indices_res
			add si,5
			MOV variable_indices_res, si
			
			MOV ax, variable_contador_est
			INC ax
			MOV variable_contador_est, ax

			JMP ENCICLAR
		IS_letter_VALIDACION3:
			MOV si, variable_indices_bf
			MOV ah, buffer[si]
			CMP ah, 41h
			JGE IS_letter_VALIDACION2
			JMP ENCICLAR
		
		IS_letter_VALIDACION2:
			MOV si, variable_indices_bf
			MOV ah, buffer[si]
			CMP ah, 5AH	
			jle IS_letter
			JMP ENCICLAR
		
		IS_letter_VALIDACION1:
			MOV si, variable_indices_bf
			MOV ah, buffer[si]
			CMP ah, 61H
			JGE IS_letter_MID
			JMP ENCICLAR
			
		IS_letter_MID:
		
			MOV si, variable_indices_bf
			MOV ah, buffer[si]
			CMP ah, 7AH	
			jle IS_letter
			JMP ENCICLAR
	
		IS_letter:
			MOV si, variable_indices_bf
			MOV di, variable_indices_ids
			MOV ah, buffer[si]
			
			CMP ah, 22h
			JE IS_COMILLA

			MOV variable_ids[di], ah
			INC di
			INC si
			MOV variable_indices_bf, si
			MOV variable_indices_ids, di
			MOV variable_IS_letter, 1
			JMP ENCICLAR
		
		FINAL:
			XOR ax,ax
			XOR bx,bx
			POP ax
			MOV si, variable_indices_res
			MOV variable_array_res[si], ax
			MOV variable_array_rIS_aux[si], ax
			MOV variable_rIS_length, si
			MOV variable_indices_res, 00
			MOV ax, variable_contador_est
			INC ax
			MOV variable_contador_est, ax

			JMP Menu_P
endm

Clear macro buffer
	LOCAL ENCICLAR
		MOV si,0
		MOV cx,0
		MOV cx, SIZEOF buffer
		ENCICLAR:
		MOV buffer[si],0
		INC si
		LOOP ENCICLAR
endm

ClearS macro buffer
	LOCAL ENCICLAR
		MOV si,0
		MOV cx,0
		MOV cx, SIZEOF buffer
		ENCICLAR:
		MOV buffer[si],20h 
		INC si
		LOOP ENCICLAR
endm

ToAscii macro numero
	LOCAL INI,FINAL
	XOR ax,ax
	XOR bx,bx
	XOR cx,cx
	MOV bx,10	
	XOR si,si
	INI:
		MOV cl,numero[si] 
		CMP cl,48
		jl FINAL
		CMP cl,57
		JG FINAL
		INC si
		SUB cl,48
		mul bx	
		add ax,cx
		JMP INI
	FINAL:
endm


ORDER_ASC macro
	LOCAL INI, FINAL, CICLO_1, CICLO_2	
	INI:
		MOV variable_indices_res, 0; i
		MOV variable_indices_res1, 0; j
		JMP CICLO_1	
	CICLO_1:
		MOV si, variable_indices_res
		CMP si, variable_rIS_length
		JGE FINAL
		JMP CICLO_2
	CICLO_2:	
		MOV si, variable_indices_res
		MOV di, variable_rIS_length
		SUB di, si
		MOV variable_condicion, di
		
		MOV si, variable_indices_res1
		CMP si, variable_condicion
		JGE OUT_F2
		
		MOV ax, variable_array_rIS_aux[si + 5]
		CMP ax, variable_array_rIS_aux[si]
		JGE INC_F2
		
		MOV variable_val_aux, ax
		MOV ax, variable_array_rIS_aux[si]
		MOV variable_array_rIS_aux[si + 5], ax
		MOV ax, variable_val_aux
		MOV variable_array_rIS_aux[si], ax
	
		MOV si, variable_indices_res1
		add si, 5
		MOV variable_indices_res1, si
		
		JMP CICLO_2	
	INC_F2:
		MOV si, variable_indices_res1
		add si, 5
		MOV variable_indices_res1, si
		JMP CICLO_2
	
	OUT_F2:
		MOV variable_indices_res1, 0
		MOV si, variable_indices_res
		add si, 5
		MOV variable_indices_res, si
		JMP CICLO_1
	FINAL:
		
		MOV ax, variable_array_rIS_aux[0]
		MOV variable_menor, ax	
		MOV si, variable_rIS_length
		MOV ax, variable_array_rIS_aux[si]
		MOV variable_mayor, ax
		MOV variable_indices_res, 0
		MOV variable_indices_res1, 0
		
		METODO_MEDIA
		
endm

METODO_MEDIA macro
	LOCAL  INI, FINAL
	MOV variable_contador, 0
	INI:
		MOV si, variable_indices_res1
		CMP si, variable_rIS_length
		JG FINAL
		MOV ax, variable_MEDIA
		MOV bx, variable_array_rIS_aux[si]
		
		add ax, bx
		MOV variable_MEDIA, ax
		MOV si, variable_indices_res1
		add si, 5
		MOV variable_indices_res1, si
		
		JMP INI
	FINAL:
		Clear variable_cadena
		MOV ax, variable_MEDIA
		
		ExtraerCadena variable_cadena
		Print variable_cadena
		
		MOV ax, variable_MEDIA
		SUB ax, 36
		MOV bx, variable_contador_est
		MOV dx, 0
		div bx
		MOV variable_MEDIA, ax
		
		Clear variable_cadena
		MOV ax, variable_MEDIA
		
		ExtraerCadena variable_cadena
		Print variable_cadena
		
		MOV variable_indices_res, 0
		MOV variable_indices_res1, 0
		METODO_MEDIANA
endm

METODO_MEDIANA macro
	LOCAL INI, FINAL, FINAL_1
	INI:
		MOV ax, variable_contador_est
		MOV bx, 2
		MOV dx, 0
		DIV bx
		MOV cx, 5
		IMUL cx
		MOV si, 0
		add si, ax
		MOV bx, variable_array_rIS_aux[si]
		CMP bx, 36
		JE FINAL_1
		MOV variable_MEDIAna, bx
		JMP FINAL
	FINAL_1:
		MOV bx, variable_array_rIS_aux[si + 5]
		MOV variable_MEDIAna, bx
		JMP FINAL
	FINAL:	
		METODO_MODA
endm

METODO_COMANDO macro

endm

METODO_OPERAR macro
	LOCAL INI, FINAL, FINAL_1, FINAL_2
	INI:
		XOR ax,ax
		XOR bx,bx
		POP ax
		MOV variable_ope_left_num, ax
		MOV bx, ax
		POP ax 
		CMP ax, 2bh
		JE FINAL_1
		CMP ax, 23h
		JE FINAL_2
		MOV variable_ope_right_num, ax
		POP si
		CMP si, 2bh
		JE SUMAR	
		CMP si, 2dh
		JE RESTAR	
		CMP si, 2dh
		JMP FINAL	
	MULTIPLICAR:
		MOV ax, variable_ope_right_num
		MOV bx, variable_ope_left_num
		IMUL bx, ax
		PUSH bx
		JMP INI
	DIVIDIR:
		MOV ax, variable_ope_right_num
		MOV bx, variable_ope_left_num
		IDIV bx, ax
		PUSH bx
		JMP INI
	SUMAR:
		MOV ax, variable_ope_right_num
		MOV bx, variable_ope_left_num
		add bx, ax
		PUSH bx
		JMP INI
	RESTAR:
		MOV ax, variable_ope_right_num
		MOV bx, variable_ope_left_num
		SUB bx, ax
		PUSH bx
		JMP INI
	FINAL_1:
		PUSH ax
		PUSH bx
		MOV variable_contador_opr, 1
		JMP FINAL_2
	FINAL:
		PUSH bx
		MOV variable_contador_opr, 1
		
	FINAL_2:
		XOR ax,ax
		XOR bx,bx
endm

IS_NUMERO macro buffer, variable
	LOCAL INI, FINAL, MINIMO_N, MAXIMO_N
	
	INI:
		MOV si, variable_indices_bf
		MOV di, variable_indices_str
		MOV ah, buffer[si]
		
		CMP ah, 7dh
		JE 	FINAL
		CMP ah, 2ch
		JE FINAL
		CMP ah, 0h
		JE	FINAL
		CMP ah, 9h
		JE 	FINAL
		CMP ah, 20h
		JE FINAL
		CMP si, SIZEOF buffer
		JE FINAL
		
		CMP ah, 30h
		JGE MINIMO_N
		JMP FINAL
		
	MINIMO_N:
		CMP ah, 39h
		jle MAXIMO_N
		JMP FINAL
	MAXIMO_N:
		MOV variable[di], ah
		INC si
		INC di
		MOV variable_indices_bf, si
		MOV	variable_indices_str, di
		
		JMP INI
	
	FINAL:
		MOV variable_indices_str, 0
endm

METODO_Reporte macro handle
		Print 	msg_ing_route
			Clear 	variable_route_a
				O_route 		variable_route_a
					Create_UNO 	variable_route_UNO ,handle
		Writter_UNO 	reporte_head, handle
		Writter_UNO 	reporte_info, handle
		Writter_UNO 	reporte_day, handle
		Writter_UNO 	reporte_mes, handle
		Writter_UNO 	reporte_year, handle
		Writter_UNO 	reporte_hora_h, handle
		Writter_UNO 	reporte_hora, handle
		Writter_UNO 	reporte_min, handle
		Writter_UNO 	reporte_seg, handle
		Writter_UNO 	reporte_result, handle
			ClearS variable_cadena
			MOV ax, variable_MEDIA
			ExtraerCadena variable_cadena
		Writter_UNO 	reporte_MEDIA, handle
		Writter_UNO 	variable_cadena, handle
			ClearS variable_cadena
			MOV ax, variable_MEDIAna
			ExtraerCadena variable_cadena
		Writter_UNO 	reporte_MEDIAna, handle
		Writter_UNO 	variable_cadena, handle
			ClearS variable_cadena
			MOV ax, variable_moda
			ExtraerCadena variable_cadena
		Writter_UNO 	reporte_moda, handle
		Writter_UNO 	variable_cadena, handle
			ClearS variable_cadena
			MOV ax, variable_menor
			ExtraerCadena variable_cadena
		Writter_UNO 	reporte_menor, handle
		Writter_UNO 	variable_cadena, handle
			ClearS variable_cadena
			MOV ax, variable_mayor
		ExtraerCadena variable_cadena
		Writter_UNO 	reporte_mayor, handle
		Writter_UNO 	variable_cadena, handle
			Report_ids handle
			Cerrar_UNO 	handle
endm

Report_ids macro handle
	LOCAL INI, FINAL
			
	MOV variable_indices_str, 1
	MOV variable_indices_ids, 0
	ClearS variable_cadena
	INI:
		MOV si, variable_indices_str
		MOV di, variable_indices_ids
		
		CMP di, SIZEOF variable_ids
		JGE FINAL
		
		MOV ah, variable_ids[di]
		CMP ah, 3bh
		JE LIMP
		
		MOV variable_cadena[0], 	22h
		MOV variable_cadena[si], ah
		INC si
		INC di
		MOV variable_indices_str, si
		MOV variable_indices_ids, di
		
		JMP INI
		
	LIMP:
		MOV variable_cadena[si], 22h
		MOV variable_cadena[si + 1], 3ah
		
		MOV variable_indices_str, 1
		MOV si, variable_indices_ids
		INC si
		MOV variable_indices_ids, si
		
		MOV si, variable_contador
		CMP si, 0
		JE FATHER
		jne SOON

	SOON:
		Writter_UNO reporte_epacio_3, 	handle
		Writter_UNO reporte_llave_abre, 	handle
		Writter_UNO reporte_epacio_4, 	handle
		Writter_UNO variable_cadena, 	handle

		ClearS variable_cadena
		MOV si, variable_indices_res
		add si, 5
		MOV variable_indices_res, si
		MOV ax, variable_array_res[si]
		
		ExtraerCadena variable_cadena
		Writter_UNO 	variable_cadena, handle
		
		Writter_UNO reporte_epacio_3, 	handle
		Writter_UNO reporte_llave_cierra, 	handle
		
		ClearS variable_cadena
		MOV variable_contador, 1
		JMP INI
	
	FATHER:
		Writter_UNO reporte_epacio_2, 	handle
		Writter_UNO reporte_llave_cierra, 	handle
		Writter_UNO reporte_coma, 	handle
		
		Writter_UNO reporte_epacio_2, 	handle
		Writter_UNO variable_cadena, 	handle
		Writter_UNO reporte_epacio_2, 	handle
		Writter_UNO reporte_corchete_abre, 	handle
		
		ClearS variable_cadena
		MOV variable_indices_str, 1
		MOV variable_contador, 1
		JMP INI
	
	FINAL:
		MOV variable_contador, 0
		Writter_UNO reporte_epacio_2, 	handle
		Writter_UNO reporte_corchete_cierra, 	handle
		Writter_UNO reporte_epacio_1, 	handle
		Writter_UNO reporte_llave_cierra, 	handle
		Writter_UNO reporte_epacio_0, 	handle
		Writter_UNO reporte_llave_cierra, 	handle
		
endm	

Abrir_UNO macro route, handle
	MOV ah, 3dh
	MOV al, 10b
	lea dx, route
	int 21h
	MOV handle, ax
	jc Error_AA
endm

Cerrar_UNO macro handle
	MOV ah,3eh
	MOV handle,bx
	int 21h
endm

Leer_UNO macro buffer,handle
	MOV ah,3fh
	MOV bx,handle
	MOV cx, SIZEOF buffer
	lea dx,buffer
	int 21h
	jc Error_LA
endm

Create_UNO macro buffer,handle
	MOV ah,3ch
	MOV cx,00h
	lea dx,buffer
	int 21h
	MOV handle, ax
	jc Error_cuatro
endm


Writter_UNO macro buffer,handle
	MOV ah, 40h
	MOV bx,handle
	MOV cx, SIZEOF buffer
	lea dx,buffer
	int 21h
	jc Error_EA
endm


METODO_MODA macro
	LOCAL INI,FINAL_1, FINAL
	INI:
		MOV si, variable_indices_res1
		MOV di, variable_rIS_length
		CMP si, di
		JG FINAL
		MOV ax , variable_array_rIS_aux[si]
		MOV variable_moda_a, ax
		MOV bx, variable_array_rIS_aux[si + 5]
		MOV variable_moda_s, bx 
		
		CMP ax, bx
		JE	IS_IGUAL
		JNE NO_IS_IGUAL	
		
		JMP FINAL_1
	NO_IS_IGUAL:
		CMP bx, 36
		JE FINAL_1
		CMP ax, 36
		JE FINAL_1
		
		MOV si, variable_contador_ma
		MOV di, variable_contador_ms
		CMP si, di
		JG CAMBIO 
		
		MOV variable_contador_ms, si
		MOV variable_contador_ma, 0
		JMP FINAL_1
	CAMBIO:
		MOV ax, variable_moda_a
		MOV variable_moda, ax
		JMP FINAL_1
	IS_IGUAL:
		CMP bx, 36
		JE FINAL_1
		CMP ax, 36
		JE FINAL_1
		MOV si, variable_contador_ma
		INC si
		MOV variable_contador_ma, si
		MOV ax, variable_moda_a
		MOV variable_moda, ax
		JMP FINAL_1
	FINAL_1:
		MOV si, variable_indices_res1
		add si, 5
		MOV variable_indices_res1, si
		JMP INI
	FINAL:
endm

Print macro cadena 
	MOV ax, @data
	MOV ds, ax
	MOV ah, 09h 
	MOV dx, offset cadena 
	int 21h
endm

Output_Entrada macro
	MOV ah,01h
	int 21h
endm

SumarNumeros macro num1, num2
	MOV ax, num1
	MOV bx, num2
	ADD ax, bx
endm

RestarNumeros macro num1, num2
	MOV ax, num1
	MOV bx, num2
	SUB ax, bx
endm

MultiplicarNumeros macro num1, num2
	MOV ax, num1
	MOV cx, num2
	IMUL cx
endm

DividirNumeros macro num1, num2
	LOCAL COMPARACION2, NEGATIVA1, NEGATIVA2, OPERAR, DIV_NEG, DIVISION, FINAL
	MOV dx, 0
	MOV ax, num1
	MOV cx, num2
	
	cmp ax, 00
	jl NEGATIVA1
	
	COMPARACION2:
	cmp cx, 00
	jl NEGATIVA2	
	JMP OPERAR
	
	NEGATIVA1:
	neg ax
	ADD aux_division, 1
	JMP COMPARACION2
	
	NEGATIVA2:
	neg cx
	ADD aux_division, 1
	JMP OPERAR
	
	OPERAR:
	CMP aux_division, 1
	je DIV_NEG
	CMP aux_division, 2
	je DIVISION
	JMP DIVISION
	
	DIV_NEG:
	DIV cx
	neg ax
	JMP FINAL
	DIVISION:
	DIV cx
	JMP FINAL
	FINAL:
	mov aux_division, 0
endm


OrdenamientoBurbuja macro arreglo, tamanio
		mov cx, 0
		mov bx, 0
		mov si, 0 
		mov di, tamanio 

		ORDEN:
		mov ch,arreglo[si] 
		mov cl,arreglo[si+1] 
		mov bh,arreglo[si+2]
		mov bl,arreglo[si+3]

		cmp cx,bx 
		jl NO_CAMBIO 
		
		mov arreglo[si+2],ch 
		mov arreglo[si+3],cl 

		mov arreglo[si],bh
		mov arreglo[si+1],bl 

		NO_CAMBIO: 
		inc si 
		inc si
		cmp si,di
		jb ORDEN
		dec di
		mov si,0
		cmp di,01h 
		ja ORDEN
endm

O_route macro buffer
LOCAL INI,FINAL
	XOR si,si
INI:
	Output_Entrada
	CMP al,0dh	
	JE FINAL
	MOV buffer[si],al
	INC si
	JMP INI
FINAL:
	MOV buffer[si],00h
endm

Estadistico_Media macro arreglo, tamanio
	LOCAL SUMATORIA_MEDIA, RESULTADO_MEDIA
	MOV si, 0
	MOV res_media, 0
	
	SUMATORIA_MEDIA:
	cmp si, tamanio
	je RESULTADO_MEDIA

	MOV ah, arreglo[si]
	MOV al, arreglo[si+1]
	ADD res_media, ax
	add si, 2
	add cantidad_num, 1
	JMP SUMATORIA_MEDIA

	RESULTADO_MEDIA:
	MOV ax, res_media
	MOV bl, cantidad_num
	DIV bl
	MOV res_media, ax

	ConversionTexto res_media, number
endm

Estadistico_Menor macro arreglo
	MOV si, 0
	MOV ah, arreglo[si]
	MOV al, arreglo[si+1]
	
	MOV res_menor, ax
	ConversionTexto res_menor, number	
endm

Estadistico_Mayor macro arreglo
	MOV si, indice_bytes
	MOV ah, arreglo[si-2]
	MOV al, arreglo[si-1]
	
	MOV res_mayor, ax
	ConversionTexto res_mayor, number	
endm

Estadistico_Mediana macro arreglo, tamanio
 LOCAL CANTIDAD, RESULTADO_MEDIANA, IMPAR, PAR, FIN_MEDIANA
	MOV si, 0
	MOV di, tamanio
	MOV res_mediana, 0
	
	CANTIDAD:
	cmp si, di
	je RESULTADO_MEDIANA
	add si, 2
	add cantidad_num, 1
	JMP CANTIDAD

	RESULTADO_MEDIANA:
	TEST cantidad_num, 1
	jnz IMPAR
	jz PAR

	IMPAR:
	MOV dx, 00h
	MOV ax, indice_bytes
	SUB ax, 1
	MOV bl, 02h
	DIV bl
	MOV ah, 00h
	MOV si, ax

	MOV bh, arreglo[si]
	MOV bl, arreglo[si+1]

	MOV res_mediana, bx

	JMP FIN_MEDIANA
	PAR:
	MOV dx, 00h
	MOV ax, indice_bytes
	SUB ax, 1
	MOV bl, 02h
	DIV bl
	MOV ah, 00h
	MOV si, ax

	MOV bh, arreglo[si-1]
	MOV bl, arreglo[si]

	MOV ch, arreglo[si+1]
	MOV cl, arreglo[si+2]

	MOV ax, bx
	ADD ax, cx

	MOV dx, 00h
	MOV bl, 02h
	DIV bl
	MOV ah, 00h
	MOV res_mediana, ax

	JMP FIN_MEDIANA

	FIN_MEDIANA:
	ConversionTexto res_mediana, number
endm

; METODOS PARA CREAR EL ARCHIVO

Abrir macro buffer,handler
 LOCAL ERROR
	mov ah, 3dh
	mov al, 02h
	lea dx, buffer
	int 21h
	jc ERROR
	mov handler, ax
	print MsgAExito
	print Salto
	JMP FIN
	ERROR:
	print Salto
	print MsgAError 
	print Salto
	FIN:
endm

Cerrar macro handler
 LOCAL FIN
	mov ah, 3eh
	mov bx, handler
	int 21h
	jnc FIN
	print Salto
	print MsgCError 
	print Salto
	FIN:
endm

Crear macro buffer, handler
 LOCAL FIN, ERROR
	mov ah, 3ch
	mov cx, 00h
	lea dx, buffer
	int 21h 
	jc ERROR
	mov handler, ax
	JMP FIN
	ERROR:
	print Salto
	print MsgCrError 
	print Salto
	FIN:
endm

Leer macro handler, buffer, numbytes
 LOCAL ERROR, FIN
	mov ah, 3Fh
	mov bx, handler
	mov cx, numbytes
	lea dx, buffer
	int 21h
	jc ERROR
	print MsgRExito
	print Salto
	JMP FIN
	ERROR:
	print Salto
	print MsgRError
	print Salto
	jmp Menu
	FIN:
endm

EscribirReporte macro handler, buffer, numbytes
 LOCAL FIN, ERROR
	mov ah, 40h
	mov bx, handler
	mov cx, numbytes
	lea dx, buffer
	int 21h 
	jc ERROR
	JMP FIN
	ERROR:
	print Salto
	print MsgEError 
	print Salto
	FIN:
endm

CrearReporte macro
	Limpiar rutaReporte, SIZEOF rutaReporte
	RutaDefinida rutaReporte
	ObtenerRutaReporte rutaReporte


	ObtenerHora
	ObtenerFecha
	Crear rutaReporte, handlerentrada

	; INICIO Y ALUMNNO
	EscribirReporte handlerentrada, reporte1, SIZEOF reporte1-1
	EscribirReporte handlerentrada, reporte2, SIZEOF reporte2-1

	; FECHA
	EscribirReporte handlerentrada, reporte3, SIZEOF reporte3-1
	EscribirReporte handlerentrada, d, SIZEOF d
	EscribirReporte handlerentrada, reporte4, SIZEOF reporte4-1
	EscribirReporte handlerentrada, m, SIZEOF m
	EscribirReporte handlerentrada, reporte5, SIZEOF reporte5-1
	EscribirReporte handlerentrada, a, SIZEOF a
	EscribirReporte handlerentrada, reporte6, SIZEOF reporte6-1

	;HORA
	EscribirReporte handlerentrada, reporte7, SIZEOF reporte7-1
	EscribirReporte handlerentrada, hor, SIZEOF hor
	EscribirReporte handlerentrada, reporte8, SIZEOF reporte8-1
	EscribirReporte handlerentrada, min, SIZEOF min
	EscribirReporte handlerentrada, reporte9, SIZEOF reporte9-1
	EscribirReporte handlerentrada, segu, SIZEOF segu
	EscribirReporte handlerentrada, reporte6, SIZEOF reporte6-1

	;RESULTADOS
	EscribirReporte handlerentrada, reporte10, SIZEOF reporte10-1
	
	Estadistico_Media padre_bytes, indice_bytes
	EscribirReporte handlerentrada, number, tam_num

	EscribirReporte handlerentrada, reporte11, SIZEOF reporte11-1

	Estadistico_Mediana padre_bytes, indice_bytes
	EscribirReporte handlerentrada, number, tam_num

	EscribirReporte handlerentrada, reporte12, SIZEOF reporte12-1



	EscribirReporte handlerentrada, reporte13, SIZEOF reporte13-1

	Estadistico_Menor padre_bytes
	EscribirReporte handlerentrada, number, tam_num	

	EscribirReporte handlerentrada, reporte14, SIZEOF reporte14-1	

	Estadistico_Mayor padre_bytes
	EscribirReporte handlerentrada, number, tam_num	

	EscribirReporte handlerentrada, reporte16, SIZEOF reporte16-1


	;VARIABLES PADRE
	EscribirReporte handlerentrada, reporte17, SIZEOF reporte17-1
	EscribirReporte handlerentrada, repo_comillas, SIZEOF repo_comillas-1
	
	MOV si,0
	VUELTA:
	CMP id_padre[si], 24h
	je ESCRIBIR
	inc si
	JMP VUELTA

	ESCRIBIR:
	EscribirReporte handlerentrada, id_padre, si
	EscribirReporte handlerentrada, repo_comillas, SIZEOF repo_comillas-1
	EscribirReporte handlerentrada, reporte18, SIZEOF reporte18-1




	Limpiar comparador_id, SIZEOF comparador_id
	MOV si,0
	MOV di,0

	VUELTA2:
	MOV cx, ids_del_padre[si]
	MOV ch, 00h
	CMP cl, 3Ah
	je ESCRIBIR1
	CMP cl, 2Ch
	je ESCRIBIR2
	CMP cl, 24h
	je ESCRIBIR3
	MOV comparador_id[di], cx
	inc si
	inc di
	JMP VUELTA2

	ESCRIBIR1:
	EscribirReporte handlerentrada, reporte19, SIZEOF reporte19-1
	EscribirReporte handlerentrada, repo_comillas, SIZEOF repo_comillas-1
	EscribirReporte handlerentrada, comparador_id, di
	EscribirReporte handlerentrada, repo_comillas2, SIZEOF repo_comillas2-1
	inc si
	MOV di,0
	JMP VUELTA2

	ESCRIBIR2:
	EscribirReporte handlerentrada, comparador_id, di
	EscribirReporte handlerentrada, reporte20, SIZEOF reporte20-1
	MOV di,0
	inc si
	JMP VUELTA2

	ESCRIBIR3:
	EscribirReporte handlerentrada, comparador_id, di
	EscribirReporte handlerentrada, reporte21, SIZEOF reporte21-1


	;FIN DEL ARCHIVO
	EscribirReporte handlerentrada, reporte22, SIZEOF reporte22-1
	EscribirReporte handlerentrada, reporte15, SIZEOF reporte15-1

	Cerrar handlerentrada
endm


;COMANDOS

Comandos macro
	LOCAL SHOW, SALIR, ERROR, INICIO, FIN, SHOW

	OrdenamientoBurbuja padre_bytes, indice_bytes

	INICIO:
	print MsgComd
	getChar
	MOV comando[0], al
	getChar
	MOV comando[1], al
	getChar
	MOV comando[2], al
	getChar
	MOV comando[3], al
	ConvertirMinuscula comando, SIZEOF comando
	
	;COMANDO EXIT
	ComandoExit comando

	;COMANDO SHOW
	ComandoShow comando

	;ERROR
	CMP C_bandera,1
	je ERROR


	;COMANDO MEDIANA
	MEDIANA:
	mov cx,7
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_mediana
	repe cmpsb
	jne MEDIA
	print MsgMediana
	Estadistico_Mediana padre_bytes, indice_bytes
	print number	
	print Salto
	print Salto
	Limpiar comando, SIZEOF comando
	jmp INICIO


	;COMANDO MEDIA
	MEDIA:
	mov cx,5
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_media
	repe cmpsb
	jne MENOR
	print MsgMedia
	Estadistico_Media padre_bytes, indice_bytes
	print number	
	print Salto
	print Salto
	Limpiar comando, SIZEOF comando
	jmp INICIO

	;COMANDO MENOR
	MENOR:
	mov cx,5
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_menor
	repe cmpsb
	jne MAYOR
	print MsgMenor
	Estadistico_Menor padre_bytes
	print number	
	print Salto	
	print Salto
	Limpiar comando, SIZEOF comando	
	jmp INICIO

	;COMANDO MAYOR
	MAYOR:
	mov cx,5
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_mayor
	repe cmpsb
	jne MODA
	print MsgMayor
	Estadistico_Mayor padre_bytes
	print number	
	print Salto	
	print Salto
	Limpiar comando, SIZEOF comando	
	jmp INICIO


	;COMANDO MODA
	MODA:
	mov cx,4
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_moda
	repe cmpsb
	jne PADRE
	print MsgModa
	print Salto	
	print Salto
	Limpiar comando, SIZEOF comando	
	jmp INICIO


	;COMANDO PADRE
	PADRE:
	mov si,0
	RECORRIDO_PADRE:
	cmp id_padre[si], 24h
	je COMPARAR_PADRE
	inc si
	JMP RECORRIDO_PADRE

	COMPARAR_PADRE:
	mov cx,si
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, id_padre
	repe cmpsb
	jne ID

	CrearReporte
	print MsgReporte
	print Salto	
	print Salto
	Limpiar comando, SIZEOF comando	
	jmp INICIO

	;COMANDO ID
	ID:
	MOV si, 0
	MOV di, 0
	MOV tamanio_palabra, 0
	SHOW_VALORES:
	MOV cx, ids_del_padre[si]
	MOV ch, 00h
	CMP cx, 3Ah
	je SHOW_COMPARAR
	CMP cx, 2Ch
	je SHOW_COMPARAR
	CMP cx, 24h
	je ERROR
	MOV comparador_id[di], cx
	inc si
	inc di
	inc tamanio_palabra
	JMP SHOW_VALORES

	SHOW_COMPARAR:
	MOV comparador_id[di], 24h
	MOV comp_final, si
	mov cx, tamanio_palabra
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, comparador_id
	repe cmpsb
	jne SHOW_COMPARAR_SIGUIENTE
	
	SHOW_GUARDAR_NUMERO:

	MOV si, comp_final
	MOV di, 0
	inc si

	SHOW_COMPARAR_GUARDAR_NUMERO:
	MOV cx, ids_del_padre[si]
	MOV ch, 00h
	CMP cl, 2Ch
	je SHOW_FIN_GUARDAR_NUMERO
	MOV cx, ids_del_padre[si]
	MOV show_auxiliar[di], cx
	inc si
	inc di
	JMP SHOW_COMPARAR_GUARDAR_NUMERO


	SHOW_FIN_GUARDAR_NUMERO:
	MOV show_auxiliar[di], 24h	
	print salto
	print MsgId
	print show_auxiliar
	print salto
	JMP INICIO

	SHOW_COMPARAR_SIGUIENTE:
	mov di,0
	mov si, comp_final
	inc si
	MOV tamanio_palabra, 0
	JMP SHOW_VALORES




	ERROR:
	print MsgError
	print Salto
	MOV C_bandera,0
	Limpiar comando, SIZEOF comando
	jmp INICIO
endm

ComandoExit macro comando
	LOCAL FIN
	mov cx,4
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_exit
	repe cmpsb
	jne FIN
	print Salto
	jmp Menu
	FIN:
endm

ComandoShow macro comando
	LOCAL FIN, ERROR
	mov cx,4
	mov ax,ds
	mov es,ax
	Lea si, comando
	Lea di, C_show
	repe cmpsb
	jne ERROR
	print espacio
	Limpiar comando, SIZEOF comando
	ObtenerTexto comando
	jmp FIN

	ERROR:
	ADD C_bandera, 1

	FIN:
endm



 
;METODOS QUE NO QUIERO VOLVER A VER :v

ObtenerHora macro
	MOV si, 0
	MOV AH,2CH
	INT 21H
	div10 CH
	mov hora[si] , ':'
	inc si
	div10 CL
	mov hora[si], ':'
	inc si
	div10 DH

	mov al, hora[0]
	mov hor[0], al
	mov al, hora[1]
	mov hor[1], al

	mov al, hora[3]
	mov min[0], al
	mov al, hora[4]
	mov min[1], al

	mov al, hora[6]	
	mov segu[0], al
	mov al, hora[7]
	mov segu[1], al
endm

div10 macro n
	mov ah, 0
	mov al, n
	mov bl, 10d
	div bl 
	add al , 48
	add ah , 48
	mov hora[si] , al
	inc si
	mov hora[si] , ah
	inc si
endm

ObtenerFecha macro
 	mov ah,2AH  
  	int 21h
    mov dia,dl    
    mov mes,dh 
    mov anio,cx
    Conv_dia
    Conv_mes
    Conv_anio
endm	

Conv_dia macro
	mov al, dia
	aam
	add al, '0'
	mov d[1],al
	add ah, '0'
	mov d[0],ah
endm

Conv_mes macro
	mov al, mes
	aam
	add al, '0'
	mov m[1],al
	add ah, '0'
	mov m[0],ah
endm

Conv_anio macro
	mov ax, anio
	cwd
	mov bx, 1000
	div bx
	aam
	mov res,dx
	add al,'0'
	mov a[0],al

	mov ax,res
	cwd
	mov bx, 100
	div bx
	aam
	mov res,dx
	add al,'0'
	mov a[1],al

	mov ax,res
    cwd
    mov bx, 10
    div bx
    aam
    mov res,dx
    add al,'0'
    mov a[2],al

    mov ax,res
    aam
    add al,'0'
    mov a[3],al
endm
