printf "visit source host TOP 100 with total number of occurrences\n" >> data1.txt
cat web_log.tsv|awk -F'\t' '{print $1}'| sort | uniq -c | sort -nr | head -n 100 >> data1.txt
printf "visit source host TOP 100 ID and total number of occurrencess\n" >> data1.txt
cat web_log.tsv|awk -F'\t' '{print $1}'|grep -E "^[0-9]"|sort | uniq -c | sort -nr |head -n 100 >> data1.txt
printf "most frequnetly visited URL TOP 100\n" >> data2.txt
cat web_log.tsv|awk -F '\t' '{print $5,$1}' | sort | uniq -c | sort -nr | head -n 100 >> data2.txt
printf "different response status codes number and persent\n" >> data2.txt
cat web_log.tsv| awk '{num[$6]++;s+=1}END{for (i in num) printf "%s %d %6.5f%%\n",i,num[i],num[i]/s*100}' | sort >> data2.txt
printf "403 and 404 status code with TOP 10 URL\n" >> data2.txt
printf "403:\n">>data2.txt
cat web_log.tsv| awk -F'\t' '{if($6=="403")print $5,$1'|sort |uniq -c | sort -nr | head -n 10 >> data2.txt
printf "404:\n" >> data2.txt
cat web_log.tsv| awk -F'\t' '{if($6=="404")print $5,$1'|sort |uniq -c | sort -nr | head -n 10 >> data2.txt
printf "pointed URL\n">>data3.txt
url='/images/'
cat web_log.tsv| awk -F'\t' '{if($5=="'$url'")print $1,$5}' | sort | uniq -c | sort -nr | head -n 100 >> data3.txt
