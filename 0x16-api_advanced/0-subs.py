#!/usr/bin/python3
"""
Queries the Reddit API and returns number  of subsrcibers for given subreddit
"""

import requests


def number_of_subscribers(subreddit):
    """Returns number of subscribers for given subreddit"""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'My User Agent 1.0'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    else:
        return 0
