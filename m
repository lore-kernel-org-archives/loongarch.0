Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC38C088
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676383852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
	b=hJ8l+sTbhqlxPfpgz9IPnE3v2+m+9DukW6d9XwAmJE9UafeMd71Gt5huOxcF45yLsJkJAP
	+GopWafvY0VeWKh1H0Gj46lvsmypZFP1SJ0GraS9U5zcv5ADt1yxHGgWnKifBieyPj45cA
	GvIpwdFIlJ41saefHctiC0nP9OTOKPc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-D5MAkn96MKCQ_ET191W45A-1; Tue, 14 Feb 2023 09:10:50 -0500
X-MC-Unique: D5MAkn96MKCQ_ET191W45A-1
Received: by mail-qv1-f70.google.com with SMTP id kd28-20020a056214401c00b0053cd4737a42so8801119qvb.22
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=kq7gxxjX5lzs/pPHTVmPR9qEbQIE3ZWz6zwRIEWcn+ideK/DwkDPUG4jxDxzh3iGBW
         mouJTpv0zXPYYTn3FLReZTPoSQXxEs40DDJONoX02+vbdtorf/4GKCC+iWs1aEAaXYA0
         UkVRXSM4vwFMb+r6jJDidin5SWEQuBDGjQlVenmzJUszWU9BA3PotWwkhq6pXrf0JMI/
         8+uFT13W+AvsOECA6AAayMnGeha2yMP2UYqr5UdBQEaCibE1FdmFo8nIP38H+PnlWmlF
         dxM4Cf0b+ebpU9IlLbL6bAzGWed60t9D0RYcj/jnerj+nTdm5sssJCIDN/arsB4uealQ
         vXnw==
X-Gm-Message-State: AO0yUKWLZ4o1S+ROyJYx/QnexLbFykG4tzymLdDK60cuCvZ9R9TSKeX2
	19Q6YHJqYzcRx/nWWF0Ke2rR5iyYJlKMNJ1hgRmohDOPYCQ7FyCTzEvKGn3OthJb1Yp7u8onJQ0
	DANoRM8Vjn76A/Kl9wMKF
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3386037qtw.63.1676383850322;
        Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set98OEMKfsGkU19OgnlE6heJ9O6LLo1g6QDlcHkAXfWHsX591p7/3MvgrPqMUwlWB9z0tPx4tA==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3385969qtw.63.1676383849978;
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s184-20020ae9dec1000000b0073b38652b9csm4892065qkf.122.2023.02.14.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/7] Generic IPI sending tracepoint
In-Reply-To: <20230119143619.2733236-1-vschneid@redhat.com>
References: <20230119143619.2733236-1-vschneid@redhat.com>
Date: Tue, 14 Feb 2023 14:10:43 +0000
Message-ID: <xhsmhh6voqqvw.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Hey folks,

On 19/01/23 14:36, Valentin Schneider wrote:
> Patches
> =======
>
> o Patches 1-5 spread out the tracepoint across relevant sites.
>   Patch 5 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 7 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>

This still rebases cleanly on top of the latest tip/sched/core, any
objections to parking it there?

