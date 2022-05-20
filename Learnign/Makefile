PRO_DIR     := .
PROJ_NAME   := MAKEFILE
OUTPUT_PATH := $(PRO_DIR)/Output

INCLUDE_DIRS := $(PRO_DIR)/Inc

SOURCE_DIR	:= $(PRO_DIR)/Src
SOURCE_DIR  += $(PRO_DIR)/Src_1

SOURCE_FILE := $(foreach SOURCE_DIR, $(SOURCE_DIR), $(wildcard $(SOURCE_DIR)/*))
SOURCE_OBJ	:= $(notdir $(SOURCE_FILE))
SOURCE_OBJ	:= $(subst .c,.o, $(SOURCE_OBJ))

PATH_OBJ := $(foreach SOURCE_OBJ,$(SOURCE_OBJ),Output/$(SOURCE_OBJ))

# the "@" mean that disappear the content of the action in the terminal
.PHONY: build
build: $(SOURCE_OBJ)
	@gcc $(PATH_OBJ) -o $(OUTPUT_PATH)/main.exe
	@echo Build!

# @< = Src/main.c it is the first position
# $@ = main.o
main.o: Src/main.c Inc/sum.h
	@gcc -I$(INCLUDE_DIRS) -c $< -o $(OUTPUT_PATH)/$@
	
sum.o: Src/sum.c Inc/sum.h
	@gcc -I$(INCLUDE_DIRS) -c $< -o $(OUTPUT_PATH)/$@

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
	@echo Cleaned!
