Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA37B
	for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E823C3411E
	for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658307668;
	bh=vij3xEAreA0G5szeWk88+d4Xp57P6c4ll2m+XCxei8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O5Wg1M9j1o/NGtP/V0wOdyp6Sb/+31Lpnf5yGATdQVx9KdJpKYjCM8AY9dgsCVwD+
	 wLstczMebtKfXc0Ar3+/nu6UmkcmVtKrhOkDvh9VCdCPsJgH28tqLNu4JJA4sfAstZ
	 4Z0rOAnumJRejbI0Hz/ssEvWu5bbrjP6/KaZeUiDWlEbk8QcMKu7Ksu2IFyfIfhALS
	 anK1PVDv/lbMA5Y7B6rQlFdKQCf7r+nPdybjbn7wAhORqKk1bpJaKCJ2+hYgaJFANr
	 t68rdrPscBWD4TlC7i91tDrNtLShQEajiB4LtqCupFz2VGO5i/0p41heejm7CowMrI
	 pCj0hJ7EPJBmA==
Received: by mail-ua1-f54.google.com with SMTP id t21so7766331uaq.3
        for <loongarch@lists.linux.dev>; Wed, 20 Jul 2022 02:01:08 -0700 (PDT)
X-Gm-Message-State: AJIora8apqFw0TH4v7v7aYinfVKrAb+C9G02IQ7rltwP3FdnEvt/0hZv
	3M7En7AKkbi3H/FCOqLW+aEKIaYhKhmwl66brNA=
X-Google-Smtp-Source: AGRyM1uzuCkEWr8GdNBqK0qQcQu6vZNJfhOZ771XERIbrKrdEjicTad3sHXaky/ZCMV5I2IQd9jw3HxI2kAEmIpe0mI=
X-Received: by 2002:a9f:3253:0:b0:383:c330:68 with SMTP id y19-20020a9f3253000000b00383c3300068mr9795065uad.104.1658307666982;
 Wed, 20 Jul 2022 02:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720072152.3894559-1-maobibo@loongson.cn>
In-Reply-To: <20220720072152.3894559-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 20 Jul 2022 17:00:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6tdimtT4P6LTaR7iMbL9ChF5_RDEFZPZvm-gQrtTotMA@mail.gmail.com>
Message-ID: <CAAhV-H6tdimtT4P6LTaR7iMbL9ChF5_RDEFZPZvm-gQrtTotMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] LoongArch: Remove clock setting during cpu hotplug stage
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Bibo,

This series looks good to me, but I want to wait for some time to see
if others have comments. Thanks.

Huacai

On Wed, Jul 20, 2022 at 3:22 PM Bibo Mao <maobibo@loongson.cn> wrote:
>
> On physical machine we can save power by disabling clock of hot removed cpu.
> However there will be problem, since different platforms have different clock
> setting methods, the code is platform relative. Also it can be in firmware/pmu
> compoments or cpu regulator driver, rather than general loongarch cpu booting
> flow.
>
> Also on qemu virt machine, device clock/freq setting is not
> emulated, there is no such registers.
>
> This patch removes hard-coded register accessing in generic
> loongarch cpu boot flow.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kernel/smp.c | 29 -----------------------------
>  include/linux/cpuhotplug.h  |  1 -
>  2 files changed, 30 deletions(-)
>
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 73cec62504fb..98b3e059d344 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -359,35 +359,6 @@ void play_dead(void)
>         play_dead_uncached(state_addr);
>  }
>
> -static int loongson3_enable_clock(unsigned int cpu)
> -{
> -       uint64_t core_id = cpu_data[cpu].core;
> -       uint64_t package_id = cpu_data[cpu].package;
> -
> -       LOONGSON_FREQCTRL(package_id) |= 1 << (core_id * 4 + 3);
> -
> -       return 0;
> -}
> -
> -static int loongson3_disable_clock(unsigned int cpu)
> -{
> -       uint64_t core_id = cpu_data[cpu].core;
> -       uint64_t package_id = cpu_data[cpu].package;
> -
> -       LOONGSON_FREQCTRL(package_id) &= ~(1 << (core_id * 4 + 3));
> -
> -       return 0;
> -}
> -
> -static int register_loongson3_notifier(void)
> -{
> -       return cpuhp_setup_state_nocalls(CPUHP_LOONGARCH_SOC_PREPARE,
> -                                        "loongarch/loongson:prepare",
> -                                        loongson3_enable_clock,
> -                                        loongson3_disable_clock);
> -}
> -early_initcall(register_loongson3_notifier);
> -
>  #endif
>
>  /*
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 19f0dbfdd7fe..b66c5f389159 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -130,7 +130,6 @@ enum cpuhp_state {
>         CPUHP_ZCOMP_PREPARE,
>         CPUHP_TIMERS_PREPARE,
>         CPUHP_MIPS_SOC_PREPARE,
> -       CPUHP_LOONGARCH_SOC_PREPARE,
>         CPUHP_BP_PREPARE_DYN,
>         CPUHP_BP_PREPARE_DYN_END                = CPUHP_BP_PREPARE_DYN + 20,
>         CPUHP_BRINGUP_CPU,
> --
> 2.31.1
>
>
