#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class Handler(FileSystemEventHandler):
    def build(self):
        subprocess.call(["runestone", "build"])


    def on_created(self, event):
        print event
        self.build()

    def on_deleted(self, event):
        print event
        self.build()

    def on_moved(self, event):
        print event
        self.build()

    def on_modified(self, event):
        print event
        self.build()

observer = Observer()
observer.schedule(Handler(), path='./_sources', recursive=True)
observer.start()

try:
    while True:
        time.sleep(1000)
except KeyboardInterrupt:
    observer.stop()
observer.join()
