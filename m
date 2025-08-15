Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84F307AC5
	for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272515; cv=none; b=cG0nMeGBdOrttAM2yPcg8nHHU5JphMT8UaPH++lh1P3seckPiln9HJF8xcK7OB0wx2vSBXuu/eN8dErI32oi9nu5XpIkTq/54I9s8q/S9ymYtGUDg2bZ10Xlqjp9C6bEjzJnOJ+yRQp3Po4mZX+0cPLBh0edPuqWr1lPbxdsycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272515; c=relaxed/simple;
	bh=V0iQe0wXHiwXgNwjclXLeqc33EIkx7ymZ0WlHmqsCas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kjt1cTUISsFeP5Veq60QBgqmxotnCggOwBQqB6d2EVYkDZLdZ4eXq4j9FZTFZVZsrClKvy04B6SsywJMKEDu6QuXiP/sysI8x4ZCxfFnhy4rkwXqNQDH5c+nd/yj4ZUuSjx9bUuxwVmM8DyzvWAkXpfyk7XHnNmSwMLKLOipvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQadbkjM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQadbkjM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32326e09c5fso2119287a91.2
        for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755272513; x=1755877313; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=iQadbkjMyv4YpXTaQ23Vk2zDSeFigOmPhvJHurlZhVvaqG0TKwjNlXG3OuVBbt/Paz
         612tX/cPMhzhT5K9oXf68X5/P946Sdp0Cpa5boc727rmOHt1hWePZMc+2B762YU3JXWS
         HUkVbycNd8FUgwwcF4Zr+aUZ9sHMFMEvI9fqWZ/o5zjYLXS30bNk1XWYJB2qwVAK1Z7h
         fQqRUZg8XYPc0hB6vgOuU8HvJyds6gq/KlGmeiLL6NjkunrZ/vWMdaKkAMCcLIQfRCK0
         wR64tT4GkGgan7oUDFVmfW8jT88mL93AApxQXDRDP/KWkkLmc6sf1vaLnycPLusnRlNQ
         aYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272513; x=1755877313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=hREWEoaY3RituZis1oZdoDG27YVaHZB6muDj3rJri2y+1ytI8m5GVxVxVu511F+9xD
         kLpqdno5xf4x1YzTAMobWX9r/Qz5yBY6dvER8hGJ4lObQ+P/QXDwIT4Rar7OeqEc/clr
         9T78siJyU122VVlEHHYFo/VrRr3XxpyvUNu5nj80I/YsQ8z9HAuvRVxuSLO/Kfmr61rN
         LQBOWheAManXe9AVW9NV4HMlECczcX3t5mXkfV9MK77DVK5pcz1LXQuiziL/y4wzNwbg
         4IpsXAuiRsPOnTcZLqvfFqGn1fEFBcxz67gvEXHABZiJPQcPrpQy5tsu6ZLm2Y55nU3/
         63BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwikuhzSenmduvIAuaDQPvSKTsNYBiVHI8EbiuSuL5TXhdSE+htbAIwSywcD9mb5ZlRvouQLCGzE4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhi5W1slyMOoJmr6YuZemwZsf+OEZldtAWAihdbA0qHGEGenxx
	1ip6bErPqybf1de6FbmlNkjd69Jb8jWeSBxiK1XhUWX5OFQBAx7gCB1p9GKmS32kZDEAg2YdORG
	u84Ln7Q==
X-Google-Smtp-Source: AGHT+IF1xhNBmkTpZib3NykIL4xlxFbGkhXK+/yjF5LGvtuWFmTYgkxBDJw0+uZkCmQyO/RrRqfOrKLRso0=
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:31e:a094:a39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5104:b0:31e:4492:af48
 with SMTP id 98e67ed59e1d1-32342238d44mr3660367a91.28.1755272513579; Fri, 15
 Aug 2025 08:41:53 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:41:52 -0700
In-Reply-To: <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Message-ID: <aJ9VQH87ytkWf1dH@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index e1df3c3bfc0d..ad22b182762e 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> >  	}
> >  
> > +	arch_perf_load_guest_context(data);
> 
> So I still don't understand why this ever needs to reach the generic
> code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> no?

It's definitely possible to handle this entirely within x86, I just don't love
switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
It's not a sticking point for me if you strongly prefer something like this: 

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0e5048ae86fa..86b81c217b97 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
 
        lockdep_assert_irqs_disabled();
 
-       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
+       perf_load_guest_context();
+
+       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
 
        /*
         * Disable all counters before loading event selectors and PMCs so that
@@ -1380,5 +1382,7 @@ void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu)
 
        kvm_pmu_put_guest_pmcs(vcpu);
 
+       perf_put_guest_lvtpc();
+
        perf_put_guest_context();
 }

