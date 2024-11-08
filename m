Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB552071E6
	for <loongarch@lists.linux.dev>; Fri,  8 Nov 2024 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079801; cv=none; b=ATBDNyoCeDOt+fvV7wklSFoYX3yyTae2I3rSb8cRzuwkHRDWeYD8SDVYzN8G1bek0jtuRPnSVBeyx5QYqs9BgmiGL39X+ojd5bo2J6M6+nmBb4cJ6Cp0MX7vK/Ad+fCAxV6fYSHnPt3hjcdiajBPEnNqx+cdfeEzEs8iCvQULRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079801; c=relaxed/simple;
	bh=YBes01HIGxCY9uAMUwOSqshjVdaMRIIeY82NB1cajGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=lPJNEZ96ZJDMLGWx3pt8OcwHUdAH/K0a/mygOA4MMJpE2aJH2ckP0/unzR9t8qYyuXdo6n4TAzBA8iaYBGA+45Ap0YIKJEYDWDK6ktcJuzPkj3KNah51puSxfyRqFa7QasvKbeZDFOvTsQxdn+4hk63uVeR9Wiy4/KpRgb+aRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=HaUjtcWH reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="HaUjtcWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=iQMcJa4BmFPVqKmXobn4cIhRx4UhLAzJDxklpcxlLI8=; b=H
	aUjtcWHDFt1bKqSXkqJGs1dRc5kfURcXD/snEVL02VfzHVmJDJvgfdNFSH25sFJS
	e/QmXTeDXcuNeFVAyRIvkZptmIV0qg/a2iU0Q4ogCM+qEHNRN03W89MpCkKtr4sE
	EYlKvW6V2O6HdedRW0CAf+PWbdmw0x1Jl4G7mFEXQs=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Fri, 8 Nov 2024 23:28:00 +0800 (CST)
Date: Fri, 8 Nov 2024 23:28:00 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, James.Bottomley@HansenPartnership.com, 
	deller@gmx.de, mpe@ellerman.id.au, paul.walmsley@sifive.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87r07lol9y.ffs@tglx>
References: <20241103080552.4787-1-00107082@163.com> <87r07lol9y.ffs@tglx>
X-NTES-SC: AL_Qu2YA/yctk4j5iSfbOkZnEYQheY4XMKyuPkg1YJXOp80uSbP/wc5cnBJEkHY4sOvLTmSvxeqUTR3+8t1RrNYQqbBTxgILkv4stMHL//JBWTB
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <3319cd6e.b980.1930c63b1e5.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:lCgvCgD3fwoBLi5nnLAiAA--.7283W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqQKRqmcuF0eQdwACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksICAKCkF0IDIwMjQtMTEtMDggMjI6MjU6MTMsICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+RGF2aWQhCj4KPk9uIFN1biwgTm92IDAzIDIwMjQgYXQgMTY6
MDUsIERhdmlkIFdhbmcgd3JvdGU6Cj4KPiRTdWJqZWN0OiBbUEFUQ0hdIGtlcm5lbC9pcnEvcHJv
YzogcGVyZm9ybWFuY2U6IC4uLgo+Cj5UaGF0J3Mgbm90IGEgdmFsaWQgc3Vic3lzdGVtIHByZWZp
eC4KCmNvcHkgdGhhdH4KCj4KPj4gc2VxX3ByaW50ZiBpcyBjb3N0eSwgd2hlbiBzdHJlc3MgcmVh
ZGluZyAvcHJvYy9pbnRlcnJ1cHRzLCBwcm9maWxpbmcgaW5kaWNhdGVzCj4+IHNlcV9wcmludGYg
dGFrZXMgYWJvdXQgfjQ3JSBvZiBzaG93X2ludGVycnVwdHMgc2FtcGxlczoKPgo+QWxzbyBwbGVh
c2UgZm9sbG93IHRoZSBkb2N1bWVudGF0aW9uIGZvciBkZW5vdGluZyBmdW5jdGlvbnMgaW4gY2hh
bmdlCj5sb2dzOgo+Cj5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL21haW50YWluZXItdGlwLmh0bWwjZnVuY3Rpb24tcmVmZXJlbmNlcy1pbi1jaGFuZ2Vsb2dz
Cj4KCmNvcHkgdGhhdH4KCj4+ICBhcmNoL2FscGhhL2tlcm5lbC9pcnEuYyAgICAgfCAgIDggKy0t
Cj4+ICBhcmNoL2FybS9rZXJuZWwvc21wLmMgICAgICAgfCAgIDQgKy0KPj4gIGFyY2gvYXJtNjQv
a2VybmVsL3NtcC5jICAgICB8ICAgMyArLQo+PiAgYXJjaC9jc2t5L2tlcm5lbC9zbXAuYyAgICAg
IHwgICA0ICstCj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvc21wLmMgfCAgIDIgKy0KPj4gIGFy
Y2gvcGFyaXNjL2tlcm5lbC9pcnEuYyAgICB8ICAzNCArKysrKystLS0tLS0KPj4gIGFyY2gvcG93
ZXJwYy9rZXJuZWwvaXJxLmMgICB8ICA0NCArKysrKysrKy0tLS0tLS0tCj4+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zbXAuYyAgICAgfCAgIDMgKy0KPj4gIGFyY2gvc2gva2VybmVsL2lycS5jICAgICAg
ICB8ICAgNCArLQo+PiAgYXJjaC9zcGFyYy9rZXJuZWwvaXJxXzMyLmMgIHwgIDEyICsrLS0tCj4+
ICBhcmNoL3NwYXJjL2tlcm5lbC9pcnFfNjQuYyAgfCAgIDQgKy0KPj4gIGFyY2gveDg2L2tlcm5l
bC9pcnEuYyAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gIGFyY2gveHRlbnNhL2tlcm5lbC9pcnEuYyAgICB8ICAgMiArLQo+PiAgYXJjaC94dGVuc2Ev
a2VybmVsL3NtcC5jICAgIHwgICA0ICstCj4+ICBrZXJuZWwvaXJxL3Byb2MuYyAgICAgICAgICAg
fCAgIDYgKystCj4KPlRoZXJlIGlzIG5vIGRlcGVuZGVuY3kgb24gdGhlc2UgY2hhbmdlcy4gU28g
cGxlYXNlIHNwbGl0IHRoZW0gdXAgaW50bwo+c2VwZXJhdGUgcGF0Y2hlcyBmb3IgY29yZSBhbmQg
dGhlIGluZGl2aWR1YWwgYXJjaGl0ZWN0dXJlcy5hbgoKVGhhbmtzIGZvciBhbGwgdGhlIHJldmll
dywgSSB3aWxsIG1ha2UgYSBwYXRjaHNldCBmb3IgdGhpcy4KPgo+VGhhbmtzLAo+Cj4gICAgICAg
IHRnbHgKCgpEYXZpZA==
