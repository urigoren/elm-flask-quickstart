import sys
sys.path.append("python")
import json
import utils
from flask import Flask, request, send_from_directory, render_template, redirect

app = Flask(__name__)
with open("config.json", 'r') as f:
  config = json.load(f)

@app.after_request
def add_no_cache(response):
    if request.endpoint != "static":
        response.headers["Cache-Control"] = "no-cache"
        response.headers["Pragma"] = "no-cache"
    return response


@app.errorhandler(404)
def page_not_found(e):
    return redirect(config["404_redirect"])
    
@app.route('/assets/<path:path>')
def serve_assets(path):
    return send_from_directory('assets', path)


@app.route('/favicon.ico')
def favicon():
    return send_from_directory('assets', 'favicon.ico')


@app.route('/js/<path:path>')
def serve_js(path):
    return send_from_directory('js', path)


@app.route('/css/<path:path>')
def serve_css(path):
    return send_from_directory('css', path)


@app.route('/')
def root():
    # TODO: Implement logic
    return render_template('index_elm.html', id=1, name="test")
    
if __name__ == "__main__":
    app.run(port=config["server_port"], host='0.0.0.0', debug=config["debug"])
