#!/bin/sh -x
output_path=$1

dd if=/dev/urandom of=$output_path/1perc.data bs=1 count=5936

dd if=/dev/urandom of=$output_path/5perc.data bs=1M count=23

dd if=/dev/urandom of=$output_path/25perc.data bs=1M count=170

dd if=/dev/urandom of=$output_path/50perc.data bs=1M count=468

dd if=/dev/urandom of=$output_path/75perc.data bs=1M count=493

dd if=/dev/urandom of=$output_path/95perc.data bs=1M count=2335

# 99perc is same as 95
#dd if=/dev/urandom of=$output_path/99perc.data bs=1m count=

dd if=/dev/urandom of=$output_path/big_blast.data bs=1M count=10000
