# GitHub Notes

[Markdown General Infos](markdown.md)

## Add a pc to github

+ ssh-keygen -t ed25519 -C "simon387@hotmail.it"
+ ssh-add ~/.ssh/id_ed25519
+ vim ~/.ssh/id_ed25519.pub and paste it in github page settings
+ eval `ssh-agent -s`
+ ssh-add ~/.ssh/id_rsa_key

## Tips

1. To reference a commit in a issues comment, simply write its SHA-hash, and it'll automatically get turned into a link
2. Want to save an empty directory? use the ```.gitkeep``` file trick!
3. link/anchor to chapther/heading [example](##-Tips)
4. ```git config --global credential.helper 'cache --timeout=99999999'```

---

## "We found a potential security vulnerability in one of your dependencies" message

Solution: just click on the Github's alert for information, usually you just need to update dependencies.

---

## "Something went really wrong and we can’t process that picture."

While switching profile's picture.

Solution: switched browser and it worked.

---

## Hide forever a file

Example: remove ```README.md``` from history and everywhere:

```
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch README.md' \
  --prune-empty --tag-name-filter cat -- --all
```

and

```
git push --all --force
```

**Updated** version 2022, removing ```__pycache__``` folder

```
git filter-branch --force --index-filter  'git rm --cached --ignore-unmatch __pycache__'  --prune-empty --tag-name-filter cat -- --all
git push --all --force
```

## Hide forever history of an entire branch

```
git checkout --orphan tmp-master # create a temporary branch
git add -A  # Add all files and commit them
git commit -m 'Add files'
git branch -D master # Deletes the master branch
git branch -m master # Rename the current branch to master
git push -f origin master # Force push master branch to Git server
```

## Change commit email

```
git config --global user.email "simone.celia@eng.it"
```

Check it:

```
git config user.email
```
