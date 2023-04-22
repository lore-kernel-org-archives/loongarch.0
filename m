Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE97F
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 07:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2164C433D2
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682147806;
	bh=keJZbVpjoAjI7YMqe2VUvubnepiHGL6L9+HrTgbGTsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RftB9xHdBTsvKQ3KI3RdjLXWPIaQBlyxNPHjSv+qFxLeXiK6CStLqcDBa2k/Zc965
	 H/8neQkGUVCW3VuNcbE2+307ejocJNi+qQt/QJgV+X8uSta1UsaQq3HYb6oTMlxBVX
	 mPeH9Nu/NcQTls6Iaa+RGuvSGIyQoWIS7gD8QTUmSjqvsqP0d1wY6/wajQ/svQwh52
	 M0Zmx4icQbk8KyFNCizEsN101y/mGNqEB5Yq+fUaO8t9G+EYRSiY2FFSPIiMN0HDCm
	 fxQ9NAuOkQE19CG/p+m9G3lmthN31igBBzf/SREeHLHOs8AP2UnqHPXDLBa6cwa750
	 odrl8SCJB+KlA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-94f6c285d92so426966066b.3
        for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 00:16:46 -0700 (PDT)
X-Gm-Message-State: AAQBX9cZW3cBCMKkJxmTWP5BrLWUoIFjKHGyFc/HTRCQcyMcIZ5qfuP2
	UPppHIPsIDOQstlVsnpxYzcn0kvdmcXxEDOgBPg=
X-Google-Smtp-Source: AKy350aw2zjs4Yj9OgXpFN6FI6uEel5P/IQqflx1aFk/NCrUVgp2VUjf9TX1cM/Ql2Jh3M6gwp8Gy7YmZlasA9s58po=
X-Received: by 2002:a17:906:3159:b0:957:17c5:8705 with SMTP id
 e25-20020a170906315900b0095717c58705mr4035245eje.51.1682147805103; Sat, 22
 Apr 2023 00:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230421114908.2970567-1-kernel@xen0n.name> <20230421114908.2970567-9-kernel@xen0n.name>
In-Reply-To: <20230421114908.2970567-9-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Apr 2023 15:16:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4nv6oY8VkOmQTs-rRntBM1WdhR9q2DpJFA_HTRggi6VA@mail.gmail.com>
Message-ID: <CAAhV-H4nv6oY8VkOmQTs-rRntBM1WdhR9q2DpJFA_HTRggi6VA@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] LoongArch: Humanize the EUEN line when showing registers
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Fri, Apr 21, 2023 at 7:49=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Example output looks like:
>
> [   xx.xxxxxx]  EUEN: 00000000 (-BTE -ASXE -SXE -FPE)
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/kernel/traps.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index 84006f1f40ed..bdd18b506bb0 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -206,6 +206,16 @@ static void print_prmd(unsigned long x)
>         pr_cont(")\n");
>  }
>
> +static void print_euen(unsigned long x)
> +{
> +       pr_cont(" EUEN: %08lx (", x);
> +       print_bool_fragment("BTE", FIELD_GET(CSR_EUEN_LBTEN, x), true);
> +       print_bool_fragment("ASXE", FIELD_GET(CSR_EUEN_LASXEN, x), false)=
;
> +       print_bool_fragment("SXE", FIELD_GET(CSR_EUEN_LSXEN, x), false);
> +       print_bool_fragment("FPE", FIELD_GET(CSR_EUEN_FPEN, x), false);
Please print from LSB to MSB for all CSRs, this can also makes ECode
be displayed before ESubCode in ESTAT.

Huacai
> +       pr_cont(")\n");
> +}
> +
>  static void __show_regs(const struct pt_regs *regs)
>  {
>         const int field =3D 2 * sizeof(unsigned long);
> @@ -249,7 +259,7 @@ static void __show_regs(const struct pt_regs *regs)
>         /* Print important CSRs */
>         print_crmd(regs->csr_crmd);
>         print_prmd(regs->csr_prmd);
> -       pr_cont(" EUEN: %08lx\n", regs->csr_euen);
> +       print_euen(regs->csr_euen);
>         pr_cont(" ECFG: %08lx\n", regs->csr_ecfg);
>         pr_cont("ESTAT: %08lx\n", regs->csr_estat);
>
> --
> 2.40.0
>
