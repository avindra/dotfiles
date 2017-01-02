# Avindra's dotfiles

This is a repository containing my dotfiles.

I aim to make my personal preferences available on any device I use, regardless of what operating system that device is using. So far, this repo supports Linux, MacOS and Windows.

## A new way to think about dotfiles

The approach that most people take with `dotfiles` is to have a chunky install script that moves everything into place for them.

I didn't like that approach. I thought, why not just have your `~` folder be a git repository that you can `push` and `pull` directly from? That's what I decided to do here.

What's the downside of this approach? Mostly that I'm limited to `~` (i.e., no mucking around in `/etc`). However, given the trend towards immutable architectures and disposable systems, this is probably for the better.

## Installation

Make `~` a git repo. That's it! [Stolen from a great StackOverflow post](http://stackoverflow.com/a/18999726/270302):

```bash
git init
git remote add origin git@github.com:avindra/dotfiles.git
git fetch
git checkout -t origin/master
```
