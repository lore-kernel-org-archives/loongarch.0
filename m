Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604AFEA9
	for <loongarch@lists.linux.dev>; Tue, 19 Jul 2022 01:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E37C341CA
	for <loongarch@lists.linux.dev>; Tue, 19 Jul 2022 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658192790;
	bh=kxYeyaK98bc49giE1gnQxza3GWs0xyyloJIWb1p7nFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j1mW32TX4YT5UN6008LS3wplo2TVAGEE+RwjNqvKdCfAf1IqgGcTAlGGUBPljihyC
	 FjCozzppXnyog//1c750BPzGcHRO8kjycyOCsbGYmKo0KKifaX3+NQDw+b3pSle/3a
	 zd/Eaye/SSlrE2WFXFeQteusYnVxcw84IsploopQsG0/8OgVOfdFt/djSZW2rRVnQE
	 299eY+M9V5ynPxw+4dosEsQSFTkAOFxRa+39GpESqmNNQVBCEoejzgvsFtEGIB4j+7
	 sPMajEgjFuN+JOL3vCir2rqJyEEpVfDPngsjr4Wls1yD2s5lzUR1KjHx+MP8IrwKOZ
	 Eq3rcrdGK8g1w==
Received: by mail-vs1-f47.google.com with SMTP id l190so12121006vsc.0
        for <loongarch@lists.linux.dev>; Mon, 18 Jul 2022 18:06:29 -0700 (PDT)
X-Gm-Message-State: AJIora9TnGhgyqc89QCqDGt6ToapqPxCMBIIgLq5/0iopoC9NTBmjpY9
	cAiQXJBKuYBf/9q+/9tlbtJa5993t6tPH7/7p5g=
X-Google-Smtp-Source: AGRyM1uXkHqJ1jNNkLUVfs4Y4LMdgPemWq2w9gsknKl2suGR1qyJLOuATeoavOgl15eseE6H341Zr1h3xGAmgqy0Bz4=
X-Received: by 2002:a67:ec05:0:b0:357:7a48:cba8 with SMTP id
 d5-20020a67ec05000000b003577a48cba8mr11370704vso.78.1658192788918; Mon, 18
 Jul 2022 18:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1658153621-40445-1-git-send-email-lvjianmin@loongson.cn> <1658153621-40445-8-git-send-email-lvjianmin@loongson.cn>
In-Reply-To: <1658153621-40445-8-git-send-email-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 19 Jul 2022 09:06:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7VRwAEELp_OrGsk7Rj73Xbwj-4A0yoyaxpMspPV83W3A@mail.gmail.com>
Message-ID: <CAAhV-H7VRwAEELp_OrGsk7Rj73Xbwj-4A0yoyaxpMspPV83W3A@mail.gmail.com>
Subject: Re: [PATCH V16 07/14] irqchip: remove COMPILE_TEST for pch-pic and pch-msi
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, loongarch@lists.linux.dev, 
	Hanjun Guo <guohanjun@huawei.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Jianmin,

This patch can be squashed into "irqchip/loongson-pch-pic: Add ACPI
init support" and "irqchip/loongson-pch-msi: Add ACPI init support",
thanks.

Huacai

On Mon, Jul 18, 2022 at 10:13 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
> From: Huacai Chen <chenhuacai@loongson.cn>
>
> Loongson's pch-pic and pch-msi will have some arch-specific
> code, so we remove the COMPILE_TEST dependency to avoid build
> warnings.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> ---
>  drivers/irqchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index c1d527f..8844e6b 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -574,7 +574,7 @@ config LOONGSON_HTVEC
>
>  config LOONGSON_PCH_PIC
>         bool "Loongson PCH PIC Controller"
> -       depends on MACH_LOONGSON64 || COMPILE_TEST
> +       depends on MACH_LOONGSON64
>         default MACH_LOONGSON64
>         select IRQ_DOMAIN_HIERARCHY
>         select IRQ_FASTEOI_HIERARCHY_HANDLERS
> @@ -583,7 +583,7 @@ config LOONGSON_PCH_PIC
>
>  config LOONGSON_PCH_MSI
>         bool "Loongson PCH MSI Controller"
> -       depends on MACH_LOONGSON64 || COMPILE_TEST
> +       depends on MACH_LOONGSON64
>         depends on PCI
>         default MACH_LOONGSON64
>         select IRQ_DOMAIN_HIERARCHY
> --
> 1.8.3.1
>
>
