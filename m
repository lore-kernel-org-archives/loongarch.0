Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45B3C14
	for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665500533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
	b=bFlEr+6Kou7c1Uq+2pDZ9tDyqBmC6hB5Yz69cCDmjCiwJ0RYANSd+q7eqqXzIxNZlKmCsJ
	HK86uUjGeeiHsSK1V+RpVwq/virSvYwS4LVGk7CpdIk8VDl90w3NrN1PoMDqyymSkyYH6c
	x7t6hK8WAEMHQictmEFy0bW7/NiJmGY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-hjN6KIBjMwiI9Tpl2y1Y2Q-1; Tue, 11 Oct 2022 11:02:09 -0400
X-MC-Unique: hjN6KIBjMwiI9Tpl2y1Y2Q-1
Received: by mail-wm1-f71.google.com with SMTP id bg21-20020a05600c3c9500b003c2acbff422so912372wmb.0
        for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 08:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
        b=dxhdiIUSyqD2YHXmkWTeHT9NdWed2tGzvsmEi0DehY4YzsUNw0Wlnc2YYeOrsp+NlF
         ikUDwaLVU9JG5mAwCQLgA8A1KOvsU2S7vDuSLuCT7JUTx6fseLGrqgEx++nRV84lTl/L
         Fjq7yyH3E9o79F3zp03mYYlzPY8AK69FlHgPZH5ywv2J9iLvdncX6pvskjLORz8K9C4H
         OcvyV2saXYZ/IA3cC9hXCjUHzvS8zZRe4qU4cZ3X6l+OBjBJ3otxNAHoJ90aV3V4eQbq
         wf96FM1WuGsNoXCgmWtMnnSOGCPQSEgftDYiL7Lg2pjL/WVHcrHJNE/b9eDmcwoS8ukq
         HCSw==
X-Gm-Message-State: ACrzQf0gp+6/SyihNG4Sugtqqfn2fASGWoCMOmpjGnBSlvb/EbhSbQ06
	x0+WutLVGhx/g/sVmFGe8P8k5HBX3glW0VRkNHd8nMA19tvVcwCvtu8DGLZG38JGOiDC5r8VG5m
	2eCt5cduSZ+FafrVDZUe5
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699180wrr.90.1665500528705;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7srUgXRaEVg4Pb59BUs0ShAt8e40s56KQw2lU0G4VdN3sOMR/0VHio2//G+OqnLs1Wx3l7Vw==
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699160wrr.90.1665500528495;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b003b49ab8ff53sm13552403wmb.8.2022.10.11.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 08:02:07 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
In-Reply-To: <20221008153442.159b2f2d@rorschach.local.home>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <20221007154533.1878285-4-vschneid@redhat.com>
 <20221008153442.159b2f2d@rorschach.local.home>
Date: Tue, 11 Oct 2022 16:02:06 +0100
Message-ID: <xhsmhlepmflox.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 08/10/22 15:34, Steven Rostedt wrote:
> On Fri,  7 Oct 2022 16:45:32 +0100
> Valentin Schneider <vschneid@redhat.com> wrote:
>>  }
>>  
>> +static inline void irq_work_raise(void)
>> +{
>> +	if (arch_irq_work_has_interrupt())
>> +		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());
>
> To save on the branch, let's make the above:
>
> 	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())
>
> As the "trace_*_enabled()" is a static branch that will make it a nop
> when the tracepoint is not enabled.
>

Makes sense, thanks for the suggestion.

> -- Steve
>
>
>> +
>> +	arch_irq_work_raise();
>> +}
>> +
>>  /* Enqueue on current CPU, work must already be claimed and preempt disabled */

