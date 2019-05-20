@echo off
REM OBRIGATORIO DEFINIR CAMINHO DO GRADLE EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\gradle-2.14\bin\"
REM OBRIGATORIO DEFINIR CAMINHO DO JAVA EM VARIAVEL DO SISTEMA (PATH). EX: "C:\Java\jdk1.8.0_201\bin"
echo Comecando...

echo Iniciando atualizacao Componentes...
cd Componentes/ && svn revert -R . && svn update
echo Componentes atualizado com sucesso.

echo Iniciando atualizacao Projetos Comuns...
cd ../Projetos Comuns/ && svn revert -R . && svn update
echo Projetos Comuns atualizado com sucesso.

echo Iniciando atualizacao Projetos Swing...
cd ../Projetos Swing/ && svn revert -R . && svn update
echo Projetos Swing atualizado com sucesso.

echo Iniciando atualizacao Projetos Web...
cd ../Projetos Web/ && svn revert -R . && svn update
echo Projetos Web atualizado com sucesso.

cd ..

call limpar.bat

set /p DUMMY=Processo finalizado. Pressione ENTER para finalizar...
