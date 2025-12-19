Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6F26D4CD
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118973; cv=none; b=Ps71D3Bii2LSERWnxpidjWHuf4lyehfRdKvxk7myZjOextnWtUuifeA+5p+o7fvTsPqtAHju9fCe+wMhzV68sEo/a/F318IIJI+VN7sviBHmqbeveU+JS82IN9D+GYzqzb8qwQJEbv4QiObGvOxHVqQvqmaaiiuJoSwJQXdYU7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118973; c=relaxed/simple;
	bh=TBeoBMXlMEVhwhMkEcXIUeqtkasMEWs5iVpIxMFXugQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EsTcbLBMrsRQ1/05E5pvTVdAb1vhCOP5y+FMrzlCEz5NiPeQvXKb/QbSHuCfFC1a34FAGRNp7D+OkjBruiMUGTkMqE3S4EujlVLMhfxnErh9ybIq/wRRCLBu4URN7qGqzitTwKuGDFkqSY0Lzg9BZy48IgztP9C47YMIADH4E7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4dXZRC3cNKzYlLgM;
	Fri, 19 Dec 2025 12:33:27 +0800 (CST)
Received: from w022.hihonor.com (10.68.16.247) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 19 Dec
 2025 12:36:01 +0800
Received: from w025.hihonor.com (10.68.28.69) by w022.hihonor.com
 (10.68.16.247) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 19 Dec
 2025 12:36:01 +0800
Received: from w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9]) by
 w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9%14]) with mapi id
 15.02.2562.027; Fri, 19 Dec 2025 12:36:01 +0800
From: yuanlinyu <yuanlinyu@honor.com>
To: Marco Elver <elver@google.com>
CC: Alexander Potapenko <glider@google.com>, Dmitry Vyukov
	<dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] kfence: allow change number of object by early
 parameter
Thread-Topic: [PATCH v2 2/2] kfence: allow change number of object by early
 parameter
Thread-Index: AQHcb+kJOevioCwokUWRSuHGy2xym7UmkpaAgACVZ/D//4LNgIABtVUA
Date: Fri, 19 Dec 2025 04:36:01 +0000
Message-ID: <a5937489d22f450eaecca610d8aef6c9@honor.com>
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
 <20251218063916.1433615-3-yuanlinyu@honor.com>
 <aUPB18Xeh1BhF9GS@elver.google.com>
 <7334df3287534327a3e4a09c5c8d9432@honor.com>
 <CANpmjNMmiXjifpc9LdCVi5jzzKU3sgb0iJn7P7TMFMNqDH7TbA@mail.gmail.com>
In-Reply-To: <CANpmjNMmiXjifpc9LdCVi5jzzKU3sgb0iJn7P7TMFMNqDH7TbA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBGcm9tOiBNYXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xlLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IERlY2VtYmVyIDE4LCAyMDI1IDY6MjQgUE0NCj4gVG86IHl1YW5saW55dSA8eXVhbmxpbnl1QGhv
bm9yLmNvbT4NCj4gQ2M6IEFsZXhhbmRlciBQb3RhcGVua28gPGdsaWRlckBnb29nbGUuY29tPjsg
RG1pdHJ5IFZ5dWtvdg0KPiA8ZHZ5dWtvdkBnb29nbGUuY29tPjsgQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz47DQo+IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5l
bC5vcmc+OyBXQU5HIFh1ZXJ1aSA8a2VybmVsQHhlbjBuLm5hbWU+Ow0KPiBrYXNhbi1kZXZAZ29v
Z2xlZ3JvdXBzLmNvbTsgbGludXgtbW1Aa3ZhY2sub3JnOyBsb29uZ2FyY2hAbGlzdHMubGludXgu
ZGV2Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMi8yXSBrZmVuY2U6IGFsbG93IGNoYW5nZSBudW1iZXIgb2Ygb2JqZWN0IGJ5IGVhcmx5
DQo+IHBhcmFtZXRlcg0KPiANCj4gT24gVGh1LCAxOCBEZWMgMjAyNSBhdCAxMToxOCwgeXVhbmxp
bnl1IDx5dWFubGlueXVAaG9ub3IuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gRnJvbTogTWFyY28g
RWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+DQo+ID4gRG8geW91IG1lYW4gcGVyZm9ybWFuY2UgY3Jp
dGljYWwgYnkgYWNjZXNzIGdsb2JhbCBkYXRhID8NCj4gPiBJdCBhbHJlYWR5IGFjY2VzcyBfX2tm
ZW5jZV9wb29sIGdsb2JhbCBkYXRhLg0KPiA+IEFkZCBvbmUgbW9yZSBnbG9iYWwgZGF0YSBhY2Nl
cHRhYmxlIGhlcmUgPw0KPiA+DQo+ID4gT3RoZXIgcGxhY2UgbWF5IGFjY2VzcyBnbG9iYWwgZGF0
YSBpbmRlZWQgPw0KPiANCj4gaXNfa2ZlbmNlX2FkZHJlc3MoKSBpcyB1c2VkIGluIHRoZSBzbHVi
IGZhc3QgcGF0aCwgYW5kIGFub3RoZXIgbG9hZCBpcw0KPiBvbmUgbW9yZSBpbnN0cnVjdGlvbiBp
biB0aGUgZmFzdCBwYXRoLiBXZSBoYXZlIGF2b2lkZWQgdGhpcyB0aHVzIGZhcg0KPiBmb3IgdGhp
cyByZWFzb24uDQo+IA0KPiA+IEkgZG9uJ3Qga25vdyBpZiBhbGwgbGludXggcmVsZWFzZSBsaWtl
IHVidW50dSBlbmFibGUga2ZlbmNlIG9yIG5vdC4NCj4gPiBJIG9ubHkga25vdyBpdCB0dXJuIG9u
IGRlZmF1bHQgb24gYW5kcm9pZCBkZXZpY2UuDQo+IA0KPiBUaGlzIGlzIGlycmVsZXZhbnQuDQo+
IA0KPiA+ID4gV2hpbGUgSSB0aGluayB0aGUgY2hhbmdlIGl0c2VsZiB3b3VsZCBiZSB1c2VmdWwg
dG8gaGF2ZSBldmVudHVhbGx5LCBhDQo+ID4gPiBiZXR0ZXIgZGVzaWduIG1pZ2h0IGJlIG5lZWRl
ZC4gSXQncyB1bmNsZWFyIHRvIG1lIHdoYXQgdGhlIHBlcmYgaW1wYWN0DQo+ID4NCj4gPiBDb3Vs
ZCB5b3Ugc2hhcmUgdGhlIGJldHRlciBkZXNpZ24gaWRlYSA/DQo+IA0KPiBIb3QtcGF0Y2hhYmxl
IGNvbnN0YW50cywgc2ltaWxhciB0byBzdGF0aWMgYnJhbmNoZXMvanVtcCBsYWJlbHMuIFRoaXMN
Cj4gaGFkIGJlZW4gZGlzY3Vzc2VkIGluIHRoZSBwYXN0IChjYW4ndCBmaW5kIHRoZSBsaW5rIG5v
dyksIGJ1dCBpdCdzIG5vdA0KPiB0cml2aWFsIHRvIGltcGxlbWVudCB1bmZvcnR1bmF0ZWx5Lg0K
DQppcyBpdCBwb3NzaWJsZSBhZGQgdGFnIHRvIGtmZW5jZSBhZGRyZXNzIGFuZCBvbmx5IGNoZWNr
IGFkZHJlc3MgaXRzZWxmID8NCg0KPiANCj4gQW4gb3B0aW9uIHRoYXQgd291bGQgZW5hYmxlL2Rp
c2FibGUgdGhlIGNvbW1hbmQtbGluZSBjaGFuZ2VhYmxlIG51bWJlcg0KPiBvZiBvYmplY3RzLCBp
LmUgb25lIHZlcnNpb24gdGhhdCBhdm9pZHMgdGhlIGxvYWQgaW4gdGhlIGZhc3QgcGF0aCBhbmQN
Cj4gb25lIHZlcnNpb24gdGhhdCBlbmFibGVzIGFsbCB0aGUgYml0cyB0aGF0IHlvdSBhZGRlZCBo
ZXJlLiBCdXQgSSdkDQo+IHJhdGhlciBhdm9pZCB0aGlzIGlmIHBvc3NpYmxlLg0KDQpZZXMsIGl0
IHNob3VsZCBhdm9pZCwgdGhlIHB1cnBvc2UgaXMgd2l0aG91dCBjb21waWxlIHRoZSBrZXJuZWwu
DQoNCj4gDQo+IEFzIHN1Y2gsIHBsZWFzZSBkbyBiZW5jaG1hcmsgYW5kIGFuYWx5emUgdGhlIGdl
bmVyYXRlZCBjb2RlIGluIHRoZQ0KPiBhbGxvY2F0b3IgZmFzdCBwYXRoICh5b3Ugc2hvdWxkIHNl
ZSBhIGxvYWQgdG8gdGhlIG5ldyBnbG9iYWwgeW91DQo+IGFkZGVkKS4gbGx2bS1tY2EgWzFdIG1p
Z2h0IGhlbHAgeW91IHdpdGggYW5hbHlzaXMuDQo+IA0KPiBbMV0gaHR0cHM6Ly9sbHZtLm9yZy9k
b2NzL0NvbW1hbmRHdWlkZS9sbHZtLW1jYS5odG1sDQoNClRoYW5rcywgd2lsbCBsZWFybiBpdA0K
DQo=
