Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4710FF
	for <loongarch@lists.linux.dev>; Sat,  4 Feb 2023 01:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E9FC433AF
	for <loongarch@lists.linux.dev>; Sat,  4 Feb 2023 01:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675473165;
	bh=0asfVCpuy+ETCtLElPtYddrgJX0d+emBWsKYbAvgUSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NjHUnR2SMV6z1nYlDsx18pdaYVqRNoWc0qy+JZKYvWy9A2/aNWDT/Zcc1VuN3LpBk
	 BHO7a+UWkrCbr7tIMsbiJcW08mJQrutSae8sjzbY2yTquduGD1S75JptE2V94CuHZ9
	 dttGDlygN+PlAgKrEnBbh02BTSkPcbJjD/mmZ2OjVdwp+2zUSzzJYuLie36CRMRH2m
	 BCNEg1yW8DiqcrRuXnMz7q97kPUCf/igZlztYEFMXkxu4lTgwVsHT2Y4vPB+fv2I45
	 treDdxLfVm4Xo9kIGz/U0PB3fSsQxF7GAvG09BPdoaWSqVqEDw/Bl5+LonXCOZV8EM
	 8X69FQT7ZO2hA==
Received: by mail-ej1-f51.google.com with SMTP id qw12so20033384ejc.2
        for <loongarch@lists.linux.dev>; Fri, 03 Feb 2023 17:12:45 -0800 (PST)
X-Gm-Message-State: AO0yUKXkkjd5rkK57esUvdb4qBLdNJPDMxfF6XChjxxkuHn6JNPB0qFj
	JD8xBtDePrpa2msyUS5En686ezVy7CMje7AtGwo=
X-Google-Smtp-Source: AK7set8d2wN/FrByoELlHyIqk75D2M0EbNicNZv8b+fs1zPJUylkd4dAYoofH/2BIYKRkzzgrVhuEwXH3PfZW7NSuUo=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr3300870ejx.120.1675473163646; Fri, 03
 Feb 2023 17:12:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675461757.git.jpoimboe@kernel.org> <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
In-Reply-To: <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Feb 2023 09:12:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
Message-ID: <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
Subject: Re: [PATCH 05/22] csky/cpu: Make sure arch_cpu_idle_dead() doesn't return
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, 
	richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	linux-alpha@vger.kernel.org, linux@armlinux.org.uk, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, 
	ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, 
	davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	linux-xtensa@linux-xtensa.org, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023 at 6:05 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> BUG().
>
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/csky/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> index b45d1073307f..0ec20efaf5fd 100644
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -317,5 +317,7 @@ void arch_cpu_idle_dead(void)
>                 "jmpi   csky_start_secondary"
>                 :
>                 : "r" (secondary_stack));
> +
> +       BUG();
Why not:
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index f26ab2675f7d..1d3bf903add2 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -285,6 +285,7 @@ static void do_idle(void)
                        tick_nohz_idle_stop_tick();
                        cpuhp_report_idle_dead();
                        arch_cpu_idle_dead();
+                       BUG();
                }

                arch_cpu_idle_enter();

>  }
>  #endif
> --
> 2.39.0
>


-- 
Best Regards
 Guo Ren
