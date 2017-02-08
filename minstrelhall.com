$TTL 3600
@	IN	SOA	gideon.rosuav.com. domainmaster.rosuav.com. (
			2017020801	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 gideon.rosuav.com.

@	IN	A	203.214.67.43
www	IN	CNAME	@
mail	IN	A	203.214.67.43
alt	IN	A	122.107.147.136
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
