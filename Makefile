# ".PHONY: clean": indicate "clean" is a action, it not a file.
# "@echo something": print some thing
# @: not print the command when run make command
#
#

PROJ_DIR := .
PROJ_NAME := GPIO


# error when using "="
#INC_PATH = $(INC_PATH)/Inc

INC_DIR := $(PROJ_DIR)/sum/inc

SRC_DIR := $(PROJ_DIR)/src
SRC_DIR += $(PROJ_DIR)/sum

#SRC_FILE := $(wildcard $(SRC_DIR)/*.c)
SRC_FILES := $(foreach SRC_DIR, $(SRC_DIR), $(wildcard $(SRC_DIR)/*.c))
# SRC_FILE := $(foreach SRC_DIR, $(SRC_DIR), $(subst $(SRC_DIR)/,,$(wildcard $(SRC_DIR)/*.c)))

OBJ_FILES := $(subst .c,.o,$(notdir $(SRC_FILES) ))
OUTPUT_PATH := $(PROJ_DIR)/output
OBJ_PATH := $(foreach OBJ_FILES, $(OBJ_FILES), $(OUTPUT_PATH)/$(OBJ_FILES))

.PHONY: build
build: $(OBJ_FILES)
	@gcc $(OBJ_PATH) -o output/main.exe

main.o: src/main.c sum/inc/sum.h
	@gcc -I$(INC_DIR) -c $< -o output/$@

summ.o: sum/summ.c sum/inc/sum.h
	@gcc -I$(INC_DIR) -c $< -o output/$@

sumn.o: sum/sumn.c sum/inc/sum.h
	@gcc -I$(INC_DIR) -c $< -o output/$@

# summ.o: sum/summ.c sum/inc/
# 	@gcc -I sum/inc -c sum/summ.c -o output/summ.o

# sumn.o: sum/sumn.c
# 	@gcc -c sum/sumn.c -o output/sumn.o

# sub.o: sub/subb.c
# 	@gcc -c sub/subb.c -o output/subb.o


.PHONY: run
run:
	@./output/main.exe

.PHONY: clean
clean:
	@rm -f Output/*

.PHONY: print
print-%:
	@echo $($(subst print-,,$@))