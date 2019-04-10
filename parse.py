
import csv
import re
import sys



#stashcp File: 1perc.data, milliseconds: 2027, return 0

line_filter = re.compile("^([\w\s]+)\sFile:\s+([\w\.]+),\s+milliseconds:\s+(\d+).*$")

header = ["File", "HTTP", "HTTP Cached", "stashcp", "stashcp Cached"]

to_read = open(sys.argv[1], 'r')
results = {}
for line in to_read.readlines():
    match = line_filter.search(line)
    if match:
        print match.groups()
        if match.group(2) not in results:
            results[match.group(2)] = {}
        results[match.group(2)][match.group(1)] = match.group(3)

print results

to_write = open(sys.argv[2], 'w')
writer = csv.DictWriter(to_write, fieldnames=header)
writer.writeheader()

for filename in results:
    line = {'File': filename}
    for transfer in results[filename]:
        line[transfer] = results[filename][transfer]
    writer.writerow(line)


