Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB911EB5ED
	for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639269; cv=none; b=K4Qkg+7msaux8K4X0Y+KW5Tsxnap4azx8IHXGOCgQuu2TeaYmLuESJZWtLLpxE0RCeZQrBNAtXki+/o2f3OxgH/3cYTb5MTZuqEju9/U3rpcpYy4ABGyRr97oF2Wkvy/CtfuqFk56gWJwE9ABbP2jTMWxJ+uGqqWaFVDvvSdXDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639269; c=relaxed/simple;
	bh=n0B/1XV3Zb7SGgPpaEn1A2d9Yhckeog7XvRX+HT5X/0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XcWDez32xU4wzFronNFuWUsNq8vQtOrF5lO608DeIImir9t4XG8Uwc2ndq1d/XFR0cSu7yzEZEJtR7yZjLuptmqRVa/ipevfWD6yIpJaficNZ6of+4I22Hk/hDp1DJMxfZ0czDrTWGD3rJs3LDz5JpyvGf0u9KUART+l0d0pKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa5ApRpk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa5ApRpk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so1277637a91.3
        for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 22:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740639267; x=1741244067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgyTSFeHFjA7K6c7bMlzYp5hJ4ivyZJhPS3wek+zZXw=;
        b=Fa5ApRpkyjt1rEKVjuqUM/652tainpPMRvtM1kEwJeUPClVL0WjkBI8IzMgtsjh3fG
         BthM5mZe55vaqd8c+GesgQCb+9UOc90RGC1MdNiYdqpPCrBcUOMDSTD04j/PJ11rTvnM
         1MyoQC7K/LvEd9cxS63alNRS0nqCV+J0GzE5GRiyBpTvaIzwHUsgnpbpDDM6WmvwBaw+
         sn53G34DZRuK5u8U6h02elMNzWLEkOEFpky9EqHXc2R4F8iee1Ysj4gH/oFhK+PXe/hr
         faJZD8Eyem6nrAz8K0HKAsM1yUd3DvlLjRLQQR2zLi4gp4yjTFz08OS9nzC6V4LGjeLK
         APtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639267; x=1741244067;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JgyTSFeHFjA7K6c7bMlzYp5hJ4ivyZJhPS3wek+zZXw=;
        b=KQbTZzJzWqWqZc3mHdLeIiMYRvzr6J1OBRX1p7m/x0xIqR3VS09afE7xvq8SURyctj
         QC6Ka7XpHmcuAnKpgPVbGOo94rykZgdTgQ7PqNm+SKpaGg3GHYNdLqeHhzmE4HswR5HJ
         /5w97Ct5UZ8SkaYXaphbY60EpCyTK5BfBo/a4Z0np3V1hzqmS7hjxSP5vMuSfiTaqRwV
         pCJX0v/xZpPqn7A8xi1twrO8XcgtDKlaKy14soSrQQWkJcbJDFYTbsiDK6oNCMBZNNtw
         2r5JxKdDmi4iBJ2bdiPBbIk9ipgwHJBuXMp7pL3iwkSN/3QuwLCRR8bQZSjR5e9Of5xp
         q0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43mJlwqRHRNS4jewtMVubRHRn3HrrEYbIUHhCV4JKvKd0qug34dzAONGqzysBCyci2ruA93jzoCE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5l853DdX4Z30mSS5a5/u5tYCBW9oKRFhR6oWn7ondjKrTDBbn
	OdSOYz4xvf/x38CZo0BVB9gAWbAPopJeoKWkPD/TZUB83Lz9HQY+
X-Gm-Gg: ASbGncsenifkbf0jv0+0QUjQuvVVfZl8MKmKKFs7e0NxAuf2/TRvvvYAsuNuUqg3p+G
	auyNi9QJC6K/R7GREBF1i1hBiRvpebfdQHXHBr3wYWWbkXkzcfnhxBglVDdSRSIFxdXQwadHeZM
	2+L3xURoyMGSwHbvEK1SeAuZd9mvqWsegjHCAqp1mxbCYqNyFNWb5NJIwFo66/dbmEKhpOBuJpB
	d5tCqma1pfKuagdYwwiQ5BscPS74GiqJVlvZIUD+H7najw4t4uUyUQV2k3Wh6SEjGqYKaPRo9lR
	j4H4HQ4w2FE2hqfT45i6u9Qb9uztI6r25AL+6Q/CYf9iezEnWOPIEvHGeKTVU5mjsqwMfJHisQM
	uL0bdtR8=
X-Google-Smtp-Source: AGHT+IGjuaF9lCedEwwvhGXZ/MFEnt3SPMlo5RufsTcV9FkuM7vYd2x/lrwZ+ktjsfsepkbI2prS3A==
X-Received: by 2002:a17:90a:d802:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-2fe8c22614fmr7028655a91.15.1740639267130;
        Wed, 26 Feb 2025 22:54:27 -0800 (PST)
Received: from localhost (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f972esm7386905ad.58.2025.02.26.22.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:54:26 -0800 (PST)
Date: Thu, 27 Feb 2025 15:54:17 +0900 (JST)
Message-Id: <20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
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
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <8734g0v6ke.fsf@kernel.org>
References: <yy_ESUuchCjlaGIJHzCPAcP_d9ucSD0CGXaoZNNkY7BmN5Ch1J8avsA9QpKO5LkTjlGpu99jl8NrFl5NFSQXuw==@protonmail.internalid>
	<20250213135759.190006-1-fujita.tomonori@gmail.com>
	<8734g0v6ke.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 20:39:45 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> How does this series compare/overlap with [1] ?
> 
> [1] https://lore.kernel.org/all/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/

No overlap. Each solves a different problem. Both are necessary.

This patchset enables Rust code to call C's BUG/WARN properly.

Currently, Rust's BUG() is a simple wrapper for C's BUG()
(rust/helpers/bug.c). I added BUG() to rnull's init() and got the
following:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP
CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
RIP: 0010:rust_helper_BUG+0x8/0x10
(snip)

This is NOT debug information that we expect. The problem is that
BUG/WARN feature (lib/bug.c) can only be used from assembly.

This patchset includes only warn() but with bug() implementation on
top of this patchset, I got:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
WARNING: CPU: 0 PID: 31 at /home/fujita/git/linux-rust/drivers/block/rnull.rs:46 _RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModu]
Modules linked in: rnull_mod(+)
CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #104
RIP: 0010:_RNvXCsafUg3oOYix8_5rnullNtB2_13NullBlkModuleNtCsaYBeKL739Xz_6kernel13InPlaceModule4init+0x71/0x4f0 [rnull_mod]


The [1] patchset adds an abstraciton for include/linux/once_lite.h,
'call a function once' feature, with pr_*_once() implementation.

pr_*_once() just calls printk() once. Unlike BUG/WARN, no debug
information (call place, registers, stack trace, etc).


The only connection between two patchset is that WARN_ONCE() can be
built on top of both like the C side.
