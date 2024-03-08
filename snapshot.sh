sudo systemctl stop namadad
cp .local/share/namada/shielded-expedition.88f17d1d14/cometbft/data/priv_validator_state.json .local/share/namada/priv_validator_state.json 
sudo apt install lz4
mkdir ~/namada-temp
curl -L https://namada-se-rpc.citadel.one/snap/namada-se-90000.tar.lz4 | tar -Ilz4 -xf - -C ~/namada-temp
rm -rf ~/.local/share/namada/shielded-expedition.88f17d1d14/db
rm -rf ~/.local/share/namada/shielded-expedition.88f17d1d14/cometbft/data
cp -a ~/namada-temp/db ~/.local/share/namada/shielded-expedition.88f17d1d14/
cp -a ~/namada-temp/data ~/.local/share/namada/shielded-expedition.88f17d1d14/cometbft
mv .local/share/namada/priv_validator_state.json .local/share/namada/shielded-expedition.88f17d1d14/cometbft/data/priv_validator_state.json 
sudo systemctl restart namadad 
sudo journalctl -u namadad -f -o cat
