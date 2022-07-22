Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E515A2
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDBEC341CA
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658476409;
	bh=0rWD6IhMSmnn/yENDINDtNOKv7uQ8o7Z0wFATJ5tHqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AmPL0VtFF4MfDH2WdLD97TF/gXY+zGcseTKEYT2Z47JNC1CJ0tBnWSonB/kUlV6Sg
	 EahG4rJA+4J1je0SjmlNQ5ah7gKFLVZfBDodM0rKisyNDkN48sbDhxnSh1XJqUCz4r
	 y6Ja31JSCl/V3Mu9Nd73DX2uxaStoK6PIjEEb+UAtXx7puQbFhGcX3xNWoB4nuBzOu
	 QWgRgmAtp9swCUFhOAayiF+VIE00gnllDXOlAhCO82GiHoxBwXXyP9/yKSp3506hw0
	 b+0Cse1Kly6HZVkFOG5uMOsxvI5sLIg5S0hHq3bFXSlLcARSs9dnjuCKYAlKk9wbrb
	 xgXf2fDGFDR4Q==
Received: by mail-vk1-f181.google.com with SMTP id b81so1749222vkf.1
        for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 00:53:28 -0700 (PDT)
X-Gm-Message-State: AJIora/qH/zFsBb1kwNXklox3jbx0fHgORtKPwhRnCdmPJeLU1veP5Zc
	Nsqy3fAogOnGcaYKy/YiRfAAoElD8iPSLWPhlAU=
X-Google-Smtp-Source: AGRyM1vaSrwm+5gJWQ/+0V5YH5UYSN0K6Nf+f62IsleKM9iW1Kms3Q1N5fkagYAxuZDdcqG29apS9LGOTJThVpEMNU8=
X-Received: by 2002:a05:6122:1825:b0:376:78:5015 with SMTP id
 ay37-20020a056122182500b0037600785015mr770718vkb.18.1658476407744; Fri, 22
 Jul 2022 00:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1658397181-2095-1-git-send-email-yangtiezhu@loongson.cn> <6c89e5de-927d-2cf1-1ed5-fef882f45a5a@xen0n.name>
In-Reply-To: <6c89e5de-927d-2cf1-1ed5-fef882f45a5a@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 22 Jul 2022 15:53:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4B1cZD5a2NMpRE5Nbm=tGPsTf8xA5A+CohsQia3vwtuQ@mail.gmail.com>
Message-ID: <CAAhV-H4B1cZD5a2NMpRE5Nbm=tGPsTf8xA5A+CohsQia3vwtuQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix wrong "ROM Size" of boardinfo
To: WANG Xuerui <kernel@xen0n.name>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Tiezhu,

If this patch is really needed, please also send a patch for our
internal LTS kernel repo, thanks.

Huacai

On Fri, Jul 22, 2022 at 3:49 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/7/21 17:53, Tiezhu Yang wrote:
> > We can see the "ROM Size" is different in the following outputs:
> >
> > [root@linux loongson]# cat /sys/firmware/loongson/boardinfo
> > BIOS Information
> > Vendor                  : Loongson
> > Version                 : vUDK2018-LoongArch-V2.0.pre-beta8
> > ROM Size                : 63 KB
> > Release Date            : 06/15/2022
> >
> > Board Information
> > Manufacturer            : Loongson
> > Board Name              : Loongson-LS3A5000-7A1000-1w-A2101
> > Family                  : LOONGSON64
> >
> > [root@linux loongson]# dmidecode | head -11
> > ...
> > Handle 0x0000, DMI type 0, 26 bytes
> > BIOS Information
> >       Vendor: Loongson
> >       Version: vUDK2018-LoongArch-V2.0.pre-beta8
> >       Release Date: 06/15/2022
> >       ROM Size: 4 MB
> >
> > According to "BIOS Information (Type 0) structure" in the SMBIOS
> > Reference Specification [1], it shows 64K * (n+1) is the size of
> > the physical device containing the BIOS if the size is less than
> > 16M.
> >
> > Additionally, we can see the related code in dmidecode [2]:
> >
> >    u64 s = { .l = (code1 + 1) << 6 };
> >
> > So the output of dmidecode is correct, the output of boardinfo
> > is wrong, fix it.
> >
> > By the way, at present no need to consider the size is 16M or
> > greater on LoongArch, because it is usually 4M or 8M which is
> > enough to use.
> Although the commit message is a bit Chinglish, the inclusion of code
> and snippets have all complemented the description, so overall it
> doesn't hamper understanding and I'm mostly okay with it.
> >
> > [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.pdf
> > [2] https://git.savannah.nongnu.org/cgit/dmidecode.git/tree/dmidecode.c#n347
> >
> > Fixes: 628c3bb40e9a ("LoongArch: Add boot and setup routines")
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >   arch/loongarch/kernel/setup.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> > index c74860b..8f5c2f9 100644
> > --- a/arch/loongarch/kernel/setup.c
> > +++ b/arch/loongarch/kernel/setup.c
> > @@ -126,7 +126,7 @@ static void __init parse_bios_table(const struct dmi_header *dm)
> >       char *dmi_data = (char *)dm;
> >
> >       bios_extern = *(dmi_data + SMBIOS_BIOSEXTERN_OFFSET);
> > -     b_info.bios_size = *(dmi_data + SMBIOS_BIOSSIZE_OFFSET);
> > +     b_info.bios_size = (*(dmi_data + SMBIOS_BIOSSIZE_OFFSET) + 1) << 6;
> >
> >       if (bios_extern & LOONGSON_EFI_ENABLE)
> >               set_bit(EFI_BOOT, &efi.flags);
>
> I've tested on real 3A5000 hardware and confirmed this is working.
>
> $ cat /sys/firmware/loongson/boardinfo
> BIOS Information
> Vendor                  : Loongson
> Version                 : vUDK2018-LoongArch-V2.0.pre-beta8
> ROM Size                : 4096 KB
> Release Date            : 06/15/2022
>
> Board Information
> Manufacturer            : Loongson
> Board Name              : Loongson-LS3A5000-7A1000-1w-A2101
> Family                  : LOONGSON64
>
>
> So,
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
>
