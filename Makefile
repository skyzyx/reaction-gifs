default:
	chmod 0644 *.gif *.jpg *.png
	rm PREVIEWS.md
	cp previews.tmpl PREVIEWS.md
	find ./ -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.gif \) -not -iname _\* -print0 | sort -z | xargs -0 -I {} bash -c 'ff=$$(basename -- "{}"); printf "\n## $$ff\n\n<img src=\"$$ff\" alt=\"$$(echo $$ff | cut -f 1 -d '.')\">\n" | tee -a PREVIEWS.md'
