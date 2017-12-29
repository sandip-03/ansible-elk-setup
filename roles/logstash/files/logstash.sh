#!/bin/bash
( ( nohup /hboprod/elk/logstash-6.1.1/bin/logstash -f /hboprod/elk/logstash-6.1.1/bin/logstash.conf 1>/dev/null 2>&1 ) & )