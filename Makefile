.ONESHELL:

.PHONY: website
website:
	for file in $$(ls *.md); do
	    if [[ "$$file" != "README.md" ]]; then \
	        BASENAME=$$(echo "$$file" | cut -d "." -f 1); \
	        echo "Processing $$BASENAME..."; \
	        pandoc -s "$$BASENAME".md -o "$$BASENAME".html -c style.css; \
		fi
	done

.PHONY: index
index:
	./gen_index.py

.PHONY: clean
clean:
	rm *.html
	rm index.md
