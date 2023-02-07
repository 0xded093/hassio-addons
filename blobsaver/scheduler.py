#!/usr/bin/python3
import schedule
import time
import subprocess

def job():
    print("Starting blobsaver")
    subprocess.run(["/app/bin/blobsaver", "--background-autosave"], capture_output=True)

schedule.every().day.at("10:30").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)