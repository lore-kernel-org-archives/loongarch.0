Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD87F259C
	for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 00:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877674; cv=none; b=l2kTeSN75ltOrrXJNTl1QUyjXNmEnlwBtRwOuRG3xxv99dJg/sy4XY1d/zIJPJI5+YZAmaJtiR+coZV6kcMblwXIRSRHCsSGLfVQ2AF6mup8au1FotWYuccvhcDQJ5r0TkEq1aQUX1qEiOWNG5cX7mEM/jSqElOd2yw6EZ3fmtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877674; c=relaxed/simple;
	bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=atQO9NMyiVeIElYY0Xg5r5Exz8ujt99KVFOFax/rYh7Ta+Rjf16R1JWEeXl78repS8OaGcF648qPIpiTMbDB3MaCGmbzwrcqQy5FxhxoDZPdXSWmMQfsPa2q5d2VA9noulFHTsvryHABPxmR6BV7NjY1H/lBlG2xk/t3rFYjDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml6D8q2W; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml6D8q2W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso35438225ad.3
        for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 16:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733877672; x=1734482472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=;
        b=ml6D8q2WqGnGxWFd5lqGP0C9nW0ewme23SAqsZmLe/NkTkacaHm9Bz0vNaVon1aAev
         2tnUIoZrxx42hk7ABGW7lhuoUCjJ2+7ap1ydtg5ZhPFQMJeIZXaycOluVY+KZcPZhdn7
         a1/xYp7Idzr25+4hfmOXT5rp9R5IAIr8o17bwVXN/fzPYNqP7Sx7S8BAA52IF3HWrIy0
         Advg4xhomgRCDqUeoTy1VLdagwTZhhNoN9Z/4A5WlsxjJK1kMp6UzNbudTCe1zag+QLE
         taQVNdQbVuU75h7/wVqwYg/lWjrvqZslW1IOOMz/2HqXFQSz/53EQcdxpfqDoXrpGOW/
         cATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733877672; x=1734482472;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5UPtfw8VuK8f7upUsP0qiiGtjlJDQAQYuFm8VMuMXK4=;
        b=mvqDX7Yz/eEOqxcsY0OMMP5zrqrhQWgwUkskOFA9mowXRd3xT0Uv885v7suDkm4Aij
         KrmkrOeY0vbSbX1lh0cZegyAcKRbF2ili5KB4oB7jZWxGU/hE4VrsoPVePHbqOX1dHct
         atbAkHh45d8VyxeOdjSCXzjqvAIWcPMgM9vFvgenYcUHrvE0A1H/avUsw1ElfeVg7g6H
         iZJADFYu/UNTcR0aK4LfexgJdVYZ9qsE/iOSpONhNqG+CBO4oWxw4Yq7PdJm7rIbULeM
         Xf84Bnvnzws0gDSKV5fgt4kkMXjPJByR3iPBqPde4OEQgvDo8gUXA44AZNP+1p7Z4b4U
         qzHw==
X-Forwarded-Encrypted: i=1; AJvYcCV5CmxRKOmlI2GzGJXH5A9bR7c+kIl9oJ8MyOC1pD8OsYC8m/qc2fA1x1FEWDMFxK37SuDnYeu9rZM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxci6bSLjgA0bM4+SZVwHu5pRxSmBFBmCkrPut916lZP9bJ7WrS
	X2l6V9JIRYKVk9YkLel0Uo4Sq5tRZWJY0YAVAs5uZKKQ1U5wV+eh
X-Gm-Gg: ASbGncuPeMGAL1M4pCOLVOVMcKWfHdsgaFFVSeLLS21V89dormDRC+41WHZczXLe+qQ
	Ya/Ywc6YIEHtEUybxC0KuIXkXdyltiVxR/KF3ZRLa9NOlQtewE6dnpQEo0xR4Mj4CsPFgHiCN3m
	E8DjWuGCqUWaPks/5TonmbpW2gmsFYKg4ORONvL6yGGSMy1iLOA/zp41tUOA4xAmNSpDlithva2
	5lCT37sOgppxbcADw7f7XmHQhH5aCjw3mhUN9xfFkbxXB6/wtouoHr8RIlPpJpqrPuzFgVS1PAT
	SnC0GkInLYcpGweuAPFQld8/Pnxant9GRA==
X-Google-Smtp-Source: AGHT+IHqHfCvZvGKLuMXz8AiDsWXknJ34bQnBz2kNatpxzICbZyL3M7rCR45PKN88PXAaH1LNr0svg==
X-Received: by 2002:a17:902:8b83:b0:216:7cbf:9500 with SMTP id d9443c01a7336-21778397522mr17055945ad.6.1733877672078;
        Tue, 10 Dec 2024 16:41:12 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216353ab708sm56076995ad.182.2024.12.10.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:41:11 -0800 (PST)
Date: Wed, 11 Dec 2024 09:40:54 +0900 (JST)
Message-Id: <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
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
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
	<20241210001802.228725-6-fujita.tomonori@gmail.com>
	<CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxMCBEZWMgMjAyNCAxMDowNTowNyArMDEwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFR1ZSwgRGVjIDEwLCAyMDI0IGF0IDE6MTnigK9B
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IEFkZCB3YXJuX29uIGFuZCB3YXJuX29uX29uY2UgbWFjcm9zLiBXcmFwcGluZyB0aGUg
QydzIFdBUk5fKiBhbmQgQlVHXyoNCj4+IG1hY3JvcyBkb2Vzbid0IHdvcmsgc28gdGhpcyB1c2Vz
IHRoZSBhc3NlbWJseSBjb2RlIGV4cG9ydGVkIGJ5IHRoZSBDDQo+PiBzaWRlIHZpYSBBUkNIX1dB
Uk5fQVNNIG1hY3JvLiBMaWtlIHRoZSBzdGF0aWMgYnJhbmNoIGNvZGUsIHRoaXMNCj4+IGdlbmVy
YXRlcyB0aGUgYXNzZW1ibHkgY29kZSBmb3IgcnVzdCBkeW5hbWljYWxseSBieSB1c2luZyB0aGUg
Qw0KPj4gcHJlcHJvY2Vzc29yLg0KPj4NCj4+IGZpbGUoKSEgbWFjcm8gZG9lc24ndCB3b3JrIGZv
ciB0aGUgUnVzdCBpbmxpbmUgYXNzZW1ibHkgaW4gdGhlIHNhbWUNCj4+IHdheSBhcyBfX0ZJTEVf
XyBmb3IgdGhlIEMgaW5saW5lIGFzc2VtYmx5LiBTbyB0aGUgY29kZSB0byBoYW5kbGUgYQ0KPj4g
ZmlsZSBuYW1lIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBDIGFzc2VtYmx5IGNvZGUgKHNpbWlsYXIg
dG8gdGhlDQo+PiBhcm02NC9sb29uZ2FyY2ggYXNzZW1ibHkpLg0KPj4NCj4+IEFTTV9SRUFDSEFC
TEUgZGVmaW5pdGlvbiB3b3JrcyBpbiB0aGUgc2FtZSB3YXkgdG8gZ2V0IG9ianRvb2wncw0KPj4g
cmVhY2hhYmxlIGFzbSBjb2RlLiBUaGUgYXJjaGl0ZWN0dXJlcyB3aGljaCB1c2Ugb2JqdG9vbCAo
eDg2IGFuZA0KPj4gbG9vbmdhcmNoKSBuZWVkcyBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBG
VUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+IA0KPj4gKyNbbWFj
cm9fZXhwb3J0XQ0KPj4gKyNbZG9jKGhpZGRlbildDQo+PiArI1tjZmcoYWxsKENPTkZJR19CVUcs
IG5vdChDT05GSUdfVU1MKSkpXQ0KPj4gKyNbY2ZnKGFueSh0YXJnZXRfYXJjaCA9ICJ4ODZfNjQi
LCB0YXJnZXRfYXJjaCA9ICJyaXNjdjY0IikpXQ0KPiANCj4+ICsjW21hY3JvX2V4cG9ydF0NCj4+
ICsjW2RvYyhoaWRkZW4pXQ0KPj4gKyNbY2ZnKGFsbChDT05GSUdfQlVHLCBub3QoQ09ORklHX1VN
TCkpKV0NCj4+ICsjW2NmZyhhbnkodGFyZ2V0X2FyY2ggPSAiYWFyY2g2NCIsIHRhcmdldF9hcmNo
ID0gImxvb25nYXJjaDY0IikpXQ0KPiANCj4gV2hhdCdzIHRoZSByZWFzb24gZm9yIHRoaXMgYXJj
aC1zcGVjaWZpYyBjb2RlPyBUaGUgZmlsZSEoKS9saW5lISgpDQo+IGludm9jYXRpb25zPyBDb3Vs
ZCB0aGV5IGJlIHBhc3NlZCBhcyBhbiBhcmd1bWVudCB0byB0aGUgYXNtIGluc3RlYWQgc28NCj4g
dGhhdCB3ZSBkb24ndCBuZWVkIHRhcmdldF9hcmNoIGNmZ3M/IEkgdW5kZXJzdGFuZCB0aGF0IHRo
ZXkgZG9uJ3Qgd29yaw0KPiBleGFjdGx5IHRoZSBzYW1lIHdheSwgYnV0IG1heWJlIGl0IGNvdWxk
IHN0aWxsIHdvcms/DQoNCkJlY2F1c2Ugb2YgImVycm9yOiBuYW1lZCBhcmd1bWVudCBuZXZlciB1
c2VkIiBpbiBSdXN0IGlubGluZSBhc3NlbWJseToNCg0KQWxsIHRoZSBhcmNocyBkZWZpbmUgQVJD
SF9XQVJOX0FTTSBtYWNybyBpbiB0aGUgc2FtZSB3YXk6DQoNCiNkZWZpbmUgQVJDSF9XQVJOX0FT
TShmaWxlLCBsaW5lLCBmbGFncywgc2l6ZSkNCg0KSG93ZXZlciwgb25seSB4ODYgYW5kIHJpc2Mt
diBhc20gY29kZSB1c2UgdGhlIHNpemUgYXJndW1lbnQuIFdpdGhvdXQNCnRoZSBjZmdzLCBJJ2xs
IGdldCB0aGUgZm9sbG93aW5nIG9uIGFybTY0L2xvb25nYXJjaDoNCg0KZXJyb3I6IG5hbWVkIGFy
Z3VtZW50IG5ldmVyIHVzZWQNCiAgLS0+IC9ob21lL2Z1aml0YS9naXQvbGludXgtcnVzdC9kcml2
ZXJzL2Jsb2NrL3JudWxsLnJzOjU0OjkNCiAgIHwNCjU0IHwgICAgICAgICB3YXJuX29uISh0cnVl
KTsNCiAgIHwgICAgICAgICBeXl5eXl5eXl5eXl5eXiBuYW1lZCBhcmd1bWVudCBuZXZlciB1c2Vk
DQogICB8DQogICA9IGhlbHA6IGlmIHRoaXMgYXJndW1lbnQgaXMgaW50ZW50aW9uYWxseSB1bnVz
ZWQsIGNvbnNpZGVyIHVzaW5nIGl0IGluIGFuIGFzbSBjb21tZW50OiBgIi8qIHtzaXplfSAqLyJg
DQogICA9IG5vdGU6IHRoaXMgZXJyb3Igb3JpZ2luYXRlcyBpbiB0aGUgbWFjcm8gYCRjcmF0ZTo6
d2Fybl9mbGFnc2Agd2hpY2ggY29tZXMgZnJvbSB0aGUgZXhwYW5zaW9uIG9mIHRoZSBtYWNybyBg
d2Fybl9vbmAgKGluIE5pZ2h0bHkgYnVpbGRzLCBydW4gd2l0aCAtWiBtYWNyby1iYWNrdHJhY2Ug
Zm9yIG1vcmUgaW5mbykNCg0KDQpBbnkgd2F5IHRvIG1ha2UgdGhlIGNvbXBpbGVyIHRvIGlnbm9y
ZSB0aGlzPw0KDQoNCj4+ICsjW21hY3JvX2V4cG9ydF0NCj4+ICsjW2RvYyhoaWRkZW4pXQ0KPj4g
KyNbY2ZnKGFsbChDT05GSUdfQlVHLCBDT05GSUdfVU1MKSldDQo+PiArbWFjcm9fcnVsZXMhIHdh
cm5fZmxhZ3Mgew0KPj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsNCj4+ICsgICAgICAgIC8vIFNB
RkVUWTogSnVzdCBhbiBGRkkgY2FsbC4NCj4+ICsgICAgICAgIHVuc2FmZSB7DQo+PiArICAgICAg
ICAgICAgJGNyYXRlOjpiaW5kaW5nczo6d2Fybl9zbG93cGF0aF9mbXQoDQo+PiArICAgICAgICAg
ICAgICAgICRjcmF0ZTo6Y19zdHIhKDo6Y29yZTo6ZmlsZSEoKSkuYXNfcHRyKCkgYXMgKmNvbnN0
IDo6Y29yZTo6ZmZpOjpjX2NoYXIsDQo+PiArICAgICAgICAgICAgICAgIGxpbmUhKCkgYXMgaTMy
LA0KPj4gKyAgICAgICAgICAgICAgICAkZmxhZ3MgYXMgdTMyLA0KPj4gKyAgICAgICAgICAgICAg
ICA6OmNvcmU6OnB0cjo6bnVsbCgpIGFzICpjb25zdCA6OmNvcmU6OmZmaTo6Y19jaGFyLA0KPiAN
Cj4gSSB3b25kZXIgaWYgdGhpcyBjb3VsZCBiZSB3cml0dGVuIHRvIHV0aWxpemUgTG9jYXRpb246
OmNhbGxlcigpDQo+IGluc3RlYWQgc28gdGhhdCBgI1t0cmFja19jYWxsZXJdYCB3b3Jrcz8NCg0K
WW91IG1lYW50IHRoYXQgd2UgY291bGQgbWFrZSB3YXJuX2ZsYWdzKCkgZnVuY3Rpb24gaW5zdGVh
ZCBvZiBtYWNybw0Kd2l0aCBMb2NhdGlvbjo6Y2FsbGVyKCk/DQoNCklmIHNvLCB3ZSBuZWVkIHRv
IGFkZCBjZmdzIHRvIHdhcm5fb24gYW5kIHdhcm5fb25fb25jZSBiZWNhdXNlIGJvdGggbWFjcm8N
CmFuZCBmdW5jdGlvbiBvZiB3YXJuX2ZsYWdzIGFyZSBuZWNlc3Nhcnk/DQo=
