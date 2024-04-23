#!/usr/bin/python3
"""
Python script that, using this REST API, for given 
employee ID, returns information about his/her TODO list progress
"""

import requests
from sys import argv


if __name__ == "__main__":
    employee_id = argv[1]
    user_url = "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
    todos_url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(employee_id)

    try:
        user = requests.get(user_url).json()
        todos = requests.get(todos_url).json()

        total_tasks = len(todos)
        done_tasks = [task for task in todos if task.get('completed')]

        print("Employee {} is done with tasks({}/{}):".format(
            user.get('name'), len(done_tasks), total_tasks))

        for task in done_tasks:
            print("\t {]".format(task.get('title')))

    except Exception as e:
        print(e)
