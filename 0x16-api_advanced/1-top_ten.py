#!/usr/bin/python3
"""
Queries the Reddit API and prints the titles of the first 10 hot posts
"""

import requests


def top_ten(subreddit):
    """Prints the titles of the first 10 host posts"""

    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {'User-Agent': 'Mozilla/5.0'}

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        children = data['data']['children']
        for post in children:
            print(post['data']['title'])
    else:
        print(None)
