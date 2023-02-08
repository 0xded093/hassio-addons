#!/usr/bin/python3
import schedule
import time
from datetime import datetime
import subprocess

def job():
print('\033[92m'+datetime.now().strftime("[%H:%M:%S]")+" INFO: Starting blobsaver...")
cmd = subprocess.run(["/app/bin/blobsaver", "--background-autosave"], capture_output=True)
stdout = str(cmd.stdout).replace('\\n', '\n')
print('\033[94m'+datetime.now().strftime("[%H:%M:%S]")+" INFO: Output:")
print(stdout)
    
schedule.every().day.at("10:30").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)
