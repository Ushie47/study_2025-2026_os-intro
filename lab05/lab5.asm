; lab5.asm
SECTION .data ; Начало секции данных
	lab5: DB 'Eva Dvorkina',10 

	lab5Len: EQU $-lab5 ; Длина строки lab5
	
SECTION .text ; Начало секции кода
	GLOBAL _start

_start: ; Точка входа в программу
	mov eax,4 ; Системный вызов для записи (sys_write)
	mov ebx,1 ; Описатель файла '1' - стандартный вывод
	mov ecx,lab5 ; Адрес строки lab5 в ecx
	mov edx,lab5Len ; Размер строки lab
	int 80h ; Вызов ядра

	mov eax,1 ; Системный вызов для выхода (sys_exit)
	mov ebx,0 ; Выход с кодом возврата '0' (без ошибок)
	int 80h ; Вызов ядра
