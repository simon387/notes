@echo off 
echo ciccione!
::#region
git add .
if [%1]==[] (git commit -m "lazy") else (git commit -m "%1")
git push
::#endregion