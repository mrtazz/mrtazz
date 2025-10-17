README_URL := https://raw.githubusercontent.com/mrtazz/unwiredcouch.com/refs/heads/main/content/github/readme.md

.PHONY: readme
readme:
	curl -Lsf $(README_URL) -o README.md


.PHONY: push-update
push-update:
	if [ -n "$$(git status -s 2> /dev/null)" ]; then \
		echo "Found changes, committing and pushing..."; \
		export GIT_COMMITTER_NAME=deploy; \
		export GIT_COMMITTER_EMAIL=deploy@mrtazz.mrtazz.github.com; \
		git commit --all -m "automated README update" && git push; \
	else \
		echo "No changes detected."; \
	fi

.PHONY: sync
sync: readme push-update
