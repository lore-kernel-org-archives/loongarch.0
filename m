Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968DD26290
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 04:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766982004; cv=none; b=dM905gsj4rYdFU3dCHImHusOgsMcPBajtkOw5FFKIjECaXQ8uGBjtYd++z3dNNEt2XJvRAwWixzo3eowMM+m5Avzz+ZrKNwtNF1TTHdHzLazKWsS2frLBSou/2l5HRE7CR8ksg68von3jjvmsWURBJCASKXEGVO6oqaGyhj3Wq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766982004; c=relaxed/simple;
	bh=rojuF6qs0MzToAaFXa+KuXKawYXFL2AL5udxghRv4cg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QRyeLeR4JtOxoNJvXq16JA3X7rzDd0nYfX9vqumrKTHM2v1IyP+pYo+sev6emWelKrUUPwS2YP9PBIr1Ixc2HBOZqZ3+fdATmkIWV18NOcyEbkZzaKGY/k8lP27wLNjuuTIsjRgLn5Ao+ljYaMJRh2uMZZe7h4THTkyWD6C/+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4dfjBy5jppzYlJgm;
	Mon, 29 Dec 2025 11:59:06 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 29 Dec
 2025 12:01:46 +0800
Received: from w025.hihonor.com (10.68.28.69) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 29 Dec
 2025 12:01:45 +0800
Received: from w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9]) by
 w025.hihonor.com ([fe80::5a3b:9b85:bbde:73b9%14]) with mapi id
 15.02.2562.027; Mon, 29 Dec 2025 12:01:45 +0800
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
Thread-Index: AQHcb+kJOevioCwokUWRSuHGy2xym7UmkpaAgACVZ/D//4LNgIARZBYw
Date: Mon, 29 Dec 2025 04:01:45 +0000
Message-ID: <2ff11f959e78405088865c6d61535bfc@honor.com>
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
DQo+IHBhcmFtZXRlcg0KDQoNCj4gPiBDb3VsZCB5b3Ugc2hhcmUgdGhlIGJldHRlciBkZXNpZ24g
aWRlYSA/DQo+IA0KPiBIb3QtcGF0Y2hhYmxlIGNvbnN0YW50cywgc2ltaWxhciB0byBzdGF0aWMg
YnJhbmNoZXMvanVtcCBsYWJlbHMuIFRoaXMNCj4gaGFkIGJlZW4gZGlzY3Vzc2VkIGluIHRoZSBw
YXN0IChjYW4ndCBmaW5kIHRoZSBsaW5rIG5vdyksIGJ1dCBpdCdzIG5vdA0KPiB0cml2aWFsIHRv
IGltcGxlbWVudCB1bmZvcnR1bmF0ZWx5Lg0KPiANCg0KSGkgTWFyY28sDQoNCklmIHlvdSBoYXZl
IGNvbmNlcm4gYWJvdXQgb25lIG1vcmUgZ2xvYmFsLCANCg0KaG93IGFib3V0IGJlbG93IGNvZGUg
Pw0KDQovKiBUaGUgcG9vbCBvZiBwYWdlcyB1c2VkIGZvciBndWFyZCBwYWdlcyBhbmQgb2JqZWN0
cyB3aXRoIG51bWJlciBvZiBvYmplY3RzIGF0IGxvd2VyIGJpdHMgLiAqLw0KdW5zaWduZWQgbG9u
ZyBfX2tmZW5jZV9wb29sX29iamVjdHMgX19yZWFkX21vc3RseTsNCg0Kc3RhdGljIF9fYWx3YXlz
X2lubGluZSBib29sIGlzX2tmZW5jZV9hZGRyZXNzKGNvbnN0IHZvaWQgKmFkZHIpDQp7DQoJcmV0
dXJuIHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKSgoY2hhciAqKWFkZHIgLSBLRkVOQ0VfUE9PTF9B
RERSKSA8IEtGRU5DRV9QT09MX0xFTiAmJiBfX2tmZW5jZV9wb29sX29iamVjdHMpOw0KfQ0KDQpJ
dCBtYXkgZ2VuZXJhdGUgb25lIG9yIHR3byBtb3JlIGluc3RydWN0aW9uIHdoZW4gY29tcGFyZSB3
aXRoIG9yaWdpbmFsIHBhdGNoLg0KDQoNCg==
