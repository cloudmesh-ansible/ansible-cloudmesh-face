#!/bin/bash

if [ -z "$*" ]; then 
        echo "Usage: .sh <Number of Swarm Nodes to be created>";

else 

	docker-machine create -d virtualbox openface-machine
	eval "$(docker-machine env openface-machine)"
	docker run -d -p "8500:8500" -h "consul" progrium/consul -server –bootst	rap
	
	docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-master	
	
	for ((i = 1; i <= $1; i++)); do
		
		docker-machine create -d virtualbox --swarm  --swarm-discovery="consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-store=consul://$(docker-machine ip openface-machine):8500" --engine-opt="cluster-advertise=eth1:2376" openface-node-$i;        
	done	
	eval $(docker-machine env --swarm openface-master)
	docker pull bamos/openface

	for machine in $(docker-machine ls | tail -n +2 | awk '{ print $1 }'); do
  		eval $(docker-machine env $machine)

    		docker run -p 9000:9000 -p 8000:8000 --name openface -v /~/ansible-cloudmesh-face/docker:/root/openface/docker  -ti bamos/openface /bin/bash
  
	done

docker-machine rm $(docker-machine ls -q)
fi
