Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC572D1F42
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510272; cv=none; b=OE0TKhuQJz6On51/aaZaT4hSvH4juZ2yyTY5ym/g3FAcr90hbLAv5JzPUfrOKFeQEgTy+UGijNQUFeoo8rH4oVpv0iSi+e5+o5wDPkRdWqueAkJsHH1TKDG5gjrvZW/aFiHs+7vpKQL2E0mpJtGUy3ONaIiqH1Q5KGp9EL85bVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510272; c=relaxed/simple;
	bh=dsL7u0gCksSjkMYlnKFIZN+mhAdNQOloX5K9ddADbjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=prP/hFRxBSmHWn2nC/B/xwuIqKyTMQDvPNDyxB9JQjo+AVVT4VWrHfAaYAlXMbAIzIYQnmh2QJ2tKMqIxemdxAQAQWY18kD9r46Fdm90/k2SAenqzfn3FuzBI9KhhRIy4OAFPWDpbn76YpWBjEp/M1yWUbH01bVHF0JdMV7sWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lhcctp/F; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lhcctp/F"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31f2dd307d4so279710a91.0
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510269; x=1755115069; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zcpMdowVJLAIFzpWUVXDuq4S/gKqPMBYO1OzyYmcx64=;
        b=Lhcctp/FV5Z/5kKpYV1/2+r2hVw4gSa5G1wR8e3mE4svkeM3FJkYukSgFUQXDNrMpo
         FlhDboCWphgkKwDU2t2j4ZZBkezt02W81HY49Wc3vFz9BbMNEKWzy10EVHzuFDpeck+n
         oai1Oc+c7Z6K1YvROF42zdsFd4azJAHVCzSioh8cqLK1G5wh0n3+jOZ7H4q2/Ox3Y28+
         cgzVb6WrKepGJT1xSHKWIZ1qdLgCdR0lHK7O+U3dxq8pvPsAS7XoEq4bgIB0VhUiVzmL
         giB8Cf6bPmQ7L4PCeDFW1RdvgpQaRvr/yfn++SF4Vh9Av7qZOzFkswVWj2sMenUXkwmg
         sRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510269; x=1755115069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcpMdowVJLAIFzpWUVXDuq4S/gKqPMBYO1OzyYmcx64=;
        b=cPkMRwcjmYt5KdmfGKvvj7TeH5isRy0254GTFAjATG9iF7ecU/mtsdAmZRskBajZSv
         hYsbuR1BQKRD7E97seSOF5PyJRvCBuALgo8//S+x/LFFVlE91y/V7QZHFtYHSiAogNMV
         pyJGGq7XOdy78xQb1XlZ9PS4KmT49J2ba1Yv8cS9sqiUcj9Z34fwVSyC2Jafx1Vx+Lh9
         mUG/K08M7NpRq7Wi41jevn3cte83Oz30mQCYgf7cRGroJ9RjdsxGORdJWvdSnwpNbn/X
         FH/g4mr4/Z3WFjSxMPpxj4yrA51XiKCzDi7tz/w9VZwABzM2qf+HXI43dum6dYDXNXwO
         aukQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdiOmQlikKw3E+K0OnPrhnadDqg4nLmjdhKUd1I82DGZ1RTHlDXqr+ocKSRRJ7hBVPX8bSTDNqZl8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSoYTaQjM/kQmH+0EMZzt3+4xay9ubEXEy2v0UNyfQBpGc7kI/
	TeSjR8K7lsSPzUSCptHMjaOu/KObrfQPAmuP/O+BHjl4s41OzfM6Je+s2AiubVOKlgAoy9CwSwU
	IPWFSKQ==
X-Google-Smtp-Source: AGHT+IEVLR7eG3e1/ODg1GEbzlPUzUDlLQzQgQfsonV4iFGNfX+Tq8xQvuZk8V1U7zslQQy51nOqc0FuQr8=
X-Received: from pjtd2.prod.google.com ([2002:a17:90b:42:b0:321:76a2:947c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:380a:b0:31f:36da:3f85
 with SMTP id 98e67ed59e1d1-32167520ee1mr6465429a91.17.1754510268743; Wed, 06
 Aug 2025 12:57:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:56:33 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-12-seanjc@google.com>
Subject: [PATCH v5 11/44] perf/x86/core: Plumb mediated PMU capability from
 x86_pmu to x86_pmu_cap
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Mingwei Zhang <mizhang@google.com>

Plumb mediated PMU capability to x86_pmu_cap in order to let any kernel
entity such as KVM know that host PMU support mediated PMU mode and has
the implementation.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c            | 1 +
 arch/x86/include/asm/perf_event.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index b8583a6962f1..d58aa316b65a 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3130,6 +3130,7 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
+	cap->mediated		= !!(pmu.capabilities & PERF_PMU_CAP_MEDIATED_VPMU);
 }
 EXPORT_SYMBOL_GPL(perf_get_x86_pmu_capability);
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 70d1d94aca7e..74db361a53d3 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -292,6 +292,7 @@ struct x86_pmu_capability {
 	unsigned int	events_mask;
 	int		events_mask_len;
 	unsigned int	pebs_ept	:1;
+	unsigned int	mediated	:1;
 };
 
 /*
-- 
2.50.1.565.gc32cd1483b-goog

