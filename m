Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9E3C14
	for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665505029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pm4VeB8ssmcYRaiZFIcIhGhr8ty4z8Z6FbdtNOJecy0=;
	b=X24PB1uGCMhBpXyL2eFidTjEOFO7f+QodkMC03tdMCmfyfTPIp+mdLXTscYuUxTjgpnnCY
	DkCEkXwG77/2i2tR+nmbFP6zXBIp+LiunHReUqFme7BOWXHi42K29n9pDyx2eGx+ZoRMNN
	qU0IjWxBX+d71GtH/KeV+55Scil5I7Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-DCG8RWQCNPO1M6nITQ6aOQ-1; Tue, 11 Oct 2022 12:17:08 -0400
X-MC-Unique: DCG8RWQCNPO1M6nITQ6aOQ-1
Received: by mail-wr1-f72.google.com with SMTP id i1-20020adfa501000000b0022cd1e1137bso4001058wrb.0
        for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 09:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm4VeB8ssmcYRaiZFIcIhGhr8ty4z8Z6FbdtNOJecy0=;
        b=B4avf1pwCfza7QpA3x+CcKH2y9TiZePbKD2KLlLh0Di0CH/uT6j8/xOTG8/cm68J0B
         w5Qtv7BzKaAt+AxyiXwfWPuyEokhkUau8IyfiaXHG/63UsSDYJVMEwPaJGwygdhTM5Jg
         SE5R/giroNkZV1quibbGqD3lvd0KQQ9+SHWkejQfLRs9OoPsmj4gelbP6l2pM3xD0tII
         1+thnl9FTUwR8WWzhjIm+6ZlSc8vWfvw+N2pji+Dc8lamTmdDj1i4s3pelK+BYlK793n
         pJdXez97gIA2xYqUYTET0bjzYAAzbfom9fUPFMAwnu/HsmePiFHdSxj2P6GvS8hkMe7r
         DOGg==
X-Gm-Message-State: ACrzQf3IBpJZ9riD3WkFLEo+CRrpxWi8GqIXdYLNfvUnvL75JkxYzLy8
	MSqJ3rdluveSTAa45KvmGiHMcfkbbBxyKTzD7+HSE18PrsFt/esJNue7wzg29Pxun0zN+55dyZi
	/z8k//xcMm1eAXQs53+aI
X-Received: by 2002:a7b:cd96:0:b0:3b4:856a:28f7 with SMTP id y22-20020a7bcd96000000b003b4856a28f7mr17405267wmj.117.1665505027277;
        Tue, 11 Oct 2022 09:17:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+yXZheRjtpI2Mraq3mO0aiY2aGzgLzN/bP6F6DHEepFtgXyphrd7vxKSt0bqtKCZRjEunTA==
X-Received: by 2002:a7b:cd96:0:b0:3b4:856a:28f7 with SMTP id y22-20020a7bcd96000000b003b4856a28f7mr17405207wmj.117.1665505026699;
        Tue, 11 Oct 2022 09:17:06 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c151500b003c6b9749505sm4667967wmg.30.2022.10.11.09.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:17:05 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Juri Lelli
 <juri.lelli@redhat.com>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Douglas RAILLARD
 <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
In-Reply-To: <Y0CFnWDpMNGajIRD@fuller.cnet>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet>
Date: Tue, 11 Oct 2022 17:17:04 +0100
Message-ID: <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

+Cc Douglas

On 07/10/22 17:01, Marcelo Tosatti wrote:
> Hi Valentin,
>
> On Fri, Oct 07, 2022 at 04:41:40PM +0100, Valentin Schneider wrote:
>> Background
>> ==========
>> 
>> As for the targeted CPUs, the existing tracepoint does export them, albeit in
>> cpumask form, which is quite inconvenient from a tooling perspective. For
>> instance, as far as I'm aware, it's not possible to do event filtering on a
>> cpumask via trace-cmd.
>
> https://man7.org/linux/man-pages/man1/trace-cmd-set.1.html
>
>        -f filter
>            Specify a filter for the previous event. This must come after
>            a -e. This will filter what events get recorded based on the
>            content of the event. Filtering is passed to the kernel
>            directly so what filtering is allowed may depend on what
>            version of the kernel you have. Basically, it will let you
>            use C notation to check if an event should be processed or
>            not.
>
>                ==, >=, <=, >, <, &, |, && and ||
>
>            The above are usually safe to use to compare fields.
>
> This looks overkill to me (consider large number of bits set in mask).
>
> +#define trace_ipi_send_cpumask(callsite, mask) do {            \
> +	if (static_key_false(&__tracepoint_ipi_send_cpu.key)) { \
> +               int cpu;                                        \
> +               for_each_cpu(cpu, mask)                         \
> +                       trace_ipi_send_cpu(callsite, cpu);	\
> +	}                                                       \
> +} while (0)
>

Indeed, I expected pushback on this :-)

I went for this due to how much simpler an int is to process/use compared
to a cpumask. There is the trigger example I listed above, but the
consumption of the trace event itself as well.

Consider this event collected on an arm64 QEMU instance (output from trace-cmd)

    <...>-234   [001]    37.251567: ipi_raise:            target_mask=00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000004 (Function call interrupts)

That sort of formatting has been an issue downstream for things like LISA
[1] where events are aggregated into Pandas tables, and we need to play
silly games for performance reason because bitmasks aren't a native Python
type.

I had a look at libtraceevent to see how this data is exposed and if the
answer would be better tooling:

tep_get_field_val() just yields an unsigned long long of value 0x200018,
which AFAICT is just the [length, offset] thing associated with dynamic
arrays. Not really usable, and I don't see anything exported in the lib to
extract and use those values.

tep_get_field_raw() is better, it handles the dynamic array for us and
yields a pointer to the cpumask array at the tail of the record. With that
it's easy to get an output such as: cpumask[size=32]=[4,0,0,0,]. Still,
this isn't a native type for many programming languages.

In contrast, this is immediately readable and consumable by userspace tools

<...>-234   [001]    37.250882: ipi_send_cpu:         callsite=__smp_call_single_queue+0x5c target_cpu=2

Thinking out loud, it makes way more sense to record a cpumask in the
tracepoint, but perhaps we could have a postprocessing step to transform
those into N events each targeting a single CPU?

[1]: https://github.com/ARM-software/lisa/blob/37b51243a94b27ea031ff62bb4ce818a59a7f6ef/lisa/trace.py#L4756

>
>> 
>> Because of the above points, this is introducing a new tracepoint.
>> 
>> Patches
>> =======
>> 
>> This results in having trace events for:
>> 
>> o smp_call_function*()
>> o smp_send_reschedule()
>> o irq_work_queue*()
>> 
>> This is incomplete, just looking at arm64 there's more IPI types that aren't covered:
>> 
>>   IPI_CPU_STOP,
>>   IPI_CPU_CRASH_STOP,
>>   IPI_TIMER,
>>   IPI_WAKEUP,
>> 
>> ... But it feels like a good starting point.
>
> Can't you have a single tracepoint (or variant with cpumask) that would
> cover such cases as well?
>
> Maybe (as parameters for tracepoint):
>
> 	* type (reschedule, smp_call_function, timer, wakeup, ...).
>
> 	* function address: valid for smp_call_function, irq_work_queue
> 	  types.
>

That's a good point, I wasn't sure about having a parameter serving as
discriminant for another, but the function address would be either valid or
NULL which is fine. So perhaps:
o callsite (i.e. _RET_IP_), serves as type
o address of callback tied to IPI, if any
o target CPUs

>> Another thing worth mentioning is that depending on the callsite, the _RET_IP_
>> fed to the tracepoint is not always useful - generic_exec_single() doesn't tell
>> you much about the actual callback being sent via IPI, so there might be value
>> in exploding the single tracepoint into at least one variant for smp_calls.
>
> Not sure i grasp what you mean by "exploding the single tracepoint...",
> but yes knowing the function or irq work function is very useful.
>

Sorry; I meant having several "specialized" tracepoints instead of a single one.

