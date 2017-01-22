# Avindra's dotfiles

This is a repository containing my dotfiles.

I aim to make my personal preferences available on any device I use, regardless of what operating system that device is using. So far, this repo supports Linux, MacOS and Windows.

## A new way to think about dotfiles

The approach that most people take with `dotfiles` is to have a chunky install script that moves everything into place for them.

I didn't like that approach. I thought, why not just have your `~` folder be a git repository that you can `push` and `pull` directly from? That's what I decided to do here.

What's the downside of this approach? Mostly that I'm limited to `~` (i.e., no mucking around in `/etc`). However, given the trend towards immutable architectures and disposable systems, this is probably for the better.

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

`Manual`: Do upgrades manually with `git pull`.

---

`Automatic`: Put in __crontab__ Do it for all devices.


`Crontab integration`: The following line runs an update at **lunchtime every day**:


```cron
30   12   * * * /usr/bin/su - ${USER} -c 'git pull' > /tmp/dotfileupdater 2>&1
```


## Resets

Deleting the `.git` folder 

```bash
cd
rm -fr .git
```
