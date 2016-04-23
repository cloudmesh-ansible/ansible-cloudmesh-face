boot2docker stop
boot2docker delete
sudo rm /usr/local/bin/docker
sudo rm /usr/local/bin/boot2docker
sudo rm /usr/local/share/boot2docker/boot2docker.iso
sudo rmdir /usr/local/share/boot2docker

rm -rf ~/.boot2docker
sudo rm /usr/local/share/boot2docker/boot2docker.iso
sudo rmdir /usr/local/share/boot2docker

rm -rf ~/.boot2docker
sudo rm -f /private/var/db/receipts/io.boot2docker.*
sudo rm -f /private/var/db/receipts/io.boot2dockeriso.*
