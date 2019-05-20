@echo off
set LOG=log.log
call > %LOG%
REM LIMPANDO ARQUIVO DE LOG


REM OBRIGATORIO DEFINIR CAMINHO DO GRADLE EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\gradle-2.14\bin\".
REM OBRIGATORIO DEFINIR CAMINHO DO JAVA EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\jdk1.8.0_201\bin".
REM ESSE ARQUIVO DEVE ESTAR NO MESMO NIVEL DAS PASTAS TASY, TASY-BACKEND, TASY-FRAMEOWRK-BACKEND E TASY-FRAMEWORK. EX:
REM --> tasy/
REM --> tasy-backend/
REM --> tasy-framework-backend/
REM --> tasy-framework/
REM --> build-tasy.bat
REM AUTOMATIZAÇÃO PARA ATUALIZAR, BUILDAR E PUBLICAR PROJETOS LOCALMENTE, DE ACORDO COM UMA VERSÃO.
REM REQUER QUE REPOSITORIOS TENHAM SIDO CLONADOS COM SSH.

rem set frameworks_branch=3.02.1747
rem set setor_branch=3.02.1747
set frameworks_branch=dev
set setor_branch=assistencial

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo ===============================================
echo Iniciando atualizacao tasy-framework-backend (pull)...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && git reset --hard && git checkout %frameworks_branch% && git pull origin %frameworks_branch%" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo tasy-framework-backend atualizado com sucesso.
echo ===============================================
echo Iniciando build tasy-framework-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && gradle clean build" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Build tasy-framework-backend finalizada com sucesso.
echo ===============================================
echo Publish do tasy-framework-backend vai iniciar.
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework-backend/ && gradle publish publishToMavenLocal" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Publish do tasy-framework-backend finalizado com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo Iniciando atualizacao tasy-backend (pull)...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-backend/ && git reset --hard && git checkout %setor_branch% && git pull origin %setor_branch%" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo tasy-backend atualizado com sucesso.
echo ===============================================
echo Iniciando build tasy-backend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-backend/ && gradle clean build" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Build tasy-backend finalizada com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo Iniciando atualizacao tasy-framework (pull)...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework/ && git reset --hard && git checkout %frameworks_branch% && git pull origin %frameworks_branch%" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo tasy-framework atualizado com sucesso.
echo ===============================================
echo Iniciando install tasy-framework...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy-framework/ && npm install" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Install tasy-framework finalizado com sucesso.
echo ===============================================

rem ===========================================================
rem ===========================================================
rem ===========================================================

echo Iniciando atualizacao tasy frontend (pull)...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && git reset --hard && git checkout %setor_branch% && git pull origin %setor_branch%" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo tasy frontend atualizado com sucesso.
echo ===============================================
echo Iniciando install tasy frontend...
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && npm install" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Install tasy frontend finalizado com sucesso.
echo ===============================================
echo Bower tasy frontend vai iniciar.
echo ===============================================

start /b /wait cmd.exe /c "cd tasy/ && bower update" >> %LOG% 2>&1
for /f "tokens=*" %%a in ('findstr /i "error failure fatal" %LOG%') do ( goto errorlabel )

echo Bower tasy frontend finalizado com sucesso.
echo ===============================================
echo Processo finalizado sem erros.
goto final

:errorlabel
echo ===============================================
echo ===============================================
echo Execucao do script foi interrompida. Erro(s) encontrado(s):
findstr /I "error failure fatal" %LOG%

:final
echo ===============================================
echo ===============================================
echo ===============================================
set /p DUMMY=Pressione ENTER para finalizar...
