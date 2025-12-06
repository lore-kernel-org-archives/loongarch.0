Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48821CC51
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980255; cv=none; b=REqtJBNsOF33+iXe1B0exMMWHHfzsliwjqlJQ8YFTlUaRcmjDH5hHNvIkhiIy6Yy/+wCCdq1XDMaekdcblJW96H+M7ejdUM3xRu2S4fnrZ48XlLuogyTJm9QfnrA466hbVo+joinuD7/M65k/FgxTl+W18I2m5YwXqjq4OgST10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980255; c=relaxed/simple;
	bh=LI1sDcOO4Y4+JFloEIGoQdv+YZQhyxul+6jzUgodhT0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iFQop8SordN6kGoPFMOHF6oG6yxx517CeKiO+p+CEp0ogwtCzB8jSysacovN22Rzedyc5o/rFV65gjnrVn1b2aFl6wJlg0gLw0c7tBuLVBJGe29XE/+03zDn6vmVBoaSK5cXt2zf2SbGibNXOIr2f/8SvTmP0BUptNH9Q+qGIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=guPkpGVx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="guPkpGVx"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7dd05696910so3485796b3a.2
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980253; x=1765585053; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8zDbYh8g4andZgSq5KjxfJP+Yx1X56NwE8CC/T+SiEI=;
        b=guPkpGVxp9yeJ+eP82J6KTFfFisv3zUA228Vaex0HDWxD3fgZj9JBbvqd2wpHlU/1g
         00Bc6tEqJwLZpYquPsQnKOHnN5I4x7ctTNidkiMCsVS1Zlietm6CfT9PwT8Iz9LYKrXF
         dIrTdxDDIMxex3cGgpB0UiTf1wpcZdk1J6sq3RKd3l2V7Et3TPSzltv8Q5hGrcuO4Zd2
         /rxS9uge9ydC6BgHwNtNeMGceJMUWr3VYENsq4/57CUCV15vYABHtRa5RS5CG5VDc0tU
         /b6yQZHWjsc75vUTjSbSX++bc/IrCoHuxxJCoYAAmHCH83aXnAdcaJmLZZR+GxnE4J3b
         LLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980253; x=1765585053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zDbYh8g4andZgSq5KjxfJP+Yx1X56NwE8CC/T+SiEI=;
        b=lnZNqDripxp9PXI3b2PPfGYH3PGCTADHyOkgOtBpTs9To1DAmTu4X32OSr/cj6N/9v
         hQl7u3xazZiu/IMv/1PMdc0BS+bqgQ3THc7C6UHXdYZGB+9hWvf+iYP4fJJhrIiwEF/3
         dDKqamjuuWmPgxARyxYCQHICIytVtZcTS8H5q5YnLKKM/JxYqL/kCdbGwVMfA1W1Ab8x
         0iZUj6I4xoem4//B+we4F0RTo/yoleEPLA2tupyj0qRkXG8dvGVBVV/c2hoAb1VjIjUr
         CkZ1tSrVRpQLph9iiRrUAdShCHJRQ37lSH3skEVUm1/MTDvIX6PTCIYm++WiMgU8AmOJ
         x9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXUn0ZqTv9VpCe4dzrd8swann8T4w24fa5MJ7mhRWYfnbQ5FZOko8hb4rZBE5c2a48gX6yvo0voaHE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9+tO5JZ6eQ6IT9b+7UoETQdQ+JLj+y10l4iVfc5vlx/BkJBCu
	SHKsZOaCkHyTc0xN2S1ny63x5zCK1PeR7BCxWRQbfrDp3vhKZJELfL6Fc22Hz4qegsjtctzSbm+
	XRYV5lw==
X-Google-Smtp-Source: AGHT+IF/oM705F739LTH8aiHz6AKpqWGtQrIi8ngNpofrp5S2I+xWIdijTs20meiR96WS9wVH7kHD0C0BxI=
X-Received: from pgce2.prod.google.com ([2002:a05:6a02:1c2:b0:bd0:79b2:aa3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7b23:b0:366:1880:7e06
 with SMTP id adf61e73a8af0-36618807e8dmr621575637.0.1764980252791; Fri, 05
 Dec 2025 16:17:32 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:39 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-4-seanjc@google.com>
Subject: [PATCH v6 03/44] perf: Move security_perf_event_free() call to __free_event()
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

Move the freeing of any security state associated with a perf event from
_free_event() to __free_event(), i.e. invoke security_perf_event_free() in
the error paths for perf_event_alloc().  This will allow adding potential
error paths in perf_event_alloc() that can occur after allocating security
state.

Note, kfree() and thus security_perf_event_free() is a nop if
event->security is NULL, i.e. calling security_perf_event_free() even if
security_perf_event_alloc() fails or is never reached is functionality ok.

Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1e37ab90b815..e34112df8b31 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5602,6 +5602,8 @@ static void __free_event(struct perf_event *event)
 {
 	struct pmu *pmu = event->pmu;
 
+	security_perf_event_free(event);
+
 	if (event->attach_state & PERF_ATTACH_CALLCHAIN)
 		put_callchain_buffers();
 
@@ -5665,8 +5667,6 @@ static void _free_event(struct perf_event *event)
 
 	unaccount_event(event);
 
-	security_perf_event_free(event);
-
 	if (event->rb) {
 		/*
 		 * Can happen when we close an event with re-directed output.
-- 
2.52.0.223.gf5cc29aaa4-goog

