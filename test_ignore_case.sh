./uno -i lorem.txt > ours$$
uniq -i lorem.txt > theirs$$

diff -w ours$$ theirs$$
rc=$?

rm ours$$ theirs$$

if [ $rc -eq 0 ]
then
  echo "$0 pass"
else
  echo "$0 failed"
fi
exit $rc
