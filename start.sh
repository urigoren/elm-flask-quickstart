mkdir js
elm-make elm/index.elm --output js/index.js --yes
python3 server.py
