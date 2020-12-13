# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"

function current_ruby() {
		local version=""
		if [ -f .ruby-version ]; then
				local ruby_version="$(ruby -v)"
				local version_pattern="^ruby ([0-9\.p]+)"
				if [[ ${ruby_version} =~ ${version_pattern} ]]; then
						version=" <$match[1]>"
				fi
		fi
		echo "$version"
}

function dashes {
	local PYTHON_ENV="$VIRTUAL_ENV"
	[[ -z "$PYTHON_ENV" ]] && PYTHON_ENV="$CONDA_DEFAULT_ENV"

	if [[ -n "$PYTHON_ENV" && "$PS1" = \(* ]]; then
		echo $(( COLUMNS - ${#PYTHON_ENV} - 3 ))
	else
		echo $COLUMNS
	fi
}

function timestamp {
	echo "%{$fg[cyan]%}%D{%H:%M:%S}%{$reset_color%} "
}

function current_user () {
	echo "%{$fg[magenta]%}%n%{$reset_color%} "
}

function current_machine {
	echo "at %{$fg[red]%}%m%{$reset_color%} "
}

function prompt_symbol {
	echo "%(?,$fg[magenta]%(!.#.❯)%{$reset_color%},%{$fg[red]%}%(!.#.❯))"
}

# primary prompt
PS1='$FG[237]${(l.$(dashes)..-.)}%{$reset_color%}
$(timestamp)$(current_user)$(current_machine)%~%{$fg[cyan]%}$(current_ruby)%{$reset_color%}$(git-radar --zsh)$(hg_prompt_info)
$(prompt_symbol) '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPS1+=' $my_gray%n@%m%{$reset_color%}%'

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
