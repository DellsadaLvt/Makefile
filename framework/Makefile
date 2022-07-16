# ".PHONY: clean": indicate "clean" is a action, it not a file.
# "@echo something": print some thing
# @: not print the command when run make command
#
#

PROJ_DIR  := ..
PROJ_NAME := GPIO

# error when using "="
#INC_PATH = $(INC_PATH)/Inc

# INC_DIR   := $(PROJ_DIR)/sum/inc
# INC_DIR   += $(PROJ_DIR)/sub/inc
INC_DIR   := ./inc
INC_DIR   += $(PROJ_DIR)/gpio/inc
INC_DIR   += $(PROJ_DIR)/test/test_gpio/test_suit/inc
INC_FILES := $(foreach INC_DIR, $(INC_DIR), $(wildcard $(INC_DIR)/*.h))
INC_PATH  := $(foreach INC_DIR, $(INC_DIR), -I $(INC_DIR))

SRC_DIR   := $(PROJ_DIR)/gpio/src
SRC_DIR   += $(PROJ_DIR)/test/test_gpio/test_suit/src
# SRC_DIR   += $(PROJ_DIR)/sum
# SRC_DIR   += $(PROJ_DIR)/sub
#SRC_FILE := $(wildcard $(SRC_DIR)/*.c)
SRC_FILES := $(foreach SRC_DIR, $(SRC_DIR), $(wildcard $(SRC_DIR)/*.c))
# SRC_FILE := $(foreach SRC_DIR, $(SRC_DIR), $(subst $(SRC_DIR)/,,$(wildcard $(SRC_DIR)/*.c)))

OUTPUT_PATH := $(PROJ_DIR)/output
OBJ_FILES   := $(subst .c,.o,$(notdir $(SRC_FILES) ))
OBJ_PATH    := $(foreach OBJ_FILES,$(OBJ_FILES),$(OUTPUT_PATH)/$(OBJ_FILES))

# vpath will search all .h files in include direction
vpath %.h $(INC_DIR)
# vpath will search all .c files in source direction
vpath %.c $(SRC_DIR)

# Compiler
COMPILER_DIR := C:/GNU_6_2017

LINKER_FILE := $(PROJ_DIR/)linker/stm32f1_discovery.ld

CC           := $(COMPILER_DIR)/bin/arm-none-eabi-gcc
LD           := $(COMPILER_DIR)/bin/arm-none-eabi-ld

CC_OPT       := -mcpu=cortex-m3 -c -O0 -g -mthumb $(INC_PATH)
LD_OPT       := -T $(LINKER_FILE) -Map $(OUTPUT_PATH)/$(PROJ_NAME).map

.PHONY: build
build: $(OBJ_FILES) $(LINKER_FILE)
	@$(LD) $(LD_OPT) $(OBJ_PATH) -o $(OUTPUT_PATH)/$(PROJ_NAME).elf
	@$(COMPILER_DIR)/arm-none-eabi/bin/objcopy.exe -O ihex "$(OUTPUT_PATH)/$(PROJ_NAME).elf" "$(OUTPUT_PATH)/$(PROJ_NAME).hex"
	@size $(OUTPUT_PATH)/$(PROJ_NAME).elf

# main.o: src/main.c $(INC_FILES)
# 	@gcc -I$(INC_DIR) -c $< -o output/$@

# summ.o: sum/summ.c $(INC_FILES)
# 	@gcc -I$(INC_DIR) -c $< -o output/$@

# sumn.o: sum/sumn.c sum/inc/sum.h
# 	@gcc -I$(INC_DIR) -c $< -o output/$@

%.o: %.c $(INC_FILES)
	@$(CC) $(CC_OPT) -c $< -o $(OUTPUT_PATH)/$@

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
	@rm -rf $(OUTPUT_PATH)/*

.PHONY: print
print-%:
	@echo $($(subst print-,,$@))