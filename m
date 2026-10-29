Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246642;
	b=pOauKwbM7ynOhTIx4kO8bwQy9YLdZMw746P7lj/FlQMUvUZx/nFXDVFocJNlcj8lLXqu
	 E9pYN1Wv0WFodYG5kV1O1eZwXkylsEyqhSfTw4VQ5OzJdVXPMkcWtornF4V3U4mo78jyT
	 o+DUn4UG47O5lpX3KeERFWLLcUiCp5Dv86DbAMIJOrJxKfMaoNLVUMHd2ebWjzORgEalS
	 9g1YlpJBIAFeyqUxKv563Uz44I314+rkDNYFNHEjB9cCZcs2S/RkEL6TdnVNlECLsgks7
	 hxZYEdDy/Lh7aV6h9FT4/Y5PdUIjzt8P3iidt6clPCP4Qf4k+Pleqc5eD4aNfCfC5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246642;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:From:To:
	 Cc:Subject:X-Priority:X-Mailer:In-Reply-To:References:X-NTES-SC:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=a1PhFUYdokHoMeeA0WPauot5ThmFVHZSu+ZYJSEfnH8=;
	b=NUc3zDeZWHZmrqxv9WTl+3CwftmXZ1fXsZy6PgNE2DzaA+fzFvgTnivp22Dn0osbPTkG
	 A0jNbauZM8FgfgIbOJ6tQZCXjW0MeKoKRgZTgQXWCNuiR07oAMpMSk/jB9rmlSVrplwYl
	 vKrT90vH+D5eAYwusGEUO8xVceJa4lMrHgaGo0p/RpSRwlbEPhMi5EE85HU7N26qtK+6b
	 BEN1QTzH9yQngPalxUc7ToFMk5aIMRNGiUpMxXnpoU7tga9g/I1I0crg7J2TESltaOKY8
	 hEc6XYj747OptbBHfNsufmoOKKh9sFnZG3sCfcO9PnosgSIWx/d9NkOZ/g0vBet+4Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dcHdFK6f;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8B606A31A
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 04:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dcHdFK6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=a1PhFUYdokHoMeeA0WPauot5ThmFVHZSu+ZYJSEfnH8=; b=d
	cHdFK6fSwvNTdfGaJ8dUaEcejlQafh68z8Oo0JIUwlbThXosz+AfW/Z07S48kuaV
	SQSbg4xKWxGm5VtSPwApHDOsKDaqtH3sCq1PPFds1f/8QcTHrNoxX4CbzVQ8Tz3B
	E8rogBb0+VfPKfLH7kKHOsedmcAxnJhaikG7V2Rbog=
Received: from 19888972804$163.com ( [2610:150:c001:15:81:7818:302a:b455] )
 by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 29 Oct 2026 12:01:31 +0800
 (CST)
Date: Thu, 29 Oct 2026 12:01:31 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Lorenzo Pieralisi" <lpieralisi@kernel.org>,
	"Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
	"Huacai Chen" <chenhuacai@kernel.org>,
	"WANG Xuerui" <kernel@xen0n.name>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>,
	"Anup Patel" <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Sunil V L" <sunilvl@ventanamicro.com>,
	"Andrew Jones" <andrew.jones@linux.dev>,
	"Jonathan Cameron" <jic23@kernel.org>,
	"Hanjun Guo" <guohanjun@huawei.com>,
	"Tomasz Nowicki" <tomasz.nowicki@linaro.org>,
	"Grant Likely" <grant.likely@linaro.org>,
	"Jason Cooper" <jason@lakedaemon.net>,
	"Robert Richter" <rrichter@cavium.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Liupu Wang" <wangliupu@loongson.cn>,
	"Tianyang Zhang" <zhangtianyang@loongson.cn>,
	"Jianmin Lv" <lvjianmin@loongson.cn>,
	"Conor Dooley" <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re:Re: [PATCH 00/12] irqchip: validate remaining MADT records
 before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <86qzhaxmh5.wl-maz@kernel.org>
References: <20261028050039.121080-1-yaojiale02@163.com>
 <86qzhaxmh5.wl-maz@kernel.org>
X-NTES-SC: AL_Qu2SAf6fuUwi5yGeZOkcn08ShO49XMOyvfoi2YFTc+0EoDzV3BInXF1gPGDxz8mkDT2vlyCFSTp15+JbY6xAaRJ2OZipwy2BT3fMJMqiQA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-ID: <2625137e.39a5.1a185d1f222.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgD3f90bxeJqMyFjAA--.1040W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRvKBWrixRsWnAAA3F
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0yOCAxNjoyMzoxOCwgIk1hcmMgWnluZ2llciIgPG1hekBrZXJuZWwub3JnPiB3
cm90ZToKPk9uIFdlZCwgMjggT2N0IDIwMjYgMDU6MDA6MjcgKzAwMDAsCj5KaWFsZSBZYW8gPHlh
b2ppYWxlMDJAMTYzLmNvbT4gd3JvdGU6Cj4+IAo+PiBTZXZlcmFsIEFDUEkgaW50ZXJydXB0LWNv
bnRyb2xsZXIgY2FsbGJhY2tzIGNhc3QgZ2VuZXJpYyBNQURUIHN1YnRhYmxlCj4+IGhlYWRlcnMg
dG8gY29udHJvbGxlci1zcGVjaWZpYyByZWNvcmRzIGFuZCBhY2Nlc3MgdHlwZWQgZmllbGRzIHdp
dGhvdXQKPj4gZmlyc3QgY2hlY2tpbmcgdGhhdCB0aGUgZmlybXdhcmUgc3VwcGxpZWQgdGhlIGNv
bXBsZXRlIHN0cnVjdHVyZS4gQQo+PiB0cnVuY2F0ZWQgZW50cnkgY2FuIHRoZXJlZm9yZSBjYXVz
ZSBhbiBvdXQtb2YtYm91bmRzIHJlYWQgZHVyaW5nIGVhcmx5Cj4+IGludGVycnVwdC1jb250cm9s
bGVyIGFuZCBDUFUgZGlzY292ZXJ5Lgo+PiAKPj4gQWRkIHRoZSBtaXNzaW5nIG1pbmltdW0tc2l6
ZSBjaGVja3MgYXQgdGhlIGNhbGxiYWNrIGJvdW5kYXJpZXMuIFJlY29yZHMKPj4gd2hpY2ggYXJl
IHBhc3NlZCBmcm9tIGEgcHJvYmUgdmFsaWRhdG9yIHRvIGFuIGluaXRpYWxpemF0aW9uIGNhbGxi
YWNrIGFyZQo+PiB2YWxpZGF0ZWQgb25jZSBpbiB0aGUgdmFsaWRhdG9yLCBiZWZvcmUgZWl0aGVy
IGNhbGxiYWNrIGFjY2Vzc2VzIHRoZW0uCj4+IAo+PiBUaGUgaXNzdWVzIHdlcmUgZm91bmQgYnkg
Y29kZSBpbnNwZWN0aW9uIGFuZCBoYXZlIG5vdCBiZWVuIHRlc3RlZCBvbiByZWFsCj4+IGhhcmR3
YXJlLgo+Cj5Ib3cgZG9lcyB0aGlzIGNvbXBhcmUgdG8gdGhlIHNlcmllcyBwb3N0ZWQgYXQgWzFd
Pwo+Cj5ObyB2ZXJzaW9uIG51bWJlciwgbm8gY2hhbmdlIGxvZywgYW5kIG5vdCBldmVuIGFuIGF0
dGVtcHQgYXQgYSBRRU1VCj50ZXN0IHJ1bi4gSWYgeW91IHdhbnQgcGVvcGxlIHRvIHJldmlldyB0
aGlzIHN0dWZmLCB5b3UgbmVlZCB0byB1cCB5b3VyCj5nYW1lIGEgdGlueSBiaXQuCj4KPglNLgo+
Cj5bMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvMjAyNjEwMjExNDQ1MjQuMzY0MTQzLTEteWFv
amlhbGUwMkAxNjMuY29tCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBJIGhhdmUgYWRkZWQgdGVz
dCBpbmZvcm1hdGlvbiwgd2l0aCBhIG5ldyBzZXJpZXMuCgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjYxMDI5MDM1MjUzLjIzMzM4NTItMS15YW9qaWFsZTAyQDE2My5jb20vCgoKPgo+
LS0gCj5XaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9z
c2libGUuCg==
