Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDAE5CBB
	for <loongarch@lists.linux.dev>; Thu, 22 Dec 2022 14:12:34 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id s9so1397979qtx.6
        for <loongarch@lists.linux.dev>; Thu, 22 Dec 2022 06:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaSeJ7b4XoTWS2Tt6rTxmu6n/STTyq8+F8PwIAXlFPg=;
        b=uwbVJ4x2uUggm008u93RPl03qVrXuamSV7qvxyJA+O1g9RATWpRUzcqRkEF9Cd8Na0
         XdW5tc3ii9/p0yhL6/Pkktnxl7COUsRFnjpzPMB0CC9smaF4bIohrKXp7ajKxqbOQgCd
         0j2qg2rQxZ34exJmfh8XpqFz13FSk02sjFE5WD+1mOmX2iWhUn44Zesxbjx7369Q9S2M
         6CUg5q95GS20r1YHx2cyD369MrLkadEJ7sELM6ysG9UOXgmf/e1y+LD+Mpk88rkrIQBU
         P1qrxvOXkUKid6shLc6PhdlzBY/wPc26oddMCGn3A4aRpY1lyf63K7AohavHwmOfQPBz
         6lgg==
X-Gm-Message-State: AFqh2krwCgNgIOkgLwmeUKqRE530EN/y8MqTDQnvR89/ap80NfUX3Xb7
	h1iYthEjo6z3Wd4YK0/eaPs57bV7K2cE3w==
X-Google-Smtp-Source: AMrXdXu93XRAzWaiWPWIeUbUvUO7fiODfKmmeu41y/dsNHybVaG+T5p3eYman+I7kHDcjCneuVRu0Q==
X-Received: by 2002:ac8:6e87:0:b0:3a8:11f3:b81c with SMTP id c7-20020ac86e87000000b003a811f3b81cmr7095003qtv.53.1671718353145;
        Thu, 22 Dec 2022 06:12:33 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id w18-20020ac86b12000000b003a6934255dasm401288qts.46.2022.12.22.06.12.31
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 06:12:31 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id v126so2094157ybv.2
        for <loongarch@lists.linux.dev>; Thu, 22 Dec 2022 06:12:31 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr417369ybg.365.1671718351056; Thu, 22
 Dec 2022 06:12:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Dec 2022 15:12:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrzej,

Thanks for your series!

On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.
> I am not sure who is good person to review/ack such patches,
> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
>
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
>
> 1. Code readability/simplification/number of lines:
>
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);

Upon closer look, shouldn't that be

    previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);

?

> For sure the code is more compact, and IMHO more readable.
>
> 2. Presence of similar helpers in other somehow related languages/libs:
>
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
>
> If the idea is OK there are still 2 qestions to answer:
>
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

Before I realized the missing "&", I wondered how this is different
from swap(), so naming is important.
https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
