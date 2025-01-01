
Get a credential 

    curl -XPOST -d '{"type":"m.login.password", "user":"userid", "password":"password"}' "https://matrix.org/_matrix/client/r0/login"


Send a message

    curl -XPUT "https://matrix.org/_matrix/client/r0/rooms/ROOMID/send/m.room.message/TXID?access_token=TOKEN" -d '{"msgtype":"m.text","body":"hello world"}'
    # TXID can just be any random number ?

    curl -XPOST -d '{"msgtype":"m.text", "body":"Hello from '"$USER"'"}' "https://matrix.org/_matrix/client/r0/rooms/ROOMID/send/m.room.message?access_token=ROOMID"
