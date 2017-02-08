$TTL 3600
@	IN	SOA	gideon.rosuav.com. domainmaster.rosuav.com. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon
	IN	NS	o


	IN	MX	10 gideon

@	IN	A	203.214.67.43
www	IN	CNAME	@
lists	IN	CNAME	@
o	IN	A	122.107.147.136
local	IN	A	192.168.0.13
uk	IN	A	127.0.0.1
*.uk	IN	A	127.0.0.1
garden	IN	A	127.0.0.1
*.garden IN	A	127.0.0.1
gideon.garden IN A	192.168.0.13
yosemite.garden IN A	192.168.0.14
huix.garden IN	A	192.168.0.16
sikorsky.garden IN A	192.168.2.2
chris	IN	CNAME	gideon.is-a-geek.net.
text	IN	TXT	"Text 1A" "Text 1B"
text	IN	TXT	"Text 2A" "Text 2B"
gideon	IN	A	203.214.67.43
sikorsky IN	A	122.107.147.136

; deprecated vv
dnd	IN	CNAME	@
ns1	IN	A	122.107.147.136
ns2	IN	A	203.214.67.43
i	IN	A	203.214.67.43
; deprecated ^^

@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
@	IN	TXT	"keybase-site-verification=KYKAVWX4a_qGHpZX-k8lPq4xpQQ27astPsP3F8IMJI0"

; $include "/etc/bind/Krosuav.com.+005+28701.key"
; $include "/etc/bind/Krosuav.com.+005+49534.key"
