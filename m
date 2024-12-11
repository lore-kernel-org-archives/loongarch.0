Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765F17838C
	for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 23:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959017; cv=none; b=XpBxTbANb4Jfmb1FdqGxODs/TSdxeqdK5yHdEO4XsLP5xdZ9o2/O+puuoHKIFPgC0toVVMTQarixSLfgrEpSyG+UMyQ+hugeSWaGPfg01/pkLxFosBxtdJVlPueb2m0LM8tURTafEj99s5tDT3QtyZTnAZsZ8QxwufY4FFALqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959017; c=relaxed/simple;
	bh=i6ZrtWtzAyOy8gdWcoPcDlt/eQnm2NOjmoi9dL7VXZg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TryxdLnwcf6HdwpISRx5IFlI0p3VxszMaYzGzkuPvvD/OkIzE9X6HlM8LP8MMyCWBz+ddz0ShLfFjS0QLV22neCREotFrXgNktUcK+2RGg2r3XoBCev3HVcwgfbUKMvNsPMsWut+R/iyD/chIHO+1pC/w+ixdmzpIS8Pk6tyIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtmPeeas; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtmPeeas"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-728ea1573c0so19543b3a.0
        for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 15:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733959015; x=1734563815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShXp0MbnAr4ggsRDnYhR5uR6lsM/ajKdCXbVIq5oTug=;
        b=JtmPeeas0JUO57uKkVgMYDr0KBbtcTGx2FzTRh4ctaEoyp+IS8UcIrmkqtRAtYY/fC
         EUV841xxYAtOYvCn3URUe00cXtLQBjGPkYEnQjS1mr68w7nPpMJv82qzmkbH3cWjEBXz
         jpSXToqwLw8tx0LeHOQr0tayAaCGcXc5eDG7X6Ff4SfwGrvDthkzJvEgeniD43iph2YU
         uNmLcH6q+16h2s0SGX0073xYRXlNY41U6bT6Jet2IDBIECjazb3QFp5afMQu1lAv8fpF
         k0O8Af+jis243hhaybBjB5U+qy9w0g4z9hFxwxGsNgdDrkDyRlfabKJHTxROqq3DzI1J
         vNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959015; x=1734563815;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ShXp0MbnAr4ggsRDnYhR5uR6lsM/ajKdCXbVIq5oTug=;
        b=FFNpk6ozGk2rOF/yzd2tKL9H64ADIYFGBLWz9jX80NxxSOEcQ6eFyVZNs9tbqEKniS
         VxYOTLTEXY31paeqKvEOtp6BUFeXEiIvY8CXNUjbDhOyKPz5DY3VBUSYFTtnlIGBSVGB
         cv08pM4fMHNyuDtR14O8OC2+pZCBCfgvY7mKeblax5cpXnlOFsVW0T5mlNkydNbM4WKC
         0Kr/uAO6kF6u2u+H3f2FWIKXvXH7yOL4pxeHCKHgXq6YnjF4xM1o0/5bLJrRKSJRdHMu
         FI5fEilwjzv26E1UNeq5ZWmBEW2BlsSKvn/oMbhGzZsu3GBCb6UpW1d471jsfdJnZtcG
         DfkA==
X-Forwarded-Encrypted: i=1; AJvYcCXIDIeLsEvHIOI5VcLQB5Ku/d4Y6XnhrWpiPR6PdI0egDkjKQrpkkrfIAgy92kVRe0R3J6ZclpiG2I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgYKG891wyETWOvSnIL9p0XXKLctk1X0Oed9ymRiVwH4gYGYsX
	qMr4SOOYsgJmn/b16E7Q0OEdw5N1D3a3NdzWOCx4c/gpIg8+e/5X
X-Gm-Gg: ASbGnct1QLQAW+9FB49jnCVODdQj+d2GAFTtJNNoSNx5HxV1oOcDoRr/t3mhnxV279V
	hSG636u9dJ04ZVr+rmpO1zBL6Cg7YmGFfyKryTIjuZ4dC2yZpgkAo3RdvYvSBTLpI6c+BT34NGm
	gJxqauS2GskfTd9Eck0C1VILakC4KvSSRwgHQ4Ss8QYBoh9pNqH9Jk2vwWxumhze6yNc8/LOgTt
	KHVnfNen7wkD6eGZMSz5KZND+3FHGZPKE3SjSsdeQt/4U4FPCH7aN4YsLD6EIItk4v9qsPYOfIh
	69EK2tg7VZPlUhsKUa4wE3FX1Emjas3jq7Rw
X-Google-Smtp-Source: AGHT+IHiOZwkIkfA6zUyxiG0lm10+eI/mHdViFN+Pz4GPmJYmGkPLqez5E4FZA5uA6Zaeh8N3oG8TQ==
X-Received: by 2002:a05:6a00:92a6:b0:725:f18a:da42 with SMTP id d2e1a72fcca58-728fa9bf4abmr1705891b3a.2.1733959015026;
        Wed, 11 Dec 2024 15:16:55 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cf238777sm8304590b3a.47.2024.12.11.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:16:54 -0800 (PST)
Date: Thu, 12 Dec 2024 08:16:39 +0900 (JST)
Message-Id: <20241212.081639.1353664129364117890.fujita.tomonori@gmail.com>
To: chenhuacai@kernel.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
 yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for
 BUG/WARN asm code sharing with Rust
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
	<20241210001802.228725-5-fujita.tomonori@gmail.com>
	<CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 11 Dec 2024 16:41:42 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

>> +#ifdef CONFIG_DEBUG_BUGVERBOSE
>> +#define __BUG_LOCATION_STRING(file, line)              \
>> +               ".long " file "- .;"                    \
>> +               ".short " line ";"
>> +#else
>> +#define __BUG_LOCATION_STRING(_file, _line)
>> +#endif
> Can we use file and line instead of _file and _line, which is the same
> as the CONFIG_DEBUG_BUGVERBOSE case?

Of course, I'll fix in v2. I should have done that.

>> +
>> +#define __BUG_ENTRY_STRING(file, line, flags)          \
>> +               __stringify(__BUG_ENTRY_START)          \
>> +               __BUG_LOCATION_STRING(file, line)       \
>> +               ".short " flags ";"                     \
>> +               __stringify(__BUG_ENTRY_END)
>> +
>> +#define ARCH_WARN_ASM(file, line, flags, size)         \
>> +       __BUG_ENTRY_STRING(file, line, flags)           \
>> +       __stringify(break BRK_BUG) ";"
>> +
> Can we use the same indentation in this file?

Oops, I'll fix in v2.

Thanks!
