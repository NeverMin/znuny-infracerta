## OTRS em Docker

### Requisitos:

* Docker
* Docker compose


### Como usar:

1. baixe o conteúdo do respositório para uma pasta no servidor Docker (ex: /opt/docker):

```git clone https://gitlab.com/infracerta/otrs.git```

```cd otrs/docker```

2. Execute o comando para fazer o build da imagem:

```docker-compose build```

3. Suba os containers:

```docker-compose up -d```

Na primeira vez que você subir os container será necessário configurar a ferramenta, igual a uma instalação feita diretamente no SO.