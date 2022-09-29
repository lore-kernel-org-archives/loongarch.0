Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC9E1116
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 10:44:20 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 63so1041341ybq.4
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eVyC2om8iRoc+83iT4ksvNh32e+purWPgzjisBjHf1E=;
        b=XUrDyfJfsz4U7znQLZEvfXt8cEYHbg3TbLkWorTXz3GRClA4xqJZExeqhFyfcLZMD0
         qlXGoGmqxoS37LqldIfgGzotYC8plIDksSsKU6wap32qxE6lw9uCe896QbkWy39myt9e
         RT9mCaJQMcrLxJVNGYldQXrkxQ5RF9Pzoeme3/LFRzTAlu5wiifHa6y3WyuILT7IjNEt
         ALcoMQKpbCNC4NTpzJ9IF4+1LXpQb6e/HzUHQKf3cYbOfViphd81T6LsI3i/kfgRlmeZ
         lRWiTLPyYQcqgqXSY2WGpYMDgpQDC+hM0flQn7diMbrACijdU9o2cL65EahRRoiQeaL/
         qo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eVyC2om8iRoc+83iT4ksvNh32e+purWPgzjisBjHf1E=;
        b=SsODmjt7AvBwYBpGTIR3deCwYsqzVu/I5m/vP/yvjQlVfSokSONGT9oF8j0XGllxsz
         QICXdjtFQiro3PhdnwkpHnVs2CRTHwhR4IIfLP4Tqp4yDxte6HdM6L2SjVssnW9QdD6c
         nhLkKa4VnxNtPdvgUPdYYbqXvCeyH2dWqJ+OmzuTHWQX9zgNIIVDbW2mpxfrn+9lE5NG
         +ICsGqAzjsWzAtfAsc+OS0rj6j6sw1jRg/L2btaSS2RQmB423kZHfJJp6a1PSbuVYhVQ
         7LaBeYAsJTgHvy3Geb8E8xsZA0kbFVhVIz5sCvKP5SkxfFF09WHC/SsGAsOn9wjBRx3l
         XIpA==
X-Gm-Message-State: ACrzQf2msMayvkdTG4/hKD0MBJqyLT75scNwirUCM/TlM4lu85iDNad1
	UrhshpbppNF5KtALVGXl2LJ2gjGIG3hoeYnXcck=
X-Google-Smtp-Source: AMsMyM6PYClyn52CoVXC0dXvBu4NXduY1WxQbcZaJsVZl+aqoBY12GbZ7shAI5oyE6urDGJcnZNGSgY17CFRG7+Z01E=
X-Received: by 2002:a25:37d8:0:b0:6bc:99af:2991 with SMTP id
 e207-20020a2537d8000000b006bc99af2991mr2316477yba.389.1664448259243; Thu, 29
 Sep 2022 03:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929101445.32124-1-lukas.bulwahn@gmail.com> <CAAhV-H6xe4o0upxcQTN=8BeDdcDipmoRp+QQNiakJJZ_eneTxg@mail.gmail.com>
In-Reply-To: <CAAhV-H6xe4o0upxcQTN=8BeDdcDipmoRp+QQNiakJJZ_eneTxg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 29 Sep 2022 12:44:08 +0200
Message-ID: <CAKXUXMwhF4V1=oNq1XaTmQpk_Tt7ZXfZEmK_r_GT6wz7=vVx2g@mail.gmail.com>
Subject: Re: [PATCH] loongarch: update config files
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 12:42 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Lukas,
>
> Thank you for your patch, it is queued for loongarch-next, and may be
> squashed to another patch with your S-o-B if you have no objections.
>
> Huacai
>

Feel free to squash as you see fit. I cannot recall sending something
specific for loongarch-next, though.

Lukas

> On Thu, Sep 29, 2022 at 6:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Clean up config files by:
> >   - removing configs that were deleted in the past
> >   - removing configs not in tree and without recently pending patches
> >   - adding new configs that are replacements for old configs in the file
> >
> > For some detailed information, see Link.
> >
> > Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  arch/loongarch/configs/loongson3_defconfig | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
> > index 3712552e18d3..2b4220778b66 100644
> > --- a/arch/loongarch/configs/loongson3_defconfig
> > +++ b/arch/loongarch/configs/loongson3_defconfig
> > @@ -108,14 +108,12 @@ CONFIG_NETFILTER=y
> >  CONFIG_BRIDGE_NETFILTER=m
> >  CONFIG_NETFILTER_NETLINK_LOG=m
> >  CONFIG_NF_CONNTRACK=m
> > -CONFIG_NF_LOG_NETDEV=m
> >  CONFIG_NF_CONNTRACK_AMANDA=m
> >  CONFIG_NF_CONNTRACK_FTP=m
> >  CONFIG_NF_CONNTRACK_NETBIOS_NS=m
> >  CONFIG_NF_CONNTRACK_TFTP=m
> >  CONFIG_NF_CT_NETLINK=m
> >  CONFIG_NF_TABLES=m
> > -CONFIG_NFT_COUNTER=m
> >  CONFIG_NFT_CONNLIMIT=m
> >  CONFIG_NFT_LOG=m
> >  CONFIG_NFT_LIMIT=m
> > @@ -329,7 +327,6 @@ CONFIG_PARPORT_PC_FIFO=y
> >  CONFIG_ZRAM=m
> >  CONFIG_ZRAM_DEF_COMP_ZSTD=y
> >  CONFIG_BLK_DEV_LOOP=y
> > -CONFIG_BLK_DEV_CRYPTOLOOP=y
> >  CONFIG_BLK_DEV_NBD=m
> >  CONFIG_BLK_DEV_RAM=y
> >  CONFIG_BLK_DEV_RAM_SIZE=8192
> > @@ -505,7 +502,6 @@ CONFIG_ATH9K_HTC=m
> >  CONFIG_IWLWIFI=m
> >  CONFIG_IWLDVM=m
> >  CONFIG_IWLMVM=m
> > -CONFIG_IWLWIFI_BCAST_FILTERING=y
> >  CONFIG_HOSTAP=m
> >  CONFIG_MT7601U=m
> >  CONFIG_RT2X00=m
> > @@ -688,7 +684,6 @@ CONFIG_COMEDI_NI_PCIDIO=m
> >  CONFIG_COMEDI_NI_PCIMIO=m
> >  CONFIG_STAGING=y
> >  CONFIG_R8188EU=m
> > -# CONFIG_88EU_AP_MODE is not set
> >  CONFIG_PM_DEVFREQ=y
> >  CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> >  CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> > @@ -772,14 +767,12 @@ CONFIG_CRYPTO_CRYPTD=m
> >  CONFIG_CRYPTO_CHACHA20POLY1305=m
> >  CONFIG_CRYPTO_HMAC=y
> >  CONFIG_CRYPTO_VMAC=m
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> >  CONFIG_CRYPTO_CAST5=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SEED=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> > --
> > 2.17.1
> >
> >
