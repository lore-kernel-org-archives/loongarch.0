Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9791817FE
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871815; cv=none; b=bbtr04l3/1jriLOqGXwN/LzJRfPCoy7uSuQSXa5krOfZKS3rTlchWlDFz21SjacNVVtV7MEV2Kx7MqGILfatiX4C/mt4C/pqwsMiK2UKO1EEJUrq3WCIen/17BLvTfv82FJkrWbSFY7QL6Ju+sPJFG7txKplZfVNccEosPSRLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871815; c=relaxed/simple;
	bh=gwBQoUZfkFpqWmF1OT5Dm56gT0MNEOI3OvCtbUI1Qao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFnJtVZo/X2f0RpkYVnoX9+XouSlbibvRicCh89O8vMOKaU3+z6m/COrhkofLpUAlR/PxmIWavhI7vt42WJIHm81K7NjF6fzSlHNBwxw+JelmcmIqnMM5tyJv15WBx6JM1dYH06qkfFEmYzyl8Zgih24JQYzPYSUA8B4MgnGnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJIcWWDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJIcWWDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485CFC4CEDD
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735871815;
	bh=gwBQoUZfkFpqWmF1OT5Dm56gT0MNEOI3OvCtbUI1Qao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bJIcWWDX0+KFBWIV1ufn0F9qmExAFz3nohqJAZHxz2VS8G6ATcNyGRmsqYrP+wc6l
	 F5YA6xcuVvzPDrM4nPfCtIGJZYxqYn3JctiS3IFBFUwOGZt/iEbl/7Gi3Zopa2XbLK
	 WookzrSoXey1fO1VT9iETMd+TZeJzTCzMm+oz+BSsp0R4jRPv0J4zUZU2a8LD+W8AU
	 q/ah3IxkYS+1qGLsgEekCp440cO3vpM9oSV1i7iYN7HWyoVkc3UMqmA3n0TLUu/FPt
	 70BUKQ+Z+cANT2c0RvC2l24XwIoQMpSYaJ+PG2dTl2FQpVBlccQQwJ6q4y7KZIYZkT
	 9zghoABU1D+aw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so23749132a12.0
        for <loongarch@lists.linux.dev>; Thu, 02 Jan 2025 18:36:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE3WUaEH43/yKpYsh37ZPCC6JcQjChz05yU8Utoh+kPklITqlOxE0SZlADnjbLddHBmpGLoaEs4vo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+1TiUkhnGiocC8N3YDP1m4+iVHXlpUJirwFtr6UIDJ2Gl8SRN
	Ke9qYUU6d5ZX9EZHk++NZZe/nPlNGj02bAtH0zVIBMmmhc3Vr91VAcoolBQbMRl876Ye+Qjzrr4
	iViPnvnDMvNqzQfl4+Jkt/LSwkCI=
X-Google-Smtp-Source: AGHT+IFgpJv87t7bWJaEBP6+eD6K/j3XDBfSi3vjB9j+b1SwpY5l2na2yKRdZutYyMUrk5dZN7MT433EJmjczUtzbc0=
X-Received: by 2002:a17:907:1c98:b0:aaf:afb9:887d with SMTP id
 a640c23a62f3a-aafafb9a436mr89183566b.1.1735871813816; Thu, 02 Jan 2025
 18:36:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250102-la-misc-v1-1-8dc7db525e54@flygoat.com>
In-Reply-To: <20250102-la-misc-v1-1-8dc7db525e54@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Jan 2025 10:36:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6_08dk6-Q1MiQTjD4pdyxyeXx3Gd6rzVkSzaq0yLEGYA@mail.gmail.com>
Message-ID: <CAAhV-H6_08dk6-Q1MiQTjD4pdyxyeXx3Gd6rzVkSzaq0yLEGYA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: time: Derive max_delta from prcfg1 tmrbits
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaxun,

On Thu, Jan 2, 2025 at 10:05=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> As per arch spec, maximum timer bits is configurable and
> should not be hardcoded in any way.
>
> Use prcfg1 tmrbits to determine clockevent's max_delta
> to be conformance.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> LA32R doesn't have prcfg, maybe we should handle this
> during cpu-probe and save it in cpuinfo_loongarch,
>
> What's your opinion, Huacai?
> ---
>  arch/loongarch/include/asm/loongarch.h | 1 -
>  arch/loongarch/kernel/time.c           | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 64ad277e096edd7d77af6f37e234d68e571764a4..a3cc4f8d4c4a0b0521ef2b76c=
87fa57eca417d75 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -466,7 +466,6 @@
>
>  #define LOONGARCH_CSR_TCFG             0x41    /* Timer config */
>  #define  CSR_TCFG_VAL_SHIFT            2
> -#define         CSR_TCFG_VAL_WIDTH             48
>  #define  CSR_TCFG_VAL                  (_ULCAST_(0x3fffffffffff) << CSR_=
TCFG_VAL_SHIFT)
>  #define  CSR_TCFG_PERIOD_SHIFT         1
>  #define  CSR_TCFG_PERIOD               (_ULCAST_(0x1) << CSR_TCFG_PERIOD=
_SHIFT)
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index a07d7eff4dc5fb0f41f5fad02698ff7a84c7bc8a..bde2297f139c2d5e26894a2eb=
c1748cc6fef3146 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -126,16 +126,21 @@ void sync_counter(void)
>
>  int constant_clockevent_init(void)
>  {
> +       uint32_t tmrbits;
tmr is a strange short name, you can use timer_bits or tbits for short.

>         unsigned int cpu =3D smp_processor_id();
>  #ifdef CONFIG_PREEMPT_RT
>         unsigned long min_delta =3D 100;
>  #else
>         unsigned long min_delta =3D 1000;
>  #endif
> -       unsigned long max_delta =3D (1UL << 48) - 1;
> +       unsigned long max_delta;
>         struct clock_event_device *cd;
>         static int irq =3D 0, timer_irq_installed =3D 0;
>
> +       tmrbits =3D read_csr_prcfg1() & CSR_CONF1_TMRBITS;
> +       tmrbits =3D tmrbits >> CSR_CONF1_TMRBITS_SHIFT;
> +       max_delta =3D CLOCKSOURCE_MASK(tmrbits + 1);
I prefer to evaluate the tbits and max_delta directly when declaring them.


Huacai
> +
>         if (!timer_irq_installed) {
>                 irq =3D get_percpu_irq(INT_TI);
>                 if (irq < 0)
>
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241223-la-misc-d610d14f947e
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>
