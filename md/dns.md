

**Summary Table:**

| Command                  | IPv4 Only             | IPv6 Only             | Both                  |
|--------------------------|-----------------------|-----------------------|-----------------------|
| `dig`                    | `+short A`            | `+short AAAA`         | `dig example.com`     |
| `host`                   | `-t A`                | `-t AAAA`             | `host example.com`    |
| `nslookup`               | `-query=A`            | `-query=AAAA`         | `nslookup example.com`|
| `getent`                 | `ahostsv4`            | `ahostsv6`            | `hosts`               |
