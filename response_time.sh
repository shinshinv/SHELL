for i in {1..10}
do
    CDATE=`date`
    echo "response check(${i}) - ${CDATE}"
    echo "https://shopping.naver.com/"
    result=`curl -o /dev/null -s -w %{time_total} "https://shopping.naver.com/"`
    echo "result : ${result}"
    echo ""
    sleep 1s
done
