#!/usr/bin/env python3

from os import walk
import sys

gitignore = [f for f in open(".gitignore").read().splitlines()]

def rec(path):
    for (dirpath, dirnames, filenames) in walk(path):
        for file in filenames:
            if file in gitignore: return
            if any([1 for i in gitignore if dirpath.find(i) > 0]):
                continue
            if file[-2:] == ".c":
                print(dirpath + "/" + file)
            
rec("./src")