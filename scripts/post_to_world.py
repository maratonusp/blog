#!/usr/bin/env python3
import sys

# Parameters
# 1. filename (for the .md in _posts/ folder)
filename = sys.argv[1]
# 2. Bot token to post the message to the channel
token_bot = sys.argv[2]
# 3. Page token to post the message to the facebook page
token_page = sys.argv[3]


import requests
import yaml
import re

print("Posting file " + sys.argv[1])

# Find the position of the k-th occurrence of pat in string
def find_kth(string, pat, k):
	fst = string.find(pat)
	if k == 1:
		return fst
	else:
		return find_kth(string[fst + 1:], pat, k - 1) + fst + 1

txt = open('../_posts/' + filename, 'r').read();
header = txt[txt.find('\n') + 1 : find_kth(txt, '---\n', 2)]
text = txt[find_kth(txt, '---\n', 2) + 4:].strip()
info = yaml.load(header)

# Creating link from post header
link = 'https://www.ime.usp.br/~maratona/'
try:
	permalink = info['permalink'].strip(' "/\n');
	if permalink.find(':') == -1:
		link += permalink
	elif permalink == ':categories/:title':
		raise 'default'
except:
	for c in info['categories']:
		link += c + '/'
	fn = filename
	for i in range(3):
		fn = fn[fn.find('-') + 1:]
	link += fn[:fn.rfind('.')]

text_channel = "Novo post no blog: '[" + info['title'] + "](" + link + ")"
r = requests.post('https://api.telegram.org/bot' + token_bot + '/sendMessage', data={'chat_id': '@maratonime', 'text': text_channel, 'parse_mode': 'Markdown'})
print("Bot response: " + str(r.status_code) + " " + r.reason)

# First paragraph
parag = text[:text.find('\n\n')]
# Removing markdown links
parag = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', parag)
text_page = info['title'] + '\n\n' + parag.rstrip() + '\n\nLeia mais no site. :)'
r = requests.post('https://graph.facebook.com/v2.11/maratonIME/feed', data={'message': text_page, 'access_token': token_page, 'link': link})
print("Bot response: " + str(r.status_code) + " " + r.reason)
