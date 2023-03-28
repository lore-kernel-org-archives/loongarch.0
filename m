Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C0723A1
	for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1680003594;
	bh=SzulNji4opou7lgojxtUyQ4UHhhPqbMH3w+G5a9zDiw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LCrSQT3N3+FNICWBBgk+C37FnzNTqIDN30fvbnD1v1F/wEXmFONCcGPeaOHokHNiS
	 SU7Kiubj/PG+DiIPUFyeKzp+DL14tKhWjyArBVVqsShWBLwTbCCCBVzsbTrMTMXEfW
	 /MDuzO/aIrSZjmB2lKjG2E4qVi6bMPUPQ0J6OBq4=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6E7A365BFC;
	Tue, 28 Mar 2023 07:39:45 -0400 (EDT)
Message-ID: <9817aaa043e9f0ed964bd523773447bd64f6e2c0.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Add kernel address sanitizer support
From: Xi Ruoyao <xry111@xry111.site>
To: Qing Zhang <zhangqing@loongson.cn>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>,  Jonathan Corbet <corbet@lwn.net>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kasan-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Tue, 28 Mar 2023 19:39:42 +0800
In-Reply-To: <20230328111714.2056-1-zhangqing@loongson.cn>
References: <20230328111714.2056-1-zhangqing@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTAzLTI4IGF0IDE5OjE3ICswODAwLCBRaW5nIFpoYW5nIHdyb3RlOgoKLyog
c25pcCAqLwoKCj4gLXZvaWQgKiBfX2luaXQgcmVsb2NhdGVfa2VybmVsKHZvaWQpCj4gK3Vuc2ln
bmVkIGxvbmcgX19pbml0IHJlbG9jYXRlX2tlcm5lbCh2b2lkKQoKV2h5IHdlIG11c3QgbW9kaWZ5
IHJlbG9jYXRlX2tlcm5lbCBmb3IgS0FTQU4/Cgo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqB1bnNp
Z25lZCBsb25nIGtlcm5lbF9sZW5ndGg7Cj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcg
cmFuZG9tX29mZnNldCA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDCoHZvaWQgKmxvY2F0aW9uX25ldyA9
IF90ZXh0OyAvKiBEZWZhdWx0IHRvIG9yaWdpbmFsIGtlcm5lbCBzdGFydCAqLwo+IC3CoMKgwqDC
oMKgwqDCoHZvaWQgKmtlcm5lbF9lbnRyeSA9IHN0YXJ0X2tlcm5lbDsgLyogRGVmYXVsdCB0byBv
cmlnaW5hbCBrZXJuZWwgZW50cnkgcG9pbnQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgY2hhciAqY21k
bGluZSA9IGVhcmx5X2lvcmVtYXAoZndfYXJnMSwgQ09NTUFORF9MSU5FX1NJWkUpOyAvKiBCb290
IGNvbW1hbmQgbGluZSBpcyBwYXNzZWQgaW4gZndfYXJnMSAqLwo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoHN0cnNjcHkoYm9vdF9jb21tYW5kX2xpbmUsIGNtZGxpbmUsIENPTU1BTkRfTElORV9TSVpF
KTsKPiBAQCAtMTkwLDkgKzE4OSw2IEBAIHZvaWQgKiBfX2luaXQgcmVsb2NhdGVfa2VybmVsKHZv
aWQpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlbG9jX29mZnNldCAr
PSByYW5kb21fb2Zmc2V0Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
IFJldHVybiB0aGUgbmV3IGtlcm5lbCdzIGVudHJ5IHBvaW50ICovCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGtlcm5lbF9lbnRyeSA9IFJFTE9DQVRFRF9LQVNMUihzdGFydF9rZXJu
ZWwpOwo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFRoZSBjdXJyZW50
IHRocmVhZCBpcyBub3cgd2l0aGluIHRoZSByZWxvY2F0ZWQga2VybmVsICovCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2N1cnJlbnRfdGhyZWFkX2luZm8gPSBSRUxPQ0FURURf
S0FTTFIoX19jdXJyZW50X3RocmVhZF9pbmZvKTsKPiDCoAo+IEBAIC0yMDQsNyArMjAwLDcgQEAg
dm9pZCAqIF9faW5pdCByZWxvY2F0ZV9rZXJuZWwodm9pZCkKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqByZWxvY2F0ZV9hYnNvbHV0ZShyYW5kb21fb2Zmc2V0KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDC
oHJldHVybiBrZXJuZWxfZW50cnk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJhbmRvbV9vZmZz
ZXQ7CgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBBZXJvc3Bh
Y2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkK

