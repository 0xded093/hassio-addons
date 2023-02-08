#!/usr/bin/python3
import schedule
import time
from datetime import datetime
import subprocess

def job():
    print(datetime.now().strftime('[%H:%M:%S]')+'INFO:\033[92m Starting blobsaver...\033[0m')
    cmd = subprocess.run(['/app/bin/blobsaver', '--background-autosave'], capture_output=True)
    stdout = str(cmd.stdout).replace('\\n', '\n')
    print(datetime.now().strftime('[%H:%M:%S]')+'INFO:\033[94m Output:')
    print(stdout+'\033[0m')
    
schedule.every().day.at("10:30").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)
