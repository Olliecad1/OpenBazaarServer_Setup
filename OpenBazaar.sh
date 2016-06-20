#!/bin/bash
sudo apt-get install -y git python-dev libffi-dev libssl-dev python-setuptools
sudo easy_install pip
git clone https://github.com/OpenBazaar/OpenBazaar-Server
cd OpenBazaar-Server
git checkout `git describe --tags`
sudo pip install -r requirements.txt
if [ -f ob.cfg] ; then
rm ob.cfg
fi
touch ob.cfg
printf '[CONSTANTS]\n  #DATA_FOLDER=/path/to/OpenBazaar/\n  \n  KSIZE=20\n  ALPHA=3\n  \n  TRANSACTION_FEE=20400\n  \n  RESOLVER=https://resol/resolver.onename.com   \n [LIBBITCOIN_SERVERS]\n  mainnet_server1=tcp://libbitcoin1.openbazaar.org:9091\n  mainnet_server3=tcp://libbitcoin3.$coin3.openbazaar.org:9091\n  mainnet_server5=tcp://obelisk.airbitz.co:9091\n  [LIBBITCOIN_SERVERS_TESTNET]\n  testnet_server2=tcp://libbitcoi$coin3.openbazaar.org:9091\n  mainnet_server5=tcp://obelisk.airbitz.co:9091\n  [LIBBITCOIN_SERVERS_TESTNET]\n  testnet_server2=tcp://libbitcoi$coin3.openbazaar.org:9091\n  mainnet_server5=tcp://obelisk.airbitz.co:9091\n  [LIBBITCOIN_SERVERS_TESTNET]\n  testnet_server2=tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3\n  testnet_server4=tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPyS LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM\n  \n  [AUTHENTICATION]\n  #SSL=False\n  #SSL_CERT=/path/to/certicate.crt\n  #SSL_KEY=/path/to/privkey.key\n \n  USERNAME=TEST\n  PASSWORD=testpassword\n  \n  [MAINNET_SEEDS]\n  mainnet_seed2=seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe\n  mainnet_seed3=seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee\n  \n  [TESTNET_SEEDS]\n  testnet_seed1=seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117'
python openbazaard.py start -d -a 0.0.0.0
