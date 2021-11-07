# Git

## Articles
- [Doing stupid stuff with GitHub Actions](https://devopsdirective.com/posts/2020/07/stupid-github-actions/)
- [Git Aliases](https://medium.freecodecamp.org/an-intro-to-git-aliases-a-faster-way-of-working-with-git-b1eda81c7747)
- [Git for Mathematicians](https://idrissi.eu/en/post/git-1-preliminaries/)
- [How to Become a Git Expert](https://link.medium.com/yEfwpuWs8R)
- [How to Undo Almost Anything in Git](https://github.blog/2015-06-08-how-to-undo-almost-anything-with-git/)
- [Recording Changes to the Repository](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) - excellent illustration of how files move between untracked/unmodified/modified/staged
- [Sparse checkout](https://github.blog/2020-01-17-bring-your-monorepo-down-to-size-with-sparse-checkout/)
- [Specify a specific SSH key for git pull/git clone](https://ma.ttias.be/specify-a-specific-ssh-private-key-for-git-pull-git-clone/)
- [Syncing GitLab and GitHub Repos](https://everythingshouldbevirtual.com/git/syncing-gitlab-and-github-repos/)

## General
- [Git Internals](https://github.com/pluralsight/git-internals-pdf/releases)
- [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/)
- [GitHub Learning Lab](https://lab.github.com/)
- [Think Like a Git](http://think-like-a-git.net/) - Really good explanation for "medium" level users

## Tools
- [BFG Repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

## Notes
- git pull = git fetch + git merge origin/master
- `git log --oneline --abbrev-commit --all --graph --decorate --color`

- References are pointers to commits
  - Local branch
    - `commit`, `merge`, `rebase`, `reset`
  - Remote branch
    - `fetch`, `push`, `pull`
  - Tag1
    - Never move

- `git commit --amend` is actually building a new commit, and pointing your local branch to that instead
- `git gc` - force garbage collections (e.g. cleaning up original commits from situation described above)
  - Does this through a graph traversal, cuts off everything it can't reach
    - Starts at every branch and every tag
    - References make commits reachable
- You can use a branch as a save point because it will make a reference to your commit, so it's reachable
  - Won't be undone by `git merge` or `git rebase`
- `git cherry-pick` will take a commit from another place and 'replay' it where you are
  - Takes the diff from commit to parent and applies it at current position
- `git reset foo` will force the current branch's pointer to foo (`--hard` will update the working directory as well)
- `git rebase` will move entire sections to somewhere else
  - `git rebase foo bar` is equivalent to:
    ```
    git checkout foo
    git checkout -b newbar
    git cherry-pick C D E
    git checkout bar
    git reset --hard newbar
    git branch -d newbar
    ```
- Commits point to trees
- Objects (immutable)
  - Blob - contents of a file
  - Tree - collection of blobs and other trees
  - Commit - collection of blobs and trees, with some added data (like parent commit)
  - Tag - shorthand for a specific commit
- References
  - Branch
    - Points to SHA of the most recent commit
  - Remote
  - HEAD - points to current branch
- Treeish
  - **Date spec**
    - `master@{yesterday}` or `master@{1 month ago}`
     - This example would refer to the value of that branch yesterday. Importantly, this is the value of that branch in your repository yesterday. This value is relative to your repo – your `master@{yesterday}` will likely be different than someone else’s, even on the same project, whereas the SHA-1 values will always point to the same commit in every copy of the repository.
  - **Ordinal spec**
    - `master@{5}`
    - This indicates the 5th prior value of the master branch. Like the Date Spec, this depends on special files in the .git/log directory that are written during commits, and is specific to your repository.
  - **Caret Parent**
    - `e65s46^2` or `master^2`
    - This refers to the Nth parent of that commit. This is only really helpful for - commits that merged two or more commits – it is how you can refer to a commit other than the first parent.
  - **Tilde spec**
    - `e65s46~5`
    - The tilde character, followed by a number, refers to the Nth generation grandparent of that commit. To clarify from the caret, this is the equivalent commit in caret syntax: `e65s46^^^^^`
      - [Tilde vs Caret?](https://stackoverflow.com/questions/2221658/whats-the-difference-between-head-and-head-in-git#2222920)
        - Use `~` most of the time — to go back a number of generations, usually what you want
        - Use `^` on merge commits — because they have two or more (immediate) parents
  - **Tree pointer**
    - `e65s46^{tree}`
    - This points to the tree of that commit. Any time you add a `^{tree}` to any commit-ish, it resolves to its tree.
  - **Blob spec**
    - `master:/path/to/file44`
    - This is very helpful for referring to a blob under a particular commit or tree.
- Your configuration will be loaded first from this `.git/config`, then from a `~/.gitconfig` file and then from an `/etc/gitconfig` file, if they exist.

## Tools
- [git-absorb](https://github.com/tummychow/git-absorb) -  git commit --fixup, but automatic
- [git-deps](https://github.com/aspiers/git-deps) - git-deps is a tool for performing automatic analysis of dependencies between commits in a git repository.
- [git-summary](https://github.com/MirkoLedda/git-summary) - summarizes multiple git repository status within a directory.
- [gitty](https://github.com/muesli/gitty) - Contextual information about your git projects, right on the command-line 

## Misc

### Replacing the DMCA repo with `ytdl` source code

```
Haha not quite literally, but remembering how github works in the backend with forks of the same repo being shared, I realized that if I made a merge commit between the 2 latest commits of each repo then opened a PR, the connected git graph would let you access the entire git commit history of ytdl through the dmca repo. For a little extra fun, I made the merge commit not actually take anything from the ytdl repo, causing the commit to be empty and not contain any ytdl code. But once you step up one commit into the ytdl tree, all the code is there. Since I also didn't rebase any commits, all the commit hashes in either history are preserved, as well as any signed commits. And then I realized I couldn't delete the PR, so it stays even after I deleted my fork. I guess it'll be up to github to remove since the repo it's linked to is theirs.

If you use Arch Linux, I made a PKGBUILD you can use to install ytdl from the source that's now in the dmca mirror. Kinda pointless but funny...
```

[Source](https://www.reddit.com/r/programming/comments/jhlhok/someone_replaced_the_github_dmca_repo_with/g9zpxas?utm_source=share&utm_medium=web2x&context=3)
