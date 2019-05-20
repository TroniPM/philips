@echo off
echo Iniciando exclusao de pastas 'nbprojects' (verificar arquivo para saber quais).

rmdir "C:\Java\Projetos\Componentes\TasyCliente\nbproject"      	/s /q
rmdir "C:\Java\Projetos\Componentes\WhebRepositorio\nbproject" 		/s /q
rmdir "C:\Java\Projetos\Projetos Comuns\WhebServidor\nbproject" 	/s /q
rmdir "C:\Java\Projetos\Projetos Swing\Ate_Pac\AtePac_EH\nbproject" /s /q
rmdir "C:\Java\Projetos\Projetos Swing\Ate_Pac\AtePac_PM\nbproject" /s /q
rmdir "C:\Java\Projetos\Projetos Comuns\Wheb_Cliente\nbproject" 	/s /q
rmdir "C:\Java\Projetos\Componentes\TasyDataComponents\nbproject"	/s /q
rmdir "C:\Java\Projetos\Componentes\Wheb_Componentes\nbproject"		/s /q

set /p DUMMY=Exclusao acabou. Pressione ENTER para finalizar...
