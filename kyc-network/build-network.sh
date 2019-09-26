echo "staring the network with ca"
docker-compose -f docker-compose.yaml -f docker-compose-ca.yaml up -d

echo "create channel" 
docker exec cli peer channel create -o orderer.example.com:7050 -c $CHANNEL_ONE_NAME -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/${CHANNEL_ONE_NAME}.tx --tls --cafile $ORDERER_CA

echo "Join the Channel One as Org1 Peer"
docker exec cli peer channel join -b ${CHANNEL_ONE_NAME}.block --tls --cafile $ORDERER_CA


echo "Join the Channel One as Org2 Peer"
docker exec -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" cli peer channel join -b ${CHANNEL_ONE_NAME}.block --tls --cafile $ORDERER_CA

echo "Update the Anchor Peers in Channel One"
docker exec cli peer channel update -o orderer.example.com:7050 -c $CHANNEL_ONE_NAME -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/Org1MSPanchors_${CHANNEL_ONE_NAME}.tx --tls --cafile $ORDERER_CA 

docker exec  -e "CORE_PEER_LOCALMSPID=Org2MSP" -e "CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp" -e "CORE_PEER_ADDRESS=peer0.org2.example.com:7051" cli peer channel update -o orderer.example.com:7050 -c $CHANNEL_ONE_NAME -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/Org2MSPanchors_${CHANNEL_ONE_NAME}.tx --tls --cafile $ORDERER_CA




