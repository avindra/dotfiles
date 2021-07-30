set fish_greeting "The Quieter you Become, the More you are able to Hear."


# sys management
abbr -a -g poweroff /sbin/poweroff
abbr -a -g shutdown /sbin/poweroff
abbr -a -g reboot /sbin/reboot
abbr -a -g up    uptime
abbr -a -g kil   kill -9
abbr -a -g cr    crontab -l
abbr -a -g cro   crontab -e
# force semantic preference
abbr -a -g top htop
abbr -a -g su sudo su - --shell (which fish)

# sane command defaults
abbr -a -g chm chmod 755
abbr -a -g cur curl -sL
abbr -a -g du du -h -d1
abbr -a -g grep grep -n --color -i
abbr -a -g l ls -lrtah
abbr -a -g pin ping -c 5
abbr -a -g tar tar xvf

#lazy
abbr -a -g o open
abbr -a -g b browse
abbr -a -g f find
abbr -a -g g git
abbr -a -g gr grep
abbr -a -g d dir
abbr -a -g di diff
abbr -a -g cho chown
abbr -a -g gun gunzip
abbr -a -g hi history
abbr -a -g cl  clear
abbr -a -g res reset
abbr -a -g md5 md5sum
abbr -a -g mo  sudo mount
abbr -a -g u   units
abbr -a -g um  sudo umount
abbr -a -g unm sudo umount
abbr -a -g rl rlwrap
abbr -a -g ns nslookup
abbr -a -g ssl openssl
abbr -a -g sha sha512sum
abbr -a -g sha1 sha1sum
abbr -a -g sha2 sha256sum
abbr -a -g tel telnet
abbr -a -g trace traceroute

# build/development
abbr -a -g m make
# js
abbr -a -g js deno run
abbr -a -g no node
abbr -a -g de deno
abbr -a -g y yarn install --ignore-engines --ignore-scripts
abbr -a -g npm npm run
abbr -a -g npmi npm install --no-fund --no-audit --ignore-engines --ignore-scripts
abbr -a -g clj planck
# rust
abbr -a -g car cargo run --release -j(nproc)
# go
abbr -a -g go go run .
abbr -a -g gob go build -ldflags \"-s -w\" .
abbr -a -g got go test -v ./...
# php
abbr -a -g ph php
abbr -a -g phpu phpunit --bootstrap vendor/autoload.php .
abbr -a -g com composer install --ignore-platform-reqs
abbr -a -g comp composer dump-autoload
# default to new py
abbr -a -g ju jupyter notebook
abbr -a -g py python3
abbr -a -g python python3
abbr -a -g rb ruby
abbr -a -g xa xargs

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
# list files in commit https://stackoverflow.com/a/424142/270302
abbr -a -g lsc git diff-tree --no-commit-id --name-only -r

# fish 3.2.0 includes a built-in diff. erase it to prefer ours
functions -e diff

# reseed git repo
# (use before going public)
function seed
	if test -d .git
		echo "Removing old git repo... "
		rm -fr .git
		echo "done"
	end

	git init
	git add .
	git commit -m 'seed'
end

#applications
abbr -a -g code code .
abbr -a -g dz dezoomify-rs
abbr -a -g ff firefox
abbr -a -g ffm ffmpeg -i
abbr -a -g ra ranger
abbr -a -g t  trans -shell
abbr -a -g yt youtube-dl

set os (uname -s)

# use nvim where vim doesn't run well
if [ "$os" = "Linux" ]
	# easy vi access
	abbr -a -g v vim
	abbr -a -g vi vim
else
	abbr -a -g v nvim
	abbr -a -g vi nvim
end

# Several of the mappings below
# serve only as emulatory pipes
# between various environments.
switch $os
	case Darwin
		# core settings
		abbr -a -g df df -bkPH
		abbr -a -g ip ifconfig
		abbr -a -g cal ncal -3

		# packages
		abbr -a -g b   brew
		abbr -a -g br  brew update
		abbr -a -g bi  HOMEBREW_NO_AUTO_UPDATE=1 brew install
		abbr -a -g bu  brew upgrade

		#debug
		abbr -a -g dt  dtrace

		# misc
		abbr -a -g pb  pbcopy

		# emulate linux linker
		abbr -a -g ldd otool -L
	case Linux
		# core settings
		abbr -a -g df df -khT
		abbr -a -g ip ip address
		abbr -a -g cal cal -3

		# 9p shells
		abbr -a -g es es -l
		abbr -a -g rc rc -l

		# debugging
		abbr -a -g st    strace -ff -p
		# invoke runtime linker https://twitter.com/AlanActual/status/1326639935902846977
		abbr -a -g linux LD_DEBUG=help /lib64/ld-linux-x86-64.so.2

		# applications
		abbr -a -g con convert
		abbr -a -g ev  evince
		abbr -a -g gim gimp
		abbr -a -g mp  mpv
		abbr -a -g qdir qdirstat
		abbr -a -g win  WINE_PREFIX=~/.wine32 wine
		abbr -a -g dxvk WINE_PREFIX=~/.wine32 DXVK_HUD=full wine

		#suse
		abbr -a -g snap snapper ls
		# packages
		abbr -a -g os  osc
		abbr -a -g rp  rpm -qa
		abbr -a -g rpm rpm -qf
		abbr -a -g rpml rpm -ql
		abbr -a -g z zypper --no-refresh
		abbr -a -g why zypper --no-refresh se -i --requires

		# check entropy
		abbr -a -g S cat /proc/sys/kernel/random/entropy_avail

		# emulate macos paster
		abbr -a -g pb     pbcopy
		abbr -a -g pbcopy xclip -selection c

		# emulate windows
		abbr -a -g ms    remmina
		abbr -a -g mstsc remmina

		#hardware/misc
		abbr -a -g fuse fuseiso
		abbr -a -g nv   nvidia-smi
		abbr -a -g nvi  nvidia-settings
		abbr -a -g gp   sudo gparted
		abbr -a -g vir  virt-manager
		abbr -a -g xr   xrandr
		abbr -a -g xe   xev
end

# hook starship
starship init fish | source

# hook deno compl
deno completions fish | source

# hook dirp
dirp hook fish | source

# hook direnv https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
direnv hook fish | source

# general shell exports
~/.exports | source

