Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C44878F
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711678206; cv=none; b=uidf46bOe+T2Ps9R4y+lsyUrVuc0xiu/BeymDnoiZ25m6S6Ac3+t55+jVH2jItFH9ELlyUh5OpPZEWwJ4ANuCwIv/6lR5FJNaMOK3rtUlDq89SINWENeuJ4Qcl84KK3cdLmMgWI8i2y5p1Hj8igMIx52PfetXBK/zQbt8ETk4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711678206; c=relaxed/simple;
	bh=O7xbgBgQOtN6IeYuQy/GU/n6T4a1CY0hLFYa9laj4dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZUBg7ZIsKe5pEqqPagLhxmQZXojqIw1r+K+N8dw+YxlUgMlRSHaCuOS4Pt3hgxI32rNxhsNLUw+Nu9lA5R9mGyvCNQFk5mehs30RzNsl7utH920dOISoniD9IcdgN8lN1g1aANJd/YjXIXLIkYBnlIy/GNcWJCyVMToz6lNciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLwPVGdy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLwPVGdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB54C4166A
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711678205;
	bh=O7xbgBgQOtN6IeYuQy/GU/n6T4a1CY0hLFYa9laj4dg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rLwPVGdyfUQ9Q5txgWZV1ray66tLnDTvru7ZC00uj72yHNLM+5uQBAyuJqOx6oAw9
	 abEHw0If2LAZPK8uSc6lmAyNOYXALEjIXNyd2eicIJFb8LyFzcbdYg/FWbDqn2W6xO
	 OLV7xPd9JNSQULR57xL2cr74eruXBuq0DoxPUJ1IRnMr63FhQALGAopQ1Gd06OLmmq
	 2zBE5Vr3Wkxt/ZdJe6cuoCw5wTNNRDb1AYJR4UjhgHi9TaAUMxBUAW/mlbM/pz7961
	 Hnwl0VSIIy5GFdVZwgIFWK9sfSOrc/+jz5PzlpgkOVrB3dnWUwPdPqO0nXkz0NH+7s
	 DTRJ3mwZ9tlPw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4749eecff7so172344266b.2
        for <loongarch@lists.linux.dev>; Thu, 28 Mar 2024 19:10:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdSIqsdjIsYdpL1ziv6IgIYo+BFzwp0PDwlV5KALIiYTcjiHNMGiz2i7LRs0tTA3o5N38wxFZHMTK4K4DSbZpJh3qc+D7vqTeo
X-Gm-Message-State: AOJu0YxwSDyHUJt7FKWqpyLc4LvDLQzG17R4nhSQy1OfAVd2lEy7hy2O
	sMURTanalYQs3osK/9qsUxnW+SiUYKeZbeBQsAlmUHJw50ATJgzC6mPVowF/06g4eqQ9UoYIsIY
	FYkaE+goTxll5Hin2grLABXVcaLg=
X-Google-Smtp-Source: AGHT+IGwe63tbdBszNS6sGYONK8L4hQI3wH9JIXEL9232tMVmuR5zTJK7GiELbRfCNUMrwys1rZgCxvDVwe/zgYgCS0=
X-Received: by 2002:a17:907:868a:b0:a46:c11d:dd01 with SMTP id
 qa10-20020a170907868a00b00a46c11ddd01mr761930ejc.50.1711678204472; Thu, 28
 Mar 2024 19:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327171737.27622-1-xry111@xry111.site>
In-Reply-To: <20240327171737.27622-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 29 Mar 2024 10:09:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ThOE0eC3tfpdXw5uTbqp6AwrZ2M7D_0L_WY6tTH8W9g@mail.gmail.com>
Message-ID: <CAAhV-H4ThOE0eC3tfpdXw5uTbqp6AwrZ2M7D_0L_WY6tTH8W9g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next, thanks.

Huacai

On Thu, Mar 28, 2024 at 1:18=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> This allows compiling a full 128-bit product of two 64-bit integers as
> a mul/mulh pair, instead of a nasty long sequence of 20+ instructions.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index a5f300ec6f28..5a769bb92d7c 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -56,6 +56,7 @@ config LOONGARCH
>         select ARCH_SUPPORTS_ACPI
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_HUGETLBFS
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_LTO_CLANG
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_NUMA_BALANCING
> --
> 2.44.0
>
>
