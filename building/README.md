# Buildando o tasy


**(Obrigatório)** git clone dos projetos abaixo com SSH [MUITO importante: apenas com SSH]:
  - tasy
  - tasy-backend
  - tasy-framework
  - tasy-framework-backend
  
**(Obrigatório)** Clone dos projetos no mesmo diretório em que está o arquivo ```build.bat```:

    .
    ├── tasy/
    ├── tasy-backend/
    ├── tasy-framework/
    ├── tasy-framework-backend/
    └── build.bat



**(Obrigatório)** Altere as linhas abaixo para selecionar a versão que deseja buildar:
```sh
...
set frameworks_branch=3.02.1747
set setor_branch=3.02.1747
...
```

Ou 

```sh
...
set frameworks_branch=dev
set setor_branch=assistencial
...
```

*(Opcional)* Altere a linha abaixo para mudar o nome do arquivo de lob:

```sh
...
set LOG=log.log
...
```

Execute o arquivo ```build.bat```. 

Caso ocorra algum erro em um dos comandos executados, o processo não irá continuar. Será necessário você ver onde parou e executar manualmente os demais comandos (ou reexecutar o script inteiro). A mensagem de saída será:
```
===============================================
===============================================
Execucao do script foi interrompida. Erro(s) encontrado(s):

erros aqui
.
.
.
===============================================
===============================================
===============================================
```

Caso o script seja executado sem erros, a saída será a seguinte:
```
===============================================
Processo finalizado sem erros.
===============================================
===============================================
===============================================
```

**(TO-DO)** Se nome de arquivo atualizado pelo git contenha palavras 'error', 'failure', ou 'fatal' (ou qualquer aparição dessas palavras), vai parar a build, mesmo que isso não seja de fato um erro. Ver melhor forma de detectar erros.
