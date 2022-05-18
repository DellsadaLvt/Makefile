PRO_DIR     := .
PROJ_NAME   := MAKEFILE
OUTPUT_PATH := $(PRO_DIR)/Output

SOURCE_DIR	:= $(PRO_DIR)/Src

# the "@" mean that disappear the content of the action in the terminal
.PHONY: build
build: main.o
	@gcc Output/main.o -o Output/main.exe

main.o: Src/main.c
	@gcc -c Src/main.c -o Output/main.o

.PHONY: run
run:
	@./Output/main.exe

# $(subst hello, A, hello world) ----> A world
.PHONY: print
print-%:
	@echo $($(subst print-,,$@))

.PHONY: clean
clean:
	@rm Output/*
