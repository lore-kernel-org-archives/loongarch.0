Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E9199FAC
	for <loongarch@lists.linux.dev>; Wed, 12 Mar 2025 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741747179; cv=none; b=rZubErTMROixeGgUwqPSLGuK756IKT/YfbEW73f49O5eticIVMCjR5rQaaGjesHoYpqSyO/A81eFIR0p3afCsq8C0Bpt230rkjDa1/wpKnIUJB7jjjssayRBWAUchTuhsUgH3z5nDHxANN54R8QCPH40vQsz0EJc+3bOSyKtzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741747179; c=relaxed/simple;
	bh=JGTUx+vZhgTcxc7A0OHnH+uACyGI2QXmhdI7qpfj7jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqshwL5OFtT1EBRSjliKAvhSPfAXAbp40Gu/z+FFKBnmBjJ8qbp93w392Gwt9JQWjTTpYviDDYljbBgdOB99weD/9tOdCFu0+9oWl23lqFr2NHdU57QSAY81tS7Utgwv9s4DJjUbADJcTHtzsdJjAXqTtjxzuPAunm2s79IPWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=V28zAJyM; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="V28zAJyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1741747132;
	bh=JGTUx+vZhgTcxc7A0OHnH+uACyGI2QXmhdI7qpfj7jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=V28zAJyM7SX6T2TrywfWoJzowcTs8/paPVx9GZmOYkDxp3wxfhzClM71NQlc97QKO
	 6A0hlwnEkwI0zA2nw/p0wQ15qApU6ScvqokGuNZFoyzM6n3t7NJBQSSeQB18GAOU6R
	 YAvI738QZESL0h3b4TFW9FrS7SoMfPAB0v0M5r3I=
X-QQ-mid: bizesmtpip4t1741747118ts6o8v4
X-QQ-Originating-IP: o3nEVXIgqVr4Vy+SxGR5R++Os4Cd3eWOquCs/y6PuaI=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Mar 2025 10:38:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16522105991542044273
Message-ID: <D5778071F336E5F6+5c5fc5ae-1ef3-45e7-8b01-c1e496bcfd58@uniontech.com>
Date: Wed, 12 Mar 2025 10:38:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Fix use of logical '&&' with constant operand
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, yangtiezhu@loongson.cn, maobibo@loongson.cn,
 guoweikang.kernel@gmail.com, agordeev@linux.ibm.com, ast@kernel.org,
 usamaarif642@gmail.com, jiaxun.yang@flygoat.com, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
 niecheng1@uniontech.com, chenlinxuan@uniontech.com, donmor3000@hotmail.com,
 Wentao Guan <guanwentao@uniontech.com>
References: <EEBE30D1ACFF646F+20250304105246.766404-1-wangyuli@uniontech.com>
 <CAAhV-H6zkq1KoLQSQgimEgHhdD=S--kHa9hmhfbxUS_6OOfSJQ@mail.gmail.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <CAAhV-H6zkq1KoLQSQgimEgHhdD=S--kHa9hmhfbxUS_6OOfSJQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------43mx7ySSAqJvNUBrybIdpW9f"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NbLMjDNEDlGtd7mMQEchkPkV0zhjm9dX5BeZ1fILLyQLNwsdYtZRNK/p
	KZxnUKpuP04++V1jrhLRCBAWc/A2c0EXl/yX9LX9jtmafBA2FPyLwHadoCDMMzl6cGbkBf4
	FfDvPZWyMneZ/CLUmoNzsjDA6M53WGBZE2b4Q7kuDEostqweOCVmyK1zek6i590rpcUNkPh
	mjGf8BSXuVUwvkzFGd7w2IvkaV7kmfl8w4HxFbs0Uj98aXFYxlFON2m9iAyv3RA0ck2bmNF
	gjQTj3JQra8oQOf5X8CHHOxY2CniyKc+AwkCHDSy5gnPrj37ICURiUJuMIARdSt0BQdOwX2
	PaOKeENFNMxa1c0wyVqJhg+FodLm0EN7L+Mh3dxxJqOVf616Lna86P9Nc0HV0oozCxhAGzM
	p78UaHgiRa2REJY5RG50fVjwtuYJ3gijFmYcEq8TGB/dskOWI8/1PFBDJP+8zQNSuPqFSi9
	O6xEekjBNkk59muO+fBjFhGWSBZYDhK5kKcCEDnTQZyJdrcyfNL6XUtE8WI5DF5n9BTewq1
	XaG9fIf291XHRJlRihjfvX/6odm3PEBYPn5PwSNk6hp4GcgtiO7T862rFBsqBGqIPWxx+7E
	7Go8I2k1s1vEugR2x6KI0YPtcJl8n25XHngjAR9QjRyzT2RNv/0Dsq8/NypYLhqNOt815Lm
	OEnyRrIso0Z2hFpt95lSLQE3AiO/OGHdKmEYhcj3mQAVa246f5L0IIcF10UytaptRKM92d6
	UXP3tdBXSNhygIoPpmIGOWy9JbY4uWqHoxUhj+AkNoo6FBuz4GjldyBPmOkO7It1T4chxzh
	BWwKiFGuxarRMjJ/e/upxk7bvxt0gGV2qGzy9wUZNOcyKMldxYHoQDsffbJPrSYcW0rTMje
	+yWSE9Ln9ZxQCtOAtvuMQQOS0U8ndOtKH/wXMCFU7RBxdYLk1AbNwPGpi4ZXcMzoUZRFmso
	OhDtnEyAkRYFKVrz0T05O8nRMIcvj1DuK7be/C26e/i2rPlHuFvskg3Qre8J9RvhoS55Qga
	VBmpztCoOw5cww6+S5JhtjX6w3wLU=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------43mx7ySSAqJvNUBrybIdpW9f
Content-Type: multipart/mixed; boundary="------------wJKrXM8GukpgPJYkT2vgJx9p";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, yangtiezhu@loongson.cn, maobibo@loongson.cn,
 guoweikang.kernel@gmail.com, agordeev@linux.ibm.com, ast@kernel.org,
 usamaarif642@gmail.com, jiaxun.yang@flygoat.com, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
 niecheng1@uniontech.com, chenlinxuan@uniontech.com, donmor3000@hotmail.com,
 Wentao Guan <guanwentao@uniontech.com>
Message-ID: <5c5fc5ae-1ef3-45e7-8b01-c1e496bcfd58@uniontech.com>
Subject: Re: [PATCH] LoongArch: Fix use of logical '&&' with constant operand
References: <EEBE30D1ACFF646F+20250304105246.766404-1-wangyuli@uniontech.com>
 <CAAhV-H6zkq1KoLQSQgimEgHhdD=S--kHa9hmhfbxUS_6OOfSJQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6zkq1KoLQSQgimEgHhdD=S--kHa9hmhfbxUS_6OOfSJQ@mail.gmail.com>

--------------wJKrXM8GukpgPJYkT2vgJx9p
Content-Type: multipart/mixed; boundary="------------mOZb0BEc7RosiYPOwaRq0lSa"

--------------mOZb0BEc7RosiYPOwaRq0lSa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSHVhY2FpLA0KDQpPbiAyMDI1LzMvNCAyMDowMCwgSHVhY2FpIENoZW4gd3JvdGU6DQo+
IEFyZSB5b3Uga2lkZGluZyBtZT8NCg0Kbm9wZQ0KDQo+IENPTkZJR19DTURMSU5FWzBdIGlz
IGEgY29uc3RhbnQgZm9yIGEgc3BlY2lmaWMNCj4gY29uZmlnIGJ1dCB0aGUgY29uZmlnIGlz
IHZhcmlhYmxlIGFjcm9zcyBidWlsZGluZ3MuIFNvIHRoZSAiY29uc3RhbnQiDQo+IGZvciBj
b21waWxlcnMgaXMgbm90IGFzICJjb25zdGFudCIgZm9yIHBlb3BsZS4NCg0KUGVyaGFwcyBJ
J20gbm90IGZ1bGx5IHVuZGVyc3RhbmRpbmcgeW91ciBwb2ludC4NCg0KIEZyb20gbXkgdmFu
dGFnZSBwb2ludCwgaXQgYXBwZWFycyB0aGF0IGFsbCB0aGF0J3MgbmVjZXNzYXJ5IGlzIHRv
IA0KYXNjZXJ0YWluIHdoZXRoZXIgQ09ORklHX0NNRExJTkVbMF0gaXMgYSBudWxsIHZhbHVl
Lg0KDQpHaXZlbiB0aGF0IHRoZSBBU0NJSSByZXByZXNlbnRhdGlvbiBvZiBOVUwgaXMgaW5k
ZWVkIDAsIHRoaXMgbWV0aG9kIG9mIA0KYm9vbGVhbiBjb2VyY2lvbiBmb2xsb3dlZCBieSBh
IGxvZ2ljYWwgY29uanVuY3Rpb24gd2l0aCB0aGUgYW50ZWNlZGVudCANCmJvb2xlYW4gdmFs
dWUgc2hvdWxkIG5vdCBpbXBpbmdlIHVwb24gdGhlIGludGVuZGVkIG9wZXJhdGlvbmFsaXR5
IG9mIA0KdGhpcyBsaW5lIG9mIGNvZGUsIGFuZCBpdCBmdXJ0aGVyIG9idmlhdGVzIGEgY29t
cGlsYXRpb24gd2FybmluZy4NCg0KVG8gYmUgcHJlY2lzZSwgYW1lbmRpbmcgISFDT05GSUdf
Q01ETElORVswXSB0byAoQ09ORklHX0NNRExJTkVbMF0gPT0gMCkgDQpvciBjb252ZXJ0aW5n
IHRoZSBsb2dpY2FsIEFORCB0byBhIGJpdHdpc2UgQU5EIG9wZXJhdGlvbiB3b3VsZCBhbHNv
IA0KbGlrZWx5IGVuZ2VuZGVyIGEgY29tbWVuc3VyYXRlIG91dGNvbWUuDQoNCkkgbWVyZWx5
IG9wdGVkIGZvciBvbmUgbW9kaWZpY2F0aW9uIHN0cmF0ZWd5IGFuZCBwYXRjaGVkIGl0Lg0K
DQo+IENvbXBpbGVyIHdhcm5pbmdzDQo+IHNob3VsZCBiZSBkb3VibGUtY2hlY2tlZCBieSBw
ZW9wbGUsIHJpZ2h0Pw0KDQpOYXR1cmFsbHkuDQoNCkNvbXBpbGVycyBhcmUsIGluIGVzc2Vu
Y2UsIGp1c3Qgc29waGlzdGljYXRlZCBzb2Z0d2FyZSBwcm9ncmFtcywgYW5kIGFyZSANCnN1
c2NlcHRpYmxlIHRvIG51bWVyb3VzIGltcGVyZmVjdGlvbnMuDQoNCk5vbmV0aGVsZXNzLCBm
b3IgdGhlIG1vc3QgcGFydCwgdGhlIHdhcm5pbmdzIGFuZCBlcnJvciByZXBvcnRzIHRoZXkg
DQpvdXRwdXQgYXJlIHR5cGljYWxseSBqdXN0aWZpZWQuDQoNCg0KVGhhbmtzLg0KDQotLSAN
Cll1bGkgV2FuZyoNCioNCg==
--------------mOZb0BEc7RosiYPOwaRq0lSa
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------mOZb0BEc7RosiYPOwaRq0lSa--

--------------wJKrXM8GukpgPJYkT2vgJx9p--

--------------43mx7ySSAqJvNUBrybIdpW9f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ9DzrAUDAAAAAAAKCRDF2h8wRvQL7qwY
APwP10RAUyDie7MZZPCvj1sJSpidz/YYJnZdv6g+Z+JfOAEAmh+yBeL9UL+shsjO/SEjLVg0LhQm
SOZBZKb8XsD5Jwg=
=jOvR
-----END PGP SIGNATURE-----

--------------43mx7ySSAqJvNUBrybIdpW9f--
