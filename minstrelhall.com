$TTL 3600
@	IN	SOA	gideon.rosuav.com. domainmaster.rosuav.com. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.rosuav.com.

@	IN	A	$iinet$
www	IN	CNAME	@
mail	IN	A	$iinet$
alt	IN	A	$optus$
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
