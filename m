Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493821FAF
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 07:48:09 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-157-rNQl31rOM_OzVpP2VZ4eFw-1; Tue, 18 Oct 2022 08:48:06 +0100
X-MC-Unique: rNQl31rOM_OzVpP2VZ4eFw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Oct
 2022 08:48:04 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Tue, 18 Oct 2022 08:48:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Huacai Chen' <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
CC: Huacai Chen <chenhuacai@loongson.cn>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Guo Ren <guoren@kernel.org>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2] LoongArch: Add unaligned access support
Thread-Topic: [PATCH V2] LoongArch: Add unaligned access support
Thread-Index: AQHY4c+4g3BwiNKgXk2nk+NWr+NpZK4SijAggAE57syAAAG74A==
Date: Tue, 18 Oct 2022 07:48:04 +0000
Message-ID: <cbbc32d4bb0f445197eb5d84d796595c@AcuMS.aculab.com>
References: <20221017022330.2383060-1-chenhuacai@loongson.cn>
 <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
 <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
 <c34a277a-1735-65e6-c97d-fcc2ac3d57e6@xen0n.name>
 <CAAhV-H5y5wz0VzFEHrkDpap4wczWXBn_ibL3LW_JQyYkMzjDXQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5y5wz0VzFEHrkDpap4wczWXBn_ibL3LW_JQyYkMzjDXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
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

RnJvbTogSHVhY2FpIENoZW4NCj4gU2VudDogMTggT2N0b2JlciAyMDIyIDA4OjMzDQouLi4NCj4g
PiBXaGF0IGFib3V0IG15IG1vcmUgc3RydWN0dXJlZCBhcHByb2FjaCBpbiBhbm90aGVyIHJlcGx5
IHRoYXQgYXZvaWRzIHRoZQ0KPiA+IGh1Z2UgZWxzZS1pZiBjb25kaXRpb25zPyBCb3RoIHRoZSB0
ZXJyaWJsZSBsaW5lIHdyYXBzIGFuZCBjb2RlZ2VuIGNvdWxkDQo+ID4gYmUgYXZvaWRlZC4NCi4u
Lg0KPiBPSywgbGV0IG1lIHRyeS4NCg0KSSBzdXNwZWN0IHlvdSBjYW4gbWFzayBvdXQgc29tZSAn
b3BlcmFuZCBzaXplJyBiaXRzIGZyb20gdGhlDQppbnN0cnVjdGlvbnMgLSBpbnN0ZWFkIG9mIGNo
ZWNraW5nIGVhY2ggb3Bjb2RlLg0KDQpJJ20gYWxzbyBwcmV0dHkgc3VyZSB5b3UgY2FuJ3QgYXNz
dW1lIHRoZSBGUCByZWdpc3RlciBhcmUgbGl2ZS4NCklmIGEgcmVhZCBmcm9tIHVzZXJzcGFjZSBm
YXVsdHMgdGhlbiB0aGVyZSBjYW4gYmUgYSBmdWxsDQpwcm9jZXNzIHN3aXRjaCAtIHNvIGJ5IHRo
ZSB0aW1lIHlvdSB0cnkgdG8gd3JpdGUgdG8gdGhlDQpGUCByZWdpc3RlcnMgdGhleSBubyBsb25n
ZXIgYmVsb25nIHRvIHRoZSBjdXJyZW50IHByb2Nlc3MuDQoNCkl0IG1pZ2h0IGJlIHNhZmVyIGFu
ZCBzaW1wbGVyIHRvIGp1c3QgZW5mb3JjZSB0aGUgRlANCnJlZ2lzdGVycyBiZSBzYXZlZCBhbmQg
dGhlbiBhY3Qgb24gdGhlIHNhdmUgYXJlYS4NCkknZCBndWVzcyB0aGV5IGdldCByZXN0b3JlZCBp
biB0aGUgJ3JldHVybiB0byB1c2Vyc3BhY2UnDQpjb2RlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

