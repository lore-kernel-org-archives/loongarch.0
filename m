Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272A2D29A9
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510276; cv=none; b=Po9v5S4pypgHxyQibkEJYvc81fSMQpGtOaHtb5knaQsB2rZSIEmEbUELGC4eWaQULIjgy1s66oX+mfDb0cs8wm0QsFW/7R64duE+JBGMtByvObkiowctsvFuxjRfqS+aUMwpiTr4twggfTNM7EK25bD/NgnOPhuv/wQ3WN4UnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510276; c=relaxed/simple;
	bh=jdq1crWcKn8y7XDSp99YavaEpnm3s9VMlFDhCc8MHB4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kBdXckLypCvE0BIOYN4V6SEyu7AK++Ue78GxErP3dCUAxhf8mmV0BxKFrRuz2JFwgCtUIBqBZ5KQt5Ce15PyLJmG35bqz/tQLKvNZnQqxViF0cqI2ACPlDDEcmXS3G+z2Eia+li/HdCIW2XoOeeRNH89Ifv/ktdTq+X4I4IFHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDSwy0v/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDSwy0v/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b4227538a47so134677a12.1
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510272; x=1755115072; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=hDSwy0v/BJb6/OTKq58BiGQiVLNmD1Yw21Q7jApF5M/V2NexQoDgfVrpPwdDzti3Z6
         fW83lmkt1T50gd5CzHXYvvNiOCuZnFdipI9RlT8o87ygwqruTNITp/n1ckXIctMzbso9
         Wy2pqIlF3Iqpk9dT8zgAIkmtmaoMeOs230jRFMUOuv/oS/6cpBuh31rBWpDtKs6JMnCH
         QZkkukBamQdWR7gZs6m2UfpWU++XnbyhbjStA+W4eA/XoYpddNo7gFNc5wC3oUe/iDCn
         iklroo94oiY5xvicJy3f1zA3d8HxDawzQSeszgabcHbcFP2lIXcHDgh3nn7ks/OZKYj2
         pYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510272; x=1755115072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=SdJQxBoAzWrIYQwNnustpWqIIOc3fHcA0rVq11cj1zflNHJR5lRoH6mO3v7PtJEYV7
         YZxyY2ttBLRpCfWF0ZaHEpz3MNGc/5TpxtbmTY7W9bNvLApWZY2RSF+4icCk3aMFZT1W
         f6jCdRFeXs0DiqVmTtTnn09959D6utjdPBPSmS3eUztV83cTKGzwCxJ1wR9lY7G2cpcC
         yW2v5OZKfFup7U5A5oFI39Njvv4WRTDiFMBsPpYidvsOJ2i3r6et7xUy6EzOxqQHPxvA
         YkgD6n3RoI5DkEROGWxiVbpc/NNHQAS8hoawtejiqkm/G2DsS45wIgguSDc5XSvv0rgr
         1Wxg==
X-Forwarded-Encrypted: i=1; AJvYcCUuxvFgkAxW3f3T1xTgDUisw3S0WHDyQTIqC8upVjVj2X2TB/KynQaouwl6czCOQrL9Kh15cIQ/ZcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnrBY9ACHE7mnmujQjbvKq92Qt3k6UAFKP30+AIBD8KwS9BgBU
	GxYkHvA1wOrS2lKTn4ieXz2pjjq9bXDcf7VsRTm57brQ0yRS28aw4qSokl1Of1vfxob9v7k+qlH
	EsswP2A==
X-Google-Smtp-Source: AGHT+IFt32OpTUGU6us4Rz359zlOuJVL+j3ifqAbqQAET68s3resGqbQqEcv8vf6Ss5FatBMSRwumXjkA8M=
X-Received: from pjbso3.prod.google.com ([2002:a17:90b:1f83:b0:311:1a09:11ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e784:b0:240:9f9:46a0
 with SMTP id d9443c01a7336-242b1aa312cmr4180365ad.38.1754510272385; Wed, 06
 Aug 2025 12:57:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:56:35 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-14-seanjc@google.com>
Subject: [PATCH v5 13/44] perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for
 AMD host
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
2.50.1.565.gc32cd1483b-goog

