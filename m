Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088DC2C0
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 07:35:40 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4871e54ee84so658651e0c.2
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 00:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691393739; x=1691998539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVDqCkVf2XQJK4O1h6mLmsszxeVizs+vrchmcAeH1mM=;
        b=GgZc4HVbVwBDtKoa8hzpHopMi8083b3Mz9ORzFnG0n+Pm7hf19v0EsjuiZnteADzK9
         WVWsARUSgVcKqWXhJOGFSMBSgu3FFxGgoi8u9arCf2twrbwyJYuSgeuR4dyTSMjajF0v
         I8n7QluuJu6VAySsM5yLOwBZ9Gf6kyjHCK/fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691393739; x=1691998539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVDqCkVf2XQJK4O1h6mLmsszxeVizs+vrchmcAeH1mM=;
        b=aEckAXr9jWdEZbxV6mB75pT3/PGB3kTAc6gWaZNXeGvialWkqtxROg1hsgrGAVY8p+
         p0zwXx64ru5kINiaj4dEGzLth2Z4FFLaGo2Pznu1Yz8/SDEV3IJQ0fVnk7q0rKPoMSxV
         AEgiMyBYqWRYf6YkBcyAkBT9MrIIOMeXpNfo9eJAm/HyV0apo8+g0BzbljZdMVyoTWxl
         DvM7xGkEZbihxaSYp6Xsu3xu1f3vH8b2zpZpT3o7hCdlXyeGqsdmjVjbceHgqm7pHszt
         2/7MVjysJjQ7u96Y8HDsaxO+5Bj0j2O8iyXynWjFZHCYxyRQgm2iiV9duOr7FvW2irgb
         81aQ==
X-Gm-Message-State: AOJu0YwVEcM8t8uHvNQBCsZPqSFx+vDBWlm7rIF/U6uSIRIt4nDcV6bP
	o7d1iSsFupuN8ptNk4uE68wv2tJIl/8PMloA38d6UQ==
X-Google-Smtp-Source: AGHT+IH6RRAXW8L9icGAFpz10EPAQT37UfLDWhYNXFPOSg/fZtT1eceWby7rBEWIJ0DFUgS7mF/xa7sdfTT+OUG3tjs=
X-Received: by 2002:a1f:c8c2:0:b0:486:42c1:5f57 with SMTP id
 y185-20020a1fc8c2000000b0048642c15f57mr2773409vkf.5.1691393739460; Mon, 07
 Aug 2023 00:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804065935.v4.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
In-Reply-To: <20230804065935.v4.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 7 Aug 2023 15:35:28 +0800
Message-ID: <CAGXv+5HtYi_9mWr+m-oufYiRTzXaGRFBtqSeqbwgE2a=bYNPug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To: Douglas Anderson <dianders@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Frederic Weisbecker <frederic@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Pingfan Liu <kernelfans@gmail.com>, Qing Zhang <zhangqing@loongson.cn>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 10:01=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> The APIs that allow backtracing across CPUs have always had a way to
> exclude the current CPU. This convenience means callers didn't need to
> find a place to allocate a CPU mask just to handle the common case.
>
> Let's extend the API to take a CPU ID to exclude instead of just a
> boolean. This isn't any more complex for the API to handle and allows
> the hardlockup detector to exclude a different CPU (the one it already
> did a trace for) without needing to find space for a CPU mask.
>
> Arguably, this new API also encourages safer behavior. Specifically if
> the caller wants to avoid tracing the current CPU (maybe because they
> already traced the current CPU) this makes it more obvious to the
> caller that they need to make sure that the current CPU ID can't
> change.
>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - Renamed trigger_allbutself_cpu_backtrace() for when trigger is unsuppor=
ted.
>
> Changes in v3:
> - ("nmi_backtrace: Allow excluding an arbitrary CPU") new for v3.
>
>  arch/arm/include/asm/irq.h       |  2 +-
>  arch/arm/kernel/smp.c            |  4 ++--
>  arch/loongarch/include/asm/irq.h |  2 +-
>  arch/loongarch/kernel/process.c  |  4 ++--
>  arch/mips/include/asm/irq.h      |  2 +-
>  arch/mips/kernel/process.c       |  4 ++--
>  arch/powerpc/include/asm/irq.h   |  2 +-
>  arch/powerpc/kernel/stacktrace.c |  4 ++--
>  arch/powerpc/kernel/watchdog.c   |  4 ++--
>  arch/sparc/include/asm/irq_64.h  |  2 +-
>  arch/sparc/kernel/process_64.c   |  6 +++---
>  arch/x86/include/asm/irq.h       |  2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |  4 ++--
>  include/linux/nmi.h              | 14 +++++++-------
>  kernel/watchdog.c                |  2 +-
>  lib/nmi_backtrace.c              |  6 +++---
>  16 files changed, 32 insertions(+), 32 deletions(-)
>

[...]

> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index e3e6a64b98e0..7cf7801856a1 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -157,31 +157,31 @@ static inline void touch_nmi_watchdog(void)
>  #ifdef arch_trigger_cpumask_backtrace
>  static inline bool trigger_all_cpu_backtrace(void)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, false);
> +       arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
>         return true;
>  }
>
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> +static inline bool trigger_allbutcpu_cpu_backtrace(int exclude_cpu)
>  {
> -       arch_trigger_cpumask_backtrace(cpu_online_mask, true);
> +       arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
>         return true;
>  }
>
>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
> -       arch_trigger_cpumask_backtrace(mask, false);
> +       arch_trigger_cpumask_backtrace(mask, -1);
>         return true;
>  }
>
>  static inline bool trigger_single_cpu_backtrace(int cpu)
>  {
> -       arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
> +       arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
>         return true;
>  }
>
>  /* generic implementation */
>  void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
> -                                  bool exclude_self,
> +                                  int exclude_cpu,
>                                    void (*raise)(cpumask_t *mask));
>  bool nmi_cpu_backtrace(struct pt_regs *regs);
>
> @@ -190,7 +190,7 @@ static inline bool trigger_all_cpu_backtrace(void)
>  {
>         return false;
>  }
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> +static inline bool trigger_allbutcpu_cpu_backtrace(void)
                                                      ^
The parameter here is still wrong. It should be "int exclude_cpu".

This patch in Andrew's queue is causing build errors on next-20230807 on ar=
m64:

kernel/watchdog.c: In function =E2=80=98watchdog_timer_fn=E2=80=99:
kernel/watchdog.c:521:25: error: too many arguments to function
=E2=80=98trigger_allbutcpu_cpu_backtrace=E2=80=99
  521 |
trigger_allbutcpu_cpu_backtrace(smp_processor_id());
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from kernel/watchdog.c:17:
./include/linux/nmi.h:193:20: note: declared here
  193 | static inline bool trigger_allbutcpu_cpu_backtrace(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:243: kernel/watchdog.o] Error 1


ChenYu
