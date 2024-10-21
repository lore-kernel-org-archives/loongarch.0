Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D071F4731
	for <loongarch@lists.linux.dev>; Mon, 21 Oct 2024 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729520223; cv=none; b=BCR+D0R3lV3HpdfETYCCz7m9U0rTAwxhxZ00+Yw42uQbJWyJ7WnxjX0OgBt21RHHUTy0akR50CKClK7BannYaklLjdECViW0dnY60++KmqbI1RuZkNivR8tMKb3dy6roHl5AP8aAuBVWPd8wcE4Maz/TnnmmIHGQ2ZjZo6HmFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729520223; c=relaxed/simple;
	bh=PLWv4lFaQV8sjHDvNQjGIRT6NksTFV03TnQPGI0/WJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=WfdYm/VexEiUZS7apylicjAwYLbOdhtAngcdJON9W/EP9S0bEX6bqkpVi2nsN+0UMfc9cOj/DyzAUVUUX7ExZR53dbYm7wCpCjrG8pTRUsMZFf/3gD4NIGd8plkPFJA/i3b36nA6rumCPCoSpWK0SFKRuhBi50lStqw+6IizBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-62-ca9pfulLNsiTNYZ1CcklcQ-1; Mon, 21 Oct 2024 15:16:52 +0100
X-MC-Unique: ca9pfulLNsiTNYZ1CcklcQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 21 Oct
 2024 15:16:51 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 21 Oct 2024 15:16:51 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Julian Vetter' <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Guo Ren" <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Richard Henderson
	<richard.henderson@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>,
	Takashi Iwai <tiwai@suse.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Johannes Berg <johannes@sipsolutions.net>, Christoph Hellwig
	<hch@infradead.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, Yann Sionneau <ysionneau@kalrayinc.com>
Subject: RE: [PATCH v10 0/4] Replace fallback for IO memcpy and IO memset
Thread-Topic: [PATCH v10 0/4] Replace fallback for IO memcpy and IO memset
Thread-Index: AQHbI73OwWqJmOV6ikC/4nDHNEDFmbKRPskA
Date: Mon, 21 Oct 2024 14:16:51 +0000
Message-ID: <0577266edb9440acb082c9e02c0a73b9@AcuMS.aculab.com>
References: <20241021133154.516847-1-jvetter@kalrayinc.com>
In-Reply-To: <20241021133154.516847-1-jvetter@kalrayinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogSnVsaWFuIFZldHRlcg0KPiBTZW50OiAyMSBPY3RvYmVyIDIwMjQgMTQ6MzINCj4gDQo+
IFRoYW5rIHlvdSBhZ2FpbiBmb3IgeW91ciByZW1hcmtzIEFybmQgYW5kIENocmlzdG9waCEgSSBo
YXZlIHVwZGF0ZWQgdGhlDQo+IHBhdGNoc2V0LCBhbmQgcGxhY2VkIHRoZSBmdW5jdGlvbnMgZGly
ZWN0bHkgaW4gYXNtLWdlbmVyaWMvaW8uaC4gSSBoYXZlDQo+IGRyb3BwZWQgdGhlIGxpYnMvaW9t
ZW1fY29weS5jIGFuZCBoYXZlIHVwZGF0ZWQvY2xhcmlmaWVkIHRoZSBjb21taXQNCj4gbWVzc2Fn
ZSBpbiB0aGUgZmlyc3QgcGF0Y2guDQoNCkFwYXJ0IGZyb20gYnVpbGQgJ2lzc3Vlcycgd2hhdCBp
cyB0aGUganVzdGlmaWNhdGlvbiBmb3IgaW5saW5pbmcNCnRoZXNlIGZ1bmN0aW9ucz8NCg0KVGhl
eSBhcmUgcXVpdGUgbGFyZ2UgZm9yIGlubGluaW5nIGFuZCBzb21lIGRyaXZlcnMgY291bGQgZWFz
aWx5DQpjYWxsIHRoZW0gbWFueSB0aW1lcy4NCg0KVGhlIEkvTyBjeWNsZXMgdGhlbXNlbHZlcyBh
cmUgbGlrZWx5IHRvIGJlIHNsb3cgZW5vdWdoIHRoYXQNCnRoZSBjb3N0IG9mIGEgZnVuY3Rpb24g
Y2FsbCBpcyBwcmV0dHkgbXVjaCBsaWtlbHkgdG8gYmUgbm9pc2UuDQoNCglEYXZpZA0KDQotDQpS
ZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWls
dG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMp
DQo=

