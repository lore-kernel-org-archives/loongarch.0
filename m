Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519FB13D53C
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347405; cv=none; b=jNzA108bBtcqJGuC45biUXreCm0GVuKT9QvaUNp90lNl4yJOMeKl6b9Zz2D29BsT8HMDAVDGjxfH42Hzn7iQL7TQVq0eBZOyUHzY4WDGMizu7bQjnlQ9RnWTIm3PRkKQzJtUSSmI52Adk6KqKzdaZljB3kbKyiteERFZBc0kz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347405; c=relaxed/simple;
	bh=a3gDiQkm39SDNs3FJn9tByo+Y+gifVe+5SxGVPceq8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkq1HVwRINXa9QgLj6N1vzbNKh4mE13/9TjUMhBTS8gHbG7hyNY4XuDRnh9eyqov/OXiYrsHAZ+s8HmXwW0PXj66zEtULgXlSsD2hLXGZvg4BS1vHoCsEBxcfAkd+DVJFEzh7h8RRbweb3gRSuRkXT+0XZ7E9A7QYbBJq+Eu/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ut7lDY8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ut7lDY8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13909C4AF09
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347405;
	bh=a3gDiQkm39SDNs3FJn9tByo+Y+gifVe+5SxGVPceq8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ut7lDY8ND5K7RwzJNWEml2yqcQaEqSGozE7YDwdArbEnnlGIRxn2j5uXIxxcgYG6l
	 pnSAZGq3HLZ9/U2pBzIc64d4lAfO/AhllGy0r2cxq52+nN1HbfIjTxIyNd2xAH4ZHE
	 3IN0zO9ZKZHSDK9YYfPoDCtn27vnJldRK1g3A9LcspEMmuLCYDPABwjWHA0Ezr0EFE
	 zagN6OINYNG2mLMt/pObX2uVkSry8FsYPI2jxcu0XB3o5AGaJ8iVwJxrZKnhnSA/QL
	 g+iDa7VrmBrsSr9SKjcPlJM+MDvEMfhz93YQq84NBy2Fdrejo6AjyxP1MjrCTe8vOr
	 Eed8uR8aNUaiw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65baa72399fso4654216a12.0
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbUX8t693eRqXprsfCC5ry6Fi6EAonZF2/8xcnc7F3IWcoeLT1QjXlMYhBPD4ktW7XXeuiNe81iWk=@lists.linux.dev
X-Gm-Message-State: AOJu0YziIsReQpAz1IXV5E2ODuU2eT3PQHWsclO4rt4TBEcwQzQ/rw59
	1iJCbnRWXXELsgFOdMYElxF48fWXRYaZ0HRrhacITxMDNK8vgHQSO6G7N0MuL0fliAq0mKPOWe5
	cYtawkBwEUc7nFDXchGeH7hsDc0uArRU=
X-Received: by 2002:a05:6402:1456:b0:658:b837:7953 with SMTP id
 4fb4d7f45d1cf-65fdd6ef9f8mr5194126a12.12.1772347403652; Sat, 28 Feb 2026
 22:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301013808.1698484-1-sashal@kernel.org>
In-Reply-To: <20260301013808.1698484-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:43:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5N+Qwz=ViTjm9pxZWOE=_HdcHXYjqBysPhFovjMPc_LQ@mail.gmail.com>
X-Gm-Features: AaiRm50d9JSTLnIVN7uyK-OVq5ZFcscc1wP3GZgAgZqmyZmVsUgy9YzHgZTkv-w
Message-ID: <CAAhV-H5N+Qwz=ViTjm9pxZWOE=_HdcHXYjqBysPhFovjMPc_LQ@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Disable instrumentation for
 setup_ptwalker()" failed to apply to 6.6-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, yangtiezhu@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:38=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.6-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.6

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
