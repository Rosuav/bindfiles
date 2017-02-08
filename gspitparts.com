$TTL 7200
@	IN	SOA	i.rosuav.com. domains.rosuav.com. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.rosuav.com.

@	IN	A	203.214.67.43
www	IN	CNAME	gasvic.github.io.
@	IN	SPF	$spf$
@	IN	TXT	$spf$
