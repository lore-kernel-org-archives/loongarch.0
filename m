Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953A2BEFF6
	for <loongarch@lists.linux.dev>; Fri, 17 Oct 2025 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661211; cv=none; b=TEExbcOhzQF3WYQf91RZKb09v9ZmU7AxnolKTWd5Fg9N99DDrqZSf5F+7flT51sJ7rr14fDcmAI7xyg7bXOqmEmTvgWL4QJGuVkHPeww8VWX28mgy4YrWO3nasVB9HaiFWxmnyZZ3gNy9AHkwR7W1u0lbUwlqPuDTA/+KiOh/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661211; c=relaxed/simple;
	bh=Jnfkzx2NqZmze1Ji5qS22be+VpNyN9sUekdU/ad34no=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QUcIgYjbjTOqZR9lQufKDa46DVu3Wd5m1evac/gixs6w0CJCALv7iPW5Z4ejKovfiFrQS66LWWvbc3eFxA6P8yTGuj0gT3GsMpAbbUedE/nh3ABpxkfbXqCl0FHJpCymjvJ4zGvVp/9LC4w3GCps03SiEQc0zIXLstO86c8N8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5rj9oFL; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5rj9oFL"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1156411a91.2
        for <loongarch@lists.linux.dev>; Thu, 16 Oct 2025 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661208; x=1761266008; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=Y5rj9oFLHiON+pdxET2zDtV1pZTcu5e7+czC8pg3qioP3Lq/E9EGzpW+V4YTehQn83
         dh1lwGoqZn4yWR31dLVsFDJ6xnVjCvwkC4VxmmK5OjGcBlmpvmWteFgCmRcfFliTYnq9
         6PdUuntYCUr4XNbBKbh84m1bHQgzh3YhI7IWXcvPF/IaVx8hdeAvdCM2GOdOSKu+/V2k
         uh8chKx0nyCig8PvFYf8FNwWHChIOhKROyYqT03T8CNoHdRVVTMGVxtGAFeP6XdOcE7R
         4BSo4fgFqTpB9yvPQwNs3ocjKTWZTb07H5uH1H9lOM+Fq8sOJXc5Yk02FSXDZ0ddQb1w
         idLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661208; x=1761266008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=kEYRXFIr3XUngRA3xj32Kd4MWutzE1U3rBo48jR9ig/ZXmnBnvOhCVkneGIcikk7SH
         HIcXmKfdSU07LDlYdo/w4cNmIKbHJhJxzo5XIt6OAr5QmpReL2Klw7KxkroiZfWyXuTH
         lrAWb9J2FANdP70BAV8Kb02qDfBA1Hfvv+RGmykxwNSraW3kRbVUt3VsQVXwawnXpGYb
         QSMaLy4kbcvFG+Poi6UCdwMO+MJ58ZixZdfY8ljy3H1Cq7GpHYt7k5lLtDuhGZUhiT10
         XFkVCFh/OZNFX0yDjaK7hb4mXO4abSDiq2LZKGJ9/FNGJT+nHiQHiviQCq5wFP/Z5xM/
         EH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtZ1LKwz9+XSqXdO9A21NcGJvnI+FslsfOejPX7jXvO46Af/DwNYpq0cIEL80MUuH0uKQcp9Q5BrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRDA92q8iD445O6lHwx6R+o74Bq+sOskdEFcX0yPf/AI6k/0Gz
	SQvjyykY+ngtaWcZscq25jfLdo0TDJhyhT/eAzUEzjXI05CLs3HSL55Eo6HJ5mGYC1zqmKaxHme
	AzXGfYg==
X-Google-Smtp-Source: AGHT+IHg17I+MrCPzq5TEoO4O1fEv/5Rea+bFeeHOFAKW3+uW2v4jsY6m0H6q4wWDO+YA+zfXcJHtbyRmvo=
X-Received: from pjot19.prod.google.com ([2002:a17:90a:9513:b0:323:25d2:22db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c7:b0:335:2747:a9b3
 with SMTP id 98e67ed59e1d1-33bcf90e717mr1807890a91.32.1760661208480; Thu, 16
 Oct 2025 17:33:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:41 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-24-seanjc@google.com>
Subject: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1de5f17a7989..84b5fe654c99 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2781,7 +2781,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2794,15 +2794,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog

