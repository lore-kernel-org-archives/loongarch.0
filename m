Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D74261B92
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 04:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339717; cv=none; b=i2RWlWI3rQEfiNchRDv6KODe2xz7wUuu3/GT5LTt+kOBPeIWjJ9rGhHjNqkrLxvYvwARSJofcTfOPCox4cwAfOKLwYlDEgk3fn9DvR9u5Lnxytoh0Yr1HTt49X0Tv8nzNf+eICFofUQko5vJwRsePANwGgDxF86BhwgdIsnPhpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339717; c=relaxed/simple;
	bh=tX5z20+Pu7QT1iBU1ERZjpz6acgU74eJVG7M/6qH2zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKte4XaKiXNCCDzDo7ZXWxQxCJeP4TYT7YmDqQVQ8FfD6Pj41LJIIiLrqs72oYu5O3a5yBwp/WTXjuUkRJvodP2sMp6j4xurXp3ijsUNjUYVfKEKfIRHfgBRCujPHbaCgtoIfTlFYpperRJP+viWyicY35H8UAU3pb6uviFqY0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcRQLFtU; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcRQLFtU"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4511744b411so3791366b6e.3
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 20:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339715; x=1765944515; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62+5xIePLz8RKkYJPxzO4xIDyBuycZ/EtL2O6QPdtuE=;
        b=gcRQLFtUqpjyllr5GT9zxM4Vxr6+/QhEa1HNU0YCAf6GSMZK+5j3wC0QabNRoXpe3W
         cCQY0TBbNn6EW+sMvJ/rQRCqqFsE+oFnyUh3+Fep+y/LDCkoQ/OkOWOFUSTbIVsblcjI
         NXKjJA2SPw3icRJm7dvEeZH4oTdGJ4wbEDTBkGc3mZh5i+dufceFkpnOcYmGV5EO/fry
         EtHr9WccKwhkVcnxIe3n3km/Kb4uBv7epMOgZJyJpPGZvvK1YkRxx+CrMk+fgnIqiPIa
         AF5GiVfzVjY4kXDYtqUH+Q0VMvol/UCHlQBYSFKkYxO0VxhthLFOsSFbksQqiYXw8/mf
         t19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339715; x=1765944515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62+5xIePLz8RKkYJPxzO4xIDyBuycZ/EtL2O6QPdtuE=;
        b=eU2cY6lHvl6Gx7FZX/oU3o60rOOqZNXbdXA1WeJJ4Ggh6DaZOvGrroxRRi/PatSuF4
         0f9pD6SV1zZLFsXJYU1A2gI5iy/cWW2EvHQijrOhxMODiay9Qb8F1i7X7hMDKdDzgTxN
         vfR04chv25Vq+leyxZ1tdIxoHhMjsxDUdhggCuJtgOWfxdseoD6GWru8GfvK4j+sMRQs
         q2hFy3fawl94/mDMJUavuhaz8rRfeoVLk3W7YIzWDVGe/vI3o8QcCsJlF/8yZ0hH49ZM
         5SD04D2+PNJnm5ZQs3vIv6Le3Ynkj+T7dgiNpC3PrI+7eYsMUJy4Z1cp5mqU1mTpOuDH
         gc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdMIK2mlHOYtIAQst+0E33h8P9ODVROoEdDtx+NMG8qSdSZyOMT8WlTIyBBlxAfY52rAJIYHLM4To=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaQpyTuAIgGzybtcANR699jt+BqSb52MoevzCIIQeqYGN+X8is
	436gd9SIWJW+5GrcuFLMQ/CW44au88FyJaWwSl1DUgiNoM/Is3JmAUg/vcSbxBGQMYddgbfBVwU
	IRIChEPAZybB0EI3bHluEt2O4V17MHpA=
X-Gm-Gg: ASbGncsrJjQQL9HNnR1tkB49d5KojJsLIWlzfOlGWlrVsMYXrnju8nxb69cFOvbOdwH
	gcp+1Hs4Wp53PbGIb0hqS0RTmaMkAuQhF3VyuUUs4hdziAyKkRf6OquaSr+aCGYrIdO//zl309O
	6945FwNfHLtLT3MT05wGvajjnqmgAoDoX/93Sy4IjQULpvbUzD7Wlb7bLMaoZ3R4g7DZn2YuFow
	fy1Y+/LyveiLp3rFXxKO5l/SO9JDjWb0NCWzJCVouthwt2CtQx1VPVHFyUXWAu82/bcKi8=
X-Google-Smtp-Source: AGHT+IFFOlecdiJ9JfRMwXuTnpP5utAc4SMsLqEKEuRAjAMeTpYU2OmESh8FjhEehZdmJ4OMcTwliGBCPKlZuMIRKMI=
X-Received: by 2002:a05:6808:19a1:b0:44f:e471:b52e with SMTP id
 5614622812f47-45586388377mr890970b6e.11.1765339715290; Tue, 09 Dec 2025
 20:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205-2-v4-0-e5ab932cf219@linux.dev>
In-Reply-To: <20251205-2-v4-0-e5ab932cf219@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 10 Dec 2025 12:08:24 +0800
X-Gm-Features: AQt7F2rHEDGaKdhW8gH9fBGovjggFx01APzY5rk8g4i7SRDXSqipgaokxj5o2hY
Message-ID: <CAEyhmHS_HudrG57i1Y9vVoyEbmMipYnkKnq+RraS_F5LHAVrJg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v4)
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>, 
	Yangyang Lian <lianyangyang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 2:29=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
>
> The series consists of four patches:
>
> 1. "LoongArch: Add 128-bit atomic cmpxchg support"
>    - Implements 128-bit atomic compare-and-exchange using LoongArch's
>      LL.D/SC.Q instructions
>    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
>      kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
>      leading to -ENOMEM errors during scheduler initialization
>
> 2. "LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
> 3. "LoongArch: Add SCQ support detection"
>     - Check CPUCFG2_SCQ bit to determin if the CPU supports
>     SCQ instrction.

The scq detection should be the first patch.

> 4. "LoongArch: Use spinlock to emulate 128-bit cmpxchg"
>    - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
>      the SCQ instruction on 3A5000), provide a fallback implementation
>      of __cmpxchg128 using a spinlock to emulate the atomic operation.
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> Signed-off-by: George Guo <dongtai.guo@linux.dev>
> ---
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
> George Guo (3):
>       LoongArch: Add 128-bit atomic cmpxchg support
>       LoongArch: Use spinlock to emulate 128-bit cmpxchg
>       LoongArch: Enable 128-bit atomics cmpxchg support
>
> george (1):
>       LoongArch: Add SCQ support detection
>
>  arch/loongarch/Kconfig                    |  2 +
>  arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++++=
++++++
>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          |  2 +
>  arch/loongarch/include/asm/loongarch.h    |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  4 ++
>  6 files changed, 76 insertions(+)
> ---
> base-commit: 2061f18ad76ecaddf8ed17df81b8611ea88dbddd
> change-id: 20251120-2-d03862b2cf6d
>
> Best regards,
> --
> George Guo <dongtai.guo@linux.dev>
>
>
