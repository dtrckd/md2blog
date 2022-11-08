https://docs.gitea.io/

Generate an API token 

    curl -H "Content-Type: application/json" -d '{"name":"test"}' -u username:password https://gitea.your.host/api/v1/users/<username>/tokens

Delete token
    
    ?

List API token

    curl --url https://yourusername:password@gitea.your.host/api/v1/users/<username>/tokens


Add a package 

    curl --user your_username:your_token_or_password --upload-file path/tpo/file https://gitea.example.com/api/packages/testuser/generic/test_package/1.0.0/file

Delete a package

    curl --user your_username:your_token_or_password -X DELETE https://gitea.example.com/api/packages/testuser/generic/test_package/1.0.0
