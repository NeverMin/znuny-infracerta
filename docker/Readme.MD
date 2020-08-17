## OTRS in Docker

### Requirements:

* Docker [Install instructions](https://docs.docker.com/get-docker/)
* Docker compose [Install instructions](https://docs.docker.com/compose/install/)


### How to use:

Clone the repository:

```git clone https://gitlab.com/infracerta/otrs.git```

```cd otrs/docker```

Build the containers:

```docker-compose build```

Startup containers:

```docker-compose up -d```

Open a Web browser,  go to `http://youripaddress/otrs/installer.pl` and follow the [web installer instructions](https://doc.otrs.com/doc/manual/admin/6.0/en/html/web-installer.html). 

For step 2 (Database Settings), select the option `Use an existing database for OTRS` and  fill the next screen with the following information:

* User: `otrs_user`
* Password: `Otrsuser01!`
* Host: `otrs_database`
* Database name: `otrs_db`

Go through the next screens. If the installation succeeds you will see a screen with the root credentials.

Have fun.
