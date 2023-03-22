Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC12566
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679484303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CeeQx+I+dRtKj5nSnz4ngzuZMZMfDzExS1NioY8sNjE=;
	b=YiHCcEMklnPO1Nnsc6FZEFkoAjKCP+8zw8PmMOPG8ZtoPhd4DcKa40P5t1WvJCGLw1i9/Z
	xGOfqk5p/rol+DVvScIDktQyC1nlY7yLxxbrXh4UjvoDYSbqbtgY4jZ09TLgqTzFSTXShx
	tE5Bxrp6JhkLWOsiCe7J+lRfmR19q+U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-RE-FD5U8Og6I5IZZ1bcrfg-1; Wed, 22 Mar 2023 07:25:02 -0400
X-MC-Unique: RE-FD5U8Og6I5IZZ1bcrfg-1
Received: by mail-qt1-f199.google.com with SMTP id v7-20020a05622a188700b003e0e27bbc2eso5741489qtc.8
        for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 04:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679484302;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeeQx+I+dRtKj5nSnz4ngzuZMZMfDzExS1NioY8sNjE=;
        b=vpL8zs6kooi6+q+BoLLcctiqpEZSlh36bue+GQ5KxJthTrJyE5N/VJ+RFNx88Zz3XF
         W9OdFRHLQiAorYgeaso0OO+/fE3l0LIylrE4XsbV2a8QK9DK4RTSnDsAvM72DJ0+yauW
         KkBZ1kkhOYhQRkrEQnBNNaYeoGXnvYuJDf5R266cV6Uh92QFeBLvY64RSO3hWbx3zveg
         RnWJRA6PQxvyqJ1UbR5Fjne3i3fcNeIxlEnnqlZgFyIKRIgEvB2kuY7veGpc4anKo7v7
         RFGvocVofL6ow26WU7DWh76/qPxiiNBUoE1C139MMsW8NhK5TzkYxggq4/AjMpTYNMPj
         VuLQ==
X-Gm-Message-State: AO0yUKUf5AtyDG3GxUrcT4eb6MdE5+VLV/dnX09j9dw7zsRLXBLPF6d9
	sz5ynU1YZMT76sR6+jsxoVdk7I9zEe3pTqS5bYnKuFODCx5GTV3mUB/M+XvXZfNq5yZaQKL7u/v
	wjVk9oP0dvhegB9YuKHCA
X-Received: by 2002:a05:6214:5087:b0:5a3:2f3c:4ee2 with SMTP id kk7-20020a056214508700b005a32f3c4ee2mr4440560qvb.42.1679484301885;
        Wed, 22 Mar 2023 04:25:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set9pQPCTrnu5TcJ8+anXt5wOGunOW6pbx+MNpUrdRaYmFZLBIEbvfDpQn22VZvxy9XYWlsJV9g==
X-Received: by 2002:a05:6214:5087:b0:5a3:2f3c:4ee2 with SMTP id kk7-20020a056214508700b005a32f3c4ee2mr4440518qvb.42.1679484301639;
        Wed, 22 Mar 2023 04:25:01 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id f66-20020a37d245000000b00745f3200f54sm11036821qkj.112.2023.03.22.04.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:25:00 -0700 (PDT)
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
 linux-xtensa@linux-xtensa.org, x86@kernel.org, Steven Rostedt
 <rostedt@goodmis.org>, "Paul E. McKenney" <paulmck@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/7] trace: Add trace_ipi_send_cpumask()
In-Reply-To: <20230322103004.GA571242@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-2-vschneid@redhat.com>
 <20230322093955.GR2017917@hirez.programming.kicks-ass.net>
 <20230322103004.GA571242@hirez.programming.kicks-ass.net>
Date: Wed, 22 Mar 2023 11:24:53 +0000
Message-ID: <xhsmhpm91c9kq.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 22/03/23 11:30, Peter Zijlstra wrote:
> On Wed, Mar 22, 2023 at 10:39:55AM +0100, Peter Zijlstra wrote:
>> On Tue, Mar 07, 2023 at 02:35:52PM +0000, Valentin Schneider wrote:
>> > +TRACE_EVENT(ipi_send_cpumask,
>> > +
>> > +	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
>> > +
>> > +	TP_ARGS(cpumask, callsite, callback),
>> > +
>> > +	TP_STRUCT__entry(
>> > +		__cpumask(cpumask)
>> > +		__field(void *, callsite)
>> > +		__field(void *, callback)
>> > +	),
>> > +
>> > +	TP_fast_assign(
>> > +		__assign_cpumask(cpumask, cpumask_bits(cpumask));
>> > +		__entry->callsite = (void *)callsite;
>> > +		__entry->callback = callback;
>> > +	),
>> > +
>> > +	TP_printk("cpumask=%s callsite=%pS callback=%pS",
>> > +		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
>> > +);
>>
>> Would it make sense to add a variant like: ipi_send_cpu() that records a
>> single cpu instead of a cpumask. A lot of sites seems to do:
>> cpumask_of(cpu) for that first argument, and it seems to me it is quite
>> daft to have to memcpy a full multi-word cpumask in those cases.
>>
>> Remember, nr_possible_cpus > 64 is quite common these days.
>
> Something we litte bit like so...
>

I was wondering whether we could stick with a single trace event, but let
ftrace be aware of weight=1 vs weight>1 cpumasks.

For weight>1, it would memcpy() as usual, for weight=1, it could write a
pointer to a cpu_bit_bitmap[] equivalent embedded in the trace itself.

Unfortunately, Ftrace bitmasks are represented as a u32 made of two 16 bit
values: [offset in event record, size], so there isn't a straightforward
way to point to a "reusable" cpumask. AFAICT the only alternative would be
to do that via a different trace event, but then we should just go with a
plain old uint - i.e. do what you're doing here, so:

Tested-and-reviewed-by: Valentin Schneider <vschneid@redhat.com>

(with the tiny typo fix below)

> @@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
>       TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
>  );
>
> +TRACE_EVENT(ipi_send_cpu,
> +
> +	TP_PROTO(const unsigned int cpu, unsigned long callsite, void *callback),
> +
> +	TP_ARGS(cpu, callsite, callback),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, cpu)
> +		__field(void *, callsite)
> +		__field(void *, callback)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->cpu = cpu;
> +		__entry->callsite = (void *)callsite;
> +		__entry->callback = callback;
> +	),
> +
> +	TP_printk("cpu=%s callsite=%pS callback=%pS",
                        ^
                      s/s/u/

> +		  __entry->cpu, __entry->callsite, __entry->callback)
> +);
> +

