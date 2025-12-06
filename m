Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636023D7F2
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980263; cv=none; b=XFGYNtSjzWGJmNMkGowkbzYK67zTbnBQtljI45jsKml+lDM4HLWu4KFJc8FMHyz4/kBsnSr9yE3zWifhhQxq0M8TigNqdFbG+ibmi+BVZ+DpzrzSYj5tJCUKCIkpUMal61n0MK+HQwRwaT1KjjBYZk8OPlhcL+PSv6hCzcvk7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980263; c=relaxed/simple;
	bh=ol4osHN66I/PAiXEwvP+OdGz+wl0D4v1AlsJ0ZqcJWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T+B0YvzeQ6FJM1kmboNzh9AXJm0GDGOZPMk0zI5e6R6zOhpCwAmzcfjlzYNTvMAYqITJ6Cn1JGGclSEoGMW1TlP77oU9nLTkl95ostd/gG4L7Vme1pUqA2n/5fHMlRp/GAGoy00hYgw+ESbm1HwrI8DgviKApchfaJ+DuT/iEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M8osMDpF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M8osMDpF"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso3062037a91.2
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980260; x=1765585060; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FylYYLVT0WTXptfl4HpO9XPf05XgvSaO59C95hLudDA=;
        b=M8osMDpFjCnxewQNK9DA9Ciz/TPbhJfUCsY7vx8HAka6oUlb4ItvNW9W3Ec3CgCPLx
         0Sk3teGzL8G4UgkzBnR7BHb9OIrtHla2oHlJqR9Q2gidxrx21XptadC3+yi3ThkkjJrb
         2FnBwOroRo1RjLCFr/yQQebKL40WJEyiOReXzLp9Ve0AIKxpgH0Uib5UaOXzzQXUWw0R
         a7a8/nIXlkBodwfXWXOVgBXLcrhRJXVPi5CJ3vcXARxQyQZnSKh9s1izjk8qZJEUSSXJ
         8rYgxBmginO/C3Nq7Qi+qL92yNrPCC/Xo+pvU8rKPBNJrQn1Y/OqOgBPYLTymQKPfLK0
         9dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980260; x=1765585060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FylYYLVT0WTXptfl4HpO9XPf05XgvSaO59C95hLudDA=;
        b=TAcqQIUOBFK6OLNk7CsfTztqGg1kxL2N/FOKtalVEpRp7yO+cvtxJZGZjG2z2zCtad
         l16t5P7sxJ5hY9D090A2IhHFD+CdrTUalXDhs0OetRBQVXzEjOWdEKJnz/JqS9HjGaJ6
         fo9UjpWxs+4GDvH5p5j22qZNmZUzwr9F7reK1pNqRkmjouphSj7gGie3o2bFrIeHyhaa
         Q+RX5et2YZ71tBuoqDPheo0+a9MDyirs4TReV8ZZbf97LhsJpIa+djH8hADUi6uX1za/
         sgSAkBNLCs4rSupm61uNYFk3lUzTRM3057LgvYs64yNmiCYUzTFRjiQRMrRToZHYsk4v
         Tm6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1QAnK+5LbD7j3WP24VlcZk62UzBOxlypb3jSdHyU3KP3oZVCciwncoNYixpokLyQY/jRNYwNMgCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTSpLq1y004y/JHqwz14EWVamG5E/Cr9BXh6ICsRBe+RoPsvNh
	4ocHzVrej8R3edCvPcPEAu1HottBamZr+Z000yaYKE2LweoxNeHoPS4qd+4GwfwvF0FVq3lcydm
	Lq3Mlmw==
X-Google-Smtp-Source: AGHT+IFoT/ixFxXWDXJBPVNPACu7PrN8IiUqBDaVd9+tgekzVLP1tDFd7WsI6N47bV9683aut9/Cc/2CP5c=
X-Received: from pjtl17.prod.google.com ([2002:a17:90a:c591:b0:349:1598:173b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acf:b0:340:d06d:ea73
 with SMTP id 98e67ed59e1d1-349a2686512mr571973a91.19.1764980260147; Fri, 05
 Dec 2025 16:17:40 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:43 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-8-seanjc@google.com>
Subject: [PATCH v6 07/44] perf: Add APIs to load/put guest mediated PMU context
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Kan Liang <kan.liang@linux.intel.com>

Add exported APIs to load/put a guest mediated PMU context.  KVM will
load the guest PMU shortly before VM-Enter, and put the guest PMU shortly
after VM-Exit.

On the perf side of things, schedule out all exclude_guest events when the
guest context is loaded, and schedule them back in when the guest context
is put.  I.e. yield the hardware PMU resources to the guest, by way of KVM.

Note, perf is only responsible for managing host context.  KVM is
responsible for loading/storing guest state to/from hardware.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: shuffle patches around, write changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h |  2 ++
 kernel/events/core.c       | 61 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index eaab830c9bf5..cfc8cd86c409 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1925,6 +1925,8 @@ extern u64 perf_event_pause(struct perf_event *event, bool reset);
 #ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
 int perf_create_mediated_pmu(void);
 void perf_release_mediated_pmu(void);
+void perf_load_guest_context(void);
+void perf_put_guest_context(void);
 #endif
 
 #else /* !CONFIG_PERF_EVENTS: */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index f72d4844b05e..81c35859e6ea 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -469,10 +469,19 @@ static cpumask_var_t perf_online_pkg_mask;
 static cpumask_var_t perf_online_sys_mask;
 static struct kmem_cache *perf_event_cache;
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+static DEFINE_PER_CPU(bool, guest_ctx_loaded);
+
+static __always_inline bool is_guest_mediated_pmu_loaded(void)
+{
+	return __this_cpu_read(guest_ctx_loaded);
+}
+#else
 static __always_inline bool is_guest_mediated_pmu_loaded(void)
 {
 	return false;
 }
+#endif
 
 /*
  * perf event paranoia level:
@@ -6385,6 +6394,58 @@ void perf_release_mediated_pmu(void)
 	atomic_dec(&nr_mediated_pmu_vms);
 }
 EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
+
+/* When loading a guest's mediated PMU, schedule out all exclude_guest events. */
+void perf_load_guest_context(void)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	ctx_sched_out(&cpuctx->ctx, NULL, EVENT_GUEST);
+	if (cpuctx->task_ctx) {
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
+	}
+
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, true);
+}
+EXPORT_SYMBOL_GPL(perf_load_guest_context);
+
+void perf_put_guest_context(void)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(!__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+
+	perf_event_sched_in(cpuctx, cpuctx->task_ctx, NULL, EVENT_GUEST);
+
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, false);
+}
+EXPORT_SYMBOL_GPL(perf_put_guest_context);
 #else
 static int mediated_pmu_account_event(struct perf_event *event) { return 0; }
 static void mediated_pmu_unaccount_event(struct perf_event *event) {}
-- 
2.52.0.223.gf5cc29aaa4-goog

