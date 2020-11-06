

mkdir -p ~/.mutt/cache/bodies
mkdir ~/.mutt/cache/headers
touch ~/.mutt/certificates


Sending emails

    mutt -s "Test from mutt" user@yahoo.com < /tmp/message.txt 

    echo "This is the body" | mutt -s "Testing mutt" user@yahoo.com -a /tmp/XDefd.png

Configure Gmail

    set from = "user@gmail.com"
    set realname = "Guillermo Garron"
    set imap_user = "user@gmail.com"
    set imap_pass = "password"
    set folder = "imaps://imap.gmail.com:993"
    set spoolfile = "+INBOX"
    set postponed ="+[Gmail]/Drafts"
    set header_cache =~/.mutt/cache/headers
    set message_cachedir =~/.mutt/cache/bodies
    set certificate_file =~/.mutt/certificates
    set smtp_url = "smtp://user@smtp.gmail.com:587/"
    set smtp_pass = "password"
    set move = no 
    set imap_keepalive = 900set from = "user@gmail.com"
    set realname = "Guillermo Garron"
    set imap_user = "user@gmail.com"
    set imap_pass = "password"
    set folder = "imaps://imap.gmail.com:993"
    set spoolfile = "+INBOX"
    set postponed ="+[Gmail]/Drafts"
    set header_cache =~/.mutt/cache/headers
    set message_cachedir =~/.mutt/cache/bodies
    set certificate_file =~/.mutt/certificates
    set smtp_url = "smtp://user@smtp.gmail.com:587/"
    set smtp_pass = "password"
    set move = no 
    set imap_keepalive = 900


**sendmail**

    sudo apt-get install ssmtp
