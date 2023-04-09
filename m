Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1971360
	for <loongarch@lists.linux.dev>; Sun,  9 Apr 2023 01:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0B8C4339C
	for <loongarch@lists.linux.dev>; Sun,  9 Apr 2023 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681004706;
	bh=3SYGLnydrT6U3B3mbzApI6UyguCUIgtRBx1wg6L0WIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3abUllHd6tUByytut79S+//VAgNDqJXSYBaTqKQA7IhA3ZfyylmeWIoFNPST1izu
	 xC8VuRzoFgpb+EtqAuGi0H6p0g/hIoCuQfd8C9hnZIXdSWNfk6XDYGUV18e5LMkmdV
	 j0PvKSwvbieJlOV+V/o9YEudIvUXhSYSGfnPhN/2gNtM/g9TUtVX6ucfEkRMPvCawx
	 qAEvtIA5Bz6kzTYcJOlFizhw+as8JQCdwFXClP9/LNgEa00rZrgL+zb9WFH6BpgiRp
	 2MUNjdOqZTXq2ji1D8FgnJtQ0sf38JmOTpJSbEhaV/lRFfP7Ewt/tvbA7y91OLHzOE
	 c1l04UaL/D/SA==
Received: by mail-ej1-f44.google.com with SMTP id sh8so5034795ejc.10
        for <loongarch@lists.linux.dev>; Sat, 08 Apr 2023 18:45:06 -0700 (PDT)
X-Gm-Message-State: AAQBX9c0tn/TwUoWeK9vZ6mdFZwd3IUMarCV4xnQfQvWTKR7Gu4+JKGt
	o1GW7MWcc4K9y5gn5NE5pKpL7O/7aLRJBVjvfaw=
X-Google-Smtp-Source: AKy350aXfl3i+ozWe0us1Eu0tkBIFe3pvFanAx5pvJQuBpocgywnM8ZhqLVq3vPmuQw+A6MtrsYrbypt3OdposEHMUM=
X-Received: by 2002:a17:907:7207:b0:942:3d67:34bc with SMTP id
 dr7-20020a170907720700b009423d6734bcmr1882126ejc.10.1681004704599; Sat, 08
 Apr 2023 18:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407083453.6305-1-lvjianmin@loongson.cn>
In-Reply-To: <20230407083453.6305-1-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Apr 2023 09:44:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40eg-cufG87k_vGbAShuSu3ceTn9uqFjwS+kqT+SYzhw@mail.gmail.com>
Message-ID: <CAAhV-H40eg-cufG87k_vGbAShuSu3ceTn9uqFjwS+kqT+SYzhw@mail.gmail.com>
Subject: Re: [PATCH V3 0/5] Fix some issues of irq controllers for
 dual-bridges scenario
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Apr 7, 2023 at 4:35=E2=80=AFPM Jianmin Lv <lvjianmin@loongson.cn> w=
rote:
>
> In dual-bridges scenario, some bugs were found for irq
> controllers drivers, so the patch serie is used to fix them.
>
> V2->V3:
> 1. Add Cc: stable@vger.kernel.org to make them be backported to stable br=
anch
>
> V1->V2:
> 1. Remove all of ChangeID in patches
> 2. Exchange the sequence of some patches
> 3. Adjust code style of if...else... in patch[2]
>
> Jianmin Lv (5):
>   irqchip/loongson-eiointc: Fix returned value on parsing MADT
>   irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
>   irqchip/loongson-eiointc: Fix registration of syscore_ops
>   irqchip/loongson-pch-pic: Fix registration of syscore_ops
>   irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling
>
>  drivers/irqchip/irq-loongson-eiointc.c | 32 ++++++++++++++++++--------
>  drivers/irqchip/irq-loongson-pch-pic.c |  6 ++++-
>  2 files changed, 27 insertions(+), 11 deletions(-)
>
> --
> 2.31.1
>
>
