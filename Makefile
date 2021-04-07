fetch:
	scripts/fetch

package: clean fetch
	zip -r package.zip manifest.json packages

chrome-web-store: fetch
	mkdir -p build/chrome-web-store
	inkscape packages/chrome.svg --export-filename build/chrome-web-store/icon.png --export-width 128 --export-height 128
	convert packages/preview.png -resize '1280x800!' build/chrome-web-store/preview.png
	convert packages/preview.png -resize '440x280!' build/chrome-web-store/small-tile.png
	convert packages/preview.png -resize '920x680!' build/chrome-web-store/large-tile.png
	convert packages/preview.png -resize '1400x560!' build/chrome-web-store/marquee.png

clean:
	rm -Rf build packages package.zip 'Cached Theme.pak'

.PHONY: build
