#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l
echo "Number of mda files"
find mountains -name "firings.mda" | wc -l
echo "#==========================================================="
echo "Start Times"
for f in rplpl-slurm*.out; do
    echo "==> $f <=="
    grep -m1 "time.struct_time" "$f"
done
for f in rplspl-slurm*.out; do
    echo "==> $f <=="
    grep -m1 "time.struct_time" "$f"
done
echo "End Times"
for f in rplpl-slurm*.out; do
    echo "==> $f <=="
    awk '/time\.struct_time/{start=NR} {line[NR]=$0} END{for(i=start;i<=NR;i++) print line[i]}' "$f"
done
for f in rplspl-slurm*.out; do
    echo "==> $f <=="
    awk '/time\.struct_time/{start=NR} {line[NR]=$0} END{for(i=start;i<=NR;i++) print line[i]}' "$f"
done
echo "#==========================================================="
