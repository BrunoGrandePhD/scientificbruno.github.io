RMD_POSTS := $(patsubst _rmd/%.Rmd, _posts/%.md, $(wildcard _rmd/20*.Rmd))
RMD_DRAFTS := $(patsubst _rmd/%.Rmd, _drafts/%.md, $(wildcard _rmd/*.Rmd))

all: ${RMD_POSTS} ${RMD_DRAFTS}

_posts/%.md: _rmd/%.Rmd
	R -e "rmarkdown::render('$<', output_dir='_posts')"

_drafts/%.md: _rmd/%.Rmd
	R -e "rmarkdown::render('$<', output_dir='_drafts')"
