set fish_greeting "The Quieter you Become, the More you are able to Hear."


# direnv hook https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
eval (direnv hook fish)

# macos backport
abbr -a -U pbcopy xclip -selection c

# sys management
abbr -a -g poweroff /sbin/poweroff
abbr -a -g shutdown /sbin/poweroff
abbr -a -g reboot /sbin/reboot

# sane command defaults
abbr -a -g g git
abbr -a -g l ls -lrtah
abbr -a -g v nvim
abbr -a -g d diff
abbr -a -g df df -khT
abbr -a -g du du -h -d0
abbr -a -g z zypper --no-refresh

# js
abbr -a -g y yarn install --ignore-engines --ignore-scripts


# build/development
abbr -a -g m make
# invoke runtime linker https://twitter.com/AlanActual/status/1326639935902846977
abbr -a -g linux LD_DEBUG=help /lib64/ld-linux-x86-64.so.2
abbr -a -g http python3 -m http.server 8000

# git aliases
abbr -a -g g git
abbr -a -g rebase git rebase -i
abbr -a -g s git status -uno
abbr -a -g a git add -u
abbr -a -g r git reset HEAD
abbr -a -g p git pull --rebase
abbr -a -g P git push
abbr -a -g H git show HEAD
abbr -a -g x git checkout --
abbr -a -g c git commit -v
abbr -a -g C git commit --amend --no-edit

# check entropy
abbr -a -g S cat /proc/sys/kernel/random/entropy_avail

# super diff
# ported from ~/.aliases from Bash
function diff
	switch (count $argv)
		case 0
			git diff --cached
			return $status
		case 2
			# diff 2 files
			if test -f $argv[1] -a -f $argv[2]
				git diff --no-index $argv[1] $argv[2]
			# diff 2 folders
			else if test -d $argv[1] -a -d $argv[2]
				/usr/bin/diff -ruN $argv[1] $argv[2]
			else
				echo $argv[1] or $argv[2] dont seem to be file.
			end

			return $status
	end

	git diff $argv
end

function dir
	if [ "$argv[1]" = "cfg" ]
		$EDITOR "$HOME/.config/dir/list"
		return $status
	end

	set prog "$HOME/bin/lib/dir"
	set selection ($prog)

	if [ "x$selection" = "x" ]
		echo -n "How are we doing @ "
		uptime
		return $status
	end

	echo "Switching to $selection"
	pushd "$selection"
end

