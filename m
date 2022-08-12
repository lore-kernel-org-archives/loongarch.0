Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE4366
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 02:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08F3C433B5
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660271649;
	bh=9Lv28NyGS6bjosmsp/uHMJP/hTY0PMaHLLD9FbemZcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=acqFmClwJrDM2k1OyBSAIxeZ5IeQjcdQqrbgf3FhN7MRRIhwEEoiAVZ3No7ONfnR7
	 mQohiMTJzHUahu0UfbGwGs6QLh5Lh6tHA82ybtGeT3DAlGdjHevVnbsY00zzH8oMJM
	 qjPoE3W1m3IRzt3q386WlFfwC7z0MmCdDhs+o+4YovQzM2PXJrzcPg005Zd52ndXRt
	 iX7iOuzcXwXs5yK8Y2x+diqe6vppHTxnG8NQhjNmxp+gvkta3r55CfQQCvVLntXsvP
	 B9HHauWJ7qnQRTo1NYxe+oGoDWsDnZgqv3SImjDQEGyRDnbOrM0NgPM/LERUFjvLrG
	 oSx58zlleeQ3Q==
Received: by mail-ua1-f51.google.com with SMTP id f10so7614711uap.2
        for <loongarch@lists.linux.dev>; Thu, 11 Aug 2022 19:34:09 -0700 (PDT)
X-Gm-Message-State: ACgBeo1hOM/G1eN7XmI1N9GHhx1dsRZ3gBdJ3h5ixwX85U63MQPtUFQd
	5lwB1kEEfhW4QHgXVq+LVyB9TBTWnJIwZaQufvs=
X-Google-Smtp-Source: AA6agR6+WbrtZAEPQR/VxgTM9aNX7JjaKfQ12BxyeOcuWXr4KKHIlnFzL7+UW1nD4E7OEz2ujeDfoF7W/hXv2EUBIwo=
X-Received: by 2002:ab0:6716:0:b0:38c:cdcd:1556 with SMTP id
 q22-20020ab06716000000b0038ccdcd1556mr924620uam.63.1660271648813; Thu, 11 Aug
 2022 19:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220811130301.2431582-1-chenhuacai@loongson.cn> <2d815c7c-6187-1b38-9185-04dc3a944bd3@xen0n.name>
In-Reply-To: <2d815c7c-6187-1b38-9185-04dc3a944bd3@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 12 Aug 2022 10:33:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6iCzzyQoAhFiNsTLsuChVX-Py+YQ2MhC6z5ZtwKdm+Mg@mail.gmail.com>
Message-ID: <CAAhV-H6iCzzyQoAhFiNsTLsuChVX-Py+YQ2MhC6z5ZtwKdm+Mg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Fri, Aug 12, 2022 at 10:09 AM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/8/11 21:03, Huacai Chen wrote:
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
>
> This seems to be reverting to an earlier behavior IIRC. Both ways work
> on my 3A5000+7A1000+EDK2 combination.
>
> But, exactly because both ways work on the most typical case, would you
> mind explaining the detailed scenario where the current approach fails,
> so people have some more context both when reviewing and reading the
> code some months/years later?
In former firmware, nonboot-cpu entered the kernel with PG enabled,
but it needed firmware to maintain a temporary page table which was
unnecessary. Latest firmware let nonboot-cpu to enter kernel in DA
mode.

>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
