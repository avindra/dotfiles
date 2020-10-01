# Avindra's dotfiles

My personal preferences made available on a number of personal computing devices. Primarily a Linux based environment, there is varied support for MacOS and Windows.

## Put it in SCM

Design goal is to avoid the usual: no placing `dotfiles` from a convenient (perhaps arcane) install script optionally bundled with a set of defined conventions required for use.

The `~` folder is a git repository that you can `push` and `pull` directly from.

What's the limitation? That I cannot go beyond `~` (i.e., no mucking around in `/etc`). However, one typically doesn't want to muck about much in the `/etc` folder, as the defaults for a given operating system tend to be secure and well defined.

One advantage to storing your work in SCM is that setting up your environment or keeping it in sync is that this is a matter of managing the source repository.

## Requirements

There are a few assumptions about what software is installed on the system. If you are using openSUSE, you want something like:

```bash
zypper --no-refresh install --no-recommends feh rofi \
  i3-gaps i3status i3lock i3bar \
# Here are some additional software I find myself
# using regularly, for which you may have
# a perfectly suitable alternative.
  ranger fzf neovim

# pywal is an "auto-ricer" that creates the color scheme from the background image.
# bumblebee-status is the statusbar for now
pip install --user pywal bumblebee-status
```

[feh](https://github.com/derf/feh) is used to set the background, as it has added support for handling multiple monitors. [pywal](https://github.com/dylanaraps/pywal) has a `-n` flag, which disables the default behavior of changing the background image (thus, only the color scheme gets updated).

## Installation

Make `~` a git repo. That's it! [Stolen from a great StackOverflow post](http://stackoverflow.com/a/18999726/270302):

Note: `cd` without any arguments automatically changes to your home folder.

```bash
cd
git init

git remote add origin git@github.com:avindra/dotfiles.git
git fetch

# The -f flag will overwrite ALL files
# this is good because it makes doing updates OR full resets very easy
git checkout -f -t origin/master
```


## Upgrades

`Manual`: Do upgrades manually with `git pull`. `dotfile-update` is a function that can be used instead, to stash local changes automatically.

---

`Automatic`: Put in __crontab__ Do it for all devices.

`Crontab integration`: The following line runs an update at **lunchtime every day**:

`As user`:
```cron
30   12   * * * cd && git pull --rebase > /tmp/dotfileupdater 2>&1
```

`or as root`:

```cron
30   12   * * * /usr/bin/su - ${USER} -c 'git pull' > /tmp/dotfileupdater 2>&1
```


## Resets

Deleting the `.git` folder 

```bash
cd
rm -fr .git
```

## Credits

 * Colleagues who have shown many possiblities and solutions for their respective development environments.
 * [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) for early [i3 settings and tips](https://github.com/LukeSmithxyz/voidrice)
