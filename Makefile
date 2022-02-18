default:
	rm PREVIEWS.md
	cp previews.tmpl PREVIEWS.md
	find ./ -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.gif \) -not -iname _\* -print0 | sort | xargs -0 -I {} bash -c 'ff=$$(basename -- "{}"); echo -n "<img src=\"$$ff\" alt=\"$$(echo $$ff | cut -f 1 -d '.')\"><br><br>" | tee -a PREVIEWS.md'
