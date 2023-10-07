Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3C17EC
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHd84PRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC8C433CC
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696672147;
	bh=5fs0qAQmil8qeHzK8rF+amcjXk7Zutaz5R48u8TzdmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hHd84PRDzVNBDHQPVtuh03Jyme9pRDRcy7vntd/lJdFL2fowa4yuKbLc8VZFwExOA
	 4/TZfOrE5WskzIpJHcvXFhc42HEQBIK/CN8wpR1BPBi2nMYJRrHXxRthk3RMmWdUxw
	 XJRhLyBWemaHzyYm06avj7JP30Tioj79H+SqTvfSoUZYHc4n0qf0Vzsrwvd5rM2eeq
	 Fs2mWePTEXQIdtDU+cZ1w3dmcPOPwa1ePAeJL2ohOy3t2gxx1P6n1dF6TCGWebRmb+
	 nYurUlkJQT9dsG+k+z2UfeaZ6K1h2Oo9IGwiaaZV/DOmdcUsV3A3X+E2AqXRndHMFx
	 JVQDiJW2vut0g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so5355206a12.2
        for <loongarch@lists.linux.dev>; Sat, 07 Oct 2023 02:49:07 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/NgwWHEFazIk0QM6FZo6jQaKahLYRNqKKXerAZ9whDY425rL6
	T8cid5l8/E1p94goNhFpuAoOudrAr8Ltb6sXRmM=
X-Google-Smtp-Source: AGHT+IHKWW8jP9f0mfthlCgUSVspE9l6zjhQYo0TfFni4XPCIysLb+iCqkttR7C3eV1aEYdvozDNfFXplpnTvMIAIbM=
X-Received: by 2002:aa7:da8a:0:b0:531:9c1:8262 with SMTP id
 q10-20020aa7da8a000000b0053109c18262mr9305005eds.8.1696672146241; Sat, 07 Oct
 2023 02:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231007075303.263407-1-zhaotianrui@loongson.cn>
In-Reply-To: <20231007075303.263407-1-zhaotianrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Oct 2023 17:48:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H50XxWH+YMT8LHS+sCVRyHWyHvRbL0UvW1f3cWWgpQi2g@mail.gmail.com>
Message-ID: <CAAhV-H50XxWH+YMT8LHS+sCVRyHWyHvRbL0UvW1f3cWWgpQi2g@mail.gmail.com>
Subject: Re: [PATCH linux-next] LoongArch: mm: Export symbol for invalid_pud_table.
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list : LOONGARCH" <loongarch@lists.linux.dev>, KVM list <kvm@vger.kernel.org>, maobibo@loongson.cn, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-next (though I prepared a similar patch), thanks.

Huacai

On Sat, Oct 7, 2023 at 3:53=E2=80=AFPM Tianrui Zhao <zhaotianrui@loongson.c=
n> wrote:
>
> Export symbol for invalid_pud_table, so it can be used
> by the files in other directories.
>
> And this can resolve the problem caused in:
> https://lore.kernel.org/lkml/20230927030959.3629941-5-zhaotianrui@loongso=
n.cn/
> ERROR: modpost: "invalid_pud_table" [arch/loongarch/kvm/kvm.ko] undefined=
!
>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index f3fe8c06ba4d..ddf1330c924c 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -240,6 +240,7 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(".bss..=
swapper_pg_dir");
>  pgd_t invalid_pg_dir[_PTRS_PER_PGD] __page_aligned_bss;
>  #ifndef __PAGETABLE_PUD_FOLDED
>  pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
> +EXPORT_SYMBOL(invalid_pud_table);
>  #endif
>  #ifndef __PAGETABLE_PMD_FOLDED
>  pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
> --
> 2.39.1
>
