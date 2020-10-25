echo "Waiting for file $1"
until [ -f $1 ]
do
     sleep 5
done
echo "File found"
echo -ne '\007'
exit
