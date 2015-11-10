#!/bin/bash

pgbench -U bench -c 6 bench -T 300 -f balancecheck1.bench -f balancecheck2.bench -f deposit.bench -f withdrawal.bench -f branchreport.bench -f transfer1.bench -f hang.bench