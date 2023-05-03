export EXPLORER_DIR=/home/roger/projects/jade-explorer
export GETH_DIR=/devnet/geth

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
