$TTL 604800
@	IN	SOA	gideon.rosuav.com. threshold.thresholdrpg.com. (
			$serial$	; Serial
			7200		; Refresh
			3600		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL

	IN	NS	gideon.rosuav.com.
	IN	NS	o.rosuav.com.


	IN	MX	10 mail.thresholdrpg.com.

@	IN	A	64.253.105.42
www	IN	CNAME	www.thresholdrpg.com.
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
