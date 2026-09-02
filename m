Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DDC37F316
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334348; cv=none; b=XFZwxCL5fZVqpupWR0/JaexrQz9Jz5Fm7BXP31exmbX68s9rTnLbPlTCiMBzCwRXutQwb56rbNdLCJwduILHiEJoJy70L1zR5mRBw8ZVv7JXKaU0g3UBQIQckom4FW7Y4US/UguXB5J0fXCW5KigkWmP4hKiMUi4T47CkyUE434=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334348; c=relaxed/simple;
	bh=Y6IX8/0lLvnQsuCIT3ysVkmxDeCp9TsVFX+CxW/Z7ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmXhnNmsmQ45BPey5g3vbmFERNchj4euz1V682ft4Q+eIuu+4jlXJB9Kc4PFIbhYmzeKUe1ZNVwxHrtg5OB8sqenbIASvOoHjevgYLifJeRhNAYYCjHubJV16zu+5bmERA6LB40P979uxX4+AcCn91kTpA9WowABdgbLWHtiu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwvxZtj1; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwvxZtj1"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc1d7f6f26aso411015a12.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334345; x=1788939145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=TwvxZtj1qA1geMySqWb2Dm/jqvFSpEcPyJMBewPG2qtRihfYPvvBzNb0OxjhchOIBp
         ukG6L1SYml9tVEL71di47Xst+uqE/WIP2xpTiGeYoZ4rXavqiMk8WPG34FP1ppJjTepk
         JsRoq8m2tLplHMDA1ppS78FzDk2U3xj+XbNpfarqmJYDrboNR7E7GKZTLSHhem6F5oxx
         xdqkh5QTBCVbzQ9WLMQMRV2etfZlq0ymB8Dbsrzv7gCSRJr7nW0vQw6+DtGO6KEeoG+9
         60T3rjIKe+S8NqrSA2obxmtphuyFSFr3bah3PNlWQbN8yrEld6mEVAtVSXseKy8HuIb1
         C+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334345; x=1788939145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=nOJkfSqe4ZpgiIlnriBH9I9/gEPsn/RC+ZngnY55CEtzaX/fyDmP5RgmW04Qs3o7ZS
         dj27gXBPzSiBwsz66w3VMtBJX1sikJgrC2BlvOfshLuZzpfF2oGEQuGX/UKOSOzT5Y6x
         2El9S8/xc//5ttbR0SV+YJ1Yoh2C3696fJTo+WdSV/lH9sdNAWRLFS09eX2cgTv0PBN6
         cW5K+igcpbrFQLNHxCex0Zesly7hhwZaJ9/VibQynHqDWHCvFl39F0hgUilINwywLNBQ
         FWqbj87JI/YD+tNAwuJwD4Zcr0ujPQnkYr82x+RGDXsm6xZEBu7WM07shiKf7ZjxnmIm
         mGTw==
X-Forwarded-Encrypted: i=1; AKwUvBz0fbOIA9258n9tvfSPQ229IH4xd+N2Y/1igLjvgyerOJ30YfOAHOo1gGJZuX8slYjsQPr5Wh4TRe0=@lists.linux.dev
X-Gm-Message-State: AFuF++m52qZgJuPC6ak1fO2AXUu4XhkQLRLObJ2Q7Nt7gCKL4BF9z5JX
	wZi0GZOXjjINMi5OObOH8chD0xGc5rOS89OFdq0S3RPuNkETJ760UuBA
X-Gm-Gg: AYBFou1SQouAbAEhcOvmY2nuQ2IQa+EhmLBMYiGl2FjG5PgkOUosGGj8GL19l9JH8GH
	g8yz4wgex+inSGVMXJvBgFVGEwagR99RdBuO2rN7NMrqqifnkqpws23qxSzsgdc8sVOCNNTXUkI
	kFbHI5b0irOJcbuQ6znoz5PpOoNvE/f/uqYM82cO+9z0yA79nUKB0faDXcqxbpWyoy8/Eldlk0q
	RWEnhQ0FTRW0zW8rr6xzclm46rJW0Cy/gcBZYBMcjn0qmLZnaUdMDE3l1kZpeowxuajIj8Zho6z
	ldYr+rfuKqSeAeYIJw9cJw8hibgT5qMPioNcLH9zF3wZP1SfCoGkz6evpLxhfbxw/HQnuxVZ9yr
	bfeVlLKA7zbrocBC7bYZsv0VQpMG8nVb0tKUaAIW5w+1BRhDSCBlom3FvVTF3wCGM+txit4hWxA
	vKTPnxKikFzDK6sELBgkkm6vlze+3oQ/hnVmCCtJusvpWMumVQob+j9oE0DDjjPy35VrEL9SY9t
	3CzaAycHck=
X-Received: by 2002:a05:6a00:238b:b0:85c:c8db:8e4b with SMTP id d2e1a72fcca58-85ed23dea9emr4650515b3a.6.1788334344871;
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 04/10] crash_core: serialize crash header preparation against hotplug
Date: Wed,  2 Sep 2026 15:31:10 +0800
Message-ID: <20260902073116.802752-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
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
---
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e681ec9cf1dc..284d78bc3fd0 100644
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
index 77285ae3ce60..3adee1ae120c 100644
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

