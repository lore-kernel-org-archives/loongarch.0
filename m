Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFBF50F
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764132284; cv=none; b=amJ5zMMtUZ++mZ4CmiznrtesbgzBtINiftUOzR019uOl/mAa051BGTleT9av8JfeGYjzED5shlvyh9vJsXljwLyXyzt6fgk464V4OEWA+AOsOFlKb5Rw0digZRfrtsOA10U+Zj2apkSTCoLJlMZC3/jEHLGGKqYVp/g5VK4rUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764132284; c=relaxed/simple;
	bh=a0T1j8pUpXQk1j0e+oZr30MHSr5vmYZysQl3QZL1MAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DB5VC3+E6Knhey6A6luyvjfr350lsQSo+gDZnafRdL/n6Ya31nQLnCWhIU/lSmcXZ/2V2OgLXNF2JejPpIUf5BVJkvZ2UGpywczThbtWsZod+qhkjfxrMjU6LkgFSHJyfBMF0EziXrkkPyYwx3t33tm4UbLGfI+U95uAvFc8sxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmMX6yBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmMX6yBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BD2C113D0
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 04:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764132283;
	bh=a0T1j8pUpXQk1j0e+oZr30MHSr5vmYZysQl3QZL1MAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cmMX6yBbiYlRCwp1Biwz2FMYfgddmWzTKFueXJ8gRkT4vnNw4D31ijn7LyoS3mg9Y
	 IMun+nY/KxJPiH/8vHckb4aTsmMTcBmjQMNgLCVeRWpicM2p6Qw/mnhjSAuQA9ql52
	 RIKx9CQO22AUbTl0ZhlbBkImev6KoVCiiU0AVai/YA1Em6+14HzA9Tt0j73dRA2c1W
	 Qfs8KIhUgPrDl/nCODIg5de5Jg/6qtPMefBGD/HVf7W26UHx827Vv2i7Gm0uNHZCJ4
	 MurKAt+rhIy0ImIuXdR33KB6kO9Lj/ZfG0bkUKu7YGa2R/CEDQOS3TQ3qiOLZQR85h
	 25pCpbVYZfg2A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73875aa527so1006279766b.3
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 20:44:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXedIcVi9p1GESgssGKpR+v6uAVXlBUQcg2Nuc4JGVWmqT8VeCtqoIWzfa9SIi3ReM7E5HUS422ERs=@lists.linux.dev
X-Gm-Message-State: AOJu0YykMyJlVEOaU2CMtL94dDTHKb1h59zaEdPTQfOvJ8nGdinoIlbD
	7MuSqMTGTRmueahKdDC0ApMWpKh80K81kZVBYf7inhuS0BsMDWQvpNneUjV0PaKHaEFbNzQ2IU7
	QWwYI5VULoH8asYGWD3Mem9JkXlLgrJk=
X-Google-Smtp-Source: AGHT+IGe11TsP5qPiyggt2mgQLm7CwCcuvS0nJm7twIPi+ghs2D1cysatwE8JJ/zBfV8H5zMGZuRQfVc912QFEFUf2Q=
X-Received: by 2002:a17:906:40c4:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b76bcf5a3f0mr482738466b.0.1764132282379; Tue, 25 Nov 2025
 20:44:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126-2-v3-0-851b5a516801@linux.dev>
In-Reply-To: <20251126-2-v3-0-851b5a516801@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Nov 2025 12:44:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4=C2Fe=O=OWZVPTpSe0P6s2_vtpL7P9os5QGE7_r3s4w@mail.gmail.com>
X-Gm-Features: AWmQ_bmVbjTUZ5xFGUJNUcWufbs5i3WNAExOfsZ51ePAvuVBJr2G2YxRCSbfCFI
Message-ID: <CAAhV-H4=C2Fe=O=OWZVPTpSe0P6s2_vtpL7P9os5QGE7_r3s4w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v3)
To: George Guo <dongtai.guo@linux.dev>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Wed, Nov 26, 2025 at 10:06=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
Have you tested your code on Loongson-3A5000/3C5000?

Huacai

>
> The series consists of two patches:
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
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> Signed-off-by: George Guo <dongtai.guo@linux.dev>
> ---
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
> George Guo (2):
>       LoongArch: Add 128-bit atomic cmpxchg support
>       LoongArch: Enable 128-bit atomics cmpxchg support
>
>  arch/loongarch/Kconfig               |  2 ++
>  arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
> ---
> base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
> change-id: 20251120-2-d03862b2cf6d
>
> Best regards,
> --
> George Guo <dongtai.guo@linux.dev>
>
