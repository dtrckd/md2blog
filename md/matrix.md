
Get a credential 

    curl -XPOST -d '{"type":"m.login.password", "user":"userid", "password":"password"}' "https://matrix.org/_matrix/client/r0/login"


Send a message

    curl -XPUT "https://matrix.org/_matrix/client/r0/rooms/ROOM_NAME/send/m.room.message/123?access_token=TOKEN" -d '{"msgtype":"m.text","body":"hello world"}'
