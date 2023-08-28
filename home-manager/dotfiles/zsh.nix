{ settings, pkgs, ... }:

with settings;
{
	enable = true;
	enableAutosuggestions = true;
	enableCompletion = true;
	autocd = true;
	syntaxHighlighting.enable = true;

	dotDir = ".config/zsh";
	history = {
		path = "$HOME/.local/share/zsh-history";
		save = 1000000;
		size = 1000000;
		share = false;
	};

	envExtra = "PATH=\"$HOME/.local/bin:$PATH\"";
	initExtra = ''
		parse_git_branch() {
			if branch="$(git branch 2>/dev/null)" then
				printf "$(printf $branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\n"
			fi
		}
		setopt PROMPT_SUBST
		prompt='%B%F{#cba6f7}%m %F{#89b4fa}%~%(?:: %F{#eba0ac}%? )%F{#f6c5a6}$(parse_git_branch)%F{#cba6f7}> %b%f'
		precmd() {
			PROMPT="$prompt"
		}

		# Menu selection completion
		zstyle ':completion:*' menu select
		zmodload zsh/complist
		compinit
		_comp_options+=(globdots)

		# Vi mode
		bindkey -v
		export KEYTIMEOUT=1
		## Use vi keys in completion menu
		bindkey -M menuselect 'h' vi-backward-char
		bindkey -M menuselect 'k' vi-up-line-or-history
		bindkey -M menuselect 'l' vi-forward-char
		bindkey -M menuselect 'j' vi-down-line-or-history
		bindkey -v '^?' backward-delete-char
		## Change cursor shape depending on the vi mode
		zle-keymap-select () {
		    case $KEYMAP in
		        vicmd) echo -ne '\e[1 q';;      # block
		        viins|main) echo -ne '\e[5 q';; # beam
		    esac
		}
		zle -N zle-keymap-select
		zle-line-init() {
		    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
		    echo -ne "\e[5 q"
		}
		zle -N zle-line-init
		echo -ne '\e[5 q' # Use beam shape cursor on startup
		preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

		# Show current Hyprland splash
		# tail -n +2 is required, cuz now hyprctl prints "adding splash" before
		# the splash message which is pretty annoying
		hyprctl splash | tail -n +2
	'';
}
