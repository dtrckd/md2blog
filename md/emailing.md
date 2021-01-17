Good tuto/course on setuing up Postal

    https://blog.h-educate.com/free-smtp-server-postal/

check if server can send mail / smtp port is filtered 

    telnet smtp.gmail.com 25
    telnet smtp.gmail.com 587
    nc -v smtp.gmail.com 25

check tls smtp connection
    
    openssl s_client -connect localhost:25 -starttls smtp

settings DMARC

    https://www.linuxbabe.com/mail-server/create-dmarc-record
    https://www.mailjet.com/blog/news/some-words-about-dmarc/

mail checker

    #+ help check and set configuration
    https://www.mail-tester.com
    https://mxtoolbox.com/emailhealth
    https://mxtoolbox.com/SuperTool.aspx

    # SSL/TLS
    https://luxsci.com/smtp-tls-checker
    https://www.checktls.com/

    # reputation
    https://www.senderscore.org
    https://www.barracudacentral.org
    Senderbase.org
    Reputationauthority.org

    postmaster.google.com ???

    # black list
    Spamhaus - http://spamhaus.org
    CBL - http://cbl.abuseat.org/ -Trend Micro MAPS - http://www.mail-abuse.com/


tools
    https://glockapps.com
    https://hunter.io

---

send email with telnet/nc

	telnet smtp.domain.com 25
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

