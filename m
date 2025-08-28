Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6724418F
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756339337; cv=none; b=pflOHnmSmwSx4xr/pIQhsb3a/dsvjrv6X4vrRb5BC8OIAS4YQziaJ/8M3rg8YJhswDTPh1dqGycDM7OdTMEkhsUJUc82Y5ns6GMA0Gsl4cp0AN+zTFoQy9tl0k7ALQ6PIXkSR9s6CHT1ibuGKUlxJppwKNwHbpIJ7MVdNDJ6HOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756339337; c=relaxed/simple;
	bh=5KZra7rrb6EshYnRt06iajnZTBGSSVrTrCSYe32dt9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e9hu+Vcy9GFKXKXK/4UevXBk068oHE5IEQD4REE4ipTPFIkkBRtN5mVdFd/zmjm75z9aUFShj5AWDwo48+h0yYUJb+nSKcOcgRqbNsulM77+rS6eLQ30WkjXgkBnYUIYhwub5yW/cSGIcQ7NEZxEHimucgfFwqZqyWZWmTq2BjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XMcCvJEa; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XMcCvJEa"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32752f91beaso435669a91.2
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339335; x=1756944135; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=XMcCvJEaOGIwamEOZB6NgLGHT4a1i0rb86HfW0eOY600PX6oPgkhP8DPr7qI2Ms7f1
         VVYP7jBqiyhGXKYw1mkdP7pl23T0c8inDslsVRRGe1jc5INtYKk/5gbE1w7hLZgvfDjH
         wUPYo7HeL7jplDkthTyiavRWUXiBVI30SZPGoW8Oeo48T/7VynmLRzNtotvJEui0vtc2
         8oOjpn+Biw3kXJHnU5zMM4fYQa6sdvJM9q+XfHX/PWAsUx5bbCM02O593ll4iVcZaCs0
         ojQJU/BI8kz+3SDXCousj3ldwzcitQFHLJFnXnupwlKePshrRneHWWizhH+V3eQBquUT
         2VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339335; x=1756944135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=Hl3GDddEfw7DCBP4JspOCq+FLZXGmZ7OoPk8o9ox/I03U8sIAnCeSyX8j0qFTh2hGr
         hHn3eomjiHsY7RTkLisk+MzJaHuzdbMTKV9weQOVCLP4WV5JGbgOPFdw7Nk7mG456tww
         BklTOySGCXNLFNCD2O3/fBZVIk82idYA6f9TL79iQpAiiL9+PZj3+Y8y9gT+kZnvV451
         2erw5Sh4KF2kqRGrorALza2+sz0OFP6sFz8jYpLcewrn6HYI4AX1qwTqjTsPh/zkQQlH
         L+4kUGzLeYpYXwPc+zwWNHE+E6rJPqao089dGsqwq6sf6RML3+ndGcW53pT+MvB78kWE
         c/zw==
X-Forwarded-Encrypted: i=1; AJvYcCWtMEGl5QygE668afmZ/nztPtLUEiz+O0T9Vn8INNyTYP/+hfFWeWjdtzg3TsalWXTK9Mn2gFWHFHk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt4SArM7UFLXp8Ty6q5ZH4hvlR9gu5idKV4SaeLqlEzqNmF0UV
	Pqd72+CleGzzVuYNQcuUEB+MNZNsgG+y7Z4k7kzU4OG/V0oxRiIj9ezvVdUxgr+SZ057k2qh5pY
	qJsSmqA==
X-Google-Smtp-Source: AGHT+IHTwHRJ1LtJUNLrZJovplfjTJdtHnbpa9Rw0OlaHYLIVyGS/gJ8LisaniBrYJHJcn/KzpZqw55zABU=
X-Received: from pjbsc11.prod.google.com ([2002:a17:90b:510b:b0:321:c36d:1b8a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3941:b0:327:b01c:4fd4
 with SMTP id 98e67ed59e1d1-327b01c52bcmr306189a91.2.1756339334767; Wed, 27
 Aug 2025 17:02:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Aug 2025 17:01:56 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-8-seanjc@google.com>
Subject: [PATCH v2 7/7] Drivers: hv: Use "entry virt" APIs to do work before
 returning to lower VTL
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Use the kernel's common "entry virt" APIs to handle pending work prior to
returning to a lower VTL.  Drop the now-defunct common MSHV helper for
doing work as the VTL driver was the last user.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/Kconfig         |  1 +
 drivers/hv/mshv.h          |  2 --
 drivers/hv/mshv_common.c   | 22 ----------------------
 drivers/hv/mshv_vtl_main.c | 11 +++--------
 4 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 894037afcbf9..b00b2b3fe3db 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -85,6 +85,7 @@ config MSHV_VTL
 	# Therefore, do not attempt to access or modify MTRRs here.
 	depends on !MTRR
 	select CPUMASK_OFFSTACK
+	select VIRT_XFER_TO_GUEST_WORK
 	default n
 	help
 	  Select this option to enable Hyper-V VTL driver support.
diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..d4813df92b9c 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,4 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
-
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index eb3df3e296bb..aa2be51979fd 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -138,25 +138,3 @@ int hv_call_get_partition_property(u64 partition_id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
-
-/*
- * Handle any pre-processing before going into the guest mode on this cpu, most
- * notably call schedule(). Must be invoked with both preemption and
- * interrupts enabled.
- *
- * Returns: 0 on success, -errno on error.
- */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
-{
-	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		return -EINTR;
-
-	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-		schedule();
-
-	if (th_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(NULL);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 4ca13c54c0a0..1eabed16aab9 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -8,6 +8,7 @@
  *   Naman Jain <namjain@linux.microsoft.com>
  */
 
+#include <linux/entry-virt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/miscdevice.h>
@@ -727,22 +728,16 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 {
 	preempt_disable();
 	for (;;) {
-		const unsigned long VTL0_WORK = _TIF_SIGPENDING | _TIF_NEED_RESCHED |
-						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
-						_TIF_NEED_RESCHED_LAZY;
-		unsigned long ti_work;
 		unsigned long irq_flags;
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
-		ti_work = READ_ONCE(current_thread_info()->flags);
-		if (unlikely(ti_work & VTL0_WORK)) {
+		if (__xfer_to_guest_mode_work_pending()) {
 			preempt_enable();
-			ret = mshv_do_pre_guest_mode_work(ti_work);
+			ret = xfer_to_guest_mode_handle_work();
 			if (ret)
 				return ret;
 			preempt_disable();
-			continue;
 		}
 
 		local_irq_save(irq_flags);
-- 
2.51.0.268.g9569e192d0-goog

