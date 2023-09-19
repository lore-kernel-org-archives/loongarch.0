Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDA531A65
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 16:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A1DC43391
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695140151;
	bh=l+nvWlCRLD6m7tXJtYKPxQ5GcwH9Qne96/LVVg2mIYA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kApe79fhQVxUGaQ4mry/0tf8D1oVtpPxdAG1GwmMRBqc5wMgTBSRgE8mD+jlNNOr9
	 oPN4DgB4BH/ydIfZsPapRpCdpdOW50epQTWCIcOTYi//Nzv3S4z+BIOLzxFQGU1DyX
	 rKRWJbnrGyZ44to8v2aNzlb9b5X6hNFBXhX8QlZvR5piD14oxTcXogCf73oAvnccSf
	 m4mtMhzAyq6FbJGNSPTCVEz/Jy0hY07CXJrLzYWejTf25FfibgpIB+2L94lymeE8sY
	 Xljh00FpFiZ8Wdg74ybMbNeBmW/zfabsCFy5tWCWP7HjOQHyTAvKZ9CMFMkUulyK9W
	 ppnT2ym8WIm5w==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-530c9980556so4122498a12.2
        for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 09:15:51 -0700 (PDT)
X-Gm-Message-State: AOJu0YwI7kkIIoNMiJ39Zy4vjNMJcCppaCf1zuysZhjidTNojQS3C1Nl
	qViuT5zaZCvcV7seg2G0RxF7Bkq/8nma+e1dgeQ=
X-Google-Smtp-Source: AGHT+IEFJubbNL2v5ghbEClmcqFm+vzvdHtJ9q0Txb0CWZ9yQWMjHzNbleb2RTNpe6zd6z5Vm/CB0fTzeW0QjbrjNOI=
X-Received: by 2002:aa7:c708:0:b0:52f:6641:4ecd with SMTP id
 i8-20020aa7c708000000b0052f66414ecdmr11595083edq.37.1695140149689; Tue, 19
 Sep 2023 09:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693623752.git.zhoubinbin@loongson.cn> <16a37f6ad3cc9417b6638c2cd532d88c79468eb1.1693623752.git.zhoubinbin@loongson.cn>
 <885eab85-2c11-cf20-9187-55cd647fbe9f@infradead.org> <c7604f6c-4da7-47c4-abe9-e626b3efc665@infradead.org>
 <20230919-9ce82588fccdd641574b468c@fedora>
In-Reply-To: <20230919-9ce82588fccdd641574b468c@fedora>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 20 Sep 2023 00:15:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73kp8zWJD7AKUvknmxow=f_cPBw9jctpmced6o_QCF6w@mail.gmail.com>
Message-ID: <CAAhV-H73kp8zWJD7AKUvknmxow=f_cPBw9jctpmced6o_QCF6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] soc: loongson: loongson2_pm: Add dependency for INPUT
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor,

On Tue, Sep 19, 2023 at 11:48=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Sep 19, 2023 at 08:36:50AM -0700, Randy Dunlap wrote:
> > Hi--
> >
> > On 9/2/23 08:43, Randy Dunlap wrote:
> > >
> > >
> > > On 9/2/23 01:47, Binbin Zhou wrote:
> > >> Since commit 67694c076bd7 ("soc: loongson2_pm: add power management
> > >> support"), the Loongson-2K PM driver was added, but it didn't update=
 the
> > >> Kconfig entry for the INPUT dependency, leading to build errors:
> > >>
> > >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-l=
inux-ld:
> > >> drivers/soc/loongson/loongson2_pm.o: in function `loongson2_power_bu=
tton_init':
> > >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/l=
oongson2_pm.c:101:(.text+0x350): undefined reference to `input_allocate_dev=
ice'
> > >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-l=
inux-ld:
> > >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/l=
oongson2_pm.c:109:(.text+0x3dc): undefined reference to `input_set_capabili=
ty'
> > >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-l=
inux-ld:
> > >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/l=
oongson2_pm.c:111:(.text+0x3e4): undefined reference to `input_register_dev=
ice'
> > >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-l=
inux-ld:
> > >> /work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/l=
oongson2_pm.c:125:(.text+0x3fc): undefined reference to `input_free_device'
> > >> /opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-l=
inux-ld: drivers/soc/loongson/loongson2_pm.o: in function `input_report_key=
':
> > >> /work/lnx/next/linux-next-20230825/LOONG64/../include/linux/input.h:=
425:(.text+0x58c): undefined reference to `input_event'
> > >>
> > >> Also, since this driver can only be built-in, it fails to link when =
the
> > >> INPUT is in a loadable module, so we should update the Kconfig entry=
 to
> > >> depend on INPUT=3Dy.
> > >>
> > >> Fixes: 67694c076bd7 ("soc: loongson2_pm: add power management suppor=
t")
> > >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > >> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > >
> > > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > >
> > > Thanks.
> >
> > What's the status of this patch?
> > linux-next builds are still failing without this patch.
>
> Likely suffering (still) from:
>
> https://lore.kernel.org/all/58500dc7-af1b-4edb-bb2b-93be454ec151@app.fast=
mail.com/
>
> :)
>
> Seemingly this was sent again in isolation 2 weeks ago, but neither the
> maintainer (Huacai) nor soc@kernel.org were on cc:
>
> https://lore.kernel.org/all/20230905123629.4510-1-zhuyinbo@loongson.cn/
v3 indeed cc-ed soc@kernel.org. :)

Arnd, could you please take this series to the soc tree? And also this seri=
es:
https://lore.kernel.org/loongarch/cover.1693534134.git.zhoubinbin@loongson.=
cn/T/#t

Thanks,
Huacai

>
> /shrug
> Conor.
>
> >
> > Thanks.
> >
> > >
> > >> ---
> > >>  drivers/soc/loongson/Kconfig | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/drivers/soc/loongson/Kconfig b/drivers/soc/loongson/Kco=
nfig
> > >> index 314e13bb3e01..368344943a93 100644
> > >> --- a/drivers/soc/loongson/Kconfig
> > >> +++ b/drivers/soc/loongson/Kconfig
> > >> @@ -20,6 +20,7 @@ config LOONGSON2_GUTS
> > >>  config LOONGSON2_PM
> > >>    bool "Loongson-2 SoC Power Management Controller Driver"
> > >>    depends on LOONGARCH && OF
> > >> +  depends on INPUT=3Dy
> > >>    help
> > >>      The Loongson-2's power management controller was ACPI, supports=
 ACPI
> > >>      S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Su=
spend To
> > >
> >
> > --
> > ~Randy
