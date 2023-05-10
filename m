Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31206125B8
	for <loongarch@lists.linux.dev>; Wed, 10 May 2023 15:36:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-956ff2399b1so1390759866b.3
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683732978; x=1686324978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=ZZqDqy+3xbSJ1UCvw4aSekdwzGgzmnYWpLW2TxoS+SLXI7MqJDOkRxY8oqACXUNRLx
         sodDVVbPqSm3nOhr5d6CbzjhfclDyMewkONktIJU7KeSDFsJKA0RkXNBwuAtx6VMk1dX
         7+v0686SoifknkkYSqBhouyPKU2qpjfTsfDFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732978; x=1686324978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=ZsV5iQBSeRTMW08mCzn20+AKBvhsUk67xSgQdchKOTExae81uDiitgRWHUwegxJIVL
         cLUoUKqM8vwtUHGmrtEAUe8XnSjmnVZbcvUsMvBmIewoN97WXlJNOGnyscQ3FDTOqcea
         BmV3C3InXKhSfQTwJ26Tc/nzgImOO2QlxPlTkYkgkK0qnXQXl5LYc6zJTduFcO249+0x
         BA+hV43Rk6EyNGdZbeIs42iQOZhneKjIJuUlKxwCL6jP91c0ea5Q5uNrovDdRjIlU/Sa
         kQHlEbqV7TE1kmjN/6Mv7GGn5SSU4bevxC1kYF9+lPvLbPfmo+6VHlvzGQSVOdl7fQVc
         IRqQ==
X-Gm-Message-State: AC+VfDw2uxJhEwVjuWBrRfBRhyNedW62Eu/ctvyABiwbGErLQ1nF7Fkn
	t6HS8TCylzN0LHuH0BIHKIb9FdFMIUK9vvramPMDbg==
X-Google-Smtp-Source: ACHHUZ543ZcpSK/qDCfh9narEWVsmE9ZuaGq1qsUW5SSxCO9R0rolmvrAIwk0uzgdNKPWShygrDH2w==
X-Received: by 2002:a17:906:eeca:b0:965:d17b:292 with SMTP id wu10-20020a170906eeca00b00965d17b0292mr14879345ejb.60.1683732978115;
        Wed, 10 May 2023 08:36:18 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id jz10-20020a17090775ea00b00965ef79ae14sm2774326ejc.189.2023.05.10.08.36.17
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:36:17 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f423c17bafso128265e9.0
        for <loongarch@lists.linux.dev>; Wed, 10 May 2023 08:36:17 -0700 (PDT)
X-Received: by 2002:a05:600c:600f:b0:3f1:6fe9:4a98 with SMTP id
 az15-20020a05600c600f00b003f16fe94a98mr178073wmb.5.1683732511119; Wed, 10 May
 2023 08:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 May 2023 08:28:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sumit Garg <sumit.garg@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: ito-yuichi@fujitsu.com, kgdb-bugreport@lists.sourceforge.net, 
	Chen-Yu Tsai <wens@csie.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Stephen Boyd <swboyd@chromium.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-perf-users@vger.kernel.org, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Ben Dooks <ben-linux@fluff.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Jason Wessel <jason.wessel@windriver.com>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jinyang He <hejinyang@loongson.cn>, Joey Gouly <joey.gouly@arm.com>, 
	Kees Cook <keescook@chromium.org>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Qing Zhang <zhangqing@loongson.cn>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> This is an attempt to resurrect Sumit's old patch series [1] that
> allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> could find was v7, so I called this series v8. I haven't copied all of
> his old changelongs here, but you can find them from the link.
>
> Since v7, I have:
> * Addressed the small amount of feedback that was there for v7.
> * Rebased.
> * Added a new patch that prevents us from spamming the logs with idle
>   tasks.
> * Added an extra patch to gracefully fall back to regular IPIs if
>   pseudo-NMIs aren't there.
>
> Since there appear to be a few different patches series related to
> being able to use NMIs to get stack traces of crashed systems, let me
> try to organize them to the best of my understanding:
>
> a) This series. On its own, a) will (among other things) enable stack
>    traces of all running processes with the soft lockup detector if
>    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
>    its own, a) doesn't give a hard lockup detector.
>
> b) A different recently-posted series [2] that adds a hard lockup
>    detector based on perf. On its own, b) gives a stack crawl of the
>    locked up CPU but no stack crawls of other CPUs (even if they're
>    locked too). Together with a) + b) we get everything (full lockup
>    detect, full ability to get stack crawls).
>
> c) The old Android "buddy" hard lockup detector [3] that I'm
>    considering trying to upstream. If b) lands then I believe c) would
>    be redundant (at least for arm64). c) on its own is really only
>    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
>    (see [4]). a) + c) is roughly as good as a) + b).
>
> [1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-=
email-sumit.garg@linaro.org/
> [2] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecop=
zer.chen@mediatek.com/
> [3] https://issuetracker.google.com/172213097
> [4] https://issuetracker.google.com/172213129
>
> Changes in v8:
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - Add loongarch support, too
> - Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
> - "Tag the arm64 idle functions as __cpuidle" new for v8
> - "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
> - "Fallback to a regular IPI if NMI isn't enabled" new for v8
>
> Douglas Anderson (3):
>   arm64: idle: Tag the arm64 idle functions as __cpuidle
>   kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
>   arm64: ipi_nmi: Fallback to a regular IPI if NMI isn't enabled
>
> Sumit Garg (7):
>   arm64: Add framework to turn IPI as NMI
>   irqchip/gic-v3: Enable support for SGIs to act as NMIs
>   arm64: smp: Assign and setup an IPI as NMI
>   nmi: backtrace: Allow runtime arch specific override
>   arm64: ipi_nmi: Add support for NMI backtrace
>   kgdb: Expose default CPUs roundup fallback mechanism
>   arm64: kgdb: Roundup cpus using IPI as NMI
>
>  arch/arm/include/asm/irq.h       |   2 +-
>  arch/arm/kernel/smp.c            |   3 +-
>  arch/arm64/include/asm/irq.h     |   4 ++
>  arch/arm64/include/asm/nmi.h     |  17 +++++
>  arch/arm64/kernel/Makefile       |   2 +-
>  arch/arm64/kernel/idle.c         |   4 +-
>  arch/arm64/kernel/ipi_nmi.c      | 103 +++++++++++++++++++++++++++++++
>  arch/arm64/kernel/kgdb.c         |  18 ++++++
>  arch/arm64/kernel/smp.c          |   8 +++
>  arch/loongarch/include/asm/irq.h |   2 +-
>  arch/loongarch/kernel/process.c  |   3 +-
>  arch/mips/include/asm/irq.h      |   2 +-
>  arch/mips/kernel/process.c       |   3 +-
>  arch/powerpc/include/asm/nmi.h   |   2 +-
>  arch/powerpc/kernel/stacktrace.c |   3 +-
>  arch/sparc/include/asm/irq_64.h  |   2 +-
>  arch/sparc/kernel/process_64.c   |   4 +-
>  arch/x86/include/asm/irq.h       |   2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |   3 +-
>  drivers/irqchip/irq-gic-v3.c     |  29 ++++++---
>  include/linux/kgdb.h             |  13 ++++
>  include/linux/nmi.h              |  12 ++--
>  kernel/debug/debug_core.c        |   8 ++-
>  23 files changed, 217 insertions(+), 32 deletions(-)

It's been 3 weeks and I haven't heard a peep on this series. That
means nobody has any objections and it's all good to land, right?
Right? :-P

Seriously, though, I really think we should figure out how to get this
landed. There's obviously interest from several different parties and
I'm chomping at the bit waiting to spin this series according to your
wishes. I also don't think there's anything super scary/ugly here. IMO
the ideal situation is that folks are OK with the idea presented in
the last patch in the series ("arm64: ipi_nmi: Fallback to a regular
IPI if NMI isn't enabled") and then I can re-spin this series to be
_much_ simpler. That being said, I'm also OK with dropping that patch
and starting the discussion for how to land the rest of the patches in
the series.

Please let me know!

-Doug
