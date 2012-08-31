$TTL 86400
@	IN	SOA	gideon.rosuav.com. pj.pjebs.com.au. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.

	IN      MX      10 mx3.netregistry.net.
	IN      MX      20 mx2.netregistry.net.


@	IN	A	$iinet$
www	IN	A	$iinet$
@	IN	SPF	"v=spf1 ?all"
@	IN	TXT	"v=spf1 ?all"
