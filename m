Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5262FAF
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679504486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZS63eR35hQQpuztlWGnGcv/jaBVlYMjTvbdWWfPWAY=;
	b=FgVeN3ywielGmnIKlkUxi2lu2L66Njnin9F4bXjtVV4gsVezh0NCxRL602DyedZptsYGqb
	kglwzYbFR3gz8OgPL4HYr6SdRVUy5Mr1nUj5JeH5iBjGPOlALjTmezPMMFGKxXzXBM/CcD
	lWoj5C7S62XFCa+7gWNchCXmw9TLrsU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-sWs2epszOYaonyzIrH6tOg-1; Wed, 22 Mar 2023 13:01:22 -0400
X-MC-Unique: sWs2epszOYaonyzIrH6tOg-1
Received: by mail-oi1-f199.google.com with SMTP id bg21-20020a056808179500b003869b702d75so7864144oib.17
        for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 10:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679504482;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZS63eR35hQQpuztlWGnGcv/jaBVlYMjTvbdWWfPWAY=;
        b=3nCo0yvfFeWgdeQ8tSPyJJM0Mw/c0ZTXbutzu+NajJfbeT0VXfX07TkZRZp/4c5Ij2
         y058+pxtCSgBoVIfMIogv8dM2PStSmaJwvVqIws24ZnVrOO1xQaRST54/YCva8RKA+b7
         pNwwzAIGZdf6dlWBTzoC22EgLNgyUOZXwpKjJJViZvA4bkFYy95taMwo75GUL2VgIdJl
         d8ARFiOZnG7FNYhi81zJPYsAAg6zBwqcy8OD4PmINQj9203pdZOMinGrE6i5H8FIHGVE
         SjxHySm7KWM7ePe6sTYS84sWEUcfUgAN1QPib9lS80BJTVW8doFMKX1Axq1LSxjKYIEz
         4tmg==
X-Gm-Message-State: AO0yUKWCo3azO3/HiY7kYBBnpOlD8/8fbr0wVVJe/YBVFQEkImlkWpza
	+NTewIyq1sjfLsIepQewWuQwajzmSxkYLXL7eHjBiAFwPKPx9YbPoZ39EoZe8FJTRcOO7ylbAvf
	Pp3HdvajBhXYu0ZwAU3gn
X-Received: by 2002:a05:6830:1397:b0:69b:c665:95ef with SMTP id d23-20020a056830139700b0069bc66595efmr1849088otq.32.1679504481961;
        Wed, 22 Mar 2023 10:01:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OhxWG20qH1i/Yp6i2el5aA4zIJA9CTIhUo/MbvkBAyasdde0EdhDBEsgwB6QV+kPj7JTH5w==
X-Received: by 2002:a05:6830:1397:b0:69b:c665:95ef with SMTP id d23-20020a056830139700b0069bc66595efmr1849034otq.32.1679504481408;
        Wed, 22 Mar 2023 10:01:21 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id g19-20020a05620a40d300b007290be5557bsm11733172qko.38.2023.03.22.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:01:20 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
Date: Wed, 22 Mar 2023 17:01:13 +0000
Message-ID: <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 22/03/23 15:04, Peter Zijlstra wrote:
> On Wed, Mar 22, 2023 at 12:20:28PM +0000, Valentin Schneider wrote:
>> On 22/03/23 10:53, Peter Zijlstra wrote:
>
>> > Hurmph... so we only really consume @func when we IPI. Would it not be
>> > more useful to trace this thing for *every* csd enqeued?
>>
>> It's true that any CSD enqueued on that CPU's call_single_queue in the
>> [first CSD llist_add()'ed, IPI IRQ hits] timeframe is a potential source of
>> interference.
>>
>> However, can we be sure that first CSD isn't an indirect cause for the
>> following ones? say the target CPU exits RCU EQS due to the IPI, there's a
>> bit of time before it gets to flush_smp_call_function_queue() where some other CSD
>> could be enqueued *because* of that change in state.
>>
>> I couldn't find a easy example of that, I might be biased as this is where
>> I'd like to go wrt IPI'ing isolated CPUs in usermode. But regardless, when
>> correlating an IPI IRQ with its source, we'd always have to look at the
>> first CSD in that CSD stack.
>
> So I was thinking something like this:
>
> ---
> Subject: trace,smp: Trace all smp_function_call*() invocations
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Mar 22 14:58:36 CET 2023
>
> (Ab)use the trace_ipi_send_cpu*() family to trace all
> smp_function_call*() invocations, not only those that result in an
> actual IPI.
>
> The queued entries log their callback function while the actual IPIs
> are traced on generic_smp_call_function_single_interrupt().
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/smp.c |   58 ++++++++++++++++++++++++++++++----------------------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
>
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -106,18 +106,20 @@ void __init call_function_init(void)
>  }
>
>  static __always_inline void
> -send_call_function_single_ipi(int cpu, smp_call_func_t func)
> +send_call_function_single_ipi(int cpu)
>  {
>       if (call_function_single_prep_ipi(cpu)) {
> -		trace_ipi_send_cpu(cpu, _RET_IP_, func);
> +		trace_ipi_send_cpu(cpu, _RET_IP_,
> +				   generic_smp_call_function_single_interrupt);

Hm, this does get rid of the func being passed down the helpers, but this
means the trace events are now stateful, i.e. I need the first and last
events in a CSD stack to figure out which one actually caused the IPI.

It also requires whoever is looking at the trace to be aware of which IPIs
are attached to a CSD, and which ones aren't. ATM that's only the resched
IPI, but per the cover letter there's more to come (e.g. tick_broadcast()
for arm64/riscv and a few others). For instance:

       hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0
       hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=sched_ttwu_pending+0x0
       hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=generic_smp_call_function_single_interrupt+0x0

That first one sent a RESCHEDULE IPI, the second one a CALL_FUNCTION one,
but you really have to know what you're looking at...

Are you worried about the @func being pushed down? Staring at x86 asm is
not good for the soul, but AFAICT this does cause an extra register to be
popped in the prologue because all of the helpers are __always_inline, so
both paths of the static key(s) are in the same stackframe.

I can "improve" this with:

---
diff --git a/kernel/smp.c b/kernel/smp.c
index 5cd680a7e78ef..55f120dae1713 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -511,6 +511,26 @@ raw_smp_call_single_queue(int cpu, struct llist_node *node, smp_call_func_t func
 
 static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
 
+static noinline void __smp_call_single_queue_trace(int cpu, struct llist_node *node)
+{
+	call_single_data_t *csd;
+	smp_call_func_t func;
+
+
+	/*
+	 * We have to check the type of the CSD before queueing it, because
+	 * once queued it can have its flags cleared by
+	 *   flush_smp_call_function_queue()
+	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
+	 * executes migration_cpu_stop() on the remote CPU).
+	 */
+	csd = container_of(node, call_single_data_t, node.llist);
+	func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
+		sched_ttwu_pending : csd->func;
+
+	raw_smp_call_single_queue(cpu, node, func);
+}
+
 void __smp_call_single_queue(int cpu, struct llist_node *node)
 {
 #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
@@ -525,25 +545,10 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
 		}
 	}
 #endif
-	/*
-	 * We have to check the type of the CSD before queueing it, because
-	 * once queued it can have its flags cleared by
-	 *   flush_smp_call_function_queue()
-	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
-	 * executes migration_cpu_stop() on the remote CPU).
-	 */
-	if (trace_ipi_send_cpumask_enabled()) {
-		call_single_data_t *csd;
-		smp_call_func_t func;
-
-		csd = container_of(node, call_single_data_t, node.llist);
-		func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
-			sched_ttwu_pending : csd->func;
-
-		raw_smp_call_single_queue(cpu, node, func);
-	} else {
+	if (trace_ipi_send_cpumask_enabled())
+		__smp_call_single_queue_trace(cpu, node);
+	else
 		raw_smp_call_single_queue(cpu, node, NULL);
-	}
 }
 
 /*

