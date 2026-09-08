#!/bin/bash
LOG="/var/log/secure"
echo "=== SOC LOG ANALYSIS REPORT ===" > report.txt
echo "Total Logs: $(wc -l < $LOG)" >> report.txt
echo "Successful Logins: $(grep -c "Accepted password" $LOG)" >> report.txt
echo "PAM Auth Failures: $(grep -c "authentication failure" $LOG)" >> report.txt
echo "Failed Login Attempts: $(grep -c "Failed password" $LOG)" >> report.txt
echo "Top Suspicious IP Addresses:" >> report.txt
grep "Failed password" $LOG | grep -oE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | sort | uniq -c | sort -nr >> report.txt

cat report.txt
