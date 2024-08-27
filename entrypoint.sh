#!/usr/bin/env bash
set -eu

export GEM_HOME="/srv/jekyll/.bundle"
export PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

if [ $# -ne 0 ]; then
  if [[ $1 = *"sh" ]]; then
    exec "$@"
  else
    bundle exec jekyll "$@" /srv/jekyll/
  fi
else
  if [ -f /srv/jekyll/Gemfile ]; then
    bundle check &> /dev/null || bundle install
  else
    jekyll new /srv/jekyll/
  fi
  bundle exec jekyll serve --force_polling -H 0.0.0.0 -P 4000 --livereload --incremental
fi
