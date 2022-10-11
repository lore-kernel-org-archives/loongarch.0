Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E643C32
	for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665506430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
	b=A+FV3O0WHCmo+SwD1nwchs7jR+YgzkGCAwje9Xx3LqMKaKhNYS22PO9aAlAwPJn07I5J2/
	kpV/PO/oqIwdn/6o7zffLkdhZI0qNV9qD7Fex2Kug3yazce+8QPRClHb1QT7y44M5ZDAjI
	W5+8s3e6cgGXu8OzkGbgwLWyS5n4UjQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-DvdBfbWANVO4LWaiU3E3xg-1; Tue, 11 Oct 2022 12:40:29 -0400
X-MC-Unique: DvdBfbWANVO4LWaiU3E3xg-1
Received: by mail-wm1-f70.google.com with SMTP id t20-20020a7bc3d4000000b003c6bfea856aso1132117wmj.1
        for <loongarch@lists.linux.dev>; Tue, 11 Oct 2022 09:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
        b=PP3dYk4TlfhRkWOGdvalv21dsdkp2qLwp0YxyZKqhv1BxVnonu4yk001JF3YrDX3UX
         ZKqik6/jrCW5DTvwtJdpGSMyFgFYbLiZ/Ccb0V9kHwpT4O5M7ODgzOj1fxTGWM5W0aqv
         OCAqp+nxG0WNmovJdHxZueN+PZJgF4XTiE7GSN7ziOO1rpbbJSEcYBC8Cgky4E1oQyuu
         mc7ZYcceO4bfLRSbcJyqc+l+uqUCMCEs8INsoDdq5r2nYiM5I2WSeOVEviY/MPcDza1S
         LjIOiHLA8lCqtNXTNB/+iXy1p2wWU7M6V091l/1T2PnMX/q65wK7luiTaJ1ShGMwrGCz
         gCwA==
X-Gm-Message-State: ACrzQf2THQv/ciH+X/iqri9PBfK7rZ1Gmi3KEJw5Z0qwF7qC8Mmg7llb
	xQ6I6eP6+ffcXAKOI8JIZL5wTPZOp+V2WKRGSPRwdp3AigX6Q0uIgoCLohp+p3+rod5qyvjSXpx
	jNACyi+0ieCZHaae9f+EE
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455623wrr.308.1665506428138;
        Tue, 11 Oct 2022 09:40:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XCj7SFWdE6E5DxEmMGEk+A0mlMYyEPprqhbmdn8jGtDu/Z9OxlEVw6NK6vPTlYZN68wZltQ==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455591wrr.308.1665506427912;
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id y3-20020a7bcd83000000b003a3170a7af9sm7900578wmj.4.2022.10.11.09.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Daniel Bristot de Oliveira <bristot@redhat.com>
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
 <juri.lelli@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, Guo Ren <guoren@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Douglas RAILLARD <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
In-Reply-To: <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet> <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
 <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
Date: Tue, 11 Oct 2022 17:40:26 +0100
Message-ID: <xhsmhfsfufh51.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 11/10/22 18:22, Daniel Bristot de Oliveira wrote:
> On 10/11/22 18:17, Valentin Schneider wrote:
>> Thinking out loud, it makes way more sense to record a cpumask in the
>> tracepoint, but perhaps we could have a postprocessing step to transform
>> those into N events each targeting a single CPU?
>
> My approach on the tracers/rtla is to make the simple things in kernel, and beautify
> things in user-space.
>
> You could keep the tracepoint as a mask, and then make it pretty, like cpus=3-5,8
> in user-space. For example with a trace-cmd/perf loadable plugin, libtracefs helper.
>

That's a nice idea, the one downside I see is that means registering an
event handler for all events with cpumasks rather than directly targeting
cpumask fields, but that doesn't look too horrible. I'll dig a bit in that
direction.

> For rtla I was thinking to make a new tool to parse them. and make it pretty there.
>
> -- Daniel

