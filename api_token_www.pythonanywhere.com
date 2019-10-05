
#API TOKEN 
f8a90f453ec16bd4134b47e6816f8f846ee5458b


import requests
my_domain = 'mcarmenzv.pythonanywhere.com'
username = 'mcarmenzv'
token = 'f8a90f453ec16bd4134b47e6816f8f846ee5458b'

response = requests.post(
  'https://www.pythonanywhere.com/api/v0/user/{username}/webapps/{domain}/reload/'.format(
      username=username, domain=my_domain
  ),
  headers={'Authorization': 'Token {token}'.format(token=token)}
)
if response.status_code == 200:
  print('All OK')
else:
  print('Got unexpected status code {}: {!r}'.format(response.status_code, response.content))