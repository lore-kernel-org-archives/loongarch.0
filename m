Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797903081D1
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980330; cv=none; b=NfH72mEmaFWMBIwZ5ZyHTzsgANEy3QKZXs5YCA4pH1Ma9130s74OQ3yANLPjOmLbiJxa4l600tPEuqd90MNx4Bxp+DcgAXqtmc1aAYeFGg8ql+Lroz31Pd+tNBNMAAQJLLqI5+W4xvSSo5owgwZ2SRnlGS3qArqidzn+Tn0K/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980330; c=relaxed/simple;
	bh=B/6xHmD7dd8wWjqN/hAhxWOoQSEJgrYoSRISc3YL0mc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyt/2Vtl0UDEWmzCwrPQKmhe1ARxZNnDQX2Uuc0bZBNPiBH2BA/AX9QsHJKs9gKjOlR7IzM5WJmiWnFfedKZgLh/hKwiDq1NmcuA/POxyaHSXYwjglzu92/NcClg8FZ6aN4EDCmf7FoRon6a1JKB9HrlcZa3RCVWaFXytZ9yMAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GpNvDYmc; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GpNvDYmc"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so3149177b3a.2
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980328; x=1765585128; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=56r/hH7ijnps8qr4K++rAycxqMKLQxyC6YFw0gfnCKk=;
        b=GpNvDYmcxEc9EjVGqXc1TE7H9JtrscqsczTSP6Nv192zVGg6zjhgrRPE8SNb28taoY
         zN6JJugv/juvK6I2Z1SCLZOboZ7+1XJ7YQgO1qR97VKjpDEhUP8EYSSQDp8ariBy6WX3
         2sNqNOhyKV/3Osh6Cxb2mI9lxkdaNTIDhbnybkAZVv28QnrA3ag40SAnkbQlung1MueC
         Rb/2JtO9V/72jEgZyzcqvXN27Zh39MT4ETqxjIcwW/hlsvLBmLsb74B7fX5gMw7TX9IT
         ClKB+p87qWRi5t3bVVrFDdZR45LDTpAhFOwAjxplyY2+jKecU/t6Fw6DqVw9j7jQj+Ct
         WlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980328; x=1765585128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56r/hH7ijnps8qr4K++rAycxqMKLQxyC6YFw0gfnCKk=;
        b=cdZuWy7gK7JHJE+C8KQhzvgRlwS68Gh1ceizeTLtk1/4OJAfqoJRhsPcPRkQEZ9t5N
         3rwXbi+d3U0YQ1pPgDjjoJyX8pRdLlav2bptjVJgrkkBXygGVuTTLl+B2tiO9L/0K0zH
         /Sf3Hzq5qOjPJHborOb4p8GUFfUYgwwN0fzGg+qb8HM+qGr6nmWTul8AKK6s/aK+SRkq
         Ahkm2UQPHpP5/m3WZKF1o4rjfb26Q8ycQZqdpOo9cKQInERbw/w0zYTUYeWVKl0foNV5
         tmZTzMMg9AQJQzyl/F1NYHzdFFft8j/glzI90qWnznp4eLjY+9jEtgxwM+rH8MclA4VI
         Uigw==
X-Forwarded-Encrypted: i=1; AJvYcCVippL1+0EtPWEZr/YSG+2riyJ+luvs7yjV1veNLAHI0pdT1nW7QjucEEG4JQje0d9tkNIOYjE/evY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl6DURQPmI8u2EB1zx6GhiHyMzOaaVReSUx66+09T0gU3KrVAN
	dBTnKagd4T2CJo83qnCjkk+6Uaed3nglgfIV4BGAiGqxJI8wr4DWpOwSpnGH/HtS9mFh92d9S4t
	YO8gf4A==
X-Google-Smtp-Source: AGHT+IGLiFKCkiAoyo8w1adxKIx9TSOzM2AC83Bo64USM+supssaEydukBJfVufrwhWzLpi5mXFgs4LcC10=
X-Received: from pfbmy25-n2.prod.google.com ([2002:a05:6a00:6d59:20b0:7e5:4656:9d96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d90:b0:7e8:4471:8ca
 with SMTP id d2e1a72fcca58-7e8c6dac0c1mr746508b3a.43.1764980327560; Fri, 05
 Dec 2025 16:18:47 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:17:16 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-41-seanjc@google.com>
Subject: [PATCH v6 40/44] KVM: VMX: Set MSR index auto-load entry if and only
 if entry is "new"
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

When adding an MSR to the auto-load lists, update the MSR index in the
list entry if and only if a new entry is being inserted, as 'i' can only
be non-negative if vmx_find_loadstore_msr_slot() found an entry with the
MSR's index.  Unnecessarily setting the index is benign, but it makes it
harder to see that updating the value is necessary even when an existing
entry for the MSR was found.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2c50ebf4ff1b..be2a2580e8f1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1141,16 +1141,16 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 
 	if (i < 0) {
 		i = m->guest.nr++;
+		m->guest.val[i].index = msr;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 	}
-	m->guest.val[i].index = msr;
 	m->guest.val[i].value = guest_val;
 
 	if (j < 0) {
 		j = m->host.nr++;
+		m->host.val[j].index = msr;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
 	}
-	m->host.val[j].index = msr;
 	m->host.val[j].value = host_val;
 }
 
-- 
2.52.0.223.gf5cc29aaa4-goog

