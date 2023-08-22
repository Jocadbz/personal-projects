# Probably the worst idea I've ever had
from flask import Flask
from flask_restful import Api, Resource, reqparse
import random
import data

app = Flask(__name__)
api = Api(app)

ai_quotes = data.json


class Quote(Resource):

    def get(self, id=0):
        return random.choice(ai_quotes), 200



api.add_resource(Quote, "/torvalds-quotes", "/torvalds-quotes/")

if __name__ == '__main__':
    app.run(debug=True)
