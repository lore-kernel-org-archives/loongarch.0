Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095128E3
	for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mwt73Igv1Cbi6CXwxAPKd0Pr+R9hvpBvRt03pYQ3bys=; b=ab3Y1GXh5hZN4kYCUal3zeuK3Q
	7SRG1cvzhO7eKodvFDYyuRae96G8g5PWd/XWhtSWcEI5MUsYEab5Ovzc8ze8gBOk9y9y/n4/VG6QA
	kxoDu7O/fG1a2giqiMnnG8GWp7V1BxUra+Jgp+oiupx2occO6L51vWUZQgeu4+7U3imdC7NUUUJ2N
	J5VaNoVksNMD06l+gxDbRhfwA3keSj0mXPL1+LX088MVxqFi6HWwWMGwF0jamw9uSp14pYO1PV0sb
	dSKJCydBYVIQlrwj2um9MWjTnI+ZTo1PEgHrvF9BZHJpiPATdBDwJ3bT9CqtMVsKHp/fep69BWHYQ
	1FAlMbCA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovxQb-00287L-Gd; Fri, 18 Nov 2022 09:12:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 78E20300487;
	Fri, 18 Nov 2022 10:12:43 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5E8232C316131; Fri, 18 Nov 2022 10:12:43 +0100 (CET)
Date: Fri, 18 Nov 2022 10:12:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
Message-ID: <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
 <xhsmhfsehy706.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhfsehy706.mognet@vschneid.remote.csb>

On Thu, Nov 17, 2022 at 02:45:29PM +0000, Valentin Schneider wrote:

> > +	if (trace_ipi_send_cpumask_enabled()) {
> > +		call_single_data_t *csd;
> > +		smp_call_func_t func;
> > +
> > +		csd = container_of(node, call_single_data_t, node.llist);
> > +
> > +		func = sched_ttwu_pending;
> > +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
> > +			func = csd->func;
> > +
> > +		if (raw_smp_call_single_queue(cpu, node))
> > +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);
> 
> So I went with the tracepoint being placed *before* the actual IPI gets
> sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
> e.g. trace_call_function_single_entry().
> 
> Packaging the call_single_queue logic makes the code less horrible, but it
> does mix up the event ordering...

Keeps em sharp ;-)

> > +		return;
> > +	}
> > +
> > +	raw_smp_call_single_queue(cpu, node);
> >  }
> >
> >  /*
> > @@ -983,10 +1017,13 @@ static void smp_call_function_many_cond(
> >                * number of CPUs might be zero due to concurrent changes to the
> >                * provided mask.
> >                */
> > -		if (nr_cpus == 1)
> > +		if (nr_cpus == 1) {
> > +			trace_ipi_send_cpumask(cpumask_of(last_cpu), _RET_IP_, func);
> >                       send_call_function_single_ipi(last_cpu);
> 
> This'll yield an IPI event even if no IPI is sent due to the idle task
> polling, no?

Oh, right..
