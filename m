Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB52187C
	for <loongarch@lists.linux.dev>; Sun,  9 Oct 2022 06:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11E4C433B5
	for <loongarch@lists.linux.dev>; Sun,  9 Oct 2022 06:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665296136;
	bh=FXMIi4X/yLKllQTQawao9abCe7Z+/qcgFVtJRXh+Q6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ugmSW59EkGNtQPaGv+m8tLRYNpRz/M/F+bTWjcUh2OpRnH6WJiI7IovegMkB0PQky
	 tGMc1q3+ns1AT7rjo+c7t5AQUiCB7NnrnJGa7bSHb3OEwiqCgE5duQ2HX5p/NSJSYh
	 DyCcN18sY9jkJPVvDAjCZ8T0vTlRDvogVw17QHRtpAf0zi7aVj995MsX1pPUwZq0zZ
	 XyyveacWb6HSJefARt321crIV/SAm7R9Tyvmfxg65679By3tCjr0GWYDOEHtOBGSFk
	 UF68frUz7GyzbMuRm3Ml3BzSGzfgwFzKtoRYhY3nwBlU2jaLQiS994HNEIALqysxpM
	 DuI/iJ4MfcgGg==
Received: by mail-ed1-f49.google.com with SMTP id w10so12034662edd.4
        for <loongarch@lists.linux.dev>; Sat, 08 Oct 2022 23:15:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf06OXU2SRgji+9JncGr1jCbt1HnMUXs1cXx7zEd9hA3TCI6fjsw
	Mpqp2piR4R7qW/AD4TlLU5eU/BM0UlOznjPqm6g=
X-Google-Smtp-Source: AMsMyM4Yjw/zx7cxOFT+P1VBQW2FA2Yvg9l2Iud5hBYeYyKSQazuLQiFgqafd6jQYFrO171zZPWuWVorWsM6/1OtlUM=
X-Received: by 2002:a05:6402:c81:b0:458:c428:173a with SMTP id
 cm1-20020a0564020c8100b00458c428173amr12031575edb.298.1665296134980; Sat, 08
 Oct 2022 23:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1665278582-16038-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1665278582-16038-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Oct 2022 14:15:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6nT5AMrgWa-FPO_cbvQbSajeoUvDskKGVys9-hsNcGvg@mail.gmail.com>
Message-ID: <CAAhV-H6nT5AMrgWa-FPO_cbvQbSajeoUvDskKGVys9-hsNcGvg@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Do not create sysfs control file for io
 master CPUs
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-next, thanks.

Huacai

On Sun, Oct 9, 2022 at 9:23 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Now io master CPUs are not hotpluggable on LoongArch, in the current code,
> only /sys/devices/system/cpu/cpu0/online is not created, let us set the
> hotpluggable field of all the io master CPUs as 0, then prevent to create
> sysfs control file for the other io master CPUs which confuses some user
> space tools. This is similar with commit 9cce844abf07 ("MIPS: CPU#0 is not
> hotpluggable").
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/bootinfo.h | 5 +++++
>  arch/loongarch/kernel/smp.c           | 5 -----
>  arch/loongarch/kernel/topology.c      | 3 ++-
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/bootinfo.h b/arch/loongarch/include/asm/bootinfo.h
> index 8e5881b..ed0910e 100644
> --- a/arch/loongarch/include/asm/bootinfo.h
> +++ b/arch/loongarch/include/asm/bootinfo.h
> @@ -40,4 +40,9 @@ extern unsigned long fw_arg0, fw_arg1, fw_arg2;
>  extern struct loongson_board_info b_info;
>  extern struct loongson_system_configuration loongson_sysconf;
>
> +static inline bool io_master(int cpu)
> +{
> +       return test_bit(cpu, &loongson_sysconf.cores_io_master);
> +}
> +
>  #endif /* _ASM_BOOTINFO_H */
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index b5fab30..781a4d4 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -240,11 +240,6 @@ void loongson3_smp_finish(void)
>
>  #ifdef CONFIG_HOTPLUG_CPU
>
> -static bool io_master(int cpu)
> -{
> -       return test_bit(cpu, &loongson_sysconf.cores_io_master);
> -}
> -
>  int loongson3_cpu_disable(void)
>  {
>         unsigned long flags;
> diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
> index ab1a75c..caa7cd8 100644
> --- a/arch/loongarch/kernel/topology.c
> +++ b/arch/loongarch/kernel/topology.c
> @@ -5,6 +5,7 @@
>  #include <linux/node.h>
>  #include <linux/nodemask.h>
>  #include <linux/percpu.h>
> +#include <asm/bootinfo.h>
>
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> @@ -40,7 +41,7 @@ static int __init topology_init(void)
>         for_each_present_cpu(i) {
>                 struct cpu *c = &per_cpu(cpu_devices, i);
>
> -               c->hotpluggable = !!i;
> +               c->hotpluggable = !io_master(i);
>                 ret = register_cpu(c, i);
>                 if (ret < 0)
>                         pr_warn("topology_init: register_cpu %d failed (%d)\n", i, ret);
> --
> 2.1.0
>
