#!/bin/bash
HOST=$1
# List of endpoints 
endpoints=("/endpoint-profile/api/v3/country-codes" 
            "/endpoint-profile/api/v3/languages" 
            "/workflow-config-service/api/dailyshow-vmid-config-mappings/vmid/0d67bb76-1cf5-4e7d-9191-cadc20050fbe" 
            "/endpoint-profile/api/v2/delivery-contexts/search?endpoint=VOD_EXPORTS&channel=ORTS&platform=VOD_MT_Melita_NICK&entityType=Series&materialType=Video"
            "/endpoint-profile/api/v2/delivery-contexts/search?endpoint=All&channel=ORTS&platform=VOD_MT_Melita_NICK&entityType=Series&materialType=Video"
            "/endpoint-profile/api/v3/epd-service/search/by-profile-name?partnerProfileName=VOD_MT_Melita_NICK&entityType=Series&materialType=Video"
            "/endpoint-profile/api/v3/epd-service/428661/package-structures/429027?materialType=Video"
            "/endpoint-profile/api/v3/epd-service/material/527878"
            "/workflow-config-service/api/material-template/v3/search?workflow=UWFAMS&materialTemplate=Video_525005&materialType=Video"
            "/workflow-config-service/api/activity/227316"
            "/endpoint-profile/api/v3/epd-service/527878/technical-requirement/525005"
            "/endpoint-profile/api/v3/epd-service/video-codec/524955"
            "/endpoint-profile/api/v3/epd-service/material/527883"
            "/endpoint-profile/api/v3/epd-service/527883/technical-requirement/525006"
            "/endpoint-profile/api/v3/epd-service/video-codec/524956")


# do curl loop for all endpoint
test_endpoints()
{
    echo "Testing @: $HOST"
    for endpoint in ${endpoints[*]}
    do
        echo "checking response for: $endpoint"
        curl -s -w "\n%{http_code}" "$HOST$endpoint"
        # echo $HTTP_CODE
        # if [[ "$HTTP_CODE" -ne "200" ]]; then
        #     echo "Test failed !"
        #     # return
        # fi
    done
    echo
    echo
    echo "Tests Done !"
}

test_endpoints;