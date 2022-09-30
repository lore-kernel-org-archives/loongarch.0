Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07C1841
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 02:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCF1C433B5
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 02:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664506011;
	bh=7uHs5ffuQbKGyXNDulGC3t0jRBhSu2WNu5pcQA2muxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qiq8UKdTUUWZVfxy0VUmiZIOdnUEiAIC5EqAC0xVMaH8MHTHwInvuJPbvceH06AwR
	 haD5EXdYG3YEgi08IJeOohRxQtWu2Nomkzdah82tv6Ht8ZFDoVxFb4WhjaFS9H9NoY
	 opZ5yIr+yxaiza3Q+X22Sppfigp/aYbN91L0zMHeusywiEBsf6AnSsQHzInWvx6mZT
	 1bPIyVkd4rZtMc2TL2355pu+OLK59aAo52cgl3odoMJs1lOLv2BJhReufSxasEFjUw
	 M3Yy71p0Hty5hsmXvdD/Q2kNtQpbbw8miMwbLW6hrjeZLD3nlbvZWwnqJ9d2T0zILC
	 iuqim8+02JLGw==
Received: by mail-ua1-f46.google.com with SMTP id e3so1239063uax.4
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 19:46:51 -0700 (PDT)
X-Gm-Message-State: ACrzQf2KQQYJeUG2bUgIlDrc/Uo1/oKgt0nV19fYOlQ7lXBMIj0hfEw8
	P1Mp5TCaHME8BtzrtfI1i4BvyA+rJclmg6uC1nM=
X-Google-Smtp-Source: AMsMyM5qttjkPyZyc+M5lKc8jOKOUC/sz9KoJYFj+hYTRZzNIcvARyEZYSIvXCe2triYyhAEwIYNWyf+Hd0Lz0aqPkA=
X-Received: by 2002:ab0:25d3:0:b0:3ae:6580:2adc with SMTP id
 y19-20020ab025d3000000b003ae65802adcmr3655719uan.23.1664506010802; Thu, 29
 Sep 2022 19:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929101445.32124-1-lukas.bulwahn@gmail.com>
 <CAAhV-H6xe4o0upxcQTN=8BeDdcDipmoRp+QQNiakJJZ_eneTxg@mail.gmail.com> <CAKXUXMwhF4V1=oNq1XaTmQpk_Tt7ZXfZEmK_r_GT6wz7=vVx2g@mail.gmail.com>
In-Reply-To: <CAKXUXMwhF4V1=oNq1XaTmQpk_Tt7ZXfZEmK_r_GT6wz7=vVx2g@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 30 Sep 2022 10:46:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
Message-ID: <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
Subject: Re: [PATCH] loongarch: update config files
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 6:44 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Sep 29, 2022 at 12:42 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Lukas,
> >
> > Thank you for your patch, it is queued for loongarch-next, and may be
> > squashed to another patch with your S-o-B if you have no objections.
> >
> > Huacai
> >
>
> Feel free to squash as you see fit. I cannot recall sending something
> specific for loongarch-next, though.
Emmm, my meaning is squash your patch to mine and keep a S-o-B in that
patch [1]. :)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?h=loongarch-next

Huacai

>
> Lukas
>
> > On Thu, Sep 29, 2022 at 6:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > Clean up config files by:
> > >   - removing configs that were deleted in the past
> > >   - removing configs not in tree and without recently pending patches
> > >   - adding new configs that are replacements for old configs in the file
> > >
> > > For some detailed information, see Link.
> > >
> > > Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > ---
> > >  arch/loongarch/configs/loongson3_defconfig | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >
> > > diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
> > > index 3712552e18d3..2b4220778b66 100644
> > > --- a/arch/loongarch/configs/loongson3_defconfig
> > > +++ b/arch/loongarch/configs/loongson3_defconfig
> > > @@ -108,14 +108,12 @@ CONFIG_NETFILTER=y
> > >  CONFIG_BRIDGE_NETFILTER=m
> > >  CONFIG_NETFILTER_NETLINK_LOG=m
> > >  CONFIG_NF_CONNTRACK=m
> > > -CONFIG_NF_LOG_NETDEV=m
> > >  CONFIG_NF_CONNTRACK_AMANDA=m
> > >  CONFIG_NF_CONNTRACK_FTP=m
> > >  CONFIG_NF_CONNTRACK_NETBIOS_NS=m
> > >  CONFIG_NF_CONNTRACK_TFTP=m
> > >  CONFIG_NF_CT_NETLINK=m
> > >  CONFIG_NF_TABLES=m
> > > -CONFIG_NFT_COUNTER=m
> > >  CONFIG_NFT_CONNLIMIT=m
> > >  CONFIG_NFT_LOG=m
> > >  CONFIG_NFT_LIMIT=m
> > > @@ -329,7 +327,6 @@ CONFIG_PARPORT_PC_FIFO=y
> > >  CONFIG_ZRAM=m
> > >  CONFIG_ZRAM_DEF_COMP_ZSTD=y
> > >  CONFIG_BLK_DEV_LOOP=y
> > > -CONFIG_BLK_DEV_CRYPTOLOOP=y
> > >  CONFIG_BLK_DEV_NBD=m
> > >  CONFIG_BLK_DEV_RAM=y
> > >  CONFIG_BLK_DEV_RAM_SIZE=8192
> > > @@ -505,7 +502,6 @@ CONFIG_ATH9K_HTC=m
> > >  CONFIG_IWLWIFI=m
> > >  CONFIG_IWLDVM=m
> > >  CONFIG_IWLMVM=m
> > > -CONFIG_IWLWIFI_BCAST_FILTERING=y
> > >  CONFIG_HOSTAP=m
> > >  CONFIG_MT7601U=m
> > >  CONFIG_RT2X00=m
> > > @@ -688,7 +684,6 @@ CONFIG_COMEDI_NI_PCIDIO=m
> > >  CONFIG_COMEDI_NI_PCIMIO=m
> > >  CONFIG_STAGING=y
> > >  CONFIG_R8188EU=m
> > > -# CONFIG_88EU_AP_MODE is not set
> > >  CONFIG_PM_DEVFREQ=y
> > >  CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> > >  CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> > > @@ -772,14 +767,12 @@ CONFIG_CRYPTO_CRYPTD=m
> > >  CONFIG_CRYPTO_CHACHA20POLY1305=m
> > >  CONFIG_CRYPTO_HMAC=y
> > >  CONFIG_CRYPTO_VMAC=m
> > > -CONFIG_CRYPTO_TGR192=m
> > >  CONFIG_CRYPTO_WP512=m
> > >  CONFIG_CRYPTO_ANUBIS=m
> > >  CONFIG_CRYPTO_BLOWFISH=m
> > >  CONFIG_CRYPTO_CAST5=m
> > >  CONFIG_CRYPTO_CAST6=m
> > >  CONFIG_CRYPTO_KHAZAD=m
> > > -CONFIG_CRYPTO_SALSA20=m
> > >  CONFIG_CRYPTO_SEED=m
> > >  CONFIG_CRYPTO_SERPENT=m
> > >  CONFIG_CRYPTO_TEA=m
> > > --
> > > 2.17.1
> > >
> > >
