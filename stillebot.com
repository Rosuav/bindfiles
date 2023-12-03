$TTL 7200
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
; Temporarily locked to just Sikorsky until I get everything multihomed.
; @	IN	A	37.61.205.138
; Since I don't have IPv6 to Sikorsky, it's probably better to have no IPv6 than
; to force everyone onto Gideon.
; @	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
www	IN	CNAME	@
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
