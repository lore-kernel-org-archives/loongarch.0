Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA1EC5EC
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 19:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE92C433EF;
	Tue, 14 Feb 2023 19:29:45 +0000 (UTC)
Date: Tue, 14 Feb 2023 14:29:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 linux-kernel@vger.kernel.org, jgross@suse.com,
 richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 chris@zankel.net, jcmvbkbc@gmail.com, linux-xtensa@linux-xtensa.org,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Message-ID: <20230214142944.100214fe@rorschach.local.home>
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
	<cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
	<1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
	<20230214182322.r5tyeowxzloiuh72@treble>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Feb 2023 10:23:22 -0800
Josh Poimboeuf <jpoimboe@kernel.org> wrote:


> void __ref cpu_die(void)
> {
> 	idle_task_exit();
> 	local_irq_disable();
> 	__asm__ __volatile__(
> 			"	movi	a2, cpu_restart\n"
> 			"	jx	a2\n");
> 
> 	BUG();
> }
> 
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Agreed, that does not look right at all.

-- Steve

> 
> Max/Chris?
> 

