Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787FA3A9DAB
	for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339033; cv=none; b=SSHkLVkdfS0PwcEM/ZgtAcKJ2WwG+4CsJG0dFpSUfOLgUgYXHXIibm2yNbbkBXIybCDuullp41RwJpavKvqfxSybZIP+rpd4DSTSC9hTOGSvSFYdxwjDIzhLinMaCkalKjYgaihT3hVN4QvT430T4pLGilgvZS1gavVcqZZbYKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339033; c=relaxed/simple;
	bh=5RcGmn3E6IkK/4PLTUVN24XJ2jAiV11BodM4t9S5uGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jvv3uCh34zTOd733T+2zS+uCS8lAtMYl/gjOcNEFnyMvqAF+5g8v0Hc/khs7jwLKLipHgigOvBgWqCpJJ3+sw6VUMmm0B/9DYHVQHHHTUX5SIrgsXZZQrCuurA1P4L02n/hfixY4pMHxeMr/JlD0O5yakUR8DuTT873omsJaGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50baafd6c4aso80993271cf.1
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339030; x=1776943830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=Zzes3bEevIRRmrlOvx2KxgwZiSby6T2QmKPsMypMSXXQ6fO+oYb3FsU0+uIWnsKS2v
         xcf7jqZE8ZmwGNtj2GhRj4CtxikLUQtOukifofPQL9Q5e87s8DwvYMb2GpWluEPZTkVa
         EJIGFlapjvX9vMj4UHk6FpRzdmWeHZOxQicO37Md/01cEL88jGhilRaamHMLO/BmsxC3
         zXPekleXAFXfKXye6ZZARkaj33ov0E8pJX8StoDsgdkifetg7EAC5QrRFvJBbhB8qcpO
         s3J06SnNgKm50MDMPRk2nvkYeFdu/MHF+IeiLHJQZ9oKmwiC74NCtdYV2xQocTziXC1G
         YAYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8meLOkqEoLX728YpmImKwbr2nITMtYAArdP4TRkK9yipXHa29dnQExOC9sL0uV+2JFviFwPIYGsdI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx30bAct5WYyO+6oQjwVpkiEgkjq45q4vNIyIhT635Syy2fli2A
	c9LvduERsGQ7NRL5Adk0egC7XR+zToo95ISoKRSbHXTdVbN+CZBAMcGePjHTj1gE
X-Gm-Gg: AeBDiet6NEqpDkCPfyTU+qUmppUhmzpOmY0/Z343C8jWKSk4UeVMgVH8HUCkxm0IjBJ
	sX5q+IuHcPhjDTpEn3pqTQSP66IQimciqnWbtiqmf05CfmCBKzewevMj4nSs8ePnAf9B1E0ULw6
	zJu/kNLKEHHga5cAHPXui+O3qzrtqgsRwobr1UEHLZSCdpz1XxgiTlM5aazC1osYYao9F+0Y7Eo
	dHAHkny6fo6xQeyag3CRdBQVIBM0jHkx2Fz96rfQsADO8R0w21ZzSoQwHx87xzmxEy+OlMYj1gB
	sDFhjudaz27cS0pONq2lDCdfuJVKp2DW15rQZAffJFeah6Asl7ysp4iIj6ymWVbYiR7bhUH7M+y
	zciPo/3nvpnNn7/A+l3pmN7ZEgxn+Fy2xyCItWGGQ5U6UM7yB0ZzSJ+UAi8zMUV/p1oNz5PDnPU
	cMoE6lzJ1LbzJAkZfiJenWJA3L/Ihu7+7m1Ll60/fiixzQvl0eWWPCwCdBZfkNeSjzOqWU+Qi1F
	E0=
X-Received: by 2002:a05:622a:2295:b0:50d:a71d:810d with SMTP id d75a77b69052e-50dd5bb12c1mr357779861cf.28.1776339030304;
        Thu, 16 Apr 2026 04:30:30 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1ad95796sm36679321cf.5.2026.04.16.04.30.30
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:30:30 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d87610513so76679491cf.3
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:30:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZrxYsm+19OGcYdbdbB3265HmHM63YsCeiODxbolQWUCIOJvSbSwteiMjipHKQ+EKMuavb/BJuyVE=@lists.linux.dev
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
