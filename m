Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D415A5
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 02:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5C5C3411E
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 02:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658457713;
	bh=xavck+mfMP0z5ZogTwR3JahixUh3QtLQC7XQ95ds+s4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RGPZQ+JOTZy9DExehtfHBMU6uUSrn/iSwMM4exLjNqIyFFOLnoyWY8W8+F4AXr6M6
	 tvacNhWotErN1SL2YXw7AlFoVIv60QRxHlFge9V7NySlktLRLIrGk11g6uJM0bqK0U
	 a4PoUGGgsg/dAnwLTnZC2DsRgwP1dy8EKH2n93ygfI9yrdfK/a+AJ2BqK2jPCVGNre
	 Q4n82gFd8Qhh4rxIU3/S8qss85PXr4q88GKrRpreRJjs4T3YAffZ97En7I6LzOYgA2
	 VevKqXz2OojziVOIc5oBuFk3UGNGDDeZbSviT+au33MMHmkhstNEAfXUtcORSdICOv
	 dpl7NZxtEg8uA==
Received: by mail-vk1-f181.google.com with SMTP id m30so1550276vkl.4
        for <loongarch@lists.linux.dev>; Thu, 21 Jul 2022 19:41:53 -0700 (PDT)
X-Gm-Message-State: AJIora8MQGvKR9s97ktL7GIW6h20cC2W2OrODGF0nBLOYU1yfd5VdArO
	wg6K4v+5bTkcMonsLtbLRPUJ+nBsH0TdeMySmwY=
X-Google-Smtp-Source: AGRyM1vifaQjeModGQlhpHoldb4kZ4m5SMkqNhmlkPGitXKFguWl9MbPd4msopVtdHO4VzFyF9V7eyUA1i0RR4I6PxM=
X-Received: by 2002:a1f:a887:0:b0:36c:8458:b061 with SMTP id
 r129-20020a1fa887000000b0036c8458b061mr412967vke.19.1658457712542; Thu, 21
 Jul 2022 19:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220722004231.91114-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220722004231.91114-1-yang.lee@linux.alibaba.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 22 Jul 2022 10:41:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Ap=3UvnZsXwiYsX-WtuyP9i25j1oCT-fY9JRnDGvihA@mail.gmail.com>
Message-ID: <CAAhV-H7Ap=3UvnZsXwiYsX-WtuyP9i25j1oCT-fY9JRnDGvihA@mail.gmail.com>
Subject: Re: [PATCH -next] LoongArch: Fix unsigned comparison with less than zero
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Yang Li,

Thank you for your patch. This looks good to me and will be queued for
5.20, since Marc said he will not rebase his branch. :)

Huacai

On Fri, Jul 22, 2022 at 8:42 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> The return from the call to get_timer_irq() is int, it can be
> a negative error code, however this is being assigned to an
> unsigned int variable 'irq', so making 'irq' an int.
>
> Eliminate the following coccicheck warning:
> ./arch/loongarch/kernel/time.c:146:5-8: WARNING: Unsigned expression compared with zero: irq < 0
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/loongarch/kernel/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 79dc5eddf504..786735dcc8d6 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -135,7 +135,7 @@ static int get_timer_irq(void)
>
>  int constant_clockevent_init(void)
>  {
> -       unsigned int irq;
> +       int irq;
>         unsigned int cpu = smp_processor_id();
>         unsigned long min_delta = 0x600;
>         unsigned long max_delta = (1UL << 48) - 1;
> --
> 2.20.1.7.g153144c
>
