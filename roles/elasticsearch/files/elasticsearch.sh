#!/bin/bash
( ( nohup /hboprod/elk/elasticsearch-6.1.1/bin/elasticsearch 1>/dev/null 2>&1 ) & )