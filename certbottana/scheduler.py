#!/usr/bin/python3
import schedule
import time
from datetime import datetime
import subprocess
import json 

def job():
    print(datetime.now().strftime('[%H:%M:%S]')+'INFO:\033[92m Parsing addon config...\033[0m')
    # parse addon configuration 
    with open('/data/options.json') as addon_conf:
        parsed_conf = json.loads(addon_conf.read())
    domains = " ".join(["-d "+domain for domain in file_contents['domains']])
    print(datetime.now().strftime('[%H:%M:%S]')+'INFO:\033[92m Starting certbottana...\033[0m')
    cmd = subprocess.run(['/app/acme_dehydrated.sh', '-c --accept-terms -k /app/curl.sh '+domains], capture_output=True)
    stdout = str(cmd.stdout).replace('\\n', '\n')
    print(datetime.now().strftime('[%H:%M:%S]')+'INFO:\033[94m Output:')
    print(stdout+'\033[0m')
    
schedule.every().day.at("10:30").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)
