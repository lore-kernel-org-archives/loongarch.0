Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9BC1361
	for <loongarch@lists.linux.dev>; Wed, 15 Mar 2023 04:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1678854802;
	bh=dnx8mYuIXKhY0u6LRcFBOzoqXdx1e7QKqhBvWdPzpZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VgEC4Y46BOhmxYa8KoD9dQnAmGzAcqArZr0zdsHqekEdduwtfswHmehsoGT391Rm8
	 bqoYsvYYjFe8Je30ruve6ZLKXqw/o95+2EShlqvf8wMo5Dd5rrd0rfkuUb0ajpLz0I
	 q9IbRDObDqGGVGwHgZUMOT6HlNVEj2yllOMwS83I=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 41E4165907;
	Wed, 15 Mar 2023 00:33:21 -0400 (EDT)
Message-ID: <0f07fc368ef9a365f4928f97819f203e45deb345.camel@xry111.site>
Subject: Re: [PATCH V2] LoongArch: Make WriteCombine configurable for
 ioremap()
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren
	 <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang
	 <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Wed, 15 Mar 2023 12:33:19 +0800
In-Reply-To: <20230315004450.508486-1-chenhuacai@loongson.cn>
References: <20230315004450.508486-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gV2VkLCAyMDIzLTAzLTE1IGF0IDA4OjQ0ICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKCi8q
IHNuaXAgKi8KCj4gK2NvbmZpZyBBUkNIX1dSSVRFQ09NQklORQo+ICvCoMKgwqDCoMKgwqDCoGJv
b2wgIkVuYWJsZSBXcml0ZUNvbWJpbmUgKFdVQykgZm9yIGlvcmVtYXAoKSIKPiArwqDCoMKgwqDC
oMKgwqBoZWxwCj4gK8KgwqDCoMKgwqDCoMKgwqAgTG9vbmdBcmNoIG1haW50YWlucyBjYWNoZSBj
b2hlcmVuY3kgaW4gaGFyZHdhcmUsIGJ1dCB3aGVuIHBhaXJlZAo+ICvCoMKgwqDCoMKgwqDCoMKg
IHdpdGggTFM3QSBjaGlwc2V0cyB0aGUgV1VDIGF0dHJpYnV0ZSAoV2Vhay1vcmRlcmVkIFVuQ2Fj
aGVkLCB3aGljaAo+ICvCoMKgwqDCoMKgwqDCoMKgIGlzIHNpbWlsYXIgdG8gV3JpdGVDb21iaW5l
KSBpcyBvdXQgb2YgdGhlIHNjb3BlIG9mIGNhY2hlIGNvaGVyZW5jeQo+ICvCoMKgwqDCoMKgwqDC
oMKgIG1hY2hhbmlzbSBmb3IgUENJZSBkZXZpY2VzICh0aGlzIGlzIGEgUENJZSBwcm90b2NvbCB2
aW9sYXRpb24sIHdoaWNoCj4gK8KgwqDCoMKgwqDCoMKgwqAgbWF5IGJlIGZpeGVkIGluIG5ld2Vy
IGNoaXBzZXRzKS4KPiArCj4gK8KgwqDCoMKgwqDCoMKgwqAgVGhpcyBtZWFucyBXVUMgY2FuIG9u
bHkgdXNlZCBmb3Igd3JpdGUtb25seSBtZW1vcnkgcmVnaW9ucyBub3csIHNvCj4gK8KgwqDCoMKg
wqDCoMKgwqAgdGhpcyBvcHRpb24gaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCwgbWFraW5nIFdVQyBz
aWxlbnRseSBmYWxsYmFjayB0bwo+ICvCoMKgwqDCoMKgwqDCoMKgIFNVQyBmb3IgaW9yZW1hcCgp
LiBZb3UgY2FuIGVuYWJsZSB0aGlzIG9wdGlvbiBpZiB0aGUga2VybmVsIGlzIGVuc3VyZWQKPiAr
wqDCoMKgwqDCoMKgwqDCoCB0byBydW4gb24gaGFyZHdhcmUgd2l0aG91dCB0aGlzIGJ1Zy4KCidZ
b3UgY2FuIG92ZXJyaWRlIHRoaXMgc2V0dGluZyB2aWEgd3JpdGVjb21iaW5lPXllcy9ubyBib290
IHBhcmFtZXRlci4nCgovKiBzbmlwICovCgo+ICtzdGF0aWMgaW50IF9faW5pdCBzZXR1cF93cml0
ZWNvbWJpbmUoY2hhciAqcCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGlmICghc3RyY21wKHAsICJv
biIpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZ3Byb3Rfd2MgPSBQQUdFX0tF
Uk5FTF9XVUM7Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZSBpZiAoIXN0cmNtcChwLCAib2ZmIikpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBncHJvdF93YyA9IFBBR0VfS0VSTkVMX1NV
QzsKCmVsc2UKCXByX3dhcm4oIlVua25vd24gd3JpdGVjb21iaW5lIHNldHRpbmcgXCIlc1wiLlxu
IiwgcCk7CgpPdGhlcndpc2UgTEdUTS4KCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0
ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5p
dmVyc2l0eQo=

