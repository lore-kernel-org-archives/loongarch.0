Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571474;
	b=W03c5Dr3Fgpphqcp7iDhcGOZTZUqwj/3YCEiyjWhHGC0wr13B643MDWOaBuRWldSpOsV
	 lNwSj45EoHrVb69uF8RL0juIXKY0J+PdvIYowoF7UF3c+snFK6kWM7GR+ws6LwlFKnDsw
	 6+X/b+SIAKT8Sp+y0ruuBvGMf1S1fvDAcphiRNQirjnSCpfUTBzzKLEyA6LeKApwctu+7
	 lqqFh4P5aZyK0qsFIheWgIwiCkaB32TLSgd+YQi5GZHCRlEgZn5uiOFBVV9hau4rj6TuF
	 mfay9B3Xb6fcJN2aIGc8L6F96B+cnfjhCcYD3pDSThmGGSXyHEANCIvldR8boNia44A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
	b=E4K+N6lOJgIn0dBp4NVfzDP46VHQBRG8x4mAvePn5FvWCafRciWb8Icz+i/TetwGtd9S
	 ck6M5A/WyQflhKv+Y1UPiq1XtI4/brSWU0rGjsinyfybjVeEYHFY56DEpULtqrYpXLjWV
	 9xlkYxweRTBaSQUnPC+asDuqtZajn44JKCjVXL9viB54HgQKP7mB45h02RCKh1Ftnsat0
	 PRert6YvEE2SU/m9lW5TtoKTs5ofSaaaFp2058+aM+XFRP5HH/9aqQKzvCq/o+l69wu4F
	 EvnW7rhYWNK/XcwUS8N91YAaLoBMcZ2Wc3ZO8j0MX/NCIFMDKbFdiAfJgZqoKe8wSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VeE0pprj;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19518606A319
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19518606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VeE0pprj
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd5cd8e8104so19939a12.0
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571473; x=1793176273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=VeE0pprjnWUYdznJAYr3jWkZhfPnrEe7Gn28WlFnK5szeN3mfEvQoRrMv/fHBkLLwi
         siTvEpJn6drfGZmV/Z+G3CMKPzLpUvLj9honNmhtGCbPl6nL3tWfa9nejdy9fuy8nrx7
         jXZP6V43gr/LthBZYReLL4L7UJ2ZsLGCG02Lp/7Oj24Kg3P37Li8ERd6v6gxFB9l0Hdb
         x+6T7AsQ/+g+LD+QltcgIyDL9RuIV60Nlie4HFUKWwyjq+MI9cFDx24w8HWtGsE5ql6l
         xABJybNHwJve+QH88aF1Rg4ydzEeeUAGxBSkelHhbeZt+UWLtbe5nj2ZKtNLUVCOy9I+
         MF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571473; x=1793176273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=oedql5so6uF00UvkHO4Hn81GYsj4JzTiguwpQRevy8NPaIitv430Or6sWUVri4Aoe4
         JcMMI/MZRjYhm+JBjjFbk5rjI2sQHcB5k4O5JCr4GFDqQbAf825cr0g9OySEqaeG/Ngw
         fvl6qjGhWiUFrpu/0Tsby6eq2lsMkjkRpGc+V1uaTQgP3gvT1sGCN8v4H/gaIs5pvtfq
         +UncgdiXrMtPbRB21oCJgdtdPqyD/eda492uAf/ap48GH7HzTh4+/ycOUToYWzooLZr/
         RRtGhZDHnB0BXbvNg/fwmB5bnOMVTgAQP7Cdgxl3h+X77RrIu78/CiI4W6HJMHRxLAuH
         mhoA==
X-Forwarded-Encrypted: i=1; AKwUvBy48cm9uwd0FuDWGs3ZZ8Bldt9rMEOp+u0eW0BVGLs+uaEnYFztZPZT7SINQBN7tLzfeZygDY5c8gE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIKk30W3UuexSEYgg33dpIQbUMvjAwIEl3GDw6nXHyEfjzq8r5D
	P1eTD1rSvoyGWtEb7UYj4EnNWzhZ4UwgtoQqNoU/it8MSWMwrIJfs2Ln
X-Gm-Gg: AYBFou3Zm9NEQX6mqCt41sAgV0a2HnOv8FA4oBN9TfBMF+TXp2LneZnkMlCir915wMn
	QWXayPRsYShUAcNnSl4zvLuIovd3M0OijOALiRrnhBV+bCwtWMaxzgAccYkXjwsCU3pTxhNmbpm
	zjEtWjLTEyW1YF/E9VxM1iAA/8LPYHZbJkzklx1eRY/D+6XHaeoWSwF30gF/maUwHZkdx/NSd6v
	Pj3ki8j9yiJcbMF4cHz55pjEQpNVZYs8YpMWh1e0XXSzSqM1BC5jR+r3YwSHurhEoMSuzMKtedU
	IMsG0Qr74guGbRuv0t56do4j9lWqK9BkFzCEbpRjUXTZ+1sTn82Cvl/zQJtXXvwDCXLAX+YFzcT
	N1Y4VnDlBZk+MXs8QW58ijwUQhcjzk1YqS18sDeNRKZ/Sp7FLj9co5a2yp7mjO6/2cYaADkuHOg
	+EbjO2YTXP0/I/U6ZfDHhoPoqwQmKMCzP1x7b8C+WjOLVPibdpHv+YMtYfW+lB7sYtP1E/cGvXB
	JsUIDyTo2S8mW73d33bka8v4CMDYw+EbxsGtc7bR7b00iM4UhSSNfhiHA3MNOB1QxJa
X-Received: by 2002:a05:6a00:4b04:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8a089cf006cmr1210490b3a.13.1792571473289;
        Wed, 21 Oct 2026 01:31:13 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:12 -0700 (PDT)
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
Subject: [PATCH v9 3/8] crash_core: serialize crash header preparation against hotplug
Date: Wed, 21 Oct 2026 16:30:06 +0800
Message-ID: <20261021083011.2170525-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
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
kexec_file_load(). The x86/riscv memory hotplug path already takes
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
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
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
index faa0f22dbb41..8a861a946e26 100644
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
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
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

