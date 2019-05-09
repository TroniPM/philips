@echo off
REM OBRIGATORIO DEFINIR CAMINHO DO GRADLE EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\gradle-2.14\bin\".
REM OBRIGATORIO DEFINIR CAMINHO DO JAVA EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\jdk1.8.0_201\bin".
REM ESSE ARQUIVO DEVE ESTAR NO MESMO NIVEL DAS PASTAS TASY, TASY-BACKEND, TASY-FRAMEOWRK-BACKEND E TASY-FRAMEWORK. EX:
REM --> tasy/
REM --> tasy-backend/
REM --> tasy-framework-backend/
REM --> tasy-framework/
REM --> build.bat
REM AUTOMATIZAÇÃO PARA ATUALIZAR, BUILDAR E PUBLICAR PROJETOS LOCALMENTE, DE ACORDO COM UMA VERSÃO.
REM REQUER QUE REPOSITORIOS TENHAM SIDO CLONADOS COM SSH.

rem set frameworks_branch=3.02.1746
rem set setor_branch=3.02.1746
set frameworks_branch=dev
set setor_branch=assistencial

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo ===============================================
echo Iniciando atualizacao tasy-framework-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && git reset --hard && git checkout %frameworks_branch% && git pull"

echo ===============================================
echo tasy-framework-backend atualizado com sucesso.
echo ===============================================
echo Rodando build tasy-framework-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && gradle clean build"

echo ===============================================
echo Build tasy-framework-backend finalizada com sucesso.
echo ===============================================
echo Publish do tasy-framework-backend vai iniciar.
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && gradle publish publishToMavenLocal"

echo ===============================================
echo Publish do tasy-framework-backend finalizado com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo ===============================================
echo Iniciando atualizacao tasy-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-backend/ && git reset --hard && git checkout %setor_branch% && git pull"

echo ===============================================
echo tasy-backend atualizado com sucesso.
echo ===============================================
echo Rodando build tasy-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-backend/ && gradle clean build"

echo ===============================================
echo Build tasy-backend finalizada com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo ===============================================
echo Iniciando atualizacao tasy-framework...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework/ && git reset --hard && git checkout %frameworks_branch% && git pull"

echo ===============================================
echo tasy-framework atualizado com sucesso.
echo ===============================================
echo Rodando install tasy-framework...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework/ && npm install"

echo ===============================================
echo Install tasy-framework finalizado com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo ===============================================
echo Iniciando atualizacao tasy...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && git reset --hard && git checkout %setor_branch% && git pull"

echo ===============================================
echo tasy atualizado com sucesso.
echo ===============================================
echo Rodando install tasy...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && npm install"

echo ===============================================
echo Install tasy finalizado com sucesso.
echo ===============================================
echo Bower tasy vai iniciar.
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && bower update"

echo ===============================================
echo Bower tasy finalizado com sucesso.
echo ===============================================

set /p DUMMY=Processo finalizado. Pressione ENTER para finalizar...
