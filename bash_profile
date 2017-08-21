[ -z "$PS1" ] && return
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
# Ubuntu make installation of Nodejs Lang
export PATH=/home/pguan/.local/share/umake/nodejs/nodejs-lang/bin:/home/pguan/.npm_modules/bin:$PATH

# Ubuntu make installation of Go Lang
export GOROOT=/home/pguan/.local/share/umake/go/go-lang
export PATH=/home/pguan/.local/share/umake/go/go-lang/bin:$PATH

# Ubuntu make installation of Ubuntu Make binary symlink
export PATH=/home/pguan/.local/share/umake/bin:$PATH


HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

source ~/.bashrc 

