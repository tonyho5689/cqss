@echo off

REM Script to initialize Git repository and push to GitHub

REM Initialize Git repository
git init

REM Add all files
git add .

REM Commit changes
git commit -m "Initial commit with migrated Maven project structure"

REM Add remote repository
git remote add origin https://github.com/tonyho5689/cqss.git

REM Push to GitHub
git push -u origin main

echo Repository pushed to GitHub successfully.