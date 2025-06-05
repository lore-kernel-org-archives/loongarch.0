Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C554769
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108043; cv=none; b=fx66kGpQjc/TjjcAdzpI3T7DJt0ZbpbB42HXr4+VyaimGmjmetwlZKXallHyn05Mcvcd4tOp7PwGyLj6uR3iWcakvbgNtL6P0q2amkR4HV9I7ZnoFGLpMNLvW16A/opPHBeAKWic1HCs6issNWKk/VMXz0icPfFsAhqv80fEdwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108043; c=relaxed/simple;
	bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mecpGLihHG/B1XDmLPl/1xmNNag8zfotePOxSZ6aKIDlxbnukz4z1mTkgCbdEI6e+RT6gm64YtbxMC2mJyEfTpwiQMurScKHw11USdxJAeJuQ6AHZOz4014MV3NCJPf5XZFBeqI+dL435jELEbyDtgDe+ILTQNpjfywohWvUyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2QMT+zM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2QMT+zM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso607781b3a.2
        for <loongarch@lists.linux.dev>; Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749108041; x=1749712841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=I2QMT+zMII9c35+ElYnxdESvj3zB1MoJBSVdp5lLDj4KSSkkW1USEZu80hV18T4vlI
         tgqYBoIWNQAEH5ghfD2ZA6y6lB54lvvNWxjFfRLWB6o3Wd9cwoEuLaiLiRqRVfglaQZO
         nBYDaclOoqb12s2oqXK3XqrYdGFXXfm8krDQNny/t0Hvb7Jbo0g8lW6usVXvV8b0AWtk
         JEoWBCwt8fKIpWw+RKC4PQzbgd/BeNiabQ81/Sf6yNKSaLufImopGa1N8swf2AU1aGQd
         2bDagUGuAZuDwAEXwddhe6sQB0t4RzdE+8R2+5AqzrErfEnhi6m5Tae5i3wDIqQKf7FC
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108041; x=1749712841;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=EkZ4UnRStN1n339myUXZVFYczlG/B3fickfPUvSJhCFhQDj/TMnUuNBYUGhSWDidSK
         ET5wNjA8ve+Yeq9E9qVSM98gipZgDjFopc29d1EukNCBrZ9Zp2n1L7hHnaMfZLBqx6z8
         DOX9vCUTDXT1UPuPARSTXWWkkfWM3QnhPedSWJOmzmvrzsA5yDVoHn0SVGjANQFFmUmL
         rixwSTZAMhanqHVctHInabfftvH4eYlASjVfTzV+YWHD6rMW4nsgXIy5u5CWEyV7m50t
         bC1UO6T2cfyK3rcDMjWh57XbEfdEg71KAaB8vglCTFGj9j4pOCVVdtBBe0yjIpdzM1x+
         LlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGwP169/tNKZkFlhC9bWcm/BeTrqVeZ5PXWTjtX18p704iRhKcJlQ1AgUB18YFN07Ywbj3+98kxjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdL8TKe+vWKwrYY6CEc3eMWBCFubFOu/WI6FIDQoAixb3S3Eoy
	xpaXDKiDU1fx6OaYObJEXzDU8laXJJloLSnydMGG1pxqrc7ng3KdSepk
X-Gm-Gg: ASbGnct/KVvyty/Tz91LWZIDUmTl8s8+XoTt9kV/bUoFp0DgL9HTcsJgiDH4jGawf4J
	7DLRoaXIOl6jfMfAhjcI7rl5qMm3heyzFCYftUi9Vyo0b3PkbMD0u+O1r8nfhqYjwjG1zoz5aiF
	48k/yYrOZq9eHWm2AIl1zsynoTmaf5qJL1p5Mbsbuvgqwl7XyBgF3Jv6IDbfNjjV/BaBrLkv1mG
	d1igKG9Xx8T9K+tHCIag93ySVdGZj+8Il6q7tvjsovVcfZrChfPFFkgtaQavegiONvr8bepDyRA
	/MVcRH2KqkTxrkuap0eCzH6oRvC2kpu/JITQunwl8InI7W+suL6W4SiYVwUM4XlT8OxkH9Pwb/5
	fOU8Ubt/f0KuwWELQud95OUH9zqI+v2J/fw==
X-Google-Smtp-Source: AGHT+IFD//RPz7ru1g21LutghSu3t+G8Yuhv3ZX4QuwTNEkZ18KvKr5lhdrA1j/AUPiBIQk/dzX11w==
X-Received: by 2002:a05:6a00:853:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-7480cf8b97amr7468180b3a.14.1749108041124;
        Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab109sm12229223b3a.40.2025.06.05.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:20:40 -0700 (PDT)
Date: Thu, 05 Jun 2025 16:20:22 +0900 (JST)
Message-Id: <20250605.162022.1856520286549134654.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
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
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
	<CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA1IEp1biAyMDI1IDAzOjU2OjMxICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgTWF5IDIsIDIwMjUg
YXQgMTE6NDbigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyB3YXJuX29uIG1hY3JvIHdpdGgg
dGhlIGJ1Zy93YXJuIGFic3RyYWN0aW9uIHRoYXQNCj4+IHV0aWxpemVzIHRoZSBrZXJuZWwncyBC
VUcvV0FSTiBmZWF0dXJlIHZpYSBhc3NlbWJseS4NCj4gDQo+IFRoaXMgcGFzc2VkIG15IHVzdWFs
IHRlc3RzIC0tIEkgd2lsbCB0YWtlIGEgYmV0dGVyIGxvb2sgYW5kIHBpY2sgaXQNCj4gZWFybHkg
bmV4dCBjeWNsZS4NCg0KUGVyZmVjdCwgdGhhbmsgeW91IHNvIG11Y2ghDQoNCg==
