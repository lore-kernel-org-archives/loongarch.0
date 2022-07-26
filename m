Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B72590
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 14:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C019EC433D6
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658846820;
	bh=12X4Y7TSnKsFNBqPkHdUFmCZ0VSVCI/EPfCaWwF9rJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iuDgJwdkhBSYSTxzLOTcpXSUU0ZO98OFmYQxDZZaQ24UBERd4usC5jd9bZJq0NWlQ
	 FHkW5lJSpoonPoOVBzQGLXt0Qpf89bQxF05STGzeaK7mbaaOdIMN5zuM5r7CRruZiw
	 ocLrqeT4lNgGSpkOS5ag88RRPLdHJjtkvLZ2UriLz5L8vIViFEDQxplRPaEIcdz50h
	 zkrOlPFolYUq4yq5G9MrP1fPvk5SmMtM7UfvC32MpUNxPEBIzIgBpHeGHEQYw1eKqR
	 01mJArBf6LNOwM0HC2pIVk4LCbSaA3fI4wm0VKEJwE+hoVQIhxTmaki0TDazhzs1Hn
	 B5gTP0/TQ/kIw==
Received: by mail-vs1-f52.google.com with SMTP id d187so13801774vsd.10
        for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 07:47:00 -0700 (PDT)
X-Gm-Message-State: AJIora+9PNpl3N7jzf7QRd74799Hde2Af7OnwV5I5xB8fG0WrPr5OHXY
	U4KNow3MTp/LOQHsjNplzIe4i1rDDokIUhbFi6U=
X-Google-Smtp-Source: AGRyM1sLm4955QmB9hbwBPhgv8pfbeRD6A2OYsDaKqAYPsq/c8Nb9sxyhVtLLW6NPTe6pTntr4AHC90U70Wp24xW+TM=
X-Received: by 2002:a67:d599:0:b0:358:6371:4cfb with SMTP id
 m25-20020a67d599000000b0035863714cfbmr2789299vsj.78.1658846819712; Tue, 26
 Jul 2022 07:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220726122920.2291947-1-kernel@xen0n.name> <20220726122920.2291947-6-kernel@xen0n.name>
 <8a2ea087-ac01-e644-3460-0ceb8685e792@loongson.cn> <7222c4df-a21d-8149-4618-c1961959244a@xen0n.name>
In-Reply-To: <7222c4df-a21d-8149-4618-c1961959244a@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Jul 2022 22:46:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Yh+B2G_0-F6j4i2V2cWsaEArp1h2=f7_g+czQhkDAZQ@mail.gmail.com>
Message-ID: <CAAhV-H5Yh+B2G_0-F6j4i2V2cWsaEArp1h2=f7_g+czQhkDAZQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] LoongArch: Simplify "BLT foo, zero" with BLTZ
To: WANG Xuerui <kernel@xen0n.name>
Cc: Jinyang He <hejinyang@loongson.cn>, loongarch@lists.linux.dev, 
	WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Tue, Jul 26, 2022 at 9:12 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/7/26 21:02, Jinyang He wrote:
> > Is there anything left?
> >
> >
> > diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
> > index 7eee40271577..4c7ba5cb4574 100644
> > --- a/arch/loongarch/mm/tlbex.S
> > +++ b/arch/loongarch/mm/tlbex.S
> > @@ -47,7 +47,7 @@ SYM_FUNC_START(handle_tlb_load)
> >           * The vmalloc handling is not in the hotpath.
> >           */
> >          csrrd   t0, LOONGARCH_CSR_BADV
> > -       blt     t0, $r0, vmalloc_load
> > +       bltz    t0, vmalloc_load
> >          csrrd   t1, LOONGARCH_CSR_PGDL
> >
> >   vmalloc_done_load:
> > @@ -210,7 +210,7 @@ SYM_FUNC_START(handle_tlb_store)
> >           * The vmalloc handling is not in the hotpath.
> >           */
> >          csrrd   t0, LOONGARCH_CSR_BADV
> > -       blt     t0, $r0, vmalloc_store
> > +       bltz    t0, vmalloc_store
> >          csrrd   t1, LOONGARCH_CSR_PGDL
> >
> >   vmalloc_done_store:
> > @@ -378,7 +378,7 @@ SYM_FUNC_START(handle_tlb_modify)
> >           * The vmalloc handling is not in the hotpath.
> >           */
> >          csrrd   t0, LOONGARCH_CSR_BADV
> > -       blt     t0, $r0, vmalloc_modify
> > +       bltz    t0, vmalloc_modify
> >          csrrd   t1, LOONGARCH_CSR_PGDL
> >
> >   vmalloc_done_modify:
> >
> >
>
> Heck. Not even the usage of register ABI names is consistent, maybe I
> over-estimated the code quality in general...
>
> Do you think it'll be better to fix these cases in another series, or
> amend the current series and send v3?
I think it is better to send v3, and I hope we can find more places to
modify before that.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
