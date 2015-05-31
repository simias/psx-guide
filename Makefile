NAME := guide

PDFLATEX := pdflatex -file-line-error -halt-on-error

$(NAME).pdf: $(NAME).tex
	$(PDFLATEX) $^
	while grep -q "Rerun to" $(NAME).log; do $(PDFLATEX) $^ ; done

clean:
	rm -f $(NAME).aux $(NAME).log $(NAME).out \
              $(NAME).toc $(NAME).lot $(NAME).pdf
