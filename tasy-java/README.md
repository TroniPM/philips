# Scripts para atualizar workspaces

Executar comando ```update.bat``` para atualizar os 4 workspaces e remover qualquer alteração no Repositório Local (equivalente a ```git reset --hard```). A Estrutura de pastas deve ser a seguinte:

    .
    ├── Componentes/
    ├── Projetos Comuns/
    ├── Projetos Swing/
    ├── Projetos Web/
    ├── limpar.bat
    └── update.bat


Edite o arquivo ```limpar.bat``` para remover a pasta ```nbprojects``` dos projetos desejados, exemplo:
```sh
...
rmdir "C:\Java\Projetos\Projetos Comuns\Wheb_Cliente\nbproject" 	/s /q
rmdir "C:\Java\Projetos\Componentes\TasyDataComponents\nbproject"	/s /q
...
```

O script ```limpar.bat``` é chamado automaticamente dentro do  ```update.bat```.
