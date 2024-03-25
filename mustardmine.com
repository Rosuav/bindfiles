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
@	IN	A	37.61.205.138
; As with stillebot.com, no IPv6 due to Sikorsky not supporting it (yet!).
www	IN	CNAME	@
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
