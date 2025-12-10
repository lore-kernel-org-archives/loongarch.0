Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAE2DA743
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339675; cv=none; b=XOKg6XVZD++ts2sFPsBka+6Ga0817FNkaZxWc+T82ZB3sKUWeJ9zaRBovbzrwtdt/xwc6Btg3yqwMNWOmBVkwjlZAV4I2251fAllWB9aK1/eSB1zgHsiu0VHrqdjNYqRUMbLtMUqT3BowTN0KTaZ0dDxD0ztlHVGj33GxQN6Xo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339675; c=relaxed/simple;
	bh=sKpZtmxRMzuvdfxUYVLEklo5rDZFXOwaN0pmfNcENPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djKgir2srbfMXZ9rg71dH3F8Pn9IQmxAauwuWC3S4UQl1/S/odL0GDRYiVAzUeIpMuDbcdLiBYWG1t063I71WNRKFkbiVW0MUXKXYOy3dIVT71DZpplsXiZLQMXj4XMHqWvZFqjwlLjuRXLpeeF/E41EZ9V2PdPvyRtWyjGRzA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Rh72yr; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Rh72yr"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3f0ec55ce57so3894799fac.2
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 20:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339672; x=1765944472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS4YiwXwP4xsawFMrY/jomjKOPBU77JtjVj+RfcDELs=;
        b=P4Rh72yrplodQDnyhCGXCo0e3f0rIGm9ewl2Lnr/yuZGC9ZQNMfvbDBqa7SWL12yQA
         S4GzzeOlU97IKsezjWgQ6Mn8R9ZelRzwaXH3EptXwwE65HeNVWbyXPP/6K398wwCaU0x
         8Xhhdz2HVSLtiLdo2Iv0Hvuehcq+QNFdrkwKvoz4OkA+ladF+s3N1aSfQnVioWCKa1LP
         qQNDdNaHhetQw3GVLSVTvH8g7AnYWAOcs4JrFTXCFiH5GtEtr5xY9KSjVgeczUqu3C8B
         SDdbnw1zw3Mq5xCKpIXgfT2eXqrTVrvPknCd6hrgj82pQigG11o5DFEm6VbDLRdriMSC
         Wqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339672; x=1765944472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tS4YiwXwP4xsawFMrY/jomjKOPBU77JtjVj+RfcDELs=;
        b=RvTKaMJ0cDwqFBIdkw0gLhHPNkMwwTJPIi+lXdNj2g0MWkH/bX5CIXVsaTkyMOGaws
         d+nkBFNcegpjC8GFfirEyoKKCgTi1Bkxz6kInsSz7cL4GpSdKNj9TjGcWxrmHvTEqEbn
         lEjnuaQyDzd8XXG1YRRDc5LKlSREO6Q9zpfP1txKNEMJezMk9cUv5gUUB1hgKltZbIe3
         W7MPVla8BY3EHSVJnCKXZaTyiB1gqqz3RGNLbfCixhRbd0sqbh72BLz3jbtAJR+ucAr3
         LiV5Igv40ZuE+jfWw7Ijc5PuciY6VYzKsKzDAhCQvypRfMNgtuS39X8ZDHE7eG6uEsd9
         7j4A==
X-Forwarded-Encrypted: i=1; AJvYcCVkAH89XtoAhOz6TGst8A8uCqzoQconCabNUJasBJnpF9GX0bu6tS3M4/N2jtMJuUNQBoGYXk8LjL0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9+EgjXy5LtgulOmJx1eNzdvi6g6MI31Rk758qn9haGtew8Wlq
	E8C5KkNvdy9Xn3YeBwTqF2TilRwqId/h9H7eyPOAfqSF66Fr6Sy1/CB9fTfovUiNvCE+39y/bCd
	ausUWdoDX4njiw1l/mOQNszJUnrfB/+A=
X-Gm-Gg: AY/fxX7wfILUc2j2J67lFtOFDkZ9HfdK+ZGeIiT04HCudS4ruTSI/6keA2Id5YWswCt
	G8kQOCUXF9G7RffUIAtYl3xLenys9NXaPtuMPwZ7WPOaSHHBd2sgEzCFS+DJ0pYIxHVzdBV6G86
	rH8O9P1tofqPQzP6ethYesM9NHy1wqONVGB2IBI95TtE3nq/k1v/KqdDrqk1VfRsOrngtfzuqFS
	h8ahx1h/9uO1k3qUdYe24oUz+cMmnz8KedyiQzmJeI1uqZ4JO+cWwEfm6XQYG6b8VUjDqI=
X-Google-Smtp-Source: AGHT+IFGSpVQlbbuwuaXknBwYJ9ALYcdhhCjvn/oxeNeFUs2umSu1XX/BwCBndTwY1aioIdKu9uBNa2DX3y7UsbEmyg=
X-Received: by 2002:a05:6870:d191:b0:3ec:4657:83f3 with SMTP id
 586e51a60fabf-3f5bdc3fe8fmr853655fac.14.1765339671765; Tue, 09 Dec 2025
 20:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205-2-v4-0-e5ab932cf219@linux.dev>
In-Reply-To: <20251205-2-v4-0-e5ab932cf219@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 10 Dec 2025 12:07:40 +0800
X-Gm-Features: AQt7F2omlzjRv3TIDDGH8qDJBp5yasdH9uJ7eGWlC1Q9r8xJPj9UiFIu9GOpVZc
Message-ID: <CAEyhmHRbFFiRXTb9pdoXbPdJjGHq44Z=iDP+eDk4jhcoGKcJzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v4)
To: George Guo <dongtai.guo@linux.dev>, "r@hev.cc" <r@hev.cc>, Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>, 
	Yangyang Lian <lianyangyang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Hev and Ruoyao

Please cc them in next respin.

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
