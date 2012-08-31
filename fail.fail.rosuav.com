$TTL 3
@	IN	SOA	gideon.rosuav.com. domainmaster. (
			7		; Serial
			10		; Refresh
			20		; Retry
			30		; Expire
			40 )		; Negative Cache TTL

	IN	NS	gideon
	IN	NS	o
	IN	NS	127.0.0.1
	IN	NS	foo.
	IN	NS	nfs3.cwihosting.com.
	IN	NS	fail.fail.fail.example.com.
	IN	NS	cn
	IN	NS	gideon.com.
	IN	NS	local

	IN	MX	10 gideon
	IN	MX	20 local
	IN	MX	30 bad.southkensington.com
	IN	MX	40 cn
	IN	MX	50 $iinet$
	IN	MX	60 mail.google.com.

@	IN	A	$iinet$
cn	IN	CNAME	@
o	IN	A	$optus$
www	IN	CNAME	local
local	IN	A	192.168.0.13
