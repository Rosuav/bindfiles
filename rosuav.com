$TTL 3600
@	IN	SOA	gideon.rosuav.com. domainmaster.rosuav.com. (
			0000000000	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon
	IN	NS	o


	IN	MX	10 gideon

@	IN	A	37.61.205.138
@	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
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
text	IN	TXT	"Text 1A" "Text 1B"
text	IN	TXT	"Text 2A" "Text 2B"
gideon	IN	A	37.61.205.138
gideon	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
ipv4	IN	A	37.61.205.138
ipv6	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
sikorsky IN	A	122.107.147.136
kytheon	IN	A	37.61.205.138
kytheon	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
crawle	IN	A	203.214.67.43

; deprecated vv
dnd	IN	CNAME	@
ns1	IN	A	122.107.147.136
ns2	IN	CNAME	@
; only gilbertandsullivan.org.au uses i.rosuav.com - change me please
i	IN	CNAME	@
; deprecated ^^

@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
@	IN	TXT	"keybase-site-verification=KYKAVWX4a_qGHpZX-k8lPq4xpQQ27astPsP3F8IMJI0"

; $include "/etc/bind/Krosuav.com.+005+28701.key"
; $include "/etc/bind/Krosuav.com.+005+49534.key"
