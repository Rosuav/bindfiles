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

; Eventually this should be multihomed same as stillebot.com is.
; Until then, though, it just points back to Sikorsky. Good enough.
@	IN	A	203.206.226.83
www	IN	CNAME	@
@	IN	SPF	"v=spf1 -all"
@	IN	TXT	"v=spf1 -all"
