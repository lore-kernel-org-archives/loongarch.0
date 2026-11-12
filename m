Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510620;
	b=GiERjAoMnKAZJQmUX7wW6kfYqbyRl6I8BhAoKlK5PRsQ5GI+TqPXMbXmMERfLJqnYOOL
	 TW2GAYn+f3XwyulPvI6pY49BY499IMmv32vxB6GwDjczigWWuyahc8DkKcaOw0E1TUEoZ
	 Cgu0jQ+QIwadEWoMRts1KEuksE4tU0YV61AAElxypwgChuGacAAdNznDlAQv+Wvz8QhOc
	 njP1LZ0G6AJZn1LHMRzMNh7KH7ssR+JSMSOQ9B9YaaWWgit2nXEyMTxsoPYhIgtl6TVZm
	 Foil18ElfJ91kqLVml3eFdlLQYRlql5TVJYIwGxD4g04nP8WHIWkRuVDq2PovYkATOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510620;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
	b=IPTpUiNVmjJivkB52f9rpAT5bZ0pxEAmO3SZMMLW5ArBEV5m5wpAKl8EC3tPohwRTh1N
	 jQPx0XhbsTDYDpRlWN1zmx1gI2UyRdReVfAo7SLATQR+CPmdHi59Ho4GYeKz/s/Ykaj+x
	 iSbRzcDyRJ5u4dirYqpVlU5pzgZYykKYGY/C5Cwjl+5bGgV3OQ07T8+YrsPdrxBcKYKPV
	 tYq881vyr0x+zmjrj7ricWI/zDqrqrQt68P0YWHg9J6JCllj1Re1D/szSleoJIPbMcK+D
	 zePaSBDOR3mV4IuaSawCsZs1rxlkfKhy7touQ1g5X2myfEbBA6VHGxzwjWJ9pJy/hNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71232606A886
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 19:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71232606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac01ff101so101486e0c.2
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 11:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510619; x=1795115419;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
        b=m2ss7JJKndiDViEVddjWmfZotlr99iKYnfC6B7Vk4zvF0VVDDfRoUdnLiyzrpu9Kr3
         u0s6IYBAgEmc8CBXHhUaEf8Gc6lZCS4dKpB+BY8N+Y91VIsUpaUIh5K972vThuvLem7l
         uvc2mOjnI5z2trLHPTJE1b7uZu49RyqulCmWBaoX73Zvu+EAO/HSfr0D1E1BaY7lOhw6
         iDx5X8+ObcdBRTzfpil6Wca+fzGpCo9QgfVtDH4dyvLTrjcB84vPXez0r3Zmj7J62uc9
         NGXxVGYZFBleqce8MkRzKFGLkkY/ZjgLra/O6ZKgs2n9OzhNPICzAmmDTrdfDSEwgPQ7
         ZEmA==
X-Forwarded-Encrypted: i=1; AL+hErHFzxleHk0e0/85gAfpisZiuXsyOviPhF2xLFNcrMzr6VUFJj7QLk8utn5ObjRsr4I2SwAZBm5TT4E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8iqGNYrnTTnMymBs1a/ZTnP7+GsS2w+/BK/F60UGu3Vl/SW6EI
	GN6HCl+qgS7bKWu88K3L3HMiEnHA960EMaU/Y7c8J3eMspjg7OSJdN7GLWTlwTqnRnw=
X-Gm-Gg: AYBFou39DV0JzgIgL+qGDrb1wQQjTZbnxNTpChM+Qu2e1wvZ/xJ+9mBMRhqPNn4vExK
	q2zftHjkPWNiwuY8ai7OE2tQjQMzoHeN09nmc58EEnHNVyNEhKyoH3kVxICUfOuBbsJ/E0Dl/kv
	PPBaqfr8YIWt1mzDtNQtMcuVdah1hUf07SbyMOk0ju8wEOLFF3JHAJKBEoTG2RhLTdrcG7L8BjV
	cci/BgrJQCfBWyparTkNt/EWTOZBXzh6bXsv2VW62rhyHxLRNh6Mhv2I2jiUyLSguEV4YHD9E+s
	flxqFqL/kHhpA20ZJ9166GzAgjyWsBtgPbvjl1eX5bKBiv583kc3YU4Zqiyi8Ns7uViP5v4YKpW
	HWeSeNC/pdvOAdekBT6YETuNDFUlgUw7ZfuG+OctFvTWij7BQ1MvRxQoY5vQdb7gHtO4SDPia0R
	aDANjjJRthaNEjUgHnm8lmFM0+121W1NK6K5xKXNBOtWoaOQzK1Ie/HOVoPB9Yyy95O7GVgWUgC
	dFXpTfE1/ufZtG9Ll3vnL8PU/0OMtt0mENHeIE0dvDRFonkEq7NsdD/U8+3xa3xyd169KfPhocd
	yoyfMQfTBtkym8U5Zfzx70CRHkfHXcycKtiV8jprpNG2YE/UtcBAqdC3jcrjUw+CLDM=
X-Received: by 2002:a05:6122:30e4:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee34a89a41mr38906e0c.13.1794510619391;
        Thu, 12 Nov 2026 11:10:19 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34d4f67csm2566e0c.1.2026.11.12.11.10.18
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:10:18 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc81984fceso32290137.0
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 11:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGb0AWqXCBIBvueRITiwpERLTRjANtN+kFQd3/O5MQNNI1fxkmQa7dzZKo1ZaOjj7U4erSNQVGQhik=@lists.linux.dev
X-Received: by 2002:a05:6102:5ccb:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d64db29605mr42432137.36.1794510618289; Thu, 12 Nov 2026
 11:10:18 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
X-Gm-Features: AclHuK-k7G9fpVKu6BhCbcWfXavvnldoQZhCl9e2eioRf49lg5T7xpzAfc2z5gM
Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:39, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
