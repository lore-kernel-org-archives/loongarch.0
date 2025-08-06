Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB142E091B
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510323; cv=none; b=d8KEEJZlIk3LXdpkGfHvbQzWzHEZzncgeg+uI4XkSW5vcKfLS4t8dqqCW1QX531gR28qJkCVNxtAIsgq/zbXHUf9vbgoO/gcqItJS3kea/UKy3lmfEwTj4R/x2EVfAWI7udfn0SpCNDZ9FTUK1XPo5/kGS2UqlPaTJrezIcNjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510323; c=relaxed/simple;
	bh=pnnkC1bAXhozYLn1+A5GeTVXCux318fw49cZ8cqaQ5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KiIDNMVGWhP5jJ165SRh6iWObu/QzlHxU7CKMCTDKmdwgXNk4FS0ixZpHmvPzA/QL/69nlHkDxy4cSRYxTsR/qfcGveIPOeW6rXiPGlZSHmixBpMqzuDpzyZcCkGqhNGnhz3wnwaWp2uWsKmCB7lqfYgV4QhAvTEPufAIlYkjOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k/XfOb6Z; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k/XfOb6Z"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31f32271a1fso373543a91.0
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510321; x=1755115121; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RsFIN1Au3Dl4zaCmP13PW3DAgvYNBzVpKCYeyT5lYGI=;
        b=k/XfOb6ZG1IhHF+R1xmDigJIUSEa+INcK8xO5PhwtRkq9Td9lVt9KE0BGrFbESbAI9
         dbH6okzgT/38qEJFWIxlRat2aMWFvornBjR4V86w6vqk1WxTOxsr7OcVUf2WfnGE9n24
         KRNU2xmYbGKZ28GgYYf23+kcfVToAhgkO8NqpAtym4xqPbpQsdo+vOvFUxtrK4rC2Upp
         jUrPIZCla1ZqL0wr0ClSJh5/E5aT1QjQZ3+p2zOzrtyNxuu3isECkYkfV+M4BjKsE/uH
         tT4yHKVqfr1Up9vzctbFDTjjFYuUaEDCrKenFcFcVsnGPubtUF4TibKvXSNeWAEj5L60
         9+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510321; x=1755115121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsFIN1Au3Dl4zaCmP13PW3DAgvYNBzVpKCYeyT5lYGI=;
        b=hb/uT4lfEECVavTG7rkMXXlFxf5/lkJhuDlyDHVCs1SNWELl/dQqeNHyBAM1ZubIzP
         cJj0ClZrxCt9r19O+1Qhuer1oIAPusfKx6nwkM5ngKEYeY2EEuyt/XDKmrTD6GTFfsfJ
         gVDNQeQvfKMI6u3H6YK6luEh+R1+6HCXp7VHrpgjOCJ+l9emLHcK0caEqGo8gWnYbP/Y
         /ASki0D3aFSxWMEojVQLcRoCdC3rBhFDQ8xlJbQxjx4WPG1uJDD9jBN8AQFLp/DGZfqs
         513DQl5BE5YRTCgYCL3v9ZSM4E/XbeKtSTgYHmc+Z3WvnSIH6/9KxGvo4gOiO5aq0I6Y
         fIoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSIex3lBXrItcKZM5ygzIFmvd3nN4yRroox/J7Y5xSwpmO8YAvCSp5Um/UXIvW2jYSe48nMZ4FgBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcglGf73so+45WTwtF1rMB1s5DnvGDhrMXc+8kAnMEGXbP967G
	XQ/aA08PjtXcp62NyirCSEXft4sjkEQI6SApJCaXCCXFPkU3DJMbWUZ2gUP++IUu3teS6drWKEg
	2+vAnKw==
X-Google-Smtp-Source: AGHT+IFbNifUFnJxYDSjClZPGiWnx/CS0ykT/Hb3U03iCPY3aeaisiXn0lmHgRNeXCjIQ2AkJAWL4xb8X68=
X-Received: from pjqh12.prod.google.com ([2002:a17:90a:a88c:b0:311:d79d:e432])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c07:b0:313:aefa:b08
 with SMTP id 98e67ed59e1d1-32175622f9emr956977a91.16.1754510321187; Wed, 06
 Aug 2025 12:58:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  6 Aug 2025 12:57:02 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-41-seanjc@google.com>
Subject: [PATCH v5 40/44] KVM: nVMX: Add macros to simplify nested MSR
 interception setting
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Add macros nested_vmx_merge_msr_bitmaps_xxx() to simplify nested MSR
interception setting. No function change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index db2fd4eedc90..47f1f0c7d3a7 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -614,6 +614,19 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 						   msr_bitmap_l0, msr);
 }
 
+#define nested_vmx_merge_msr_bitmaps(msr, type)	\
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1,	\
+					 msr_bitmap_l0, msr, type)
+
+#define nested_vmx_merge_msr_bitmaps_read(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_R)
+
+#define nested_vmx_merge_msr_bitmaps_write(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_W)
+
+#define nested_vmx_merge_msr_bitmaps_rw(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -697,23 +710,13 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	 * other runtime changes to vmcs01's bitmap, e.g. dynamic pass-through.
 	 */
 #ifdef CONFIG_X86_64
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_FS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_GS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_FS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_GS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_KERNEL_GS_BASE);
 #endif
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_PRED_CMD, MSR_TYPE_W);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_SPEC_CTRL);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_PRED_CMD);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_FLUSH_CMD);
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_APERF, MSR_TYPE_R);
-- 
2.50.1.565.gc32cd1483b-goog

