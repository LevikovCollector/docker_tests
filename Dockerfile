FROM python:3.5.9-buster
COPY . .
RUN pip install -r requirements.txt
RUN mv chromedriver /usr/local/bin
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update
RUN apt-get install google-chrome-stable -y
CMD ["pytest", "tests", "--opencart_url", "http://192.168.1.72/opencart/"]
