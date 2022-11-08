
Generate an API token 

    curl -H "Content-Type: application/json" -d '{"name":"test"}' -u username:password https://gitea.your.host/api/v1/users/<username>/tokens

List API token

    curl --url https://yourusername:password@gitea.your.host/api/v1/users/<username>/tokens

Delete an API token 

    Did not find it in doc : https://github.com/go-gitea/gitea/pull/4235
