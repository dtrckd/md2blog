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


## Spam

install


    apt install spamassassin

configure
    
    systemctl enable spamassassin

Check configuration in

    /etc/mail/spamassassin/local.cf

