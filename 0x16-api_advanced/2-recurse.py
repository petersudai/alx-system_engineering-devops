#!/usr/bin/python3
"""
Queries Reddit API recursively & returns list containing titles of all hot articles
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively queries the Reddit API and returns
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    headers = {'User-Agent': 'Mozilla/5.0'}

    if after:
        url += f'&after={after}'

    response = requests.get(url, headers=headers)

    if response.status_code != 200:
        return None

    data = response.json().get('data', {})
    children = data.get('children', [])
    hot_list.extend([child.get('data', {}).get('title') for child in children])

    after = data.get('after')
    if after:
        return recurse(subreddit, hot_list, after)
    else:
        return hot_list
