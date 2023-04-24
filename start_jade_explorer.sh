#!/bin/bash
export PATH=$PATH:/home/roger/elixir/bin
export HOME=/home/roger
export EXPLORER_DIR=/home/roger/projects/jade-explorer
# export MIX_ENV=prod

cd $EXPLORER_DIR

# Assuming we have an Ethereum archive node running on 127.0.0.1, with necessary HTTP APIs open
export ETHEREUM_JSONRPC_HTTP_URL=http://127.0.0.1:8545
export ETHEREUM_JSONRPC_VARIANT=geth

export DATABASE_URL=postgresql://postgres:meowiscuteaf@localhost:5432/blockscout

export ETHEREUM_JSONRPC_WS_URL=ws://127.0.0.1:8546
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

_mix_system_gettext_path=$(mix deps.path gettext)
_mix_system_decimal_path=$(mix deps.path decimal)
export C_INCLUDE_PATH=${_mix_system_gettext_path}/priv:${_mix_system_decimal_path}/priv:${C_INCLUDE_PATH}
mix phx.server
