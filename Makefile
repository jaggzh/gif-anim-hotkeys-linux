all:
	@echo
	@echo 'Try: "make vi" to edit'
	@echo "(there's nothing to build; they're just bash scripts)"
	@echo '(you should symlink them in your own bin dir in your \$$PATH,'
	@echo " and/or assign them to hotkeys... like I do.)"
	@echo
	@echo '     gif-anim-select-area is the first to run'
	@echo 'then gif-anim-cap-frame for each frame'
	@echo 'then gif-anim-make-gif to create the final animation'
	@echo

vi:
	vim \
		Makefile \
		README.md \
		gif-anim-cap-frame \
		gif-anim-make-gif \
		gif-anim-select-area \
		gif-anim-settings \
		gif-anim-settings.example \

v: vi
