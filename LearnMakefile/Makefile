PRO_DIR     := .
PROJ_NAME   := MAKEFILE
OUTPUT_PATH := $(PRO_DIR)/Output

INCLUDE_DIRS := $(PRO_DIR)/Inc
INCLUDE_FILES := $(foreach INCLUDE_DIRS, $(INCLUDE_DIRS), $(wildcard $(INCLUDE_DIRS)/*.h))

SOURCE_DIR	:= $(PRO_DIR)/Src
SOURCE_DIR  += $(PRO_DIR)/Src_1
SOURCE_FILE := $(foreach SOURCE_DIR, $(SOURCE_DIR), $(wildcard $(SOURCE_DIR)/*.c))
SOURCE_OBJ	:= $(notdir $(SOURCE_FILE))
SOURCE_OBJ	:= $(subst .c,.o, $(SOURCE_OBJ))

PATH_OBJ := $(foreach SOURCE_OBJ,$(SOURCE_OBJ),Output/$(SOURCE_OBJ))

# Search all .c in Source dir
vpath %.c $(SOURCE_DIR)
# Search all .h in Incllude dir
vpath %.h $(INCLUDE_DIRS)

# the "@" mean that disappear the content of the action in the terminal
.PHONY: build
build: $(SOURCE_OBJ)
	@gcc $(PATH_OBJ) -o $(OUTPUT_PATH)/main.exe
	@echo Build!

# @< = Src/main.c it is the first position
# $@ = main.o
# %.o: %.c --> main.o: main.c, and use together with
# vpath
%.o: %.c $(INCLUDE_FILES)
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
