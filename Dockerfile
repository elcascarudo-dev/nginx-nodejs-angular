FROM ubuntu

LABEL maintainer="elcascarudo.dev@gmail.com"

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
    apt-get install -y git && \
    apt-get install -y nginx && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/* 


# Instalando NodeJS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# Instalando Angular CLI
RUN npm install -g @angular/cli

# Configuración de Nginx para que funcionae Angular
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]