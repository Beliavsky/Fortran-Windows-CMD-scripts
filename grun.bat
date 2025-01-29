@echo off
:: Batch script to compile the most recently modified *.f90 file in the 
:: current directory using gfortran and run the executable if created.
:: It finds the newest .f90 file based on modification date and compiles it, handling errors appropriately.
setlocal
:: Find the most recently modified *.f90 file
for /f "delims=" %%f in ('dir /b /o-d /a:-d *.f90 2^>nul') do (
    set "latest_file=%%f"
    goto :compile
)

echo No .f90 files found in the current directory.
exit /b 1

:compile
echo compiling %latest_file%
if exist a.exe del a.exe
gfortran -fmax-errors=1 -std=f2018 "%latest_file%"
if exist a.exe a.exe
endlocal
