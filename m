Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA1134AB
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342022; cv=none; b=AAyAaxcS80g754fZy9UcSA8F6dOGgGtNgfx5XS31NTc9xeH6hrw+xTICcCph5tND4Fw8FvvJDcocF/y92oPkRCgm76KjJhCKNqS7eE/GDont1oKYlzLYultmvXhd5/PEXtpH6JpMcERA2R0Sbhcm1Zc6/RneZ9BOGDOzgQoUoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342022; c=relaxed/simple;
	bh=a3/l+BJfoA/G/28RbhkAW1tXtxlUYPuy/d4D+LgwoZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4BngfE8ESBpTGVxEWFgncV4HImQ61hUaUkwkgY0Gkf6wyDB4+rvAzoimIxPMGixAVBMkmcfyv0A6fJTrzj58UJo51LZcWOW7HBi/TmL+IpNiyg+2moNKifpkgbZejTC/bM/sP1/oPaf397ybJhLV50vORPP/rNJP3e3oMC5Fm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyF+ySJL; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyF+ySJL"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61e0c1f7169so5791527b3.0
        for <loongarch@lists.linux.dev>; Tue, 21 May 2024 18:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342020; x=1716946820; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RHSd/NUpLA+qEQZ24Usoansq2bi58Ee8oOJzhOJ4pNg=;
        b=nyF+ySJLX+hU6dbd4NAf2kppi9FEFTH8fQ5RZAdJxuKHtz8m4aqKFd3yM29toojjgK
         dIWOfZxwa89JXdkkp+ciyTUODVqIiyw0m5zRorB2TpDbOoDxY95t/WQD+7Q50tEYqTcO
         MxMP2UN1d2vRuGPj8LIIjo238qf/d9pMHC2xbDnRlZ6BeiU+UBLu7xyLVkmprLOjz6xY
         VXxfPL/N+jC8clA8dhXDWaoO6o77xxq+FjxWu1YseQZhu4BxwXg2CpTZo4KBiViNezmD
         D/PaCkeeFvBtQv/fNrzCf2Nt4eg0S1Pmr/t68yzpFq5CqrsGeokgRyymj/h+00GSTCvg
         aU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342020; x=1716946820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHSd/NUpLA+qEQZ24Usoansq2bi58Ee8oOJzhOJ4pNg=;
        b=mSt75rOURvDbqszaCwzuETyOWLhu47fweD4hii5+tcKxzTKfXNUb/q+kh8IPsxsb1R
         9liuWCwCOaLmx4p8sVvR4FJto2x9LpeI04fY/QuvHfV0mgVSg+QfNCGsaNDhj+v1o6Sz
         qIiYKfUSomMauKvASOwFFxA1RADC1F5aHU9WJUSAWnegFqObr4v87XFrEsKYVo46JpB8
         UW1GN2Wb5htqRU4nlTKFxuLwf3fkEYJMycbMYaJAm30zRDUqidOq+VhmMI+FSmOeIUwb
         elxkQaiuuw8OtCtcZowMGvDGWRuez8EBUwIQwuTWWKA+GRPEWn9YmCnYvVKWz15vpp27
         Ua9w==
X-Forwarded-Encrypted: i=1; AJvYcCVu+ry+rmcOoe2HJK3tw1urDX38tRkUSLl8oZDNq1zhrtfopPS0EObdxDwR+AqTsMc0vPQ4bQuBMNZBt2UJaWC1eXcXRieojoKT
X-Gm-Message-State: AOJu0Yx8RCtxdInVlGt0WkFSry9IVB3obkIkVxIxiML3pzHG8tpRqZ5x
	k+ifM21e76lR6UGZyqwspNQsw3BGWSUPT0xTNOItwpvLSS2Rq693yEl4tm0/UP8QOIH5rA+P79W
	Lyw==
X-Google-Smtp-Source: AGHT+IE9wMBEKwP41aGLYHN5gIBbi7welOi0G93+qj4AotHFqdz8JFE0XRpN5nX1Yz+N7pw0xKG3cBx+pVY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca57:0:b0:61b:e53e:c7ae with SMTP id
 00721157ae682-627e46aa2e9mr2093257b3.2.1716342019957; Tue, 21 May 2024
 18:40:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 May 2024 18:40:09 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-3-seanjc@google.com>
Subject: [PATCH v2 2/6] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move VMX's {grow,shrink}_ple_window() above vmx_vcpu_load() in preparation
of moving the sched_in logic, which handles shrinking the PLE window, into
vmx_vcpu_load().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 64 +++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 51b2cd13250a..07a4d6a3a43e 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1410,6 +1410,38 @@ static void vmx_write_guest_kernel_gs_base(struct vcpu_vmx *vmx, u64 data)
 }
 #endif
 
+static void grow_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __grow_ple_window(old, ple_window,
+					    ple_window_grow,
+					    ple_window_max);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
+static void shrink_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __shrink_ple_window(old, ple_window,
+					      ple_window_shrink,
+					      ple_window);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
 void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
 			struct loaded_vmcs *buddy)
 {
@@ -5889,38 +5921,6 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-static void grow_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __grow_ple_window(old, ple_window,
-					    ple_window_grow,
-					    ple_window_max);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
-static void shrink_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __shrink_ple_window(old, ple_window,
-					      ple_window_shrink,
-					      ple_window);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
 /*
  * Indicate a busy-waiting vcpu in spinlock. We do not enable the PAUSE
  * exiting, so only get here on cpu with PAUSE-Loop-Exiting.
-- 
2.45.0.215.g3402c0e53f-goog

