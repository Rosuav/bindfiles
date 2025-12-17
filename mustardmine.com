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

@	IN	A	159.196.70.86
@	IN	A	37.61.205.138
@	IN	AAAA	2403:5803:f90e::1
@	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
sikorsky IN	A	159.196.70.86
gideon	IN	A	37.61.205.138
sikorsky4 IN	A	159.196.70.86
gideon4	IN	A	37.61.205.138
sikorsky6 IN	AAAA	2403:5803:f90e::1
gideon6	IN	AAAA	2a01:488:67:1000:253d:cd8a:0:1
www	IN	CNAME	@
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
@	IN	TXT	"google-site-verification=ug9RUQm0uq0seI9Me6fm7GbmGwkxKEwJfaB1R3CSNes"
