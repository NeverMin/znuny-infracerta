## Script de Instalação do OTRS

Este script faz a instalação e configuração do Software OTRS. Após rodar este script é necessário ir até a página WEB do servidor para terminar a configuração

## Sistema Operacional suportado

*  Ubuntu 16.04
 

## Como usar

* Faça o download do script para o servidor que será hospedado a aplicação

```
wget https://gitlab.com/infracerta/otrs-infracerta/-/raw/master/scripts/otrs_install_script.sh
```
* Dê permissões de execução no arquivo usando o comando abaixo:

```
chmod +x otrs_install_script.sh
```

* Em seguida rode o script através do comando:

```
bash otrs_install_script.sh
```

* Siga as etapas até finalizar a instalação

* Acesse a url do servidor para finalizar a configuração (ex: http://ipdoservidor/otrs/installer.pl)
