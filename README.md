 # My Dotfiles
 
 ![my desktop](/.screenshots/scr-1.png "my desktop")
 
 ## What Are Dotfiles?
 
 Dotfiles are the customization files that are used to personalize your Linux or other Unix-based system.  You can tell that a file is a dotfile because the name of the file will begin with a period–a dot!  The period at the beginning of a filename or directory name indicates that it is a hidden file or directory.  This repository contains my personal dotfiles.  They are stored here for convenience so that I may quickly access them on new machines or new installs.  Also, others may find some of my configurations helpful in customizing their own dotfiles.
 
 ## Creating a repo on your first machine
 
 So to start out, let’s assume you have some files in your home directory that you want to put in your dotfiles repo.
 
 We can just run `pwd` and then `ls -a`
 
 ```
 ~  pwd
/home/uarenotprepared
 ~  ls -a
./             .config/        .emacs.d/   .lesshst              Pictures/        .var/
../            Desktop/        .fzf/       .local/               .pki/            Videos/
.bash_history  Documents/      .fzf.bash   .logs/                poligon/         .vscode/
.bash_logout   .doom.d/        .gitconfig  .mozilla/             Public/          .wget-hsts
.bash_profile  Downloads/      .gnupg/     Music/                .ssh/            .yarn/
.bashrc        .dropbox/       goCode/     neovim-cheets.txt     Templates/       .yarnrc
.cache/        Dropbox/        ide*        nord-gnome-terminal/  .tmux.conf       .zoom/
codeBackup*    .dropbox-dist/  .lesshsQ    .npm/                 .tmux.conf.save  Загрузки/
 ~  
```

First, we need to create a new git repo. We can just run `git init .`

```
 ~  git init .
Initialized empty Git repository in /home/uarenotprepared/.git/
```

As an optional step, we will also switch to a `main` branch that we will use here as the default branch.

```
 ~   master ±  git checkout -b main
Switched to a new branch 'main'
```

Right now, we have an empty git repo, but it ‘wants’ to track everything in my home directory. Nothing is tracked because we haven’t `git added` anything, but the entire home directory is coming up as untracked.

```
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .bash_history
        .bash_logout
        .bash_profile
        .bashrc
        .cache/
        .config/
        .doom.d/
        .dropbox-dist/
        .dropbox/
        .emacs.d/
        .fzf.bash
        .fzf/
        .gitconfig
        .gnupg/
        .lesshsQ
        .lesshst
        .local/
        .mozilla/
        .npm/
        .pki/
        .ssh/
        .tmux.conf
        .tmux.conf.save
        .var/
        .vscode/
        .wget-hsts
        .yarn/
        .yarnrc
        .zoom/
        Documents/
        Downloads/
        Dropbox/
        Pictures/
        README.md
        codeBackup
        goCode/
        ide
        neovim-cheets.txt
        nord-gnome-terminal/
        poligon/
        "\320\227\320\260\320\263\321\200\321\203\320\267\320\272\320\270/"

nothing added to commit but untracked files present (use "git add" to track)
```

Now, let’s add a `.gitignore` file that ignores everything.

You can create file `.gitignore` in your file manager or use simple command `echo '*' > .gitignore`. Then let's check repo status.

```
 ~   main ±  echo '*' > .gitignore
 ~   main   git status
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

Now, `git status` shows that there is nothing to commit because we ignored everything. But we actually DO want to track the `.gitignore` file we made. That is because `.gitignore` basically becomes the ‘manifest’ of files to commit to the repo, and as such, does need to be present on each machine. So let’s add to our `.gitignore` file to tell it we DO want to track the `.gitignore` file itself, how meta.

```
 ~   main ±  git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .gitignore

nothing added to commit but untracked files present (use "git add" to track)
```

The syntax used was to put a `!` before the file name, which acts like a NOT ignore; tracking the file!

Now that git shows some untracked changes, we can add the `.gitignore file` and commit.

```
 ~   main ±  git add --all
 ~   main ±  git commit -m "The bare bones of our dotfiles setup. Currently just a gitignore file that ignores everything besides itself"
[main (root-commit) 40a4c99] The bare bones of our dotfiles setup. Currently just a gitignore file that ignores everything besides itself
 1 file changed, 2 insertions(+)
 create mode 100644 .gitignore
 ```
 
 Then you can add all what you want. With command `echo '!.gnupg/' >> .gitignore` or just edit `.gitignore` by any text editor. Then we can push this up to your Git host of choice.
 
 ```
 ~   main   git remote add origin git@github.com:vohol/dotfiles.git
 ~   main   git push --set-upstream origin main
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (7/7), 3.02 KiB | 3.02 MiB/s, done.
Total 7 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:vohol/dotfiles.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
 ```
 
## Cloning this repo on your second machine

Ok, so now let’s move to machine two, and copy these dotfiles down. 

If we try to clone the repo we created, we will get an error since we don’t have an empty directory.

So what we need to do is create an empty git repo, and then wire up the origin and do a fetch.

* `git init`
* `git remote add origin git@github.com:YOUR_GIT_REPO`
* `git fetch`

So now we have our remote all set up, let’s set up a local branch.

* `git checkout -b main`
* `git reset --mixed origin/main`

Here we used `git reset` to tell git that our `HEAD` is the same as the origin version, or we want to operate as if we were ‘on’ that commit. We use `--mixed` so that it keeps our local changes. We can then see if any of our local changes are things we want to keep or remove. You might also notice it says we ‘deleted’ the `.gitignore` file. This is because this machine didn’t have a `.gitignore.` We want to take this file from the version we already committed on the first machine. If we don’t and run `git status`, you will see we aren’t yet ignoring the rest of the home directory. So let us go ahead and checkout the origin copy.

* `git checkout origin/main -- .gitignore`
* `git status`
* `git add -all`
* `git commit -m "Get second machine setup and create a more unified prompt"`

While we were doing those last steps, we used `git add --all`. When I’ve talked to people about this workflow before, they get worried that commands like this will accidentally commit more than they want. But as you can see, that isn’t the case! `git add` follows the `.gitignore` file, so it will only add the files we explicitly allow.

And there you have it! Now we have a dotfiles repo setup on two machines, but even better, the repo lives directly in your home directory! No more copying or symlinking! Simply edit the files and create a commit, nice and simple and using all the tools you already know and love!

[The original article](https://coreyja.com/dotfiles-git-in-home-dir/)
