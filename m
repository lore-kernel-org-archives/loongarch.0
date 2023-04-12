Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1D28EF
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1681295953;
	bh=uK2Ba3ZWSYogBHYvci04+yx8O80TQjxAxa7QAUBekvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U5BvSleDhvgrJYA80jw6IGPbTXpJp/po8oThiAucW8xJKak6xELb3rsQdKsbFriyO
	 q8Lvo/TTTVLJOQm0WUVlgoU+RhrPO5c8UVPJMcTWQ3kFnpPUv4W44NoQ94Iz+PF3Q6
	 Trps8JSY0vo5+0haCSZ97XxCbyygW0o89oncEfbY=
Received: from [192.168.124.11] (unknown [113.140.11.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 046C665CE0;
	Wed, 12 Apr 2023 06:39:11 -0400 (EDT)
Message-ID: <6d06f74cb610b0012ff367fd1a7ac4aba027e304.camel@xry111.site>
Subject: Re: [PATCH v1 1/4] LoongArch: Move three functions from kprobes.c
 to inst.h
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Wed, 12 Apr 2023 18:39:04 +0800
In-Reply-To: <1681293901-24918-2-git-send-email-yangtiezhu@loongson.cn>
References: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
	 <1681293901-24918-2-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gV2VkLCAyMDIzLTA0LTEyIGF0IDE4OjA0ICswODAwLCBUaWV6aHUgWWFuZyB3cm90ZToKPiAr
c3RhdGljIGlubGluZSBib29sIGluc25zX25vdF9zdXBwb3J0ZWQodW5pb24gbG9vbmdhcmNoX2lu
c3RydWN0aW9uIGluc24pCgpUaGlzIGZ1bmN0aW9uIHNlZW1zIGxvbmcgZW5vdWdoICh0byBtZSkg
bm90IHRvIHVzZSAic3RhdGljIGlubGluZSIuIApOb3RlIHRoYXQgbW9zdCBwYXJ0IG9mIHRoaXMg
ZnVuY3Rpb24gYmVsb25ncyB0byBhIGNvbGQgcGF0aCwgYW5kIElNTwppdCdzIGJhZCB0byBpbmxp
bmUgYSBjb2xkIHBhdGggaW50byBldmVyeSBjYWxsZXIuCgo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKg
c3dpdGNoIChpbnNuLnJlZzJpMTRfZm9ybWF0Lm9wY29kZSkgewo+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgbGx3X29wOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgbGxkX29wOgo+ICvCoMKgwqDCoMKgwqDC
oGNhc2Ugc2N3X29wOgo+ICvCoMKgwqDCoMKgwqDCoGNhc2Ugc2NkX29wOgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwcl9ub3RpY2UoImtwcm9iZTogbGwgYW5kIHNjIGluc3RydWN0
aW9ucyBhcmUgbm90IHN1cHBvcnRlZFxuIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKg
c3dpdGNoIChpbnNuLnJlZzFpMjFfZm9ybWF0Lm9wY29kZSkgewo+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgYmNlcXpfb3A6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByX25vdGljZSgi
a3Byb2JlOiBiY2VxeiBhbmQgYmNuZXogaW5zdHJ1Y3Rpb25zIGFyZSBub3Qgc3VwcG9ydGVkXG4i
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4gK8KgwqDC
oMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBpbnNuc19uZWVkX3NpbXVsYXRpb24odW5pb24gbG9vbmdhcmNo
X2luc3RydWN0aW9uIGluc24pCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBpZiAoaXNfcGNfaW5zKCZp
bnNuKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoGlmIChpc19icmFuY2hfaW5zKCZpbnNuKSkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biBmYWxzZTsKCkknZCB3cml0ZSAicmV0dXJuIGlzX3BjX2lucygmaW5zbikgfHwgaXNfYnJhbmNo
X2lucygmaW5zbik7IiBoZXJlLCBidXQKdGhlcmUgaXMgbm8gYmVoYXZpb3JhbCBkaWZmZXJlbmNl
IGFueXdheS4KCj4gK30KCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29s
IG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQo=

