# Tear down running network
docker-compose -f docker-compose.yaml -f docker-compose-ca.yaml down
# remove orderer block and other channel configuration transactions and certs
rm -rf channel-artifacts/*.block channel-artifacts/*.tx crypto-config
# clearContainers
docker rm -f $(docker ps -aq)
