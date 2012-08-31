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

@	IN	A	$iinet$
www	IN	CNAME	@
o	IN	A	$optus$
local	IN	A	192.168.0.13
uk	IN	A	127.0.0.1
*.uk	IN	A	127.0.0.1
garden	IN	A	127.0.0.1
*.garden IN	A	127.0.0.1
gideon.garden IN A	192.168.0.13
chris	IN	CNAME	gideon.is-a-geek.net.

; deprecated vv
dnd	IN	CNAME	@
ns1	IN	A	$optus$
ns2	IN	A	$iinet$
i	IN	A	$iinet$
; deprecated ^^

@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"

; $include "/etc/bind/Krosuav.com.+005+28701.key"
; $include "/etc/bind/Krosuav.com.+005+49534.key"
