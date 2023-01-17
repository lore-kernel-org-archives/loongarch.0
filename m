Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854E1FC2
	for <loongarch@lists.linux.dev>; Tue, 17 Jan 2023 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=82O7MPpmKDKH/y6naoktZs3WQBLC/PHyEl3Wjqd7/dM=; b=ncsUyaVTQh9fhCexlcLhcCRL9S
	NS41uihsn8PZ17VRTMIIzlrwWNAiQRiZ+A4KgC02XPY3VKPipXvA16q7pUrG6TIkjLDcbi+W3slKi
	h85JYKde28tJS9HLnAiNQ+McUjM7BTsRbUDLFJN9zQZYCnlMQqI+CXescHjmHAOgmblkdCG63TjI5
	hsx9HymmLMz+M4j+0M4z1OxRHRUY9AkKLozOO195MLFu+M+9o7/ZBcr0hniqbdURCPdODH0YEGjlO
	dFmo4sxsYm5aXL3MhIme6f3DivnrrXzkntnOlOoyjw7VtAnFKHFuSFkW50SdsVFAEpGeHYVZ8ifC/
	LYIAtIQA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pHhj2-005saH-0S;
	Tue, 17 Jan 2023 08:53:48 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E36D3002BF;
	Tue, 17 Jan 2023 09:53:52 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46751201ABB3C; Tue, 17 Jan 2023 09:53:52 +0100 (CET)
Date: Tue, 17 Jan 2023 09:53:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
	nsekhar@ti.com, brgl@bgdev.pl, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, anup@brainfault.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, atishp@atishpatra.org,
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, rostedt@goodmis.org,
	frederic@kernel.org, paulmck@kernel.org, pmladek@suse.com,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, ryabinin.a.a@gmail.com,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com,
	Andrew Morton <akpm@linux-foundation.org>, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 35/51] trace,hardirq: No moar _rcuidle() tracing
Message-ID: <Y8ZiIMHyXX/yW1EI@hirez.programming.kicks-ass.net>
References: <20230112194314.845371875@infradead.org>
 <20230112195541.477416709@infradead.org>
 <20230117132446.02ec12e4c10718de27790900@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117132446.02ec12e4c10718de27790900@kernel.org>

On Tue, Jan 17, 2023 at 01:24:46PM +0900, Masami Hiramatsu wrote:
> Hi Peter,
> 
> On Thu, 12 Jan 2023 20:43:49 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > Robot reported that trace_hardirqs_{on,off}() tickle the forbidden
> > _rcuidle() tracepoint through local_irq_{en,dis}able().
> > 
> > For 'sane' configs, these calls will only happen with RCU enabled and
> > as such can use the regular tracepoint. This also means it's possible
> > to trace them from NMI context again.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> The code looks good to me. I just have a question about comment.
> 
> > ---
> >  kernel/trace/trace_preemptirq.c |   21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > --- a/kernel/trace/trace_preemptirq.c
> > +++ b/kernel/trace/trace_preemptirq.c
> > @@ -20,6 +20,15 @@
> >  static DEFINE_PER_CPU(int, tracing_irq_cpu);
> >  
> >  /*
> > + * ...
> 
> Is this intended? Wouldn't you leave any comment here?

I indeed forgot to write the comment before posting, my bad :/ Ingo fixed
it up when he applied.
