Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584492750FE
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980276; cv=none; b=QizbVMOClzXOPJ7irDVsPgXS6qaO3yM6vRFI02mZ8/W5iI+acbTvSSktqlWuCxxVWM1VkajmOll6lZeSzHHE2vGzowXT9wSl64kIsORePAgloI5ss5wQzMQBnSyXJQqvgqrim/MJE9tVZlrwkC/xop68V56/rFjJMPe0PD4ngWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980276; c=relaxed/simple;
	bh=kd7T73ar6I8NiXQe7LuWrPEA21EYkgr8AnFeISoZufY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YqZc7AGC9xtJJXs+diOuwXOj6b3PqP1TiDFmwweiXI3iLMG4Zsgi++FPredIfY7btcLVlJAGxOmhY6g/48MVkSAnRoLEFge9RynITZW+CKjQd8rTMCeY9OEaZ6zlkTO4vWGl8smNaj4DILsuYuQskyHWTTFIgcH+xoeepTZelTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v3KH8PJd; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v3KH8PJd"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso1884278a12.0
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980273; x=1765585073; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvhz9N1L4N+mDurmwM1rhQiV/PP6RHnJJPdqNYMoi5g=;
        b=v3KH8PJd6SYkPLpFo6JX/vNOlV4FX5S9fj8lXHfmAH07WoRa9CFQuG8DuvGWzqugd5
         U5jI1hIgqsIJ55KdXOyWaw6Feqq7dtZqf/rNN56bf59tQOuYWzZl+OBOXBxwYmsIoAeP
         j0KMyMvC3pgc5PAYhyt/yLownkVZXBGYFtUSzkMIbMA5Y+Q8AIgU2mliuOW/z5nSjhj0
         ocgCbYgQVGsVaO5E2m0hO7vpnpPQo0jnZCD91fIM6atlhS/MSfvlOZUc9v1rCdcUZtUG
         FIzDuYmQoysaYXIhC3E1yWOznd9qzjBPHfYEf31mTa9eg2WqfahQ4KmbQx+OwF7kvo9S
         Ei7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980273; x=1765585073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xvhz9N1L4N+mDurmwM1rhQiV/PP6RHnJJPdqNYMoi5g=;
        b=cN7fn9bNNvLLu04P43zrv5M87YRfVDcZ+koGR9P3sNrkvtNEPNxudE9ideFs0dHjjz
         rnZiAtSZzUfzaRqe4Pq0Ksp0BUp15n5BFnI1L6wvKDmMWcz6J4yiYXix2bluw8G4m0be
         KGh0Z+C+w9EyxV2PMJwSdBvAYXuEY1M/RY9okYd1bSRUsHJeFxNukXJhxXHCpAgO3lLK
         WAXnxiy76BiY3/EduVVxvJ50Cg3hILbRnFOJew35PRp85jhzG3VyYngN2hu5Y/RMc3vx
         j5GSzY6AtX15/zNLxWVBoAXPNk1NOlkJctvGrffJEFZCf2HIZT0lr1QgfFwELGjJG7Vx
         VpxA==
X-Forwarded-Encrypted: i=1; AJvYcCVSIWwBq/TdvMnEgQcZn52BQAZf4QpKPlsrKPKlxAXg2vTqEAm3C5RMSCzaNevVkbxXohVdbD2uejQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvYtU45Azxxm0akCCqZhVbx5zPK+JD2mQi2DI/OxUnjXGWOIGN
	/wK8phfNM7E5YNxFxX0N+mIB+zohrgGT1GwjMJRO+0sJcdFVzxGUG1LWFSArePiSaLz7uwDQ4tF
	HjJfk/Q==
X-Google-Smtp-Source: AGHT+IFWUJIU/8E8cWwKD1KvVXfXTPgHtbYSY08/FWGA961BLSrK8ZlXaCtvUM6dR/7cetdvhZaXTRiVhyQ=
X-Received: from pfdc17.prod.google.com ([2002:aa7:8c11:0:b0:7dd:1a70:fbc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5605:b0:366:14b0:4b19
 with SMTP id adf61e73a8af0-366180292f3mr728551637.36.1764980272562; Fri, 05
 Dec 2025 16:17:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:49 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-14-seanjc@google.com>
Subject: [PATCH v6 13/44] perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for
 AMD host
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

From: Sandipan Das <sandipan.das@amd.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU flag for version 2 and later
implementations of the core PMU. Aside from having Global Control and
Status registers, virtualizing the PMU using the mediated model requires
an interface to set or clear the overflow bits in the Global Status MSRs
while restoring or saving the PMU context of a vCPU.

PerfMonV2-capable hardware has additional MSRs for this purpose, namely
PerfCntrGlobalStatusSet and PerfCntrGlobalStatusClr, thereby making it
suitable for use with mediated vPMU.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/amd/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index b20661b8621d..8179fb5f1ee3 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1433,6 +1433,8 @@ static int __init amd_core_pmu_init(void)
 
 		amd_pmu_global_cntr_mask = x86_pmu.cntr_mask64;
 
+		x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 		/* Update PMC handling functions */
 		x86_pmu.enable_all = amd_pmu_v2_enable_all;
 		x86_pmu.disable_all = amd_pmu_v2_disable_all;
-- 
2.52.0.223.gf5cc29aaa4-goog

