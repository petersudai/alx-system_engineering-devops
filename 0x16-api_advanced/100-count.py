#!/usr/bin/python3
"""
Queries the Reddit API
"""

import requests


def count_words(subreddit, word_list, after=None, word_count={}):
    """
    Recursively queries the Reddit API
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    headers = {'User-Agent': 'My User Agent'}

    if after:
        url += f'&after={after}'

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return

    data = response.json().get('data', {})
    children = data.get('children', [])

    for child in children:
        title = child.get('data', {}).get('title', '').lower()
        for word in word_list:
            if f' {word.lower()} ' in f' {title} ':
                word_count[word.lower()] = word_count.get(word.lower(), 0) + 1

    after = data.get('after')
    if after:
        count_words(subreddit, word_list, after, word_count)

    else:
        sorted_word_count = sorted(
            word_count.items(),
            key=lambda x: (-x[1], x[0])
        )
        for word, count in sorted_word_count:
            print(f"{word}: {count}")
