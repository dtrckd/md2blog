
Get a credential 

    curl -XPOST -d '{"type":"m.login.password", "user":"userid", "password":"password"}' "https://matrix.org/_matrix/client/r0/login"


Send a message

    curl "https://matrix.org/_matrix/client/r0/rooms/ROOM_NAME/send/m.room.message/?access_token=TOKEN" -X PUT --data '{"msgtype":"m.text","body":"hello world"}'
