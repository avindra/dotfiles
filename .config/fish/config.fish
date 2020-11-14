set fish_greeting "The Quieter you Become, the More you are able to Hear."

# macos backport
abbr -a -U pbcopy xclip -selection c

# sane command defaults
abbr -a -g g git
abbr -a -g l ls -ltrah
abbr -a -g d diff
abbr -a -g df df -khT
abbr -a -g z zypper --no-refresh

# git aliases
abbr -a -g g git
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
				echo  $argv[1] or $argv[2] dont seem to be file.
			end

			return $status
	end

	git diff $argv
end

