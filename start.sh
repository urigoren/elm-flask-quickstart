mkdir js
elm-make elm/index.elm --output js/index.js --yes
python server.py
