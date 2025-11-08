Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB42D9EE0
	for <loongarch@lists.linux.dev>; Sat,  8 Nov 2025 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762602881; cv=none; b=qQzuOqdvuOHuu0VJRqZvaEyyer1t9vJO+Z+04OfYBYhBmj/Rfug2IZEofFhOUp2k67MkDycc8IZVO3GyeiALUnoEENLVF0Un0MHH+zB7pqHGeYhSgKdRJidAd0JalDB52rdSf+cgV9CWRzj6iEGEfOrIv4ta0vFHCGHjABwDTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762602881; c=relaxed/simple;
	bh=JjmBnOELtYL2Z+Ms8Gl+U+Kgb9+9vO49fpmGW17yLhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mk6cbpa1jpFbb0dj25qzydGhaoBJRdDptZUbtAAiMp7rlOzyyfa4/uNUzyvzHYXseZPUO/lOQI6zbQb5LOh3x+nOT5dkVykpEC5k9rN5yDvE6wgJtrPoVbji3IKaDK97YT7kZzCgNofI7zpJnXdkda5bupUkvInexfl+Dv4A0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/BMyzUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/BMyzUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F93DC19421
	for <loongarch@lists.linux.dev>; Sat,  8 Nov 2025 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762602881;
	bh=JjmBnOELtYL2Z+Ms8Gl+U+Kgb9+9vO49fpmGW17yLhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/BMyzUuLaPNNqL7OBffPO1on/itoPTd27U51krMmrstpD8eyowLSJ+QmhArJHTho
	 TnMcIUrj9yI7fqVuc2tXFLnNgo8wC+tpYP13ap2sJVHZaGGdYvChZ+zi/WyRc7kDVX
	 n6vkbkUhRl7gCchpkVQoiNWhKR4CvFDTccLJ0XDPAX96n6kkUc35ta41U9tJpFIzb1
	 uHvvrCjWtrpAh3F+HcGEv+VEo34Z7wZjQ8EKTDCgQbKcpBrhArTnQKY71EhEz+ywuM
	 SLzp9mSXmBLeIQxoCHs7/zNtEMYlGEmk/Yto8KZTQbk/saI1AOYZ0PozZeno2j2A5B
	 1oga+DsOWgj+w==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b728a43e410so345886366b.1
        for <loongarch@lists.linux.dev>; Sat, 08 Nov 2025 03:54:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgC4RhMV/ChLW/msFmAy2vRMiwneg9EMKe2TRQzUbXy1fTBk+qh0YMcJmRWvRfs+QWj++DFKYYDgk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhuev2zcgJ6njAUKlhl9ATLNa37PkTlwUtCFXwEEBEDOqiI3lM
	Fj++YDp0IWmHVxwimYL2nhtr3npvbm1ACSydGoDNjXddtOuKUPvb91dHr87Y9Xska6LTrGSTU6j
	3LnAUL1FTIbfW/6MwLhqyfqIH+Q2s424=
X-Google-Smtp-Source: AGHT+IHqBYT+axB9BZiN2sqZeeRbAIRm5Jznc2Lzyd1nIVtQAooGjUjXpKVeEoEBYy1D8Y2EU6h2crd5Lp0qkuxnMZo=
X-Received: by 2002:a17:907:c13:b0:b71:ee24:8a41 with SMTP id
 a640c23a62f3a-b72e061a8edmr197739366b.55.1762602880135; Sat, 08 Nov 2025
 03:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107180601.86483-1-vishal.moola@gmail.com>
In-Reply-To: <20251107180601.86483-1-vishal.moola@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 8 Nov 2025 19:54:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58u2xXYG0X3giazizpuBqT-0qdGojbBsmwD2U1Z7D_vQ@mail.gmail.com>
X-Gm-Features: AWmQ_blKLKtaUFkaK1b4OmOoYr8cN9MHEprk0cMi9STYqXx46onfrqx2NUZin-Y
Message-ID: <CAAhV-H58u2xXYG0X3giazizpuBqT-0qdGojbBsmwD2U1Z7D_vQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove __GFP_HIGHMEM masking
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Vishal,

On Sat, Nov 8, 2025 at 2:06=E2=80=AFAM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
> commit 382739797f79 ("loongarch: convert various functions to use
> ptdescs"). GFP_KERNEL doesn't contain __GFP_HIGHMEM.
I have planned to submit a similar patch after [1] is merged, but
anyway, thank you for your contribution.

[1] https://lore.kernel.org/linux-mm/CAAhV-H5C_Af72a5QcJs25qUMsJqO26=3D8oNv=
vLrJ7z+xHZh8oKQ@mail.gmail.com/T/#t

Huacai

>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/loongarch/include/asm/pgalloc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/includ=
e/asm/pgalloc.h
> index 1c63a9d9a6d3..08dcc698ec18 100644
> --- a/arch/loongarch/include/asm/pgalloc.h
> +++ b/arch/loongarch/include/asm/pgalloc.h
> @@ -88,7 +88,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm=
, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long a=
ddress)
>  {
>         pud_t *pud;
> -       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_KERNEL & ~__GFP_HIG=
HMEM, 0);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_KERNEL, 0);
>
>         if (!ptdesc)
>                 return NULL;
> --
> 2.51.1
>
>
