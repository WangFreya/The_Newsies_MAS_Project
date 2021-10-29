from flask import Flask
from src.book import book_lib

app = Flask(__name__)
app.register_blueprint(book_lib, url_prefix="/api/v1/")

@app.route("/")
def home():
    return "Server is up and running!!"


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')