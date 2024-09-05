$TTL 60
@	IN	SOA	gideon.rosuav.com. domainmaster.rosuav.com. (
			0000000000	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

; NOTE: Glue records for these two names are configured at Domains Priced Right,
; aka SecureServer. Go to https://www.secureserver.net/?prog_id=domainspricedright&pl_id=1592&plid=1592
; and sign in, then select Domains, DNS, and Hostnames (even though it's saying that
; they aren't managing DNS and thus can't change things - they still manage glue).
; Of course, their UI will probably have changed before the next time that I (or
; anyone following behind me) needs this again.
		IN	NS	gideon
		IN	NS	o


		IN	MX	10 gideon

@		IN	A	37.61.205.138
@		IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
www		IN	CNAME	@
lists		IN	CNAME	@
o		IN	A	159.196.70.86
o		IN	AAAA	2403:5803:bf48::1
garden		IN	NS	o
yosemite.garden	IN	A	192.168.0.14
huix.garden	IN	A	192.168.0.16
sikorsky.garden	IN	A	192.168.2.2
gideon		IN	A	37.61.205.138
gideon		IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
ipv4		IN	A	37.61.205.138
ipv6		IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
sikorsky	IN	A	159.196.70.86
sikorsky	IN	AAAA	2403:5803:bf48::1
stillebot	IN	A	159.196.70.86
stillebot	IN	A	37.61.205.138
F-35LightningII	IN	A	159.196.70.86
; Might not be completely consistent. Have to check.
traal6		IN	AAAA	2403:5803:bf48:8000::8ef7
vol		IN	CNAME	rosuav.github.io.
;ttop		IN	A	203.206.205.179
subdelegate	IN	NS	traal6

; deprecated vv
dnd		IN	CNAME	@
ns1		IN	A	159.196.70.86
ns2		IN	A	37.61.205.138
; deprecated ^^

@		IN	SPF	"v=spf1 -all"
@		IN	TXT	"v=spf1 -all"
@		IN	TXT	"keybase-site-verification=KYKAVWX4a_qGHpZX-k8lPq4xpQQ27astPsP3F8IMJI0"

; $include "/etc/bind/Krosuav.com.+005+28701.key"
; $include "/etc/bind/Krosuav.com.+005+49534.key"


; Fourth Wall's shop configuration to allow https://shop.rosuav.com/
em-fw.support.shop		IN	CNAME	u42604072.wl073.sendgrid.net.
s1._domainkey.support.shop	IN	CNAME	s1.domainkey.u42604072.wl073.sendgrid.net.
s2._domainkey.support.shop	IN	CNAME	s2.domainkey.u42604072.wl073.sendgrid.net.
shop				IN	A	34.117.223.165
www.shop			IN	CNAME	shop.rosuav.com.
zendesk1._domainkey.support.shop IN	CNAME	zendesk1._domainkey.zendesk.com.
zendesk2._domainkey.support.shop IN	CNAME	zendesk2._domainkey.zendesk.com.
zendesk1.support.shop		IN	CNAME	mail1.zendesk.com.
zendesk2.support.shop		IN	CNAME	mail2.zendesk.com.
zendesk3.support.shop		IN	CNAME	mail3.zendesk.com.
zendesk4.support.shop		IN	CNAME	mail4.zendesk.com.
zendeskverification.support.shop IN	TXT	e1d2fd3073b9c044
_dmarc.support.shop		IN	TXT	"v=DMARC1; p=reject; pct=100; rua=mailto:dmarc@fourthwall.com"
support.shop			IN	TXT	"v=spf1 include:_spf.google.com include:mail.zendesk.com include:spf.improvmx.com include:sendgrid.net ~all"
support.shop			IN	MX	10 mx1.improvmx.com.
support.shop			IN	MX	20 mx2.improvmx.com.
