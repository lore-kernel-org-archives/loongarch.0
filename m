Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F130C62F
	for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238973; cv=none; b=Dx7cSZ+H82A4LIZQ29iG5MAIcnD9Jol5m0xUhzOuvlvbOn6CH2iMnl8QWrBBb3I9laU8eR3qPzvBuqZ0mKLzkL0iBPxjsLGfGDZ8jyRxa8HNjli3YyUntzKKh+CllCfsL14wRHaY5xM1xI5fsghOZceKxreJu//a0+K1jrwOk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238973; c=relaxed/simple;
	bh=zYvFL6LqtudmwcVIj3B156+jlIjbWM1A+nL9BTwsx3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gj58uZQoQmXg+xeO/3bJT+dlqwrPWUxBLpKlSBdEt9hN5ZtftyyZH3thQiqeyacpIJbRL+rVDrHdNqXmDj/2I0uiK7aVDbVtwCOZ0eBhE6p4288/5bSCWY9k+8damTXrWsnF0Okhw3oiqvgYjPMC5Yc/rRo/AuAwDPHOjM5DqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btJ++n2o; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btJ++n2o"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-65d1a094185so514394eaf.1
        for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766238968; x=1766843768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUGAPPbEZVI/WOqnLeKGl/PLNS6xlNAVWjy9kMt0HwI=;
        b=btJ++n2oMWQBBNBPMzSyPzOX5uYKCXJRygBrKEN2G65egPW7Q6uOJy6h94tv4fIcoN
         vQveIMmNnAG4xzGgvqVDbf/+vFeNkEPG03wMzXGQqmHxeOjGc5PDj12Su5z6Xg5gm8+P
         vyQJ4Nr5LFW4SlHQPur4dKvMHvKtbf6z+fii5xTikxvF3yVwiwkQvj6vhA9+Dhtr/gsx
         9+hbNyrQ6MIIyg/mnlzba/6utA5A0Kr6ZC9VlMthNOeclL8q3i3cKSmkzB7bkmJIzE2X
         uy8ogIOcqfQCTnsnf7hkc7L/P5s/mtAVsKAGPU5r6UXRxXIaF8tGTze5fxo0LKvcGmil
         GzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766238968; x=1766843768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUGAPPbEZVI/WOqnLeKGl/PLNS6xlNAVWjy9kMt0HwI=;
        b=d4u5LN7w1EvfEp3uuIR0nufSvJ1DB72qIwtetxRoCfEKYlyHFGgpq8QuUPYh8UffZU
         TkrCt3UGpG7xMSWY5bisB5JDrk5aM0eT0FFgr91ta12AoIH8olAcwlrxOWFVWpQRsQT7
         jmWTIJkdyQJJSDx2IwXfskfFHKrVpomCbBWuP9aSi8n1SxFSDQYwnKyNTMpY/KaH8KgM
         g4LvvzeVbwCY9dL7QA/CTVL/PSg76eOHj4u4BSPvEyFIFOeS5kNoV+vYNx/QaEp0pGhm
         ExWkBas6Eal+magdi1B0BIww2SZ4kj54e8E6PLn608SNoo3+9SLSXLiWA8Z1zaRIilWt
         J90w==
X-Forwarded-Encrypted: i=1; AJvYcCVwNCC+QtmdfhFTBWCUnBd5B/OiCju8usPECYHBZjjaQKb7IhdNI9FNRr5mX8pfHgfETVBPdXyTNDs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKkOV0hxk3v9V2f1Y/wWkHKRNIKqFwebB2UL0SMs5oU7z3adie
	4tq8yH650V2QJ6cvILOnFGQ2CGYGNxzdPz/7p7k2m5blnI4th2vMYhw3HXrU2trZGqvLKRkQiOg
	BtIRvPXI6jgMTOQOsgi/OXRsRJMZ4+fA=
X-Gm-Gg: AY/fxX4SUXbbHuSGKfUqdHAqionH6OUPsQCDdlZeteRPji7fZ+O6zfooaI1oNLkre32
	Ctemh76Rbgi7VN8lYdq54psnvYSIG9sRjgy6kZ3Ah5P29QpmaLV8woDSkyc6SsG8hIBrC4TOQ/y
	/Kr3TNk6Mrb7w72CVL56XaXP6tejytQzRE8BuAXbQIqzpp9OUbajzk+xo/nAJlapTQtSWn8n7Xx
	W2yx+SJ0fp41INVLTn9VnAXp7f8WlyRWhYUCnt94rgKgtw0qsAF8ClrvuQdAxmB2rBZSIn3WgTC
	d7AlEQ==
X-Google-Smtp-Source: AGHT+IG/yo2gmQze8EfniySFGsbwm4bj6Ko/mS2kcgsJLLdQNnzzj5Zlg6OMnxvxp01PABAO61g51epD7RLNRbUvqfg=
X-Received: by 2002:a05:6820:1c9f:b0:65d:1697:e6cc with SMTP id
 006d021491bc7-65d1697e82emr1523715eaf.60.1766238968167; Sat, 20 Dec 2025
 05:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215-2-v6-0-c3ceeb281916@linux.dev>
In-Reply-To: <20251215-2-v6-0-c3ceeb281916@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sat, 20 Dec 2025 21:55:57 +0800
X-Gm-Features: AQt7F2rtq7NQmwnffZ7KoUbgux1waF2Ne4vfSnObfI3Uv3yjHP0_V2XgsRrV0RI
Message-ID: <CAEyhmHSaCXqUka+a85eVfWHxuc6ThveQL-tjS5uhB2EvmXmMgg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v5)
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, r@hev.cc, 
	xry111@xry111.site, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 4:11=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
>
> The series consists of four patches:
>
> 1. "LoongArch: Add SCQ support detection"
>     - Check CPUCFG2_SCQ bit to determin if the CPU supports
>     SCQ instrction.
>
> 2. "LoongArch: Add 128-bit atomic cmpxchg support"
>    - Implements 128-bit atomic compare-and-exchange using LoongArch's
>      LL.D/SC.Q instructions
>    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
>      kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
>      leading to -ENOMEM errors during scheduler initialization
>
> 3. "LoongArch: Use spinlock to emulate 128-bit cmpxchg"
>    - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
>      the SCQ instruction on 3A5000), provide a fallback implementation
>      of __cmpxchg128 using a spinlock to emulate the atomic operation.
>

Probably, you can combine patch 2 and patch 3 into a single patch.

> 4. "LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> Signed-off-by: George Guo <dongtai.guo@linux.dev>
> ---
> Changes in v6:
> - Put SCQ information in hwcap
> - Link to v5: https://lore.kernel.org/r/20251212-2-v5-0-704b3af55f7d@linu=
x.dev
>
> Changes in v5:
> - Reordered the patches
> - Link to v4: https://lore.kernel.org/r/20251205-2-v4-0-e5ab932cf219@linu=
x.dev
>
> Changes in v4:
> - Add SCQ support detection
> - Add spinlock to emulate 128-bit cmpxchg
> - Link to v3: https://lore.kernel.org/r/20251126-2-v3-0-851b5a516801@linu=
x.dev
>
> Changes in v3:
> - dbar 0 -> __WEAK_LLSC_MB
> - =3DZB" (__ptr[0]) -> "r" (__ptr)
> - Link to v2: https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linu=
x.dev
>
> Changes in v2:
> - Use a normal ld.d for the high word instead of ll.d to avoid race
>   condition
> - Insert a dbar between ll.d and ld.d to prevent reordering
> - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to __cmpxchg128_asm(=
ptr, o, n)
> - Fix address operand constraints after testing different approaches:
>   * ld.d with "m"
>   * ll.d with "ZC",
>   * sc.q with "ZB"(alternative constraints caused issues:
>    - "r"  caused system hang
>    - "ZC" caused compiler error:
>      {standard input}: Assembler messages:
>      {standard input}:10037: Fatal error: Immediate overflow.
>      format: u0:0 )
> - Link to v1: https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linu=
x.dev
>
> ---
> George Guo (4):
>       LoongArch: Add SCQ support detection
>       LoongArch: Add 128-bit atomic cmpxchg support
>       LoongArch: Use spinlock to emulate 128-bit cmpxchg
>       LoongArch: Enable 128-bit atomics cmpxchg support
>
>  arch/loongarch/Kconfig                    |  2 +
>  arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++++=
++++++
>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          |  2 +
>  arch/loongarch/include/asm/loongarch.h    |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  2 +
>  arch/loongarch/kernel/proc.c              |  1 +
>  7 files changed, 75 insertions(+)
> ---
> base-commit: 612df905d7404450696e979c806ba4cdef8684f4
> change-id: 20251120-2-d03862b2cf6d
>
> Best regards,
> --
> George Guo <dongtai.guo@linux.dev>
>
