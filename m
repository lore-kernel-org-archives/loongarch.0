Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C33161BA
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347758; cv=none; b=JQr4pnJ4mugNOhv5QnPE9T1BZq8j3cS4z8A9DKiQuaxXnDBnlwm9vZoY5I6p46Dd7mnSkEhb5XDJC1jW7hrlVbZo0kQlJ5Xvi6Pn9MuJSYwxvWDUWD1gHztI+uyauVJRHvqjcOzG0porfmXCe9+bcGCeqX2hly0QTSroJk7xIrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347758; c=relaxed/simple;
	bh=xPvs5GerX7U1TS3JHlMdvormyYoyyl11VTFg/9+mW5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImgqTLBSIApTxWC0dPjfFmVFLa8MYR5gmUh9DOOG3KVfG4zNR/4UFFTf4XyZh+CLzdnIaZysDH9tqbzLyPIUbyPqjFc83PYi7/dcdJEy2EL2+SbWwwXjYDBGDlGvBEK0LgciNZqC0ZKUYMsKu0A2LbVBx6sCdCJVuJ+21+nad/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtfcCxEc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtfcCxEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41024C2BCAF
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347758;
	bh=xPvs5GerX7U1TS3JHlMdvormyYoyyl11VTFg/9+mW5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OtfcCxEcG8pbt6HI7nANxn4aAzhyxk9xZh1uwt5VXskY/IC/LCOSuRqVBkMzk8cf2
	 5LojD2xKfDPBnRcavsQtPRFtxnKcijRw0IkE6+iQzTvkZt0gptJxh5zVRmdRhyewNO
	 oxU3KWr1ik6BlhTxYVjJI+p8e4gFuAsjnrP+Qx0Js/3nJOrFz0pkJeBHGY/Efb286j
	 2JyMh2av0AeD2sKelA7tiI2TNOE/O9Lqj81Vg1j9lJBa0SpiNz/CkF33O5Y0qGk9KC
	 DIP3QmpjOISh8aYAIheid4G0XFOIvRUoe5otgkiC5ROip71+bov0vYRRqbeJyVhKpD
	 mYEFRW0CI28BA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65fb991d7eeso4846070a12.0
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:49:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsv6JO1wapFEx0kPsgptUxN/Me9gVGIn7vixdxVooLn89iIqoRoCSswMvATQgP8czhmU3HDRrn2ho=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0kd5iT5czGySF6IJ8bBnSE5B30I7qyEH5YZQPg8yjHPfjJhJq
	7CtgIc+nPY9UPzI/rrZcqDpbBD7qd9fThPaGpEYRiSvxOobDs5I/oUaGbRvZojhsJ3v5p1obsTu
	+GW7rBsjLCGj0hfkYsmQbLCIvWIycd5g=
X-Received: by 2002:a05:6402:3508:b0:658:cb40:6701 with SMTP id
 4fb4d7f45d1cf-65fdd6bdb3amr4924372a12.7.1772347756791; Sat, 28 Feb 2026
 22:49:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301014656.1710036-1-sashal@kernel.org>
In-Reply-To: <20260301014656.1710036-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:49:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4HODcY4gwjTd7GJtSuOCyGnNfWbhQ4TYXiEVLyx37seg@mail.gmail.com>
X-Gm-Features: AaiRm53LsORNy_ujK6ToSvQlnWPZtzY4mKGAwctzX8HvFN8c1trS_zRecrt55SM
Message-ID: <CAAhV-H4HODcY4gwjTd7GJtSuOCyGnNfWbhQ4TYXiEVLyx37seg@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Disable instrumentation for
 setup_ptwalker()" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, yangtiezhu@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:46=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.1

Huacai
>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From 7cb37af61f09c9cfd90c43c9275307c16320cbf2 Mon Sep 17 00:00:00 2001
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
> Date: Tue, 10 Feb 2026 19:31:17 +0800
> Subject: [PATCH] LoongArch: Disable instrumentation for setup_ptwalker()
>
> According to Documentation/dev-tools/kasan.rst, software KASAN modes use
> compiler instrumentation to insert validity checks. Such instrumentation
> might be incompatible with some parts of the kernel, and therefore needs
> to be disabled, just use the attribute __no_sanitize_address to disable
> instrumentation for the low level function setup_ptwalker().
>
> Otherwise bringing up the secondary CPUs failed when CONFIG_KASAN is set
> (especially when PTW is enabled), here are the call chains:
>
>     smpboot_entry()
>       start_secondary()
>         cpu_probe()
>           per_cpu_trap_init()
>             tlb_init()
>               setup_tlb_handler()
>                 setup_ptwalker()
>
> The reason is the PGD registers are configured in setup_ptwalker(), but
> KASAN instrumentation may cause TLB exceptions before that.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/mm/tlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index 4014c44695878..aaf7d685cc2aa 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -202,7 +202,7 @@ void __update_tlb(struct vm_area_struct *vma, unsigne=
d long address, pte_t *ptep
>         local_irq_restore(flags);
>  }
>
> -static void setup_ptwalker(void)
> +static void __no_sanitize_address setup_ptwalker(void)
>  {
>         unsigned long pwctl0, pwctl1;
>         unsigned long pgd_i =3D 0, pgd_w =3D 0;
> --
> 2.51.0
>
>
>
>
>
