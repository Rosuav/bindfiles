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

@	IN	A	37.61.205.138
@	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
www	IN	CNAME	gasvic.github.io.
@	IN	SPF	"v=spf1 ip4:122.107.147.136 ip4:203.214.67.43 ip4:37.61.205.138 ip4:192.168.0.0/16 ip6:2a01:488:67:1000:253d:cd8a:0:1 -all"
@	IN	TXT	"v=spf1 ip4:122.107.147.136 ip4:203.214.67.43 ip4:37.61.205.138 ip4:192.168.0.0/16 ip6:2a01:488:67:1000:253d:cd8a:0:1 -all"
