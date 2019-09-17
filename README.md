# Hyperledger-Fabric-Blockchain

Hyperledger Fabric Network with Multiple Organization and multiple chaincode

# Defining the Architecture

    1 Orderer
    2 Organizations
    1 Peer per organization
    1 CA per organization
    1 cli
    
    
# Setting Up The Environment
   Create a new folder in a suitable location.
   
    mkdir multichain_network
    cd multichain_network
    
Pulling Platform Tools The platform tools are necessary to create the certificates and configuration transaction blocks to setup the network. It’s specific to each platform thus you need to manually download it with the following script.

    curl -sSL https://goo.gl/6wtTN5 | bash -s 1.1.0
    This will create a bin folder in the current location
   
create the following files and its content to start the network
  
    touch docker-composer.yml
    touch crypto-config.yml
    touch configtx.yaml
