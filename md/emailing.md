Good tuto/course on seting up Postal

    https://blog.h-educate.com/free-smtp-server-postal/

Get a MX address
    dig smtp.gmail.com MX

check if server can send mail / smtp port is filtered 

    nc -zv -w1 domain.com 25
    nc smtp.gmail.com 25
    telnet smtp.gmail.com 25
    telnet smtp.gmail.com 587
    netcat --ssl smtp.gmail.com 587

Open a basic server for test with netcat

    sudo nc -l -p 25 -c 'echo -e "HTTP/1.1 200 OK\n\n $(date)"'

check tls smtp connection


    # For StartTLS on port 587 or 25 you can try
    openssl s_client -starttls smtp -connect <host>:<port>
    # For implicit TLS on port 465 you can try 
    openssl s_client -connect <host>:465

    You can use Swaks to send test emails and testssl.sh for TLS checks.

Check a certificate expritation date 

    openssl x509 -enddate -noout -in file.pem

    openssl s_client -servername <SERVERNAME> -connect <HOST>:<PORT> 2>/dev/null | openssl x509 -noout -dates


settings DMARC

    https://www.linuxbabe.com/mail-server/create-dmarc-record
    https://www.mailjet.com/blog/news/some-words-about-dmarc/

Decode dmarc-report email content/body (as from Postal dowloads email...)

    echo -n "$body" | base64 --decode > feedback.zip

mail checker

    #+ help check and set configuration
    https://www.mail-tester.com
    https://mxtoolbox.com/emailhealth
    https://mxtoolbox.com/SuperTool.aspx
    https://toolbox.googleapps.com

    # SSL/TLS
    https://luxsci.com/smtp-tls-checker
    https://www.checktls.com/

    # DNS
    https://intodns.com/

    # Reputation
    https://www.senderscore.org
    https://www.barracudacentral.org
    Senderbase.org
    Reputationauthority.org
    https://www.blacklistmaster.com

    postmaster.google.com ???

    # black list
    Spamhaus - http://spamhaus.org
    CBL - http://cbl.abuseat.org/ - Trend Micro MAPS - http://www.mail-abuse.com/


tools
    https://glockapps.com
    https://hunter.io

---

send email with telnet/nc

	telnet smtp.domain.com 25

Or with ssl

    openssl s_client -starttls smtp -crlf -connect smtp.mailgun.org:587

---

    HELO server.com
    MAIL FROM:bar@example.com
    RCPT TO:foo@server.com
    DATA
    Hi stranger !
    .
    QUIT

Full exchange sample

    Trying 192.168.0.1...
    Connected to smtp.domain.com (192.168.0.1).
    Escape character is '^]'.
    220 myrelay.domain.com ESMTP
    HELO smtp.domain.com
    250 myrelay.domain.com
    MAIL FROM:<alice@hacker.com>
    250 sender <alice@hacker.com> ok
    RCPT TO:<bob@secure.net>
    250 recipient <bob@secure.net> ok
    DATA
    354 go ahead
    From: [Alice Hacker] <alice@hacker.com>
    To: [Bob Smith] <bob@secure.net>
    Date: Mon, 12 Apr 2010 14:21:26 -0400
    Subject: Test Message

    Hi there!
    This is supposed to be a real email...

    Have a good day!
    Alice


    .
    250 ok:  Message 222220902 accepted
    QUIT
    221 myrelay.domain.com
    Connection closed by foreign host.


## Concepts

**Definitions:**

Mail user agent (MUA): this component that the user sees and interacts with like Thunderbird and Microsoft Outlook, these user agents are responsible for reading mail and allowing you to compose mail.

Mail transport agent (MTA): this component is responsible for getting the mail from one site to another like Sendmail and Postfix.

Mail delivery agent (MDA): this component is responsible for distributing received messages on the local machine to the appropriate user mailbox like postfix-maildrop and Procmail.

https://www.debian.org/releases/jessie/amd64/ch08s05.html.en
https://wiki.debian.org/Postfix
http://www.linux-france.org/article/appli/procmail.html


**MDA**
* procmail
* exim can play the role of an MDA?


**relay-only MTA**

Relay-only or send-only MTAs can forward your emails to another server, which is typically the SMTP server of your Internet service provider (ISP).
The most used relay-only MTAs are
* nullmailer, 
* msmtp, 
* sSMTP. 

This type of mail transfer agent is a good choice if you just want to send emails to your email address, such as Gmail


**MTA comparaison**

* postfix
* exim
* ...sendmail
* ...qmail


https://blog.mailtrap.io/postfix-sendmail-exim/
https://www.tecmint.com/setup-postfix-mail-server-in-ubuntu-debian/


**Spam**

install

    apt install spamassassin

configure
    
    systemctl enable spamassassin

Check configuration in

    /etc/mail/spamassassin/local.cf

