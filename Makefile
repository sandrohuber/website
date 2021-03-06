build: OPTIMIZE = --optimize
debug: OPTIMIZE = 

build debug:
	@elm make src/Main.elm --output temp/elm.js $(OPTIMIZE)
	@uglifyjs temp/elm.js --output temp/elm.compressed.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe'
	@uglifyjs temp/elm.compressed.js --mangle --output=public/elm_min.js

deploy:
	@firebase deploy

clean:
	@rm -rf temp
	@rm public/elm_min.js
