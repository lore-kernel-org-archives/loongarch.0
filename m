Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A783431E6
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053093; cv=none; b=KA1AP2IWE+RYfXQ8ey+E/TEa5G6GAJ/E6kY9cNhzOS0AAc0ljnR3aB28yz+HZCWDRcjDlnllEOuUNgl9q88L9OTGagFQ9vlz91o6vy6WKj6tyO2bb6GE65nGazQvZvIW4OcteIJ2xnOPnFEYCa6afxwCiYh6sIc/yPl77NcgS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053093; c=relaxed/simple;
	bh=SEzXO+vDjo81UC3xUG8gWrkW2zdxYChfvJ+fHaee1Vs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W+P5CfUdoO6KdlN+k404YFMSCIueq1aS9nzLWjpEu04d/n0yH5bc6mfgMVb2BUhzSXsLSD1hbik7UVi2dnaEkQFepmGHiGGDKZuk5FojFHGUwpo4PKtMjraIlxrg8RFhQvE8g0wzD7UoejEjE8k9piuGIUnzK0kPiFl7h8Vym0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=bZp9bjqT; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="bZp9bjqT"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=SEzXO+vDjo81UC3xUG8gWrkW2zdxYChfvJ+fHaee1Vs=;
	b=bZp9bjqTyhxLnOHreEOwtdRSsBheQgZrecTbXz5eJLSDcgtu9Pj/PP5bK7bQDIb3gILkBGy9k
	+Qw0MAssFDcgMzZRnGcJe8g1ei3JYbtCHfdrmzFOCPZgfKPfGGjmzXJT2hjfFfLRz/13/xgniSM
	96DhV/TsJb18Bxnr8ut2dWI=
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dX6543NsJzYlQ4R;
	Thu, 18 Dec 2025 18:16:08 +0800 (CST)
Received: from w022.hihonor.com (10.68.16.247) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 18:18:08 +0800
Received: from w025.hihonor.com (10.68.28.69) by w022.hihonor.com
 (10.68.16.247) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 18:18:07 +0800
Received: from w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9]) by
 w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9%14]) with mapi id
 15.02.2562.027; Thu, 18 Dec 2025 18:18:02 +0800
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
Thread-Index: AQHcb+kJOevioCwokUWRSuHGy2xym7UmkpaAgACVZ/A=
Date: Thu, 18 Dec 2025 10:18:02 +0000
Message-ID: <7334df3287534327a3e4a09c5c8d9432@honor.com>
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
 <20251218063916.1433615-3-yuanlinyu@honor.com>
 <aUPB18Xeh1BhF9GS@elver.google.com>
In-Reply-To: <aUPB18Xeh1BhF9GS@elver.google.com>
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
IERlY2VtYmVyIDE4LCAyMDI1IDQ6NTcgUE0NCj4gVG86IHl1YW5saW55dSA8eXVhbmxpbnl1QGhv
bm9yLmNvbT4NCj4gQ2M6IEFsZXhhbmRlciBQb3RhcGVua28gPGdsaWRlckBnb29nbGUuY29tPjsg
RG1pdHJ5IFZ5dWtvdg0KPiA8ZHZ5dWtvdkBnb29nbGUuY29tPjsgQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz47DQo+IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5l
bC5vcmc+OyBXQU5HIFh1ZXJ1aSA8a2VybmVsQHhlbjBuLm5hbWU+Ow0KPiBrYXNhbi1kZXZAZ29v
Z2xlZ3JvdXBzLmNvbTsgbGludXgtbW1Aa3ZhY2sub3JnOyBsb29uZ2FyY2hAbGlzdHMubGludXgu
ZGV2Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMi8yXSBrZmVuY2U6IGFsbG93IGNoYW5nZSBudW1iZXIgb2Ygb2JqZWN0IGJ5IGVhcmx5
DQo+IHBhcmFtZXRlcg0KPiANCj4gT24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMDI6MzlQTSArMDgw
MCwgeXVhbiBsaW55dSB3cm90ZToNCj4gPiB3aGVuIHdhbnQgdG8gY2hhbmdlIHRoZSBrZmVuY2Ug
cG9vbCBzaXplLCBjdXJyZW50bHkgaXQgaXMgbm90IGVhc3kgYW5kDQo+ID4gbmVlZCB0byBjb21w
aWxlIGtlcm5lbC4NCj4gPg0KPiA+IEFkZCBhbiBlYXJseSBib290IHBhcmFtZXRlciBrZmVuY2Uu
bnVtX29iamVjdHMgdG8gYWxsb3cgY2hhbmdlIGtmZW5jZQ0KPiA+IG9iamVjdHMgbnVtYmVyIGFu
ZCBhbGxvdyBpbmNyZWF0ZSB0b3RhbCBwb29sIHRvIHByb3ZpZGUgaGlnaCBmYWlsdXJlDQo+ID4g
cmF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IHl1YW4gbGlueXUgPHl1YW5saW55dUBob25v
ci5jb20+DQo+ID4gLS0tDQo+ID4gIGluY2x1ZGUvbGludXgva2ZlbmNlLmggIHwgICA1ICstDQo+
ID4gIG1tL2tmZW5jZS9jb3JlLmMgICAgICAgIHwgMTIyDQo+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgbW0va2ZlbmNlL2tmZW5jZS5oICAgICAgfCAgIDQg
Ky0NCj4gPiAgbW0va2ZlbmNlL2tmZW5jZV90ZXN0LmMgfCAgIDIgKy0NCj4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2tmZW5jZS5oIGIvaW5jbHVkZS9saW51eC9rZmVuY2UuaA0K
PiA+IGluZGV4IDBhZDFkZGJiOGI5OS4uOTIwYmNkNTY0OWZhIDEwMDY0NA0KPiA+IC0tLSBhL2lu
Y2x1ZGUvbGludXgva2ZlbmNlLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2tmZW5jZS5oDQo+
ID4gQEAgLTI0LDcgKzI0LDEwIEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIGtmZW5jZV9zYW1wbGVf
aW50ZXJ2YWw7DQo+ID4gICAqIGFkZHJlc3MgdG8gbWV0YWRhdGEgaW5kaWNlczsgZWZmZWN0aXZl
bHksIHRoZSB2ZXJ5IGZpcnN0IHBhZ2Ugc2VydmVzIGFzIGFuDQo+ID4gICAqIGV4dGVuZGVkIGd1
YXJkIHBhZ2UsIGJ1dCBvdGhlcndpc2UgaGFzIG5vIHNwZWNpYWwgcHVycG9zZS4NCj4gPiAgICov
DQo+ID4gLSNkZWZpbmUgS0ZFTkNFX1BPT0xfU0laRSAoKENPTkZJR19LRkVOQ0VfTlVNX09CSkVD
VFMgKyAxKSAqIDIgKg0KPiBQQUdFX1NJWkUpDQo+ID4gK2V4dGVybiB1bnNpZ25lZCBpbnQgX19r
ZmVuY2VfcG9vbF9zaXplOw0KPiA+ICsjZGVmaW5lIEtGRU5DRV9QT09MX1NJWkUgKF9fa2ZlbmNl
X3Bvb2xfc2l6ZSkNCj4gPiArZXh0ZXJuIHVuc2lnbmVkIGludCBfX2tmZW5jZV9udW1fb2JqZWN0
czsNCj4gPiArI2RlZmluZSBLRkVOQ0VfTlVNX09CSkVDVFMgKF9fa2ZlbmNlX251bV9vYmplY3Rz
KQ0KPiA+ICBleHRlcm4gY2hhciAqX19rZmVuY2VfcG9vbDsNCj4gPg0KPiANCj4gWW91IGhhdmUg
aWdub3JlZCB0aGUgY29tbWVudCBiZWxvdyBpbiB0aGlzIGZpbGU6DQo+IA0KPiAJLyoqDQo+IAkg
KiBpc19rZmVuY2VfYWRkcmVzcygpIC0gY2hlY2sgaWYgYW4gYWRkcmVzcyBiZWxvbmdzIHRvIEtG
RU5DRSBwb29sDQo+IAkgKiBAYWRkcjogYWRkcmVzcyB0byBjaGVjaw0KPiAJICoNCj4gCVsuLi5d
DQo+IAkgKiBOb3RlOiBUaGlzIGZ1bmN0aW9uIG1heSBiZSB1c2VkIGluIGZhc3QtcGF0aHMsIGFu
ZCBpcyBwZXJmb3JtYW5jZQ0KPiBjcml0aWNhbC4NCj4gCSAqIEZ1dHVyZSBjaGFuZ2VzIHNob3Vs
ZCB0YWtlIHRoaXMgaW50byBhY2NvdW50OyBmb3IgaW5zdGFuY2UsIHdlIHdhbnQgdG8NCj4gYXZv
aWQNCj4gICAgPj4JICogaW50cm9kdWNpbmcgYW5vdGhlciBsb2FkIGFuZCB0aGVyZWZvcmUgbmVl
ZCB0byBrZWVwDQo+IEtGRU5DRV9QT09MX1NJWkUgYQ0KPiAgICA+PgkgKiBjb25zdGFudCAodW50
aWwgaW1tZWRpYXRlIHBhdGNoaW5nIHN1cHBvcnQgaXMgYWRkZWQgdG8gdGhlIGtlcm5lbCkuDQo+
IAkgKi8NCj4gCXN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBpc19rZmVuY2VfYWRkcmVzcyhj
b25zdCB2b2lkICphZGRyKQ0KPiAJew0KPiAJCS8qDQo+IAkJICogVGhlIF9fa2ZlbmNlX3Bvb2wg
IT0gTlVMTCBjaGVjayBpcyByZXF1aXJlZCB0byBkZWFsIHdpdGggdGhlIGNhc2UNCj4gCQkgKiB3
aGVyZSBfX2tmZW5jZV9wb29sID09IE5VTEwgJiYgYWRkciA8IEtGRU5DRV9QT09MX1NJWkUuDQo+
IEtlZXAgaXQgaW4NCj4gCQkgKiB0aGUgc2xvdy1wYXRoIGFmdGVyIHRoZSByYW5nZS1jaGVjayEN
Cj4gCQkgKi8NCj4gCQlyZXR1cm4gdW5saWtlbHkoKHVuc2lnbmVkIGxvbmcpKChjaGFyICopYWRk
ciAtIF9fa2ZlbmNlX3Bvb2wpIDwNCj4gS0ZFTkNFX1BPT0xfU0laRSAmJiBfX2tmZW5jZV9wb29s
KTsNCj4gCX0NCg0KRG8geW91IG1lYW4gcGVyZm9ybWFuY2UgY3JpdGljYWwgYnkgYWNjZXNzIGds
b2JhbCBkYXRhID8NCkl0IGFscmVhZHkgYWNjZXNzIF9fa2ZlbmNlX3Bvb2wgZ2xvYmFsIGRhdGEu
DQpBZGQgb25lIG1vcmUgZ2xvYmFsIGRhdGEgYWNjZXB0YWJsZSBoZXJlID8NCg0KT3RoZXIgcGxh
Y2UgbWF5IGFjY2VzcyBnbG9iYWwgZGF0YSBpbmRlZWQgPw0KDQoNCkkgZG9uJ3Qga25vdyBpZiBh
bGwgbGludXggcmVsZWFzZSBsaWtlIHVidW50dSBlbmFibGUga2ZlbmNlIG9yIG5vdC4NCkkgb25s
eSBrbm93IGl0IHR1cm4gb24gZGVmYXVsdCBvbiBhbmRyb2lkIGRldmljZS4NCg0KDQo+IA0KPiBX
aGlsZSBJIHRoaW5rIHRoZSBjaGFuZ2UgaXRzZWxmIHdvdWxkIGJlIHVzZWZ1bCB0byBoYXZlIGV2
ZW50dWFsbHksIGENCj4gYmV0dGVyIGRlc2lnbiBtaWdodCBiZSBuZWVkZWQuIEl0J3MgdW5jbGVh
ciB0byBtZSB3aGF0IHRoZSBwZXJmIGltcGFjdA0KDQpDb3VsZCB5b3Ugc2hhcmUgdGhlIGJldHRl
ciBkZXNpZ24gaWRlYSA/DQoNCj4gaXMgdGhlc2UgZGF5cyAoYSBsb3QgaGFzIGNoYW5nZWQgc2lu
Y2UgdGhhdCBjb21tZW50IHdhcyB3cml0dGVuKS4gQ291bGQNCj4geW91IHJ1biBzb21lIGJlbmNo
bWFya3MgdG8gYW5hbHl6ZSBpZiB0aGUgZmFzdCBwYXRoIGlzIGFmZmVjdGVkIGJ5IHRoZQ0KPiBh
ZGRpdGlvbmFsIGxvYWQgKHBsZWFzZSBkbyB0aGlzIGZvciB3aGljaGV2ZXIgYXJjaCB5b3UgY2Fy
ZSBhYm91dCwgYnV0DQo+IGFsc28gYXJtNjQgYW5kIHg4Nik/DQo+IA0KPiBJZiBwZXJmb3JtYW5j
ZSBpcyBhZmZlY3RlZCwgYWxsIHRoaXMgY291bGQgYmUgZ3VhcmRlZCBiZWhpbmQgYW5vdGhlcg0K
PiBLY29uZmlnIG9wdGlvbiwgYnV0IGl0J3Mgbm90IGdyZWF0IGVpdGhlci4NCg0Kd2hhdCBraW5k
IG9mIG9wdGlvbiA/IA0KSXQgYWxyZWFkeSBoYXZlIGtjb25maWcgb3B0aW9uIHRvIGRlZmluZSB0
aGUgbnVtYmVyIG9mIG9iamVjdHMsIGhlcmUganVzdCBwcm92aWRlDQphIHBhcmFtZXRlciBmb3Ig
dGhlIHNhbWUgb3B0aW9uIHdoaWNoIHVzZXIgY2FuIGNoYW5nZS4NCg0KPiANCj4gPiAtLQ0KPiA+
IDIuMjUuMQ0K
