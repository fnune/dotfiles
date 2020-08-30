source ~/.zsh/env
source ~/.zsh/aliases
source ~/.zsh/plugins
source ~/.zsh/hist
source ~/.zsh/prompt
source ~/.zsh/themes
source ~/.zsh/path
source ~/.zsh/functions

# Allow other configuration files to add files
# to this directory for them to be sourced later
export ZSH_INCLUDES=~/.zsh/includes

mkdir -p $ZSH_INCLUDES

for file in $ZSH_INCLUDES/*; do
  source "$file"
done
