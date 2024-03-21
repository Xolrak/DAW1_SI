#!/bin/bash
cut -d'.' -f4 /etc/passwd | sort | uniq -c | sort -nr