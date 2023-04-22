Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45467F
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 08:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F70EC4339B
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682151969;
	bh=fzP/E9ucEE6iCKgfuc+c9NBvsSrf8rY+gSLMxPeuAZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZloHeerrA+HxH8LW3ji4WjHuECv3z9po7Z49dH8X9jAh7gWNTjduardYb06fSMDba
	 chAogNVs4b7mIfdpU7tbuQTqF7HWhVHX22foOX2HXFP17Dd3m0qTiEMxEJiRw0Lejn
	 3KrOdS58zL0ngOqkFrh/Zu+tUEqKXGMNuRx0m77hzL8HuU6ujjmwm05orBQajHU85V
	 jBp/c5evwXmW2++Ol3e/AHIPDq4DZ96ZHXytTuw78JGIY3xN2/qHFevPLkWcrfIzFI
	 Eysa+s/lJPGsyO5Ndv8OZmH/cSSAmF3MmKMG8bBoSES6xbbgPobdVBpFU82SbmlWSA
	 RcXeAa+hlW4wg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-94f6c285d92so434058666b.3
        for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 01:26:09 -0700 (PDT)
X-Gm-Message-State: AAQBX9cUNWB5irJqa/O9QamJy+mF3cN6G95llHS/Y3bD3U/MQW186MGU
	XfhOy3UR8e8BqLLHGBNbuW/jFBTQpLABjXqroeU=
X-Google-Smtp-Source: AKy350YdGlmaIg5/XfKxVodoHJhMalNYcVBwg7uFt60vNpAP71nDQ9Mbfy2yuWdZrDdVd5YDD2ChlbCIiJOBSxpuR/U=
X-Received: by 2002:a17:907:7713:b0:94f:3045:2255 with SMTP id
 kw19-20020a170907771300b0094f30452255mr3968712ejc.50.1682151967781; Sat, 22
 Apr 2023 01:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230421114908.2970567-1-kernel@xen0n.name> <20230421114908.2970567-9-kernel@xen0n.name>
 <CAAhV-H4nv6oY8VkOmQTs-rRntBM1WdhR9q2DpJFA_HTRggi6VA@mail.gmail.com> <ca75ac82-f8b9-edca-c916-c9bc8e7f700e@xen0n.name>
In-Reply-To: <ca75ac82-f8b9-edca-c916-c9bc8e7f700e@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Apr 2023 16:25:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xSPEkHCaXSbm3XE_HRKKv3ZwaSa+2GuH6tsWo-FPGZA@mail.gmail.com>
Message-ID: <CAAhV-H6xSPEkHCaXSbm3XE_HRKKv3ZwaSa+2GuH6tsWo-FPGZA@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] LoongArch: Humanize the EUEN line when showing registers
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 22, 2023 at 3:59=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
>
> On 4/22/23 15:16, Huacai Chen wrote:
> > Hi, Xuerui,
> >
> > On Fri, Apr 21, 2023 at 7:49=E2=80=AFPM WANG Xuerui <kernel@xen0n.name>=
 wrote:
> >> From: WANG Xuerui <git@xen0n.name>
> >>
> >> Example output looks like:
> >>
> >> [   xx.xxxxxx]  EUEN: 00000000 (-BTE -ASXE -SXE -FPE)
> >>
> >> Signed-off-by: WANG Xuerui <git@xen0n.name>
> >> ---
> >>   arch/loongarch/kernel/traps.c | 12 +++++++++++-
> >>   1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/tra=
ps.c
> >> index 84006f1f40ed..bdd18b506bb0 100644
> >> --- a/arch/loongarch/kernel/traps.c
> >> +++ b/arch/loongarch/kernel/traps.c
> >> @@ -206,6 +206,16 @@ static void print_prmd(unsigned long x)
> >>          pr_cont(")\n");
> >>   }
> >>
> >> +static void print_euen(unsigned long x)
> >> +{
> >> +       pr_cont(" EUEN: %08lx (", x);
> >> +       print_bool_fragment("BTE", FIELD_GET(CSR_EUEN_LBTEN, x), true)=
;
> >> +       print_bool_fragment("ASXE", FIELD_GET(CSR_EUEN_LASXEN, x), fal=
se);
> >> +       print_bool_fragment("SXE", FIELD_GET(CSR_EUEN_LSXEN, x), false=
);
> >> +       print_bool_fragment("FPE", FIELD_GET(CSR_EUEN_FPEN, x), false)=
;
> > Please print from LSB to MSB for all CSRs, this can also makes ECode
> > be displayed before ESubCode in ESTAT.
> After some consideration, I think it's even more unfortunate to have all
> other CSRs printed backwards, just to make ECode appear before EsubCode.
> I'll change the ESTAT line alone in favor of keeping the display order
> of other CSRs' fields consistent with the accompanying hex notation.
No, it is also more natural for EUEN if it is displayed in FPE, SXE,
ASXE, BTE order.

Huacai
> --
>
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
