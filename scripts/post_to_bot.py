#!/usr/bin/env python3
import sys
import requests
import yaml

txt = open('../_posts/' + sys.argv[1], 'r').read();
header = txt[txt.find('\n') + 1 : txt.find('---\n', txt.find('\n') + 1)]
info = yaml.load(header)
text = "Novo post no blog: '[" + info['title'] + "](https://www.ime.usp.br/~maratona/"
try:
	permalink = info['permalink'].strip(' "/\n');
	if permalink.find(':') == -1:
		text += permalink
	elif permalink == ':categories/:title':
		raise 'default'
except:
	for c in info['categories']:
		text += c + '/'
	fn = sys.argv[1]
	for i in range(3):
		fn = fn[fn.find('-') + 1:]
	text += fn[:fn.rfind('.')]

text += ")'"

token = sys.argv[2]

r = requests.post('https://api.telegram.org/bot' + token + '/sendMessage', data={'chat_id': '@maratonime', 'text': text, 'parse_mode': 'Markdown'})
