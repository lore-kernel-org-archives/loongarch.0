Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32992365
	for <loongarch@lists.linux.dev>; Wed,  5 Oct 2022 12:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFE5C433D6
	for <loongarch@lists.linux.dev>; Wed,  5 Oct 2022 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664973048;
	bh=MUH/5Nr9NH5nKvpp0g6W1q0YMvqiwhZO2hEEaGu7mjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uNkQZys6eTVye1mUdQlmmPlOzfcPR4HVn4+cBENggnv0hjY/R7ncfpjGyssN4t7u8
	 WyaJfbsbSONZ2w6dut04UzBU0rH7Gn2fAz1bkhWqMEg46XGLTruf4qerOC7A3wL30x
	 khjyz5RvzQv/QfzwqN5AY3MOZOsEMICr0XTM7isnK2VSaZQ4nvG7x8uZOn8o5AoUL0
	 pse87rtFEj08C3l2ZgjOtQlXsF7uKe4/vPMMupSJO4Ee4ZfHEaDM2CHGr2LeTdHSqO
	 CsjHkDbQ0la+igFccgmQTJ4hVhhh0wIo5URoSih3Mt8J1L0qzpxPIiD6c9WHWLnHno
	 Lw4pIiRn2pptw==
Received: by mail-ej1-f44.google.com with SMTP id qn17so2261074ejb.0
        for <loongarch@lists.linux.dev>; Wed, 05 Oct 2022 05:30:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf0wz3bKbi91B/NS1/oEkeDNfJHzhAML5jnRUindlplm76LsemJN
	09FCrDwCsLHnACnN2VNp+KCvb/veQIi0oVi4haw=
X-Google-Smtp-Source: AMsMyM5L8hCj4bFlWh0VlM5kabk6auuvY8ux7t4b2Vc2ydVwZHKt3XLpUTraCw25wFlUiOkTFbotGZGrl8iYa+Ajy/Y=
X-Received: by 2002:a17:907:a05a:b0:78d:225c:bbc3 with SMTP id
 gz26-20020a170907a05a00b0078d225cbbc3mr4319639ejc.224.1664973047171; Wed, 05
 Oct 2022 05:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yz1t6rPLOzKT8Id+@debian>
In-Reply-To: <Yz1t6rPLOzKT8Id+@debian>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 5 Oct 2022 20:30:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7FoDEEtqF_ZOwTGPeGK-4wpzsxEqvO+iuq=KpEuDUofQ@mail.gmail.com>
Message-ID: <CAAhV-H7FoDEEtqF_ZOwTGPeGK-4wpzsxEqvO+iuq=KpEuDUofQ@mail.gmail.com>
Subject: Re: build failure of next-20221005 due to 4078ec1ef5ed ("LoongArch:
 Use TLB for ioremap()")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Sudip,

This seems a false positive. When the implementation of iounmap() is
empty (but this is completely legal I think), these drivers will cause
"unused variable error".

Huacai

On Wed, Oct 5, 2022 at 7:43 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The builds of loongarch allmodconfig have failed to build next-20221005
> with errors
>
> sound/soc/mediatek/common/mtk-btcvsd.c: In function 'mtk_btcvsd_snd_remove':
> sound/soc/mediatek/common/mtk-btcvsd.c:1394:32: error: unused variable 'btcvsd' [-Werror=unused-variable]
>  1394 |         struct mtk_btcvsd_snd *btcvsd = dev_get_drvdata(&pdev->dev);
>       |                                ^~~~~~
>
>
> sound/soc/sof/intel/hda.c: In function 'hda_dsp_remove':
> sound/soc/sof/intel/hda.c:1185:26: error: unused variable 'bus' [-Werror=unused-variable]
>  1185 |         struct hdac_bus *bus = sof_to_bus(sdev);
>       |                          ^~~
>
>
> drivers/mfd/asic3.c: In function 'asic3_mfd_remove':
> drivers/mfd/asic3.c:940:23: error: unused variable 'asic' [-Werror=unused-variable]
>   940 |         struct asic3 *asic = platform_get_drvdata(pdev);
>       |                       ^~~~
>
>
> drivers/gpu/drm/exynos/exynos7_drm_decon.c: In function 'decon_remove':
> drivers/gpu/drm/exynos/exynos7_drm_decon.c:771:31: error: unused variable 'ctx' [-Werror=unused-variable]
>   771 |         struct decon_context *ctx = dev_get_drvdata(&pdev->dev);
>       |
>
>
> git bisect pointed to 4078ec1ef5ed ("LoongArch: Use TLB for ioremap()")
>
> I will be happy to test any patch or provide any extra log if needed.
>
>
> --
> Regards
> Sudip
>
