mkdir js
elm-make elm/index.elm --output js/index.js --yes
pip3 install -r requirements.txt
python3 server.py
