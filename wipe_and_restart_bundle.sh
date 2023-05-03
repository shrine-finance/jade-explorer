export EXPLORER_DIR=/home/roger/projects/jade-explorer
export GETH_DIR=/devnet/geth
export ETHEREUM_JSONRPC_HTTP_URL=http://127.0.0.1:8545
export ETHEREUM_JSONRPC_VARIANT=geth

export DATABASE_URL=postgresql://postgres:meowiscuteaf@localhost:5432/blockscout

export SUBNETWORK="Jade Network"
export NETWORK="POA"
export SECRET_KEY_BASE=$(cat ~/blockscout_secret.txt)
export BLOCKSCOUT_HOST=0.0.0.0
export BLOCKSCOUT_PROTOCOL=http
export LINK_TO_OTHER_EXPLORERS=false

export PORT=4000
export COIN=JADE
export COIN_NAME=JADE
export LOGO=/images/jadescan-logo.png
export LOGO_FOOTER=/images/jadescan-logo.png
export SUBNETWORK="JADE Network"
export CHAIN_ID=99168

sudo supervisorctl stop jade-explorer

killall beam.smp

sleep 15

cd $EXPLORER_DIR
mix do ecto.drop, ecto.create, ecto.migrate

./stop-chain.sh
./wipe-chain.sh
./init-chain.sh
./start-chain.sh

cd $EXPLORER_DIR
sudo supervisorctl start jade-explorer
