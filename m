Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078A1C747
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 10:21:21 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-248-5WJ049edOrWmU0tcoX8Omw-1; Thu, 11 May 2023 11:21:19 +0100
X-MC-Unique: 5WJ049edOrWmU0tcoX8Omw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 11 May
 2023 11:21:17 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 11 May 2023 11:21:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Youling Tang' <tangyouling@loongson.cn>, WANG Xuerui <kernel@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Zhangjin Wu <falcon@tinylab.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Subject: RE: [PATCH v2] LoongArch: Add jump-label implementation
Thread-Topic: [PATCH v2] LoongArch: Add jump-label implementation
Thread-Index: AQHZg6ozaB8g4nBOXk2nIgcZgDD24q9U3LGw
Date: Thu, 11 May 2023 10:21:17 +0000
Message-ID: <644efa37967b4944aeb41d4ab9faeceb@AcuMS.aculab.com>
References: <1683710206-23905-1-git-send-email-tangyouling@loongson.cn>
 <3b360532-6ad5-b22c-b02a-103be491be4c@xen0n.name>
 <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>
In-Reply-To: <72b6c81a-d4ee-575a-ff48-6be7e034ac96@loongson.cn>
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

RnJvbTogWW91bGluZyBUYW5nDQo+IFNlbnQ6IDExIE1heSAyMDIzIDAyOjM0DQouLi4NCj4gPj4g
KyAgICBpZiAodHlwZSA9PSBKVU1QX0xBQkVMX0pNUCkNCj4gPg0KPiA+IFBsZWFzZSB1c2UgYSBz
d2l0Y2ggZm9yIGRlYWxpbmcgd2l0aCBlbnVtLXR5cGVkIHZhbHVlcy4NCj4gDQo+IEJlY2F1c2Ug
dGhlIGN1cnJlbnQgdHlwZSBvbmx5IGhhcyBKVU1QX0xBQkVMX05PUCBhbmQgSlVNUF9MQUJFTF9K
TVAsDQo+IHVzaW5nIGlmIG1heSBiZSBzaW1wbGVyIHRoYW4gc3dpdGNoLg0KDQpUaGUgZ2VuZXJh
dGVkIGNvZGUgd2lsbCBiZSBwcmV0dHkgbXVjaCB0aGUgc2FtZS4NCkV2ZW4gaWYgdGhlIGNvbXBp
bGVyIGlzIGFsbG93ZWQgZ2VuZXJhdGUgYSBqdW1wIHRhYmxlDQood2hpY2ggaXMgYWxtb3N0IGNl
cnRhaW5seSBkaXNhYmxlZCkgaXQgd29uJ3QgaWYgdGhlcmUNCmFyZSBvbmx5IHR3byBjYXNlcy4N
Cg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2Fk
LCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykNCg==

