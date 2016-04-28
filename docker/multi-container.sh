docker-machine create -d virtualbox openface-machine
eval "$(docker-machine env openface-machine)"
docker run -d -p "8500:8500" -h "consul" progrium/consul -server –bootstrap


docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-master

docker-machine create -d virtualbox --swarm  --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-node1


eval $(docker-machine env --swarm openface-master)
docker pull bamos/openface

for machine in $(docker-machine ls | tail -n +2 | awk '{ print $1 }'); do
  eval $(docker-machine env $machine)

    docker run -d  -p 9000:9000 -p 8000:8000 --name openface --restart=always  bamos/openface
    
    SS=`docker ps --format "{{.Names}}"`
    
    echo "Container Name is:"$SS
    
    echo "Copying demo2.sh and demo3.sh"

    docker cp demo2.sh openface:/root/src/openface/demo2.sh

    docker cp demo3.sh openface:/root/src/openface/demo3.sh

    docker exec -t -i openface /bin/bash
done


