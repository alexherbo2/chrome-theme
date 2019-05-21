fetch:
	./fetch

package: clean fetch
	zip --recurse-paths package.zip manifest.json packages

clean:
	rm -Rf packages package.zip 'Cached Theme.pak'

.PHONY: fetch
