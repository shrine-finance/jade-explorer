export EXPLORER_DIR=/home/roger/projects/jade-explorer
export GETH_DIR=/devnet/geth

sudo supervisorctl stop jade-explorer

cd $EXPLORER_DIR
mix do ecto.drop, ecto.create, ecto.migrate

cd $GETH_DIR
/devnet/geth/stop-chain.sh
/devnet/geth/wipe-chain.sh
/devnet/geth/init-chain.sh
/devnet/geth/start-chain.sh

cd $EXPLORER_DIR
sudo supervisorctl start jade-explorer
