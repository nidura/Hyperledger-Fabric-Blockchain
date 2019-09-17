# Hyperledger-Fabric-Blockchain

Hyperledger Fabric Network with Multiple Organization and multiple chaincode

# Defining the Architecture

    1 Orderer
    2 Organizations
    1 Peer per organization
    1 CA per organization
    1 cli


# Starting The Network
    docker-compose -f docker-compose.yaml -f docker-compose-ca.yaml up -d
    

After this command is executed successfully, just check if everything is running with the following command.

     docker ps

# Chain code install using hyperlder composer(.ban file)
    
    .................


