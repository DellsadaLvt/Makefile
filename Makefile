# ".PHONY: clean": indicate "clean" is a action, it not a file.
# "@echo something": print some thing
# @: not print the command when run make command
#
#

PROJ_DIR := .
PROJ_NAME := GPIO
PROJ_PATH := $(PROJ_DIR)/Output

# error when using "="
#INC_PATH = $(INC_PATH)/Inc

SRC_DIR := 

.PHONY: build
build: main.o
	@gcc Output/main.o -o Output/main.exe

main.o: Src/main.c
	@gcc -c Src/main.c -o Output/main.o

.PHONY: run
run:
	@./Output/main.exe

.PHONY: clean
clean:
	@rm -f Output/*

.PHONY: print
print-%:
	@echo $($(subst print-,,$@))