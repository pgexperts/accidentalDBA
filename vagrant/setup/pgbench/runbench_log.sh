#!/bin/bash

pgbench -U bench -c 6 bench -T 300 -f balancecheck1.bench -f balancecheck2.bench -f balancecheck3.bench -f deposit.bench -f withdrawal.bench -f branchreport.bench