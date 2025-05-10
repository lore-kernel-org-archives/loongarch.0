Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0CD9444
	for <loongarch@lists.linux.dev>; Sat, 10 May 2025 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746862453; cv=none; b=GJP1RP5+wvcNprIWo4gomklzg7kLtw4C7gHkJ6ni0gLHw2AChMKpdVJ6OPgkSaTHzVLJvpVdmB7kiMxbsmjIoNIyxD9nRtnwZZ85bD1kIWJnyg73lXQPrD/QfCu3jyknODOtgzBMk9Ag76vLt/7YWQsieGpoAGG0BoFUXPgmfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746862453; c=relaxed/simple;
	bh=fvijvS2MYfhTPTg8ry3/+Dayr5PBz0uT7UGvPckdf9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIB65gTLTFpSR7+/zDgq7ls6W9yqDa+yISu1uqQ+bUftnvfgScC3DNgy+8Nf1AvvvA65EH35iOqTGv5GsJL2ZzmHAW/P8eRYTZEXewCljvcMaV7wKKzWuNj/u15Sg2i3Wb2AQRmRcB/zQXTHkRzPPj5OD3STMzfpl+0wQkFQ5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I650Iy8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I650Iy8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8350C4CEEF
	for <loongarch@lists.linux.dev>; Sat, 10 May 2025 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746862452;
	bh=fvijvS2MYfhTPTg8ry3/+Dayr5PBz0uT7UGvPckdf9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I650Iy8bXVt12CPBgiA/0OB/laieVcX99twsC7A/DFl1GSbEoWuW+G58X5OyVnkvR
	 9UlzugJmXQxjqaaWT5BGqLbQ6NZgm5Y52sFb/ZNylI9qoVSM1Al1U2j3d9v4GrZixe
	 p79fGCqeM57jCumJaB+eTGtC1iCTtcm3QdD2ykVBuCNFKzlMHonEyb3iYbOT2embZJ
	 FDT+ajn1YA8KDaxzFqMW99GPzf25xR4gt0FImxfH/Cgporjo2FeQV/x16VYrB1DZHe
	 ZJyekbDCklIFzwnwaCJ0MpMdpUkk14Fc1fhG7vpx5ZQUTcY+V7GtPjfwd9Ck6K4+LM
	 6+gvcHqCDjRlA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fc3f0a5506so5072616a12.0
        for <loongarch@lists.linux.dev>; Sat, 10 May 2025 00:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkP+yOPiaCVB4VhuY1t4xxWZnwy0EGusA6sx2vnY9npgdHpcns3IR5krOi8A/cgsltgtoNpl3olaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDyfO/Xb4my3PyCFMM8BXoiXkL1MGuY1W7Iod7abfXnp8r+IvD
	TuPLg2CfAfXA1blG2cU/olCDrHJdURQbuab5qcL8TfGrtwGvu2ZlCP1y6pGHFkVhr2eq+XYikDq
	do6hbDYjf2Vcd8f+mhcAp0S0eJ2Q=
X-Google-Smtp-Source: AGHT+IEn9zSoaVBYo0DNSjXuYFOo2oyLfmd7pHQxJqaRlCJrT05m4QYdCbNqWUsi/knofpEpCN6KXcjcM/S27HldPsQ=
X-Received: by 2002:a17:906:48d4:b0:ad2:1cd7:cef3 with SMTP id
 a640c23a62f3a-ad21cd7d372mr427924166b.23.1746862451298; Sat, 10 May 2025
 00:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250508030506.7076-1-dongtai.guo@linux.dev>
In-Reply-To: <20250508030506.7076-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 10 May 2025 15:34:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5eUtV6N=jt9sUyKXLAP2sX2kHA7rEbyKuSL1G-kRiXFg@mail.gmail.com>
X-Gm-Features: AX0GCFvIlddaOloms8tMR9SgFwC6VXWE77UAAFFykp2Vn3Z8ZeeyrJnJlZM3cic
Message-ID: <CAAhV-H5eUtV6N=jt9sUyKXLAP2sX2kHA7rEbyKuSL1G-kRiXFg@mail.gmail.com>
Subject: Re: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check
 in __set_fixmap()
To: george <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, rppt@kernel.org, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, geert@linux-m68k.org, ptesarik@suse.com, 
	guoweikang.kernel@gmail.com, maobibo@loongson.cn, loongarch@lists.linux.dev, 
	George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Thu, May 8, 2025 at 11:05=E2=80=AFAM george <dongtai.guo@linux.dev> wrot=
e:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> This check could falsely report errors when PTEs are remapped:
> arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.
>
> The check was unnecessary because:
> - Fixmap slots are designed to be reusable
> - Other architectures (x86/arm64) allow PTE overwrites
> - Callers are responsible for proper mapping management
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/mm/init.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index 06f11d9e4ec1..7b7e3b1aa00d 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -200,10 +200,6 @@ void __init __set_fixmap(enum fixed_addresses idx,
>         BUG_ON(idx <=3D FIX_HOLE || idx >=3D __end_of_fixed_addresses);
>
>         ptep =3D populate_kernel_pte(addr);
> -       if (!pte_none(ptep_get(ptep))) {
> -               pte_ERROR(*ptep);
> -               return;
> -       }
Resolve what problems? If other patches need this change, please
submit them as a series.

Huacai

>
>         if (pgprot_val(flags))
>                 set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> --
> 2.34.1
>
>
