Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFA28003A
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096299; cv=none; b=CFdcb7OI9dI9S26mfmfulq9QE5UpObHPIj5f8ds550FZRp4XrrUt4X7kZ9MOZOuZ/g+FTcOkPd1ZR6jhglRfHo7tYhybliMMpmKIwiKXxZI1sY10QuIPuM3KUjWhiNLMtgT08AnTln4UbxeqtFpjInM8jPgRmknEjKF1iANrvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096299; c=relaxed/simple;
	bh=vhZoGJmlWwglfxQe+ippHsiHTBoG3804HlrHPmseHoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRJB1OLGZXUacZ+HuWOPMtx3k/Nr2+TbSy7O4j0qnYL2ZBu4Ji07IZ0NZ23u/2rKYYEP9BOHchEff+ZfEUPRq8ERSUZlZrSw1sDC7ncVzaU4viwNwMqDQa+0EjpmRjKFPY8VGxViZiJuqtn5hqufsrfJiGXNKn70uawjX2/XdkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbzKauUu; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbzKauUu"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-455ddb90934so2457463b6e.0
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767096297; x=1767701097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Teo/ikYebykMKNwBVhqhf6+L7v7awBFHNTpV4cYqnc=;
        b=CbzKauUuXbUGnFJ/ZsvTd+dHJEO8V4/zwNM55yFMBOSspTGVIHdqFhzP/cwzbn4UOx
         wOtGGO72w/MZ983K1o0SvB4+mLULmuJLIH6BuVnoi22qwJ8WgQC2eb5WIrfMwRw7+JNI
         fzS3plqD7tHA/0iyLldZ5gBLP1YS2uCJ65Eo2Vg6fd3GO/It1dyRj28xdJmHdN3ZSw58
         TnKbfebTY2tcgv1stTVTONybJh3fCyJ+h8UCIkx1qy8zVEkVYutciH4dvzHxVtFDixuP
         envUW1NY6/LoznIXrdRBhb0F/2addKWkji5IueY6QbDsQk21kbnjCDZkwQwwJ5D9Or3n
         6xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767096297; x=1767701097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Teo/ikYebykMKNwBVhqhf6+L7v7awBFHNTpV4cYqnc=;
        b=fqxq2MPWxt3UuxWa2k169xJj1c552rNvYl2gguRDp+fZCUwpDDctERf0qgk03mnf6h
         SH+CzC+LwQ0nTl5casonrjXWC/zP0D/81zNLKHS4MxlHVwVpt7OGRjfwrLBmh7VEAeDd
         aLiA6oU8KKRhb/FHR26fEcITUviJ7LKkcV8Oeb9nFPiFiXIkMGP4t31wGLedX+C/mROp
         kmJTV/Gn8ohwniXjeF59vWtznzODVrwvLmb5NvamjO/7TEAqq9yu6ViCdKsYQVtDZiQu
         5mf9e1w0nNBJK5jr9mYN/8Xj017rXdhMVyjMqb6LyabchiiJ+AuVx/D5X5kXIE5C5huS
         U8SA==
X-Forwarded-Encrypted: i=1; AJvYcCVIcevqZ5wePje5iUroU1wCjSM3KZcSu7LXYW9wQ0s6981kvMha2xA1z9iTIpdMvz+JNym1k6SXtec=@lists.linux.dev
X-Gm-Message-State: AOJu0YyquCLT0N3WYGdR0I6j0GWzorrXtQx0tn4uIN4/XoBBZKPYRPAJ
	XkwxUYfPE38lEpY7cBsyV07GxV7VPTbNDZADj8ga8a118+F6a7ywMsQ4J98Z9Xrr+nKrTerGa4U
	llKqAQmMSGx4dI2Ec/hpQjcHWbFmXYAI=
X-Gm-Gg: AY/fxX4Q8spBoRw1RPPlAAWXIuMq/BWINTM7hYz+fZMh3dAAjoPHybMMzYKi+fsj629
	UvE5ggnwfgqpmxsyVgUpM9fAAD7Uoe1vFXNvR1cBJBvvqHpDB9TJRjaeK6oO3tu3hjYGrGdjww8
	0mu/DOMnvyHZp/y/1jyBin98gYacNYK8k5okVRFwXi/2e7udZ09O/8vrXc9yDtDWm5o3E6a9L1v
	EOtlTxzRQCDkT/TBc+Lbt/9viC9nRikyM3Sppy6je0Gb4ExaHRw7oQCEWp+I3EgTh6dblxFmHvj
	uhhGkZo=
X-Google-Smtp-Source: AGHT+IFLHO+WK6lRzKfGhUoyHYFK024k8rro2xI86AILYHR7LeQdSHHfovrBIOBVG/jsyn6guwl3pKxzgLNWH1V2egY=
X-Received: by 2002:a05:6808:5393:b0:44f:e5c8:2902 with SMTP id
 5614622812f47-457b1e84427mr13528935b6e.9.1767096296810; Tue, 30 Dec 2025
 04:04:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-1-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 30 Dec 2025 20:04:46 +0800
X-Gm-Features: AQt7F2qRP9GO1MRV9WiHU7iKmYUP15vnzFzArrD-NWmEHRkyqJGKvv3xzHwaP5U
Message-ID: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
Subject: Re: [PATCH v7 loongarch-next 0/4] LoongArch: Add 128-bit atomic
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 9:34=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
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
> 4. "LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>

Testing good, this series fixes the BPF timer issues.
For the series:
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

> ---
> Changes in v7:
> - Create patches based on loongarch-next branch(previously used master)
> - Link to v6: https://lore.kernel.org/r/20251215-2-v6-0-09a486e8df99@linu=
x.dev
>
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
>
> George Guo (4):
>   LoongArch: Add SCQ support detection
>   LoongArch: Add 128-bit atomic cmpxchg support
>   LoongArch: Use spinlock to emulate 128-bit cmpxchg
>   LoongArch: Enable 128-bit atomics cmpxchg support
>
>  arch/loongarch/Kconfig                    |  2 +
>  arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++
>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          |  2 +
>  arch/loongarch/include/asm/loongarch.h    |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  2 +
>  arch/loongarch/kernel/proc.c              |  1 +
>  7 files changed, 75 insertions(+)
>
> --
> 2.49.0
>
