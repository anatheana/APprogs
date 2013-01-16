# Root Makefile for all APprogs tools
# Antti Penttilä, 2012

# Users can change these
PLATFORM = WIN64

FC = gfortran
CC = gcc
AR = ar

FOPT = -O2


# Users should not need to change these below
LIBS = PaulV_utility AP_library
PROGS = meshconvert


ROOT_MAKE = true

# Recipies

all : $(LIBS) $(PROGS)

.PHONY : cleanall libs progs $(LIBS) $(PROGS)

libs : $(LIBS)

progs : $(PROGS)

$(LIBS) :
	@$(MAKE) -C $@

cleanall : 
	@for dir in $(LIBS); do \
	  $(MAKE) -C $$dir clean; \
	done
	@for dir in $(PROGS); do \
	  $(MAKE) -C $$dir clean; \
	done

distclean : cleanall
	rm -rf mods/$(PLATFORM)/*.mod
	rm -rf libs/$(PLATFORM)/*.a


	