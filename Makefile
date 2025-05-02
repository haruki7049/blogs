build:
	emacs -Q --batch -l build.el

clean:
	# Delete all generated HTML
	rm dist/*.html
