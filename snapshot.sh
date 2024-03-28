sudo systemctl stop namadad.service
cp $HOME/.local/share/namada/shielded-expedition.88f17d1d14/cometbft/data/priv_validator_state.json $HOME/.local/share/namada/shielded-expedition.88f17d1d14/priv_validator_state.json.backup
rm -rf $HOME/.local/share/namada/shielded-expedition.88f17d1d14/cometbft/data $HOME/.local/share/namada/shielded-expedition.88f17d1d14/db

curl -L https://snapshots.lavenderfive.com/testnet-extra-db/namada/latest_db.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.local/share/namada

curl -L https://snapshots.lavenderfive.com/testnet-snapshots/namada/latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.local/share/namada

mv "$HOME/.local/share/namada/data/" "$HOME/.local/share/namada/shielded-expedition.88f17d1d14/cometbft/"
mv "$HOME/.local/share/namada/db/" "$HOME/.local/share/namada/shielded-expedition.88f17d1d14/"
cp $HOME/.local/share/namada/shielded-expedition.88f17d1d14/priv_validator_state.json.backup $HOME/.local/share/namada/shielded-expedition.88f17d1d14/cometbft/data/priv_validator_state.json


sudo systemctl restart namadad.service && sudo journalctl -u namadad.service -f --no-hostname -o cat
