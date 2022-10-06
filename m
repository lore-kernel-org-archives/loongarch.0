Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531C64C
	for <loongarch@lists.linux.dev>; Thu,  6 Oct 2022 05:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB65C433C1
	for <loongarch@lists.linux.dev>; Thu,  6 Oct 2022 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665033952;
	bh=COGl5uV0nSso0ASdfQpE3uWYO735hZcandisnHobVps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QU44qG4Rm1M0zo9iHJPLh5Zj524EOifybS++udldoMyZWSqogiejpjindLfsdbkXi
	 hIo5mZumUMD6ZXiSZfORmxbC1MBM6soHIFaMzVIntXHr5Su9l/kxgoMtCHDlwG58RI
	 cVMXx4lT1vrUiwok/LrtWulWfs24AaH/4tptKksRVoLgqxODpcPtcpLvaAoaMW3oeX
	 Cw6KizHXhiKMaFYMjyipdEGwBUhwLnFkuojrjavw+zJDBmnnT5vXRkGbLMa0tgYGcy
	 LR81XyFoFtlbA/TUK5uii4Uq1jceG5Z9JuC7GE2cGDQIS0bxfVlCNz1k8hX3hQ/NtE
	 hAjLXEJiMLBOQ==
Received: by mail-ed1-f53.google.com with SMTP id u21so1220095edi.9
        for <loongarch@lists.linux.dev>; Wed, 05 Oct 2022 22:25:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf3OYW27C313chqiuHERnMluM07fWOGoMS1c9gsOVped3BZ8AQdR
	sVvZZ0U+MQ0Tkci1wutydp9cAXriAa/sND7PiMs=
X-Google-Smtp-Source: AMsMyM5NkOQxKS3BuwzOSC9pLfMrTJCGhnRFLhXo2lty1XKLpQ6+AS8o2HupP+dFpHMwKEOTnYORcQkSlc9VcVbt2nY=
X-Received: by 2002:a05:6402:c81:b0:458:c428:173a with SMTP id
 cm1-20020a0564020c8100b00458c428173amr2920220edb.298.1665033951020; Wed, 05
 Oct 2022 22:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yz1t6rPLOzKT8Id+@debian> <CAAhV-H7FoDEEtqF_ZOwTGPeGK-4wpzsxEqvO+iuq=KpEuDUofQ@mail.gmail.com>
 <CADVatmOmtd0jfzNvpyMiQnN0nUn3qZFjLnTjxrn7km3p-grwpQ@mail.gmail.com> <ad45e0e0409b07ecb719743e4febb2853143986d.camel@xry111.site>
In-Reply-To: <ad45e0e0409b07ecb719743e4febb2853143986d.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 6 Oct 2022 13:25:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7VPCT3aYeNFeLzLKYW8r3rGnk_X61a1wc-GTROPD2aSg@mail.gmail.com>
Message-ID: <CAAhV-H7VPCT3aYeNFeLzLKYW8r3rGnk_X61a1wc-GTROPD2aSg@mail.gmail.com>
Subject: Re: build failure of next-20221005 due to 4078ec1ef5ed ("LoongArch:
 Use TLB for ioremap()")
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Wed, Oct 5, 2022 at 10:14 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> Hi Huacai,
>
> Try:
>
> #define iounmap(addr) ((void)(addr))
This can solve the problem, and arm use the same way:
#define tlb_flush(tlb)  ((void) tlb)

but I don't know whether this is the correct way.

Huacai

>
> This is how we normally silence an unused variable or parameter warning.
> Not sure if the kernel uses the same convention though.
>
> On Wed, 2022-10-05 at 13:54 +0100, Sudip Mukherjee wrote:
> > On Wed, Oct 5, 2022 at 1:30 PM Huacai Chen <chenhuacai@kernel.org>
> > wrote:
> > >
> > > Hi, Sudip,
> > >
> > > This seems a false positive. When the implementation of iounmap() is
> > > empty (but this is completely legal I think), these drivers will
> > > cause
> > > "unused variable error".
> >
> > And that error will fail the build as allmodconfig will have
> > CONFIG_WERROR=y.
> >
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
