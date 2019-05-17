#!/bin/bash

mkdir app/

wget https://releases.wikimedia.org/mediawiki/1.32/mediawiki-1.32.0.tar.gz
tar -xvzf mediawiki-*.tar.gz -C ./app/
sudo mv ./app/mediawiki*/* ./app/
rm -r ./app/mediawiki*/
rm mediawiki-*.tar.gz


sudo setsid docker run -i -t -p "80:80" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql mattrayner/lamp:latest
