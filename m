Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938742BDC2A
	for <loongarch@lists.linux.dev>; Fri, 17 Oct 2025 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661207; cv=none; b=IZDh6ZvIvhnj3ixdm1vfmULrm5+oxz7oqc6jZbQDakqJQC0MWWLie6Fm+EAC9vWqRj+Vz6k9fYgL8NdDDgaPFGR1NGNkFOnuFo0QVezpq9OtI9ACNLqrOjpT9uysf9q0U98mTChQKruGFV/kADdBjWjBFFZ7ptpQ5d9Z3tIX1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661207; c=relaxed/simple;
	bh=7L8ZMSuIkRJTkNiFBvS5epoU4gg7pv9o+BehY7SDauc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K3J1sYf2r6tc32nxwLSLsA6MCe3E1KpNk8yaMhXqqv+lH0SbtGMhdb3IuhV0Yhg/vcZ/4x6Jg6iOeiNRB2YSxchRxNmD+PWwJB/BsIz9pUpnjLhaeFIX5h/5Z01dQypfCeOSqdJwJE8a8E7l5RPbUd35mjbzSBzmRwD2IeWDbWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6u6nZrc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6u6nZrc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-336b646768eso1548704a91.1
        for <loongarch@lists.linux.dev>; Thu, 16 Oct 2025 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661205; x=1761266005; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=H6u6nZrcHJN51i3WUeG53Rzrj8T1f7eACzMjHMh0WKme+NFtTvGOPDxLHVVhcmtoy7
         2Db4Ok1vbjE7QV8fK97jci2FzZ6EsvW30DNm+RQ740JDXQDHrWzY1I/CkzUCqogNEN1R
         bXZs9/F8uluMCSPaAFJcow6sGj6K22JEth1ZcahllBBxfaMXzGb70uZ7bUWC6QfaCIom
         QLkpTW1E84DE71OEFg+1L0coEwvJUnh79W3i7CbN76838uNB9eu9dS4QBQn3Zb+HbtJy
         GLImdh1LcvRhgmVQHmH/wntgoqWeKV05Fxp6ingavoLsnjTcm5azo/rCWTuiLGlVs71T
         XvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661205; x=1761266005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=tC21jk8x4EdDgPfQe85xslk1XgNDYsYMgopN4XriwdOmYB/ruFiLHzdl4fIVCfKR3u
         /ldcMg63UIi3mAzy+2kUy3lIdSO+jUjbRgHbPSv/t0XwsXTdtK1yYRghNrmNysypASB1
         PDOfSakLO5p3rPwMhNGggn+uNds1tlcdaKxlv5qiWuFgTvFOFolhIETlt+O0vNBkIMN1
         xQzzrdw3aYtn1eUUarm7C1KEXkc+J5cNfJ+UXbdyHYn3JZFD8qjvUso/TBcy/y58xo9t
         mB+2VG8QWo8owW8v7W2b9Rji0RY0sqUsFyCa+7egIZ9HQDHhkXEls3RF61CZqCk9bP66
         ktAg==
X-Forwarded-Encrypted: i=1; AJvYcCUsi8bVLzDmYDCftz7zJDO8TFZ+h3ZxBQVIgWadldnIpFPMU/wobPB2LF4UkK8y+xrkze7Mv0vDTg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL0P+b3DjI3JnTU/qwZ5wGHU9F/bIJG8GyN6s3ksgIwn2GpJZT
	Qqh2jNJr7wRhSVx5DY22o2XBgUgGGh6TavldszmWbKu4c6JEY5ru3uN/LNlJx/B9F0Eb7IUKKEZ
	EwymaMA==
X-Google-Smtp-Source: AGHT+IFb3cb9XScIkfIbQA2oQID7nhqxfExRyWF6N5UGcVhE3T71y0SJP1d51io6pNMM6/KZP3XG25y1rx0=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8f:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33bcf8f94b6mr1826093a91.28.1760661204960; Thu, 16
 Oct 2025 17:33:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:39 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-22-seanjc@google.com>
Subject: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2e2dab89c98f..d5f810435f34 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	if (cmd->hw_error)
+		return -EINVAL;
+
+	return 0;
+}
+
 int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_tdx_cmd tdx_cmd;
 	int r;
 
-	if (copy_from_user(&tdx_cmd, argp, sizeof(struct kvm_tdx_cmd)))
-		return -EFAULT;
-
-	/*
-	 * Userspace should never set hw_error. It is used to fill
-	 * hardware-defined error by the kernel.
-	 */
-	if (tdx_cmd.hw_error)
-		return -EINVAL;
+	r = tdx_get_cmd(argp, &tdx_cmd);
+	if (r)
+		return r;
 
 	mutex_lock(&kvm->lock);
 
@@ -3152,11 +3157,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (copy_from_user(&cmd, argp, sizeof(cmd)))
-		return -EFAULT;
-
-	if (cmd.hw_error)
-		return -EINVAL;
+	ret = tdx_get_cmd(argp, &cmd);
+	if (ret)
+		return ret;
 
 	switch (cmd.id) {
 	case KVM_TDX_INIT_VCPU:
-- 
2.51.0.858.gf9c4a03a3a-goog

