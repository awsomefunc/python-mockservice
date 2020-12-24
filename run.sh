#!/bin/bash
 
stage="test13"
region="us-east-1"

# Deploy current version of api
deploy_and_upload()
{
    echo "Deploying current version to: -s $stage -r $region"
    serverless deploy -s $stage -r $region
    if [[ $? -ne 0 ]]; then
        echo "Deployment failed !"
        return
    fi
    upload_mock_data
}

  
# Upload mock data to dynamoDB using CURL to current api
upload_mock_data()
{
     #  Get the current deployed URL
    URL="$(serverless info -s $stage -r $region --verbose | grep ServiceEndpoint | sed s/ServiceEndpoint\:\ //g)"
    echo "Uploading endpoints data..."
    file="data/data.sh"
    echo "Host url: $URL"
    source $file "$URL"
    
    # Tests
    source "data/test.sh" "$URL"
    echo
    echo "[HOST]: $URL"
    
}
# upload_mock_data
deploy_and_upload
echo "DONE"




 