Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6D29BD87
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980284; cv=none; b=uyZWMUgtsoMezy3sw2MQzM5KaSKHF8cejzkpVPIclQnM4BeGW2us09M3Al6YcBh7Fn41ySZNrz7oDibiQQeG3OhBtB46e2eM0gCNO3xX/KTGiHAP7/mHLKDgkWS8T8V/z/GOS3Tn2PteDAx0ADKewgBGIHQFvACJOv8fmL/TeVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980284; c=relaxed/simple;
	bh=GEofwV87pfS9k1X1r08HpHCiDsjoBWg3ivwGBCrzyh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RjZnGl8UYNEvCJADb+tITHierzBWbhdHgBHDtUoSxLFOIDmTDkb1nABs4UvbEP8CNIt2OOtvOx2SBnrCJqvuPLz4vprkCHatZpZ8TmdeXCtf/XhrGa3z09sB2AntmKZB5t8vDZgW/GtIDg0wn6nxF+DMpVvRX/3RvDTiK00sxTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XFXBZunX; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XFXBZunX"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34378c914b4so4920040a91.1
        for <loongarch@lists.linux.dev>; Fri, 05 Dec 2025 16:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980282; x=1765585082; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Z5nHAcUfdxfKrbAwjeK85mE0dJR71iRHLzzuZPmpA=;
        b=XFXBZunX5GaunUmfHMQgGfGFBlX1Gz3eBJAWcqDK+t94lnFjVerL+qm+xHWGMhVvWz
         PtfJMRucgH+9YEJSmIArENYTK0ULPxqAvHBRkkQRSe+OY2qducSlYU5ExG5aPX6hi3Mw
         CLBkvapUfLdMgzqDRVqfy6/4q8lp6P87iS2ch8aBVJfZgVOJlb99+F6jX4nuCtnR6Lsu
         zS3eVNfrNE0Asu8i0D4SYZwel29IicC6g6NFyU2NLMT60eCdYWJbP7ESruFTjKfcErSO
         zWkpmjSeJyTli6ctyXXGvUc7HspD+opdm0/r+tpZ2UwANhDbtDl2SjWDiaXibyhI9BGN
         Z8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980282; x=1765585082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3Z5nHAcUfdxfKrbAwjeK85mE0dJR71iRHLzzuZPmpA=;
        b=GV2pFDByywx5bgMtAjyuf2tTSB5i9shGJo8zg6h6KeIR4A9+vP4mOqZU/vmNkgJY7r
         y4yLuA3HTLxZgtXHQMO8JJaodF4v7Bad6T18yA9X/T6lgAp+ueEYgbHpc9DAinGu0w4z
         xw86lYnnQkTke1mdnE6eVGOfL+5Un6YVKEGiQN4G73CBPgRQr3skDEqkkLSGWZxP3CyO
         L00/i47UON2lw/N4KQ2m+KsyBQYF2H2oF6UGFhrh6BPfvju99u/ZNzZE5+DZxq9MJzw3
         6rxOPK2Eft2EDOS1x+LDEGdl+zDBaJY0jS5vshhyjoLL34pKMaane6GxdQSwD2uR13Za
         feFA==
X-Forwarded-Encrypted: i=1; AJvYcCXktW1met+LvKKa5En+avOd3EnmJbSBKvU0AKUhQcfnqKUShwTPmMrHYHAS2uZdD4LEG3ly+iR/EXs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3L7XC5ycC9mWGjln+uZYuOh3N/JRw3zWBS40ZwVOIFAWMQcwj
	IkebguaFVrvsGCisfgQvVrRrWSo9qhM4/2Sn1QF5YIVEgHrl3DHdAFUytURNEPh3qdaqJiNdipi
	xau0zVw==
X-Google-Smtp-Source: AGHT+IGcOklQOzJ/lNZWJnk8g0uw9rVYfuzrIb6PtX+N9IOeiT702eHEqjavt0HC1DcnaOX9m2isN8tDRpE=
X-Received: from pjyt22.prod.google.com ([2002:a17:90a:e516:b0:340:92f6:5531])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2cb:b0:33b:b078:d6d3
 with SMTP id 98e67ed59e1d1-349a25bcd68mr661307a91.23.1764980281984; Fri, 05
 Dec 2025 16:18:01 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  5 Dec 2025 16:16:54 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-19-seanjc@google.com>
Subject: [PATCH v6 18/44] KVM: x86/pmu: Implement AMD mediated PMU requirements
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

Require host PMU version 2+ for AMD mediated PMU support, as
PERF_GLOBAL_CTRL and friends are hard requirements for the mediated PMU.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: extract to separate patch, write changelog]
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index bc062285fbf5..16c88b2a2eb8 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -227,6 +227,11 @@ static void amd_pmu_init(struct kvm_vcpu *vcpu)
 	}
 }
 
+static bool amd_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pmu)
+{
+	return host_pmu->version >= 2;
+}
+
 struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = amd_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = amd_msr_idx_to_pmc,
@@ -236,6 +241,9 @@ struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.set_msr = amd_pmu_set_msr,
 	.refresh = amd_pmu_refresh,
 	.init = amd_pmu_init,
+
+	.is_mediated_pmu_supported = amd_pmu_is_mediated_pmu_supported,
+
 	.EVENTSEL_EVENT = AMD64_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_AMD_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = AMD64_NUM_COUNTERS,
-- 
2.52.0.223.gf5cc29aaa4-goog

