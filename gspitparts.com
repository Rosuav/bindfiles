$TTL 7200
@	IN	SOA	i.rosuav.com. domains.rosuav.com. (
			2017020801	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.rosuav.com.

@	IN	A	203.214.67.43
www	IN	CNAME	gasvic.github.io.
@	IN	SPF	"v=spf1 ip4:122.107.147.136 ip4:203.214.67.43 ip4:192.168.0.0/16 -all"
@	IN	TXT	"v=spf1 ip4:122.107.147.136 ip4:203.214.67.43 ip4:192.168.0.0/16 -all"
