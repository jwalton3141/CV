TARGET=cv
SHELL=/bin/bash

.PHONY: clean cleaner force

$(TARGET).pdf: $(TARGET).tex internal/
	pdflatex $(TARGET)

clean:
	rm -f $(TARGET).{aux,log,out,synctex.gz,fls}

cleaner: clean
	rm $(TARGET).pdf

force:
	touch $(TARGET).tex
	$(MAKE)
