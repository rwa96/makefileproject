CC := gcc # This is the main compiler

SRCDIR := src
BUILDDIR := build
RUNDIR := bin
TARGET := runner

SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name '*.$(SRCEXT)')
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := -g
LIB :=
INC :=

$(RUNDIR)/$(TARGET): $(OBJECTS)
	@echo "Linking..."
	@mkdir -p $(RUNDIR)
	@echo "  $(CC) $^ -o $(RUNDIR)/$(TARGET) $(LIB:%=% )"; $(CC) $^ -o $(RUNDIR)/$(TARGET) $(LIB:%=% )

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@echo "Compile: $@"
	@mkdir -p $(BUILDDIR)
	@echo "  $(CC) $(CFLAGS:%=% ) $(INC:%=% ) -c -o $@ $<"; $(CC) $(CFLAGS:%=% ) $(INC:%=% ) -c -o $@ $<

clean:
	@echo " Cleaning...";
	@echo " $(RM) -r $(BUILDDIR) $(RUNDIR)/$(TARGET)"; $(RM) -r $(BUILDDIR) $(RUNDIR)/$(TARGET) || :

# Tests
tester:
	$(CC) $(CFLAGS:%=% ) test/tester.$(SRCEXT) $(INC:%=% ) $(LIB:%=% ) -o bin/tester

.PHONY: clean
