Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CB51C84D0
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174946; cv=none; b=NI/bH31dXtZZnuLPTlDxDprS7Iz+hafUw15aX0vKkt12geaWG3vGpYaNW2a7GaLkvLJjJkm29Qc0RD5lLRgV+HqJfY6B1ysDjZNx51PJvdwwiD5xQMjvSjBl78185W38LNU2JW90jHS8EyLsRBNMctqov/wgtGgyuZlElzfZP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174946; c=relaxed/simple;
	bh=U8pRaWuDClfDkRPXfSisSfcHdN6dCJ/A41uH5GBl544=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enReuPdKID6Gw7ImApKMdVrsEjBRa0ztniP/ZAX5xOl3pe7zbT58KmeMgkFHEhy2rgC3pa6OLzI6vZi37R0qeBg/f/AwJny3qQnBmOScwYvUvOTY2Wfmde33j9w7jSwRsT0qLpfETsbShloA5cgBH1abkqwwI00UsugpoovmxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohB3Ti2T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohB3Ti2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EB2C19425
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767174946;
	bh=U8pRaWuDClfDkRPXfSisSfcHdN6dCJ/A41uH5GBl544=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohB3Ti2TO4shDOA7MhbsWoCvDbqQ36gJdNguLRKbR4UvsauN/eY+Wb+9lDR/+o1SG
	 bfuqoqhd5vFbL53W/fRD8t8GJS4TbeB9TENX6Y4uvwN1z9bfPiDnfNaGIo9tdD4WYd
	 3ZegbB3vOCJXW4XCmeUTuz6zo4d6ZsCeoESIeyVz+pcLOi/FAN8cQIitE5F1As4LY6
	 Aq3CJhhptYbKHfrdkTgsXBeXFOh8SZGy9i2njnvy31+yvoYQcwGpwUu4FgJbx9ipVS
	 WBf2m9JV397Qx3nRYaPFDHa+LtikpCq4nDP5tE6OBS3W6aPN3Ftf2xtAf0r6ABW0u1
	 RA89mDhuWjFOg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7eff205947so1524486666b.1
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwB+HJOIyj45uXHLHcDjI2JmwCwuzRxFQwNtaVCc/yKrxc7qKDYUjSEWTIP/veH7uJvyaPOvfoZXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJnDygTdo+57PjuJdtYsOpY9GYnJnjPLb812Z+EpLuUgDdJqw4
	4oBLtEpXPfBzyNbrjfGgErFRdB+co9o8R8I8D2o+S5OPDlkiheytYwS6qOY+HVc1djr2Z4g8j00
	fEtNaODTJxhR6WFt6+ZHAqYcFELh85Dg=
X-Google-Smtp-Source: AGHT+IEPAl6cq0a7EB5PFUs/O4xTdBWsWghu79A6GXQ3tPMk+jtbtR4nJaOBN9Fhg17Jh15rofx70eV8HGbZU4L6fYQ=
X-Received: by 2002:a17:907:6e9f:b0:b73:8cea:62b3 with SMTP id
 a640c23a62f3a-b803704ffd7mr3609393866b.41.1767174944883; Wed, 31 Dec 2025
 01:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 31 Dec 2025 17:56:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4UjnewKEo6ZqC5H-kxna8wF2s2vowGzcWZWLiFEu-vZQ@mail.gmail.com>
X-Gm-Features: AQt7F2odl_kCuENWIQ8xaZEV1q6rGomMVoCDXfndTdXxq3jwtI7uN9LIU9joOM4
Message-ID: <CAAhV-H4UjnewKEo6ZqC5H-kxna8wF2s2vowGzcWZWLiFEu-vZQ@mail.gmail.com>
Subject: Re: [PATCH v8 loongarch-next 0/3] LoongArch: Add 128-bit atomic
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: hengqi.chen@gmail.com, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Wed, Dec 31, 2025 at 11:45=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
>
> The series consists of three patches:
>
> 1. "LoongArch: Add SCQ support detection"
>     - Check CPUCFG2_SCQ bit to determin if the CPU supports
>     SCQ instrction.
>
> 2. "LoongArch: Add 128-bit atomic cmpxchg support"
>    - Implements 128-bit atomic compare-and-exchange using LoongArch's
>      LL.D/SC.Q instructions
>    - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
>      the SCQ instruction on 3A5000), use a spinlock to emulate
>      the atomic operation.
>    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
>      kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
>      leading to -ENOMEM errors during scheduler initialization
>
> 3. LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> ---
> Changes in v8:
> - Merge patch 2 and patch 3 into one patch
> - Put HAVE_CMPXCHG_DOUBLE in order
> - Link to v7: https://lore.kernel.org/all/20251230013417.37393-1-dongtai.=
guo@linux.dev/
I don't know why you make all versions in a single thread, and the
version numbers of cover letters are always wrong.

For the code itself:
1. You said you have set hwcaps, but you completely ignore
arch/loongarch/include/uapi/asm/hwcap.h, I don't know why.
2. You can simply do
 #define system_has_cmpxchg128()  (cpu_has_scq)
and don't need to define __cmpxchg128_locked(), which is the same as
X86 and RISC-V.


Huacai

>
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
> George Guo (3):
>   LoongArch: Add SCQ support detection
>   LoongArch: Add 128-bit atomic cmpxchg support
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
