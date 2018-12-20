HUGO = hugo
COMMIT_MESSAGE = "rebuilding site $(shell date +%Y-%m-%d)"


run:
	$(HUGO) server -D

clone:
	rm -rf public
	git clone git@github.com:springrunner/springrunner.github.io.git
	mv springrunner.github.io public

new:
	$(HUGO) new post/$(shell date +%Y-%m-%d)-$(title).md

deploy:
	echo "\033[0;32mDeploying updates to GitHub...\033[0m"

	# Build the project.
	$(HUGO)

	cd ./public && git add . && git commit -m $(COMMIT_MESSAGE) && git push