Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3C1841
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 08:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9484BC433D7
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668501110;
	bh=HhcFH+cadi57qTWbydHQdoKaz29QoMHUVpKX9PxEtsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A5CiupwYH8+BO8Nd/6yw0kQBMp/4zN7GL7KoQGLo6/9Vq1+tNz97T0oheaEAN2FDd
	 WGBKiD0XS9Prx729B8lwDT31wLVTdOmrSmLfX+rmPj1qg31K+SBVoGzeJxLjaa7mNJ
	 qlsTlGjpROnYtTA7XNPdDweRHP0Bp427g3+vk6pwZnXtHgTPNVTzMSJ/NGA2N/aR9T
	 YruKv0ZSYd3gl6WWDM3qS3cNJYBPxfn+9oTpJcszdyOaQOAipU7BPumPjgSR/5pQvc
	 Ut75Wy1hKHP0RN6M1mFuMKyFryvRaNTJvFJBOoz3FpeXt671+GAK6Nu3/pFkEE6fwx
	 5/PD0m5HM0JVA==
Received: by mail-ed1-f44.google.com with SMTP id l11so20845648edb.4
        for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 00:31:50 -0800 (PST)
X-Gm-Message-State: ANoB5pm+TGQHIWTzzNzhk+WyEwvpHPeuWRof9vINZnpu+wqovQXfjTT5
	dSMnTMzqhjKY6BM3qQbtGjEBbihazS+yPLejkQg=
X-Google-Smtp-Source: AA0mqf48zfzMA14DyPoh+Ghu+RUlJPZcKfa5azAGVTnXzRlBdVSZuqAE7DFsi2PIRKckonj7bDwcYXCWZ8wwqZTKgY8=
X-Received: by 2002:a05:6402:3715:b0:462:32bf:613a with SMTP id
 ek21-20020a056402371500b0046232bf613amr13628347edb.78.1668501108788; Tue, 15
 Nov 2022 00:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221115025527.13382-1-zhangqing@loongson.cn> <20221115025527.13382-10-zhangqing@loongson.cn>
In-Reply-To: <20221115025527.13382-10-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 15 Nov 2022 16:31:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5YnpRu=mcdmHy=x9MstTmfFgHU=WV4ZBd49PBkeeZjAA@mail.gmail.com>
Message-ID: <CAAhV-H5YnpRu=mcdmHy=x9MstTmfFgHU=WV4ZBd49PBkeeZjAA@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Qing,

I suggest not enabling debug mechanisms in the default config file,
distribution configs can make their own decisions.

Huacai

On Tue, Nov 15, 2022 at 10:55 AM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> Defaults enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS to convenient
> ftrace tests.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/configs/loongson3_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
> index 2d4678e6189a..0bbab17609b0 100644
> --- a/arch/loongarch/configs/loongson3_defconfig
> +++ b/arch/loongarch/configs/loongson3_defconfig
> @@ -34,6 +34,7 @@ CONFIG_SYSFS_DEPRECATED=y
>  CONFIG_RELAY=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> +CONFIG_KALLSYMS_ALL=y
>  CONFIG_USERFAULTFD=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_COMPAT_BRK is not set
> @@ -845,6 +846,7 @@ CONFIG_CRYPTO_DEV_VIRTIO=m
>  CONFIG_PRINTK_TIME=y
>  CONFIG_STRIP_ASM_SYMS=y
>  CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
>  CONFIG_SCHEDSTATS=y
>  # CONFIG_DEBUG_PREEMPT is not set
> --
> 2.36.0
>
>
