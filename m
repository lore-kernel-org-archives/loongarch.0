Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D452ED32
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066630; cv=none; b=i53DdjGerBpkduS7hDXpYKG1NgsYRlHuxTwDenALJF6FG56k+HJL8cBDJ6ddD1mERwKZUSbNzyqaPGMoOZFP1yLJ55+T5Ijj/YP6wqvYjlnV7+JJfZQCB+l97Lxx/FbvikO3GNEkQb4GE5XKCux8odJdV/pcsgNMNpv6HIaPbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066630; c=relaxed/simple;
	bh=DYgu14ldWLDawZXAo/7e6ZGTkYuIhCDmacFGgdEgG38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSVPdK/dqd0goWD02XPJ7GFwxd86PqexhYK1iRiNIfMci/PRk9f5VhhTUtXhuoCgwg+wSZfOLo2zKMBvgzPwqNenRtTlI3En1/9wAdkc49Q4N6drdSo3w2jzT9q5u0h3BD1lHQ/K4U8wD/Y7lq4ifZFk1STHQhFxend5F/Gzx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmiodWHq; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmiodWHq"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so5078365a91.1
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066627; x=1790671427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=TmiodWHqIyELumgY/F2/gqIbaEbD8FGp+D9GNGFf/h/DxJ1oPJ8+7rWUcVjuv+SZ/u
         qPw2Lc8VctQxbotMyaDX0cZj/uzkaMRyIP/ZW0r+tTKyS677UBsgpvvAandbhtrShxsr
         XDPRpALiHejxiMcWHte41RiKfEXH8aR3upNSGHZZPzK/N93kLNe2gyAr984As5sSPu4J
         tdtRymhjjHXvqCGpTKLPFEa5zm++AmCfFvsU0FHCqQDpQUcTW+aKyrGCVSw1DmfFU0q6
         EL8k7RB2yK8N7LlEw5XeD2tl+Vz5JyGlDdD7/Iv6BF4+aSRPU5v5kFpcAAOjbNlQ5Oc7
         2EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066627; x=1790671427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=l9VOsJz1C6LZFhyCazCVPeAFeSsveQBE8MqsplyzN85VsF7PUCGrxdEQmN8igIM2Wr
         zwVCS+wz1V2OE9LDhseVctfYs5cZOP36jeoCGZSsxdPeCNwNGmNzA2H1xHo137MSufub
         nxcF7SMqOc9M8rL1MQJgEXxqVpLFxB28srfcPMf5QCAQHu0NAkN9n8w6+PNZb1bfq8ls
         FBs3MW15j3YXNXb3mab3JQTAIBjY3yZrOV7UGGnV7lsRR3cYF84x57Ws41tAPBGGqj4y
         5s4Ou8BPYVDUwwDVk315PKhUh5L+DxiViijqVvDpOfCgQAgBlwkl0kYU/i/NzkfNC4Pb
         U13Q==
X-Forwarded-Encrypted: i=1; AKwUvByv6iU/J8JusqKIz+z8Oa7y3Y2X0AqREU3RXS7VxzVIvZxeeigJfO5+I0rrqDXU4Ic1JYlEtnlsHyI=@lists.linux.dev
X-Gm-Message-State: AFuF++lH9GRxLD8uF8+k/sDUKI4OPL9m4WzkrfJBFuergy5vSsRYErrs
	W1nOk+hqkKEj9jMmppHsbt3jkuEJvtkaNLbA/a7SCTB0QG9VTe5BIIjT
X-Gm-Gg: AYBFou14Fm4CEaqAT8DO0Paw4YnXfSq3foa9HIGh+6cFpe9IxkIMV8/ToJ2gIYmm2a8
	/BmnTRvt4AO59kZvll2NbGt7LTfLNhzlmLqMl8VwV+Mm5AuhIVGSJq0z0vwKv2jY/6bSlIz5qsk
	QE6SBUjOjTn9Wedkn7GLXmDscy6qK736IROVlNcDAV+U1p7xlhyKI1vPf1803J5c89HUm3C3EcC
	LCvamhxRlo+8zfjpIup0T7aEJrH6xjBBzwIvj+NG+kCDxmGXukTcur2zKxTdA5ZohZ/91AomMSe
	dUYWh80lL1iyJ5noBo4PrElnEpFXMQt8oeQ4ek24WRuDi45TBxHcf9/0Ur2x0AXzEIq20iL/Rpf
	66UrAj1rLY6epMvTfZ09pPpZtXJKOINOmOyKY7WNVqFm2NPwZ+RDGLyYCgoqeXfj+GsclaIahmO
	99RvkTti4ILabBOdRT1Tvr9gi56N5qtwXBUtk2d4fGsMvTmolNz/bGc32Kqu9kRsxmSBKFjpAos
	t/09cnHzNE=
X-Received: by 2002:a17:90b:5546:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-3a07309c886mr542158a91.4.1790066626997;
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 3/9] crash_core: serialize crash header preparation against hotplug
Date: Tue, 22 Sep 2026 16:42:50 +0800
Message-ID: <20260922084256.1515554-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86 memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d201638d11f3..d0cc2496dc09 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -338,8 +339,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -376,6 +377,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0

