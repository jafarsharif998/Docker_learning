from flask import Flask

app = Flask(__name__)
import redis

r = redis.Redis(host='redis', port=6379)

@app.route('/')
def hello_world():
    return 'We are running our first container - from CoderCo'

@app.route('/count')    
def count():
    count = r.incr('visits')
    return f'Number of visits: {count}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)