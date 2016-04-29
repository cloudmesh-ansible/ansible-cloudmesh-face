docker-machine create -d virtualbox openface-machine
eval "$(docker-machine env openface-machine)"
docker run -d -p "8500:8500" -h "consul" progrium/consul -server –bootstrap


docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-master

docker-machine create -d virtualbox --swarm  --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-node1


eval $(docker-machine env --swarm openface-master)
docker pull bamos/openface

for machine in $(docker-machine ls | tail -n +2 | awk '{ print $1 }'); do
  eval $(docker-machine env $machine)

    docker run -p 9000:9000 -p 8000:8000 --name openface -v /Users/Sonal/ansible-cloudmesh-face/docker:/root/src/openface/docker  -ti bamos/openface /bin/bash
done


