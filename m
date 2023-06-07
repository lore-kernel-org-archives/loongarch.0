Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A36AB9
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZlBm9K/eDsGZdtktFZEDp+gLxlecPmXApRL0wxE0aA=;
	b=FC0QDEE1+S9gRrfY3uMcMviUxq/9hkpbs5QuDlEECiQeWK/lvU61XI8OLPQ0wb6RWAQ18z
	8z11PKWI5BDZrUZOtGdfwmFRD8CFBvBvdjhfGB0E0nBs896Eq1An0LW4jQHaXuZjH+2dNP
	vp02IUnbU/RWoAMK8YFrH7qmJVRIiqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-PNNB5q-iNjGjLMDAmSG5Zg-1; Wed, 07 Jun 2023 04:58:25 -0400
X-MC-Unique: PNNB5q-iNjGjLMDAmSG5Zg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30ae7bd987dso3031474f8f.2
        for <loongarch@lists.linux.dev>; Wed, 07 Jun 2023 01:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128305; x=1688720305;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZlBm9K/eDsGZdtktFZEDp+gLxlecPmXApRL0wxE0aA=;
        b=g+srWukLq5Co0Tl+cJWkRjbsl+rxMVYM/lxvYI2/uXtQyPboATkrcjmkGLipWulTsz
         iEF6Bdf6aGM86yJSxCUQI1BAOks8DB0KkOMp4qOFf7l1DkfxeYKWjrVbMXt4fCuRcaAm
         BxEQxsk9xMxrfCheYKgBqeXl3IY/+Tq2nedZcxUQ3VMQdxU2t5Wc9cpGQHBco2tv87PD
         szpbcGtCFMMC6Xqux813iTKHz+ISEOuSdLFExm9XL/XyE11vguS/9uoxAWF7z3UGTRqw
         aebE5tqQsEisMANjAh1q/s8ZeLZbSzr7c1YFOW74QEEAyJkTdtmZNsbDLMo8uVlAdnDM
         LQqA==
X-Gm-Message-State: AC+VfDy4O+cyU99DibiMHIEjXF6IZIeTbQFbIvmcQLTrrbrLz/tz8x/D
	XC+RfciJOfNxSXBbBeq39G/hF1lt+7w40agiibVpjqx7XyRNo/w/yECGHjRUTFByIe7f2P28WFw
	89SayT3YDpha9Jsrvwjkw
X-Received: by 2002:a5d:4573:0:b0:30d:efe0:5395 with SMTP id a19-20020a5d4573000000b0030defe05395mr3930885wrc.47.1686128304834;
        Wed, 07 Jun 2023 01:58:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4gsMslc9ahJC8zUHAGJ/RP7BQSmGZi72AZv76jXK1i6rRbHtaqjZeOnSvI17kebHXmkLvWiw==
X-Received: by 2002:a5d:4573:0:b0:30d:efe0:5395 with SMTP id a19-20020a5d4573000000b0030defe05395mr3930845wrc.47.1686128304503;
        Wed, 07 Jun 2023 01:58:24 -0700 (PDT)
Received: from vschneid.remote.csb ([208.178.8.98])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c00d300b003f70a7b4537sm1382812wmm.36.2023.06.07.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:58:24 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: bigeasy@linutronix.de, mark.rutland@arm.com, maz@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 jgross@suse.com, boris.ostrovsky@oracle.com, daniel.lezcano@linaro.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, rafael@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com, pmladek@suse.com, senozhatsky@chromium.org,
 rostedt@goodmis.org, john.ogness@linutronix.de, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, jstultz@google.com, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 04/13] arm64/arch_timer: Provide noinstr
 sched_clock_read() functions
In-Reply-To: <20230602115451.GG620383@hirez.programming.kicks-ass.net>
References: <20230519102058.581557770@infradead.org>
 <20230519102715.435618812@infradead.org>
 <xhsmho7m9ptrk.mognet@vschneid.remote.csb>
 <20230602115451.GG620383@hirez.programming.kicks-ass.net>
Date: Wed, 07 Jun 2023 09:58:22 +0100
Message-ID: <xhsmhsfb3odht.mognet@vschneid.remote.csb>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 02/06/23 13:54, Peter Zijlstra wrote:
> On Wed, May 24, 2023 at 05:40:47PM +0100, Valentin Schneider wrote:
>>
>> So this bit sent me on a little spelunking session :-)
>>
>> From a control flow perspective the initialization isn't required, but then
>> I looked into the comment and found it comes from the
>> arch_timer_read_counter() definition... Which itself doesn't get used by
>> sched_clock() until the sched_clock_register() below!
>>
>> So AFAICT that comment was true as of
>>
>>   220069945b29 ("clocksource: arch_timer: Add support for memory mapped timers")
>>
>> but not after a commit that came 2 months later:
>>
>>   65cd4f6c99c1 ("arch_timer: Move to generic sched_clock framework")
>>
>> which IIUC made arm/arm64 follow the default approach of using the
>> jiffy-based sched_clock() before probing DT/ACPI and registering a "proper"
>> sched_clock.
>>
>> All of that to say: the comment about arch_timer_read_counter() vs early
>> sched_clock() doesn't apply anymore, but I think we need to keep its
>> initalization around for stuff like get_cycles(). This initialization here
>> should be OK to put to the bin, though.
>
> Something like the below folded in then?
>

Much better, thank you!

