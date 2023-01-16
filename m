Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41BA1878
	for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 10:08:26 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id qb7so19269597qvb.5
        for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 02:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcfbiaOtd0rIUu3J0LzMQ7r+7EcuQP5IsDRStK58JTY=;
        b=n+jaHkMipOfDQH28iCEvWuHcTrbQF1TvRC7dWeojb4QO0IcYwWextl++ZLzryxpkev
         hCAmNxlalzrl1FJgsJsJoQRBOwN8pfeIcoTvcpMGclPf4UXkuYa/3eKWzjavPKtGpSfR
         qSdRJg94JYU0s01ZFp5K73NcTaeNzNwJvn4LzT1T/ggznaI22cFrHfupopuv9h+ca92s
         RJgvWYg/nmPY+c7KAoKNEc0EvxhRfZqnqGjf1W0mJ8AxEAHhDGY2LL3B07ifB14LGz4O
         MQyTrrxmi2n351MYUI/12kHBg/eNegdL21cAJ+s+6jSsgliKu2zfYTvQL6sRFIm7YiUp
         tQTg==
X-Gm-Message-State: AFqh2kq17C3BZ3EcdBCffbGeQpjv0wFKm+k00RtYWi2J08Bc+pprJSXI
	jQx8qIjl2pR2cq1AaILmiMpO7EF1qmKJbg==
X-Google-Smtp-Source: AMrXdXtp19KNaKGtZ516Y04/DgMhd7GLYOelX2oLwIMpfdE/8V/HKX3O+YqoRPaIM996s7i5PBHBqg==
X-Received: by 2002:ad4:55d1:0:b0:534:6c0b:db6f with SMTP id bt17-20020ad455d1000000b005346c0bdb6fmr20329964qvb.5.1673863705742;
        Mon, 16 Jan 2023 02:08:25 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b006fa12a74c53sm17596115qkp.61.2023.01.16.02.08.25
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:08:25 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-4d4303c9de6so223273767b3.2
        for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 02:08:25 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4703291yba.36.1673863245804; Mon, 16
 Jan 2023 02:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7P9IcR7/jgYWMcq@osiris> <20230105095426.2163354-1-andrzej.hajda@intel.com>
In-Reply-To: <20230105095426.2163354-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 11:00:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Subject: Re: [PATCH v4] arch: rename all internal names __xchg to __arch_xchg
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
	dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 10:54 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> v4: adjusted indentation (Heiko)

>  arch/m68k/include/asm/cmpxchg.h      |  6 +++---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
