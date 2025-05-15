@echo off

REM Script to install custom dependencies to a local Maven repository

REM Create local repository directory
if not exist cqss-repo\repository mkdir cqss-repo\repository

REM Set variables for common paths
set LIB_PATH=..\Deploy\lib
set WNBCORE_PATH=..\..\..\cbs\cbs\Deploy\Was9\Libraries\WnbCore\Core
set WASWASCORE_PATH=..\..\..\cbs\cbs\Deploy\Was9\Libraries\WnbWas\WasCore
set WASSCS_PATH=..\..\..\cbs\cbs\Deploy\Was9\Libraries\WnbWas\Scs
set CYBERUTIL_PATH=..\..\..\btss\btss\Deploy\lib

echo Installing WNB Core libraries...

REM Install WNB Core libraries
call mvn install:install-file -Dfile=%WNBCORE_PATH%\AppCore.jar -DgroupId=com.wnb.core -DartifactId=app-core -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WNBCORE_PATH%\AppMsg.jar -DgroupId=com.wnb.core -DartifactId=app-msg -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WNBCORE_PATH%\AppUtil.jar -DgroupId=com.wnb.core -DartifactId=app-util -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

echo Installing WebSphere Core libraries...

REM Install WebSphere Core libraries
call mvn install:install-file -Dfile=%WASWASCORE_PATH%\EjbCommon.jar -DgroupId=com.wnb.was -DartifactId=ejb-common -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WASWASCORE_PATH%\WnbLog.jar -DgroupId=com.wnb.was -DartifactId=wnb-log -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WASWASCORE_PATH%\EjbIntraWebCommon.jar -DgroupId=com.wnb.was -DartifactId=ejb-intra-web-common -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WASWASCORE_PATH%\EjbWebCommon.jar -DgroupId=com.wnb.was -DartifactId=ejb-web-common -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WASWASCORE_PATH%\Startup.jar -DgroupId=com.wnb.was -DartifactId=startup -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%WASSCS_PATH%\EjbIntraCommonScs.jar -DgroupId=com.wnb.was -DartifactId=ejb-intra-common-scs -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

echo Installing CyberUtil libraries...

REM Install CyberUtil libraries
call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilCommonForWas.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-common-for-was -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilToolsForWas.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-tools-for-was -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilForWas.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-for-was -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtil.jar -DgroupId=com.cyberutil -DartifactId=cyber-util -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilCommon.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-common -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilTools.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-tools -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilBatch.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-batch -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilBatchDB.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-batch-db -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilBatchVo.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-batch-vo -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilBatchJob.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-batch-job -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%CYBERUTIL_PATH%\CyberUtilBatchSvr.jar -DgroupId=com.cyberutil -DartifactId=cyber-util-batch-svr -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

echo Installing other libraries...

REM Install other libraries
call mvn install:install-file -Dfile=%LIB_PATH%\external\hsm\HsmCommon.jar -DgroupId=com.hsm -DartifactId=hsm-common -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

call mvn install:install-file -Dfile=%LIB_PATH%\external\applet\jaws.jar -DgroupId=com.jaws -DartifactId=jaws -Dversion=1.0.0 -Dpackaging=jar -DlocalRepositoryPath=cqss-repo\repository

echo All dependencies installed successfully.