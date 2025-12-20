Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025DC23EAAE
	for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238090; cv=none; b=dHtZkhqsHzA2home9WpmBguLI2rQREFV7x0j8YC4t7TfM0jsymfRFQUXywHOmQQmutK1QAlDX0dXQu7hFEbx/Ad7fv3ey3AcZjoOB+Z2hj5fMRe3MLtopXqsD3Nt9VchziokqKhso+ijbFd/MPQPuHJHmE/ByCTSbWc4DYPHf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238090; c=relaxed/simple;
	bh=9E0fdsBH/jk/gXSHvnWTk3FZqGpwLL5cYfAaniHLdME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWnidy9ZGXfEPbF7QlEihpaagXhJBb+Z5CaLhDzg5AUlSfcYuppSAoqYdFFXNdAncf3Fk3tTez9oreNKWkmSyM72BCm9HG6VKlboXSMDga75mMZSPyytGUmvirrAORChl/pU/h7x41ahdXcNOGWgfvHKy0F2gsvgGw9oSOUx0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl5xE8i7; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl5xE8i7"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45330fe6e1bso1703135b6e.2
        for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 05:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766238088; x=1766842888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0xYR+0fSPrq9kQPLIVZXvhAfzal7hI1v8ze7DDqKX4=;
        b=nl5xE8i7l0whQ4wUQUjRCq+0AbrJdgMJSfoszot2evgYnZhlnWVsTMep/Q2dVOCLxl
         8JD5OOCAGLAN3AxYndVfVyjazy5Y2UyOmQOWwyeXm1orD7Fjek7M7JGwx69jKP7X9/8h
         jSGLA5x68m3Zv17EXZmS63r9gtZ1ZEMtBwuTYRUeDKyv00UBCNynkCnDVrve2vM/NxLF
         cZwLKKQq08MbVX5qkppuxXzOlpUlwdQrfZyjXDXS+ScCSBBEMW306/N59cJUZw9SNItM
         cVhHcX3blSRDK8wLbz600xU2G8KSNkxSiJl7vKGMJZs5FKD3OhoEjq71wEQIr8CFsegN
         zbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766238088; x=1766842888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0xYR+0fSPrq9kQPLIVZXvhAfzal7hI1v8ze7DDqKX4=;
        b=Gk+V49+FG5ntxXpN74BkC5qK1lA0S+KCQSE89yw/il3Fo0ig4t/cOk85jgMTsMyIIc
         wQWi/sPBngXejpQOklatfxLGFwOhUiV/lqs4itXtz1dGEHmfgQmcgHj2pQOMf0niaRVy
         D3mPKjiLSyAgSSlGsdZ0b1ksadHoqHF366KUPeFniwd+LoOzlZk4ZDBgplgquU0PLCpr
         IEVbvB59VDBv/mtonVqMygf64RJgnCzsb6RDT6brmYA8Ph5szT5ROmRAm8sqa2sRCigp
         TaKWnsTPBk2TgNFXmSDyH1s9zjcaZwG0r3Wh0mP85PzMwC2ENBdcqEOmk6XS4h69Isna
         NdGA==
X-Forwarded-Encrypted: i=1; AJvYcCULjiXKjRyH/+8OuHkYoa0EfrnOqk1yoU8OGFoev63UlNEV2gTVsj8yc1I+i9SUwMUwDrI/3aiPujw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEmcKqBaYhjtMvi2rS0WGO5VPqwqqBEqh3nzSKYQIv2pR8vu8p
	0BX5MvHBE843CF0UqojM0JuwLt3V7BkeNblOlpUHHoUiS2Q/1YYW8GYM/0IAWBBxCXHYw6feekF
	0xl84hO0pCp2olVCHBUm3B8rzp/XhDm8=
X-Gm-Gg: AY/fxX71dKXTH73NY1xEU0YdMfH+IlfkpB1uwi9AT+/3iskX7Bs+lm2ZPpWN1wf6wVC
	nCcuoXyw5GDh5BfpkdzJRQLVCT0iGtoZlDXuF4WggKXnRpYAgFTL9xqHq8/o4sKsBgdfkZB9Ffc
	Y87Ge2ioBdYYp663xrgzgsi6V/MeeyP5emgLzdXuP9eAhhARVzIdh4FQDYiciCQvdg5JXNTRFw/
	kNiG+lANSWNMoKmjboczDVBpKQ1Lbf1j2vQxd3jPlMjDNL2uChSGgmgrhliDGVukr4IoZpetA26
	YKLrqg==
X-Google-Smtp-Source: AGHT+IHSsZqogUHLn1n1Lybpbm/1iGXs+aT4as4fQDFEOzyXJBRvVuQpRI5qt8alGtCUgdpBrNpJonCgmTuqKLHveAE=
X-Received: by 2002:a05:6808:5391:b0:455:d5b1:1f94 with SMTP id
 5614622812f47-457b1eef50dmr2437497b6e.29.1766238087569; Sat, 20 Dec 2025
 05:41:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215-2-v6-0-c3ceeb281916@linux.dev>
In-Reply-To: <20251215-2-v6-0-c3ceeb281916@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sat, 20 Dec 2025 21:41:16 +0800
X-Gm-Features: AQt7F2p955VjQ2rV8nGYJkdOdh8ud4vsStQxgGhmkHyKGSDabLc3eS7xGDW4LxQ
Message-ID: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
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

This series can not apply cleanly on top of loongarch-next branch, so
I haven't tested it.

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
