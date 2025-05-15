@echo off

REM Script to reorganize source files according to Maven's standard directory layout

REM Create excludes.txt for xcopy
echo *.java > scripts\excludes.txt
echo *\*.java >> scripts\excludes.txt
echo *.contrib >> scripts\excludes.txt
echo *.keep >> scripts\excludes.txt
echo *.mkelem >> scripts\excludes.txt
echo *.checkout >> scripts\excludes.txt
echo *.unloaded >> scripts\excludes.txt

REM Define modules
set MODULES=CqssApplet CqssBatchJobDB CqssCommon CqssDB CqssEjbTestClient CqssEjbUtil CqssIntraEAR CqssIntraEjb CqssIntranetWeb CqssSecurityAdmin CqssStartup CqssSvr CqssVo Ibator

REM Process each module
for %%M in (%MODULES%) do (
    echo Processing %%M module...
    
    REM Create Maven directory structure
    if not exist %%M\src\main\java mkdir %%M\src\main\java
    if not exist %%M\src\main\resources mkdir %%M\src\main\resources
    if not exist %%M\src\test\java mkdir %%M\src\test\java
    if not exist %%M\src\test\resources mkdir %%M\src\test\resources
    
    REM Move Java files to src/main/java
    if exist Source\%%M\src (
        echo Moving Java files from Source\%%M\src to %%M\src\main\java
        xcopy /S /Y Source\%%M\src\*.java %%M\src\main\java\ > nul
    )
    
    REM Move resources to src/main/resources
    if exist Source\%%M\src (
        echo Moving resources from Source\%%M\src to %%M\src\main\resources
        xcopy /S /Y /EXCLUDE:scripts\excludes.txt Source\%%M\src\* %%M\src\main\resources\ > nul
    )
    
    REM For EJB modules, handle ejbModule directory
    if exist Source\%%M\ejbModule (
        echo Moving Java files from Source\%%M\ejbModule to %%M\src\main\java
        xcopy /S /Y Source\%%M\ejbModule\*.java %%M\src\main\java\ > nul
        
        echo Moving resources from Source\%%M\ejbModule to %%M\src\main\resources
        xcopy /S /Y /EXCLUDE:scripts\excludes.txt Source\%%M\ejbModule\* %%M\src\main\resources\ > nul
    )
    
    REM For web modules, handle WebContent directory
    if exist Source\%%M\WebContent (
        echo Moving web content from Source\%%M\WebContent to %%M\src\main\webapp
        if not exist %%M\src\main\webapp mkdir %%M\src\main\webapp
        xcopy /S /Y Source\%%M\WebContent\* %%M\src\main\webapp\ > nul
    )
    
    echo Completed processing %%M module.
)

echo Source reorganization completed.