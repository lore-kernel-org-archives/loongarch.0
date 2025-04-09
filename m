Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881415A85E
	for <loongarch@lists.linux.dev>; Wed,  9 Apr 2025 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180015; cv=none; b=DiPi/6mW2Hgbz754466cojJgxpXIqDgmyn5bTbjwR58O8HAj2t7dQdSFMdBFtUmO9CPKbIGPaFBwhlTdtv9DJbVa9cGqN+QFD0DCekMz1/PYHve91sThQ/Fbfami0jBjylUcfd/G0mqP3EuAGdtx5niouWW48D9MbukYqlGAmcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180015; c=relaxed/simple;
	bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lvfr/fBgPQ6PBybWE25tMRuaznPeTEOlcSkOwU2LYXb4TAbR8QmaxiJb19QdU2vMgR/IloGKqflgg7cH2m+P9U9Lm5weypc+BkfVaQMGGL8y/9ZEZ88nWLYY59cqWBHXKYv5XxnC0ON9Nzwk3ElIKKCWqbyw8OZ5knnTTORwb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwCFRU4x; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwCFRU4x"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b0c68092so5288278b3a.0
        for <loongarch@lists.linux.dev>; Tue, 08 Apr 2025 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744180013; x=1744784813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=;
        b=PwCFRU4xKqM31LUqxqQvONoNxV77FShv7nfe75lmQdksHkS1rJrFiT2ujLxqwC++Ml
         f3oiDQDdWIvSpofUW6qVEpEYRKAH0tYQ3AsckYt20MPLMes6sMj5tVxs/TwfKC3Fl/fC
         3z2rfO5SSLmR6Km/Ev79Eedb/8U3yslUWpx8JGSrv664xQFQkGR37LR15R7t+KxArrOw
         lcgwSnhwz9Yud0Bl1ZSRQSsgRcEreLHPP8ZdFiSjW9uXbXnfXfK9mMZ5Y7rOHS+fnQ2V
         5vcXkgZM+SMEQjKr6KKkSiaE9dX+PmpwId6VgU4c9DxPRodGd/awkCWAIff6tOe/VHn5
         vXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180013; x=1744784813;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3Z4Xarq1tuQBhaaqWTW8nAq+1+kB87I8bwIR1VHPJQ=;
        b=BQLL7dRc2cvIK7OOf5Zyh3xE5KC1tK2vRogBbVWbiNE1QN4SObzjCzIKFIcL1obFn1
         PkN5e/FwA0wvolB6jAdxuUpuztXUEZ5nqxTj7i8PHNKG7YQ8H8vy8w4RrO70dSqz0Bve
         14JYs5kTgyZp4+PFYn+Vc1wfdBrs6iyrGQE5jMC3PV0QTfBs07WYpSAqw/VA8vfnLwRI
         fN5VY9tTxPfTL4uyMqlSNo+dbRiLKr2wBo8UWCKZsrpl2SkvNSkGbgnYvR3lrhNcG1pD
         VHgtoRlfVNIt2sf27/27UB7vgyJbP5F1Ttkc6N4ArYP+LEewbJQeuEeG6uHjMB5QuP2w
         /ZRg==
X-Forwarded-Encrypted: i=1; AJvYcCVWBqkpULb7hQWz4P+MxWp9VQXyPhzrnEyLdrr9e6C7SiOB3qfwnrWBJc7KTVWA+CGgiNCY3c82L2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiK2I4eDty6V+fGCCxVwImeq6zu0atm5rPCIuztAG4j55sE85+
	gKhZ1pdkWQBS4QrXXAdjOnXfsvoyg2NFcWxehbij8XxX+ERDJs+o
X-Gm-Gg: ASbGncvkKWZaoUvonQ/J7FEDieQSlP8l75RnRy/fb/pWyehSF94yibHajRTxLfikjHa
	LXIxJLP645DswbD5L8yiGI+v9ZAguRtKB4cxZ1u6SOVeoP+WI/6lo3QlOf1ifkSJGI0Fy7IPQNs
	cCWN+k+XqVwBw9G7Z7vyxdtfqss6G1xuuxjgb47joVU04jZpf2ULm2JfmkmPBQm+16h7oe4QyN/
	UVSKzY+OIbiG4BngQbmOZYXPyS6DE9VBymeyp786tf1HClqXsDgi2V/OdewYqGJKI0gJebz30Su
	JhKGRSDORLcZzT+Zv9NT74tdURYc51ZWNFCjE9UFn7IrHP/dcBW7Lp80rQ3Q1R466fT9dNYZBB1
	dBLQh13KibURDCZsBCKxyxDc=
X-Google-Smtp-Source: AGHT+IGrx+0fnZn+0LBw/cUv76G2E7ObwLXuSnUaIiBaCUhSms2DnAP0T+H1BXT4eMhmnrXlDWCCAw==
X-Received: by 2002:a05:6a00:2e0f:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73bae551295mr2257466b3a.21.1744180013348;
        Tue, 08 Apr 2025 23:26:53 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f768sm489551b3a.142.2025.04.08.23.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:26:52 -0700 (PDT)
Date: Wed, 09 Apr 2025 15:26:45 +0900 (JST)
Message-Id: <20250409.152645.2045309190127414357.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
	<20250305110814.272792-5-fujita.tomonori@gmail.com>
	<CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCA4IEFwciAyMDI1IDE1OjU1OjM4ICswMjAwDQpBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gT24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMjoxMOKAr1BN
IEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6DQo+
Pg0KPj4gQWRkIHdhcm5fb24gbWFjcm8sIHVzZXMgdGhlIEJVRy9XQVJOIGZlYXR1cmUgKGxpYi9i
dWcuYykgdmlhIGFzc2VtYmx5DQo+PiBmb3IgeDg2XzY0L2FybTY0L3Jpc2N2Lg0KPj4NCj4+IFRo
ZSBjdXJyZW50IFJ1c3QgY29kZSBzaW1wbHkgd3JhcHMgQlVHKCkgbWFjcm8gYnV0IGRvZXNuJ3Qg
cHJvdmlkZSB0aGUNCj4+IHByb3BlciBkZWJ1ZyBpbmZvcm1hdGlvbi4gVGhlIEJVRy9XQVJOIGZl
YXR1cmUgY2FuIG9ubHkgYmUgdXNlZCBmcm9tDQo+PiBhc3NlbWJseS4NCj4+DQo+PiBUaGlzIHVz
ZXMgdGhlIGFzc2VtYmx5IGNvZGUgZXhwb3J0ZWQgYnkgdGhlIEMgc2lkZSB2aWEgQVJDSF9XQVJO
X0FTTQ0KPj4gbWFjcm8uIFRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSBhc3NlbWJseSBjb2RlLCB0
aGlzIGFwcHJvYWNoIGZvbGxvd3MNCj4+IHRoZSBzYW1lIHN0cmF0ZWd5IGFzIHRoZSBzdGF0aWMg
YnJhbmNoIGNvZGU6IGl0IGdlbmVyYXRlcyB0aGUgYXNzZW1ibHkNCj4+IGNvZGUgZm9yIFJ1c3Qg
dXNpbmcgdGhlIEMgcHJlcHJvY2Vzc29yIGF0IGNvbXBpbGUgdGltZS4NCj4+DQo+PiBTaW1pbGFy
bHksIEFSQ0hfV0FSTl9SRUFDSEFCTEUgaXMgYWxzbyB1c2VkIGF0IGNvbXBpbGUgdGltZSB0bw0K
Pj4gZ2VuZXJhdGUgdGhlIGFzc2VtYmx5IGNvZGU7IG9ianRvb2wncyByZWFjaGFibGUgYW5vdGF0
aW9uIGNvZGUuIEl0J3MNCj4+IHVzZWQgZm9yIG9ubHkgYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBv
Ymp0b29sLg0KPj4NCj4+IEZvciBub3csIExvb25nYXJjaCBqdXN0IHVzZXMgYSB3cmFwcGVyIGZv
ciBXQVJOIG1hY3JvLg0KPj4NCj4+IFVNTCBkb2Vzbid0IHVzZSB0aGUgYXNzZW1ibHkgQlVHL1dB
Uk4gZmVhdHVyZTsganVzdCB3cmFwcGluZyBnZW5lcmljDQo+PiBCVUcvV0FSTiBmdW5jdGlvbnMg
aW1wbGVtZW50ZWQgaW4gQyB3b3Jrcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGVUpJVEEgVG9t
b25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+IA0KPiBPdmVyYWxsIGxvb2tzIHJl
YXNvbmFibGUuIEEgZmV3IG5pdHMgYmVsb3c6DQoNClRoYW5rcyENCg0KPj4gKyNbbWFjcm9fZXhw
b3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tjZmcoYWxsKENPTkZJR19CVUcsIG5vdChD
T05GSUdfVU1MKSwgbm90KENPTkZJR19MT09OR0FSQ0gpKSldDQo+PiArI1tjZmcoQ09ORklHX0RF
QlVHX0JVR1ZFUkJPU0UpXQ0KPj4gK21hY3JvX3J1bGVzISB3YXJuX2ZsYWdzIHsNCj4+ICsgICAg
KCRmbGFnczpleHByKSA9PiB7DQo+PiArICAgICAgICBjb25zdCBGTEFHUzogdTMyID0gJGNyYXRl
OjpiaW5kaW5nczo6QlVHRkxBR19XQVJOSU5HIHwgJGZsYWdzOw0KPj4gKyAgICAgICAgY29uc3Qg
X0ZJTEU6ICZbdThdID0gZmlsZSEoKS5hc19ieXRlcygpOw0KPj4gKyAgICAgICAgLy8gUGx1cyBv
bmUgZm9yIG51bGwtdGVybWluYXRvci4NCj4+ICsgICAgICAgIHN0YXRpYyBGSUxFOiBbdTg7IF9G
SUxFLmxlbigpICsgMV0gPSB7DQo+PiArICAgICAgICAgICAgbGV0IG11dCBieXRlcyA9IFswOyBf
RklMRS5sZW4oKSArIDFdOw0KPj4gKyAgICAgICAgICAgIGxldCBtdXQgaSA9IDA7DQo+PiArICAg
ICAgICAgICAgd2hpbGUgaSA8IF9GSUxFLmxlbigpIHsNCj4+ICsgICAgICAgICAgICAgICAgYnl0
ZXNbaV0gPSBfRklMRVtpXTsNCj4+ICsgICAgICAgICAgICAgICAgaSArPSAxOw0KPj4gKyAgICAg
ICAgICAgIH0NCj4+ICsgICAgICAgICAgICBieXRlcw0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAg
ICAgIC8vIFNBRkVUWTogSnVzdCBhbiBGRkkgY2FsbC4NCj4+ICsgICAgICAgIHVuc2FmZSB7DQo+
PiArICAgICAgICAgICAgJGNyYXRlOjphc20hKGNvbmNhdCEoDQo+PiArICAgICAgICAgICAgICAg
ICIvKiB7c2l6ZX0gKi8iLA0KPj4gKyAgICAgICAgICAgICAgICBpbmNsdWRlIShjb25jYXQhKGVu
diEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9nZW5lcmF0ZWRfYXJjaF93YXJuX2FzbS5ycyIp
KSwNCj4+ICsgICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiks
ICIvcnVzdC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfcmVhY2hhYmxlX2FzbS5ycyIpKSk7DQo+PiAr
ICAgICAgICAgICAgZmlsZSA9IHN5bSBGSUxFLA0KPj4gKyAgICAgICAgICAgIGxpbmUgPSBjb25z
dCBsaW5lISgpLA0KPj4gKyAgICAgICAgICAgIGZsYWdzID0gY29uc3QgRkxBR1MsDQo+PiArICAg
ICAgICAgICAgc2l6ZSA9IGNvbnN0IDo6Y29yZTo6bWVtOjpzaXplX29mOjo8JGNyYXRlOjpiaW5k
aW5nczo6YnVnX2VudHJ5PigpLA0KPiANCj4gVGhlIGluZGVudGF0aW9uIGhlcmUgaXMgb2RkLiBT
aG91bGRuJ3QgdGhlIGFyZ3VtZW50cyBiZSBpbmRlbnRlZCBvbmUgbW9yZT8NCg0KWWVhaCwgZml4
ZWQuDQoNCg0KPj4gKyNbbWFjcm9fZXhwb3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tj
ZmcoYWxsKENPTkZJR19CVUcsIG5vdChDT05GSUdfVU1MKSwgbm90KENPTkZJR19MT09OR0FSQ0gp
KSldDQo+PiArI1tjZmcobm90KENPTkZJR19ERUJVR19CVUdWRVJCT1NFKSldDQo+PiArbWFjcm9f
cnVsZXMhIHdhcm5fZmxhZ3Mgew0KPj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsNCj4+ICsgICAg
ICAgIGNvbnN0IEZMQUdTOiB1MzIgPSAkY3JhdGU6OmJpbmRpbmdzOjpCVUdGTEFHX1dBUk5JTkcg
fCAkZmxhZ3M7DQo+PiArICAgICAgICAvLyBTQUZFVFk6IEp1c3QgYW4gRkZJIGNhbGwuDQo+PiAr
ICAgICAgICB1bnNhZmUgew0KPj4gKyAgICAgICAgICAgICRjcmF0ZTo6YXNtISgNCj4+ICsgICAg
ICAgICAgICBjb25jYXQhKA0KPj4gKyAgICAgICAgICAgICAgICAiLyoge3NpemV9ICovIiwNCj4+
ICsgICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiksICIvcnVz
dC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMiKSksDQo+PiArICAgICAgICAgICAg
ICAgIGluY2x1ZGUhKGNvbmNhdCEoZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2dlbmVy
YXRlZF9hcmNoX3JlYWNoYWJsZV9hc20ucnMiKSkpOw0KPj4gKyAgICAgICAgICAgIGZsYWdzID0g
Y29uc3QgRkxBR1MsDQo+PiArICAgICAgICAgICAgc2l6ZSA9IGNvbnN0IDo6Y29yZTo6bWVtOjpz
aXplX29mOjo8JGNyYXRlOjpiaW5kaW5nczo6YnVnX2VudHJ5PigpLA0KPiANCj4gU2FtZSB0aGlu
ZyBoZXJlLg0KDQpGaXhlZC4NCg0KPj4gKyAgICAgICAgICAgICk7DQo+PiArICAgICAgICB9DQo+
PiArICAgIH0NCj4+ICt9DQo+PiArDQo+PiArI1ttYWNyb19leHBvcnRdDQo+PiArI1tkb2MoaGlk
ZGVuKV0NCj4+ICsjW2NmZyhhbGwoQ09ORklHX0JVRywgQ09ORklHX1VNTCkpXQ0KPj4gK21hY3Jv
X3J1bGVzISB3YXJuX2ZsYWdzIHsNCj4+ICsgICAgKCRmbGFnczpleHByKSA9PiB7DQo+PiArICAg
ICAgICAvLyBTQUZFVFk6IEp1c3QgYW4gRkZJIGNhbGwuDQo+PiArICAgICAgICB1bnNhZmUgew0K
Pj4gKyAgICAgICAgICAgICRjcmF0ZTo6YmluZGluZ3M6Ondhcm5fc2xvd3BhdGhfZm10KA0KPj4g
KyAgICAgICAgICAgICAgICAkY3JhdGU6OmNfc3RyISg6OmNvcmU6OmZpbGUhKCkpLmFzX3B0cigp
IGFzICpjb25zdCA6OmNvcmU6OmZmaTo6Y191Y2hhciwNCj4+ICsgICAgICAgICAgICAgICAgbGlu
ZSEoKSBhcyBpMzIsDQo+PiArICAgICAgICAgICAgICAgICRmbGFncyBhcyB1MzIsDQo+PiArICAg
ICAgICAgICAgICAgIDo6Y29yZTo6cHRyOjpudWxsKCkgYXMgKmNvbnN0IDo6Y29yZTo6ZmZpOjpj
X3VjaGFyLA0KPiANCj4gV2h5IHVuc2lnbmVkIGNoYXI/IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUg
OjprZXJuZWw6OmZmaTo6Y19jaGFyIHRvDQo+IHV0aWxpemUgdGhlIGN1c3RvbSBpbnRlZ2VyIHR5
cGUgZGVmaW5pdGlvbnMgaW4ga2VybmVsIHJhdGhlciB0aGFuIHRoZQ0KPiBmYXVsdHkgb25lcyBp
biBjb3JlLg0KPiANCj4gKE1heWJlICRjcmF0ZSByYXRoZXIgdGhhbiBrZXJuZWwpDQoNCk9vcHMs
IHJlcGxhY2VkIHRoZW0gd2l0aCAkY3JhdGU6OmZmaTo6Y19jaGFyDQoNCg==
