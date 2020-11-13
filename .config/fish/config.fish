set fish_greeting "The Quieter you Become, the More you are able to Hear."

abbr -a -g l ls -ltrah
abbr -a -U pbcopy xclip -selection c

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
# todo: port
