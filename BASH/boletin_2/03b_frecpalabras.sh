#!/bin/bash
tr'''\n' < texto.txt | sort | uniq -c | sort -nr