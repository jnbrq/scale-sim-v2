import sys
import re

if len(sys.argv) != 3:
    print("too few arguments, we need the name of the topology file and report filepath")

topo = sys.argv[1]
fpath = sys.argv[2]

cycle_regex = re.compile(r"cycles:\s+(\d+)")
time_regex = re.compile(r"real\s+(\d+)m(\d+(?:.\d+)?)s")

def output_metrics(c: str) -> None:
    total_cycles = 0
    for match in cycle_regex.findall(c):
        total_cycles += int(match)
    time = float(time_regex.findall(c)[0][0]) * 60 + float(time_regex.findall(c)[0][1])
    throughput = total_cycles / time
    print(f"{topo};{total_cycles};{time};{throughput}")


with open(fpath) as f:
    output_metrics(f.read())
