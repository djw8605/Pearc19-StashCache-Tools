#!/bin/sh -x
test_dir=$1

# List of files
files="1perc.data  25perc.data  50perc.data  5perc.data  75perc.data  95perc.data big_blast.data"

http_download_file () {
  file=$1
  curl -v http://stash.osgconnect.net/~dweitzel/download_tests/$test_dir/$file -o to_delete

}

stashcp_download_file () {
  file=$1
  python stashcp.py --methods=xrootd -d /user/dweitzel/public/download_tests/$test_dir/$file ./to_delete
  return $?

}



echo "HTTP Proxy set to: $http_proxy"
# Time the downloads, in seconds
for test_file in $files; do
echo $test_file
ts=$(date +%s%N) ; http_download_file $test_file ; tt=$((($(date +%s%N) - $ts)/1000000))
echo "HTTP File: $test_file, milliseconds: $tt"
rm -f to_delete
ts=$(date +%s%N) ; http_download_file $test_file ; tt=$((($(date +%s%N) - $ts)/1000000))
echo "HTTP Cached File: $test_file, milliseconds: $tt"
rm -f to_delete
done

# 
# Now stashcp
for test_file in $files; do
echo $test_file
ts=$(date +%s%N)
stashcp_download_file $test_file
stashcp_return=$?
tt=$((($(date +%s%N) - $ts)/1000000))
echo "stashcp File: $test_file, milliseconds: $tt, return $stashcp_return"
rm -f to_delete
done

for test_file in $files; do
echo $test_file
ts=$(date +%s%N)
stashcp_download_file $test_file
stashcp_return=$?
tt=$((($(date +%s%N) - $ts)/1000000))
echo "stashcp Cached File: $test_file, milliseconds: $tt, return $stashcp_return"
rm -f to_delete
done


