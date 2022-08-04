Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A2639
	for <loongarch@lists.linux.dev>; Thu,  4 Aug 2022 03:19:57 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id x184so6761060vka.11
        for <loongarch@lists.linux.dev>; Wed, 03 Aug 2022 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JEJULrzPwdNHQ/ggnVhsmc574+1cmbi28gF+VqoMdE8=;
        b=ItzlZ6X4RZlRxPA+fabyikpNA4YcicwUY0cHPfuM5fV5YqCUytGaKaK02kZX26BTM3
         HC8BswlviJMjctrZXbCTD2+thmqvKuLAQnLGotp+RVxDY01bOYAmVr3+tcOc7Yv55gqE
         oqsC7lyK4jfcQke1f+jNKxtnbavpN6gQPiRr/jEXSPeFqoaiMvwsO/PTpyDlqdlPNScO
         zIrQkSw5vo81od6o6OxRWpfOb6PgifQqqP4rCOzLEPWL5GQaepZnbvkE+8JU4hH+HfN4
         RZS1zZp9bHye/GY29utpcHi0ykhJ1zxMUsrAzmz5TswEJUOSO2CxReB7LhMFg73kA3HJ
         06Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JEJULrzPwdNHQ/ggnVhsmc574+1cmbi28gF+VqoMdE8=;
        b=Ymn8NE24p9lqpqOrYv2boSmMbgFByLL555aNNylQqGtA8kDws2QjwaCQ6gdz7eEWCf
         waYnEFpgIP3SYf83w31riu5IRZMVQRncEWpM4Dh7OGFgPecvl4BGFtxOqGRJZAsVYmou
         E7TCTGHus5ZI6XwN6x+Hb+/gemtyTc6AZsEDmBM5BZSL8AAf25tBJaDBp0/uuNGXKzmY
         Gj1z2T9z/gce9afZSKFIGTMJhBrOrs1zRgmfkZKue+PMqy/ZCtlwRZPvn8udirhxVEHT
         sdJL0grBzcf26Dv/pGXwNvcUF+++54bSyqVvey39cqXhMoTb5WgvEDB1Z6mkBEA1mmxM
         LKSw==
X-Gm-Message-State: ACgBeo3BG/WB/+U2+hqqYK2zfvnwPV6mWHUEpW4l4uICNqPmg66Wa+44
	nlCE5VENpbQDHIg65FVyVNKYmFQ0x4RXGyN1s5k=
X-Google-Smtp-Source: AA6agR6bH+ek1y8K4AkXf/Y74zT5MSmemJUfzKo66bH1768Q3KVDwlOYLRz6o3ECUoJFFiKUohxftcesm2tIu0ufDPM=
X-Received: by 2002:a1f:b248:0:b0:377:aa0c:941 with SMTP id
 b69-20020a1fb248000000b00377aa0c0941mr5792434vkf.37.1659583196085; Wed, 03
 Aug 2022 20:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220804025457.213979-1-chenhuacai@loongson.cn>
In-Reply-To: <20220804025457.213979-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 4 Aug 2022 11:19:41 +0800
Message-ID: <CAAhV-H7J=mofWtm99pSzvcByLxf3-in1BkopBFSYh1hF0_dQ6w@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-eiointc: Fix a build warning
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Marc,

Other build warnings reported by lkp due to the missing CONFIG_ACPI in
randconfig. So they will be fixed by adjusting arch/loongarch/Kconfig
and going through loongarch tree. Thanks.

Huacai

On Thu, Aug 4, 2022 at 10:54 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Make acpi_get_vec_parent() be a static function, to avoid:
> drivers/irqchip/irq-loongson-eiointc.c:289:20: warning: no previous prototype for 'acpi_get_vec_parent'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
> index 317467857478..bffb7b3128e8 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -290,7 +290,7 @@ static void acpi_set_vec_parent(int node, struct irq_domain *parent, struct acpi
>         }
>  }
>
> -struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group *vec_group)
> +static struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group *vec_group)
>  {
>         int i;
>
> --
> 2.31.1
>
