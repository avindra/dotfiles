# Avindra's dotfiles

This is a repository containing my dotfiles.

I aim to make my personal preferences available on any device I use, regardless of what operating system that device is using. So far, this repo supports Linux, MacOS and Windows.

## A new way to think about dotfiles

The approach that most people take with `dotfiles` is to have a chunky install script that moves everything into place for them.

I didn't like that approach. I thought, why not just have your `~` folder be a git repository that you can `push` and `pull` directly from? That's what I decided to do here.

What's the downside of this approach? Mostly that I'm limited to `~` (i.e., no mucking around in `/etc`). However, one typically doesn't want to muck about much in the `/etc` folder. This is the design constraint of this approach.

## Requirements

There are a few assumptions about what software is installed on the system. If you are using openSUSE, you want something like:

```
zypper --no-ref in --no-recommends fzf ranger i3-gaps i3status i3lock i3bar rofi

pip install --user pywal
```

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

 * Many thanks to [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) for [his dotfile setup](https://github.com/LukeSmithxyz/voidrice), from which this repo takes a LOT of inspiration (ranger, background setting patterns, i3 configuration, etc).
 * Various colleagues / co-workers who have informed my understanding of how systems work, the 'unix' way.
