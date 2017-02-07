$TTL 60
@	IN	SOA	i.rosuav.com. domainmaster.transporttextbook.com. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	i.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.kepl.com.au.

www	IN	CNAME	@
@	IN	SPF	"v=spf1 ?all"
@	IN	TXT	"v=spf1 ?all"
@	IN	A	$iinet$
