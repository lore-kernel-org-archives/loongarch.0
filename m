Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DBE37A
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 09:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE4BC4347C
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660296255;
	bh=CcgdLV5jt383QIHdWqYhPSE2b+e2C7JYIK79c8vOMQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eQZnoMaZgs6pkpdPh+bYtrW79k2pWM6S+lj0dXpENTo4bFep40EfL2TN83cs76OjE
	 l+u/m8TS+CsHmhljKtF7UQ8JKdYCtBj7W24gZHUrxGs29RCLb0BW2wWcsIrJwNd54T
	 m0YX1RYQ1gHB3qWlxB957BCDhj81J2fPSsNsc3vaT7W/M8h7fMiHyzsecTfl8g7FTW
	 bB6/QDQQoCLBG/4NxBSsF8jJFs5mhxCUOaaXnmJluFCGBHzKf8ssopurMyndtkGecy
	 wbLe7QVpjP1r1SVxxCIeYlSRCIrynOd5l2LkUdLJiqm6hsvW+yb+tyKnpaJ94gfy0q
	 J/4HY7nzjpSww==
Received: by mail-vk1-f173.google.com with SMTP id bq26so202298vkb.8
        for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 02:24:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo06wI/ernBTOwEYrl2qDJt4g6Oa7jVmeoHa3TIBoighH8W/622A
	wSxBIE8/LiJpN6bGMUMbW2iYia+WSvxZK0uqm+c=
X-Google-Smtp-Source: AA6agR5xnmGfbzpFbM5koXGwiSnHOd/aPqt7X2j1i8Z743YSR1cxPbbXO4Tiskj93UMBIW1BZEXvTvS/ve5vNHpJH5g=
X-Received: by 2002:a1f:7c04:0:b0:378:323e:1e89 with SMTP id
 x4-20020a1f7c04000000b00378323e1e89mr1434485vkc.35.1660296253872; Fri, 12 Aug
 2022 02:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220811130301.2431582-1-chenhuacai@loongson.cn> <bc52a604-828b-6d19-4f9c-df17cd180f34@loongson.cn>
In-Reply-To: <bc52a604-828b-6d19-4f9c-df17cd180f34@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 12 Aug 2022 17:24:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7zjqJDq0aqSx23wxE=sDSZ1dpfPV_D2hS6sEZ8YGDGqw@mail.gmail.com>
Message-ID: <CAAhV-H7zjqJDq0aqSx23wxE=sDSZ1dpfPV_D2hS6sEZ8YGDGqw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Jinyang,

On Fri, Aug 12, 2022 at 4:24 PM Jinyang He <hejinyang@loongson.cn> wrote:
>
> On 08/11/2022 09:03 PM, Huacai Chen wrote:
>
> > The kernel entry point of both boot-cpu and nonboot-cpu may be physical
> > address from BootLoader (in DA mode or identity-mapping PG mode). So we
> > should jump to the link address before PG enabled (DA is disabled at the
> > same time) and just after DMW configured.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/kernel/head.S | 19 +++++++++++--------
> >   1 file changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> > index 7062cdf0e33e..c60eb66793e3 100644
> > --- a/arch/loongarch/kernel/head.S
> > +++ b/arch/loongarch/kernel/head.S
> > @@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)                       # kernel entry point
> >       csrwr           t0, LOONGARCH_CSR_DMWIN0
> >       li.d            t0, CSR_DMW1_INIT       # CA, PLV0, 0x9000 xxxx xxxx xxxx
> >       csrwr           t0, LOONGARCH_CSR_DMWIN1
> > +
> > +     /* We might not get launched at the address the kernel is linked to,
> > +        so we jump there.  */
> > +     la.abs          t0, 0f
> > +     jr              t0
> > +0:
> Hi, Huacai,
>
> I care about the real address these codes is running.  We know that the
> kernel codes is placed at the location 0x9000000000200000 because the
> firmware, or the compressed kernel puts it in this location. However,
> there are other ways to put it to others location. E.g. during kdump,
> when the capture kernel reboot, (here the capture kernel is the same
> as the standard kernel), its address may be 0x9000000004200000, and
> the physical address is 0x4200000. If only using la.abs which is a constant
> after compiled is unreliable. The real address might look like as follows
>
>    /* Get High */
>    csrrd $t0,LOONGARCH_CSR_DMWIN1
>    srli.d t0, t0, 59
>    slli.d t0, t0, 59
>    /* Get Low */
> 0:
>    pcaddi t1, (1f-0b)/4
>    srli.d t1, t1, 48
>    slli.d t1, t1, 48
>    /* Combine */
>    or t0, t0, t1
>    /* Jump */
>    jr t0
> 1:
>
> I admit that this thoughts may seem a little strange. It is not fully
> considered, so if wrong, or should not be considered at present,
> please ignore.
That seems like another problem and I haven't thought about it before. :)

Huacai
>
> Thanks,
> Jinyang
>
