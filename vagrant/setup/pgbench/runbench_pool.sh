#!/bin/bash

pgbench -U bench -c 16 bench -p 6432 -T 300 -f balancecheck1.bench -f balancecheck2.bench -f balancecheck3.bench -f balancecheck4.bench