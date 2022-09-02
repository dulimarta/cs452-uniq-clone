cat lorem.txt | ./uno -c -d > ours$$-1
./uno -d -c lorem.txt > ours$$-2

cmp ours$$-1 ours$$-2
rc=$?

rm ours$$-1 ours$$-2
if [ $rc -eq 0 ]
then
  echo "$0 pass"
else
  echo "$0 failed"
fi
exit $rc
