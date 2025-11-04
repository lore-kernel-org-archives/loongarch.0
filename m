Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7150D23F412
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243256; cv=none; b=JZXHn/HIFiSOQTrDPf8Vx53kahkYXn+t43mohYhT2ii5rLonwvs/dH5YYic07n1F8Pb3HfAX0akGdc6m9vkxD26AgpcWtckY2aW0jWJhDWSJImVJUc6s3ZGNja9q8ra0XDCebI84QhTBNBRgR3nsh56kHLseex1ksWNRi0dBLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243256; c=relaxed/simple;
	bh=PuqSRgKY4tTRslHCnIdLX5a9mAqIoTyPqIDfD9qJFTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzoIsqorQ8lCvq8bzWWh26k/d9HsxFzvUfzKy/N5cT7dFVgRDzqvfJ5BKmTYWUrrqdKsew1z8F/ouBQA2fBqXSY91xIGB8k6BR/tu6Qgh2Nzu5zx7JLPIcfg0kJDmZ5ZFK2aQmJuMf8xyyFDpaYPBHUV8QTLk3aX+ZeMfYMK2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSJUp1lm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSJUp1lm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD23C19424
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762243256;
	bh=PuqSRgKY4tTRslHCnIdLX5a9mAqIoTyPqIDfD9qJFTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CSJUp1lmHp3hz0LCNyjgfhfrEzthneKW7/OKfLaYL2heWOT+Hn6JibpgVaBahiuSI
	 uaNyA973U42y6JQwzIloVDlQxoJEyIyoTqmOYeVDagUGZMRGNeILgL5xJDANHyctk9
	 RWg5qEF/OJyoFNoc8v44loQU5cS8nFCBQGEh35+e/1kuOdyJga0MHH91sQd118KStK
	 +yJjfY6qnOgk/LMv+ollf0NN2i0MdOFRukL3WC8WYCQciCNcswesTva60wZ1n6yufS
	 q4ClJ7Mw3OI6ZdknGap+DiXvjMZcNJimKkWkgt7FL/GqYpgEo8+Lvu0ORj9p0IQBd1
	 vvbJCFQgJn3uA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4f323cf89bso165148366b.2
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 00:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKFT5AA9SlE7ou+Y7TK0nwUGJM7GdmSH0hNcWjaJRJAkpNWDopcLT0Ov0GHpeYcARqbDP2ECFTnBY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/ry7zItLR0tvNHROZkkgedYvqRPOFHLJhdTSdWkoRRzn7pUfT
	OIIwmKWVyfJr4iSCYARguVAFZU4F7DQ3FhTStsGBXXSXHwImW3D0P/Y6TZTsXpEfnaMIJl21Ahw
	gstT1COMiiktMA7kcR1TrchLCM27laMA=
X-Google-Smtp-Source: AGHT+IHIs4+6OBOp4RqpqefxiLfpCGnf/D+NxvdkoozjKR966Glf2llUVjvc8wIBEtQlwvpPcc3fyqEKerv7cThEoK4=
X-Received: by 2002:a17:907:3d45:b0:b6d:9bab:a7ba with SMTP id
 a640c23a62f3a-b70704e16a2mr1560642266b.42.1762243254594; Tue, 04 Nov 2025
 00:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
In-Reply-To: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Nov 2025 16:00:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5JnmJqTZ1GnhcgODtjL5FLy8x5HNRJxs6us=gzcFon5Q@mail.gmail.com>
X-Gm-Features: AWmQ_bloCtvEGDGM7glFVyRnOfFYLga14ov4xbpTGd4Rhq6-yJ3cFAIVjrxTyOM
Message-ID: <CAAhV-H5JnmJqTZ1GnhcgODtjL5FLy8x5HNRJxs6us=gzcFon5Q@mail.gmail.com>
Subject: Re: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, akpm@linux-foundation.org, willy@infradead.org, 
	david@redhat.com, linmag7@gmail.com, thuth@redhat.com, maobibo@loongson.cn, 
	apopple@nvidia.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liupu Wang <wangliupu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

The subject line can be:
LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY (If
I'm right in the later comments).

On Tue, Nov 4, 2025 at 3:30=E2=80=AFPM Tianyang Zhang <zhangtianyang@loongs=
on.cn> wrote:
>
> In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
> the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
> this could lead to loss of valid data in certain scenarios.
>
> The new modification involves checking whether the original PTE has the
> _PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
> that the pte_dirty interface can return accurate information.
The description may be wrong here. Because pte_dirty() returns
pte_val(pte) & (_PAGE_DIRTY | _PAGE_MODIFIED).
If _PAGE_DIRTY isn't lost, pte_dirty() is always right, no matter
whether there is or isn't _PAGE_MODIFIED.

I think the real reason is we need to set _PAGE_MODIFIED in
pte/pmd_modify to record the status of _PAGE_DIRTY, so that we can
recover _PAGE_DIRTY afterwards, such as in pte/pmd_mkwrite().

>
> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index bd128696e96d..106abfa5183b 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -424,8 +424,13 @@ static inline unsigned long pte_accessible(struct mm=
_struct *mm, pte_t a)
>
>  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  {
> -       return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
> -                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
> +       unsigned long val =3D (pte_val(pte) & _PAGE_CHG_MASK) |
> +                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
> +
> +       if (pte_val(pte) & _PAGE_DIRTY)
> +               val |=3D _PAGE_MODIFIED;
> +
> +       return __pte(val);
>  }
>
>  extern void __update_tlb(struct vm_area_struct *vma,
> @@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
>
>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  {
> -       pmd_val(pmd) =3D (pmd_val(pmd) & _HPAGE_CHG_MASK) |
> +       unsigned long val =3D (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>                                 (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
> -       return pmd;
> +
> +       if (pmd_val(pmd) & _PAGE_DIRTY)
> +               val |=3D _PAGE_MODIFIED;
> +
> +       return __pmd(val);
>  }
A minimal modification can be:
diff --git a/arch/loongarch/include/asm/pgtable.h
b/arch/loongarch/include/asm/pgtable.h
index 1f20e9280062..907ece0199e0 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -448,8 +448,13 @@ static inline unsigned long pte_accessible(struct
mm_struct *mm, pte_t a)

 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-       return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
-                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
+       pte_val(pte) =3D (pte_val(pte) & _PAGE_CHG_MASK) |
+                       (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
+
+       if (pte_val(pte) & _PAGE_DIRTY)
+               pte_val(pte) |=3D _PAGE_MODIFIED;
+
+       return pte;
 }

 extern void __update_tlb(struct vm_area_struct *vma,
@@ -583,7 +588,11 @@ static inline struct page *pmd_page(pmd_t pmd)
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
        pmd_val(pmd) =3D (pmd_val(pmd) & _HPAGE_CHG_MASK) |
-                               (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
+                       (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
+
+       if (pmd_val(pmd) & _PAGE_DIRTY)
+               pmd_val(pmd) |=3D _PAGE_MODIFIED;
+
        return pmd;
 }

You needn't define a new variable.


Huacai

>
>  static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> --
> 2.41.0
>
>
