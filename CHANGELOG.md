(venv) $>git init

(venv) $>git add -A

(venv) $>git commit -m "first commit"

(venv) $>git branch -M main

(venv) $>git remote add origin https://github.com/<my-user>/<project-name>.git

(venv) $>git push -u origin main

(venv) $> git checkout -b docs-config

(venv) $>git add -A

(venv) $>git commit -a -m "Adds all to a new branch docs-config"

(venv) $>git push origin docs-config

(venv) $>