# Avindra's dotfiles

My personal preferences made available on a number of personal computing devices. Primarily a Linux based environment, there is varied support for MacOS and Windows.

## Limits

 * Avoid the usual: `dotfiles` sit in the home folder as a git repository (no install scripts allowed).
 * Avoid manual color tweaking: prefer theme integrations to the generated color maps of [pywal](https://github.com/dylanaraps/pywal)

Changing the background image occasionally is the way to "get" a new theme.

## Put it in SCM

The `~` folder is a git repository that you can `push` and `pull` directly from.

What's the limitation? That I cannot go beyond `~` (i.e., no mucking around in `/etc`). However, one typically doesn't want to muck about much in the `/etc` folder, as the defaults for a given operating system tend to be secure and well defined.

One advantage to storing your work in SCM is that setting up your environment or keeping it in sync is that this is a matter of managing the source repository.

## Documentation

Extensive documentation exists at the [avindra/dotfiles wiki](https://github.com/avindra/dotfiles/wiki).

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
git checkout -f -t origin/src
```


## Upgrades

`Manual`: Do upgrades manually with `git pull`. `dotfile_update` is a function that can be used instead, to stash local changes automatically.

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
 * [/r/unixporn](https://www.reddit.com/r/unixporn/) for selection of several gadgets
 * [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) for early [i3 settings and tips](https://github.com/LukeSmithxyz/voidrice)
