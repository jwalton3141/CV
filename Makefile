TARGET=cv
SHELL=/bin/bash

.phony: clean cleaner force spell_check

$(TARGET).pdf: $(TARGET).tex internal/
	pdflatex $(TARGET)

clean:
	rm -f $(TARGET).{aux,log,out,synctex.gz,fls,fdb_latexmk}

cleaner: clean
	rm $(TARGET).pdf

force:
	$(MAKE) -B

spell_check:
	./scripts/check_spelling.sh
