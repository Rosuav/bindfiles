$TTL 60
@	IN	SOA	gideon.rosuav.com. domains.rosuav.com. (
			0000000000	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.rosuav.com.

@	IN	A	203.206.226.83
@	IN	A	37.61.205.138
sikorsky IN	A	203.206.226.83
gideon	IN	A	37.61.205.138
; Hack: Temporarily using this name for the new IP. (Also temporarily dropped
; all TTLs to 60 seconds.)
sikorsky4 IN	A	159.196.70.86
gideon4	IN	A	37.61.205.138
sikorsky6 IN	AAAA	2403:5803:bf48::1
gideon6	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
; As with stillebot.com, no IPv6 due to Sikorsky not supporting it (yet!).
; When one comes, add it to @ as well as to sikorsky and gideon, and of
; course activate it as sikorsky6
www	IN	CNAME	@
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
