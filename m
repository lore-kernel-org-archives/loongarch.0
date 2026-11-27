Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770501;
	b=VOcKgwg8D/3AsoXb66vqXdJ4P+UvWfybBsifmeY6Xjr+tsY8gDZYySyiv9vYrJDty0kw
	 yPT510TCda6D+GDYz/SvLuqJ7PN0gHaercseTo8T8oHkMumFea4ogdsDpo5GQuufvjdvj
	 7w1i92BI8j6uDUgQRKeTczIeLkM0jG07/TdiggHviBdoN4HuQIdli7NacfioJZ+b2yEBQ
	 BFJYlj8x3kM0zgZr056Jmr+COHDW8LbvBZuMbKio9Rqm+36+0ilAdyvhngPo1Flt2a79y
	 /ZA3QxiSy6RZcRQ1Oz2ahLa6Bj3NFlm+MU6Nx9FTnP7zg0/Nyu+DM1TQmakkXU1N+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
	b=GEsWUkyMExb6CNzMcVgtfdCHPEUamRz4wqzbh9mjK0V5ceAPtyx8UPbw06Ih2xoPXInN
	 NqBdgJTwfIuk+k8eYKre3M3csOL5KpWZyybO11KfeFt5yvxWzfonp074fSLwy9YedAKOp
	 sWb5R2Qyx0pLJzD6NwJjKJMP12mKnHlnsN483hFK17Q7XU3kzPyHR0TfZ4NWypolijeSq
	 S+4CFuj3z2IPM/9ynrfXc1idVY/IT61XQC+NXPc/OAJTSDC2V3E9JcNLxNe8jV7kpQbRk
	 U0Y41RvtpgO0b5vBLcT6/iIumi2UwVLHz3mbMZjPWw15ttpZ43opBTO5BmP0UxZ4bcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsTDqKFp;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE3606A321
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsTDqKFp
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso30996825ad.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770500; x=1796375300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=dsTDqKFp/upCPWBuAiXpEsAuib1KWACRG5pnn1CaUDdng47Xw1kklLOMM6zbtMqKj8
         1e/45KMdpBXw7XiiG9dBJ6nSjgW4upt7thpd7h1eLPWhq7Gs30CkBQYFLP7kVRRzVIVy
         qZqB85Z015gBfCRWTBLNcJoUpAUKbNDNw+lKSqqgVDWlEI8G0J7OVbQyOCXnMr0YEXAU
         1/Ua0EvDwhyPDF0nwEQb44apX0DcvxG75ZJ3awOov9pxAP819arRXoNbBcvEEYNW1j05
         sQmsrxyBvMAY9NpceR0cXxG1+NdjG8Lk5NrCu7Jy7T7XOGN3Yh4hjBgrrMCbAdJhVpRe
         jhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770500; x=1796375300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=kQAUJBj5+SOzkM8f2Milgin1QVwloKTQNGXd5vZ47oNy0XPYLPQ6sGTJ8Lkd1CJv9S
         Iv4TMRZahhYriZwHeKumIHnu9MvBWkOo33heHlT3n8dwqStwz7ngXEURex/hvY/DaftF
         CKSc8+g1k7OL+k7n1BM5zKxWT7oO9hnq989cNTjeGC6EpPj+5P0X11dFxwdXJAF/IMrl
         KpS5Cssv2ok3wOI/lMjXllNSTfquzO9DXUwF+UQJ6wnXsuWucak0NAXwWJwoTFut5hDN
         lsFeZm402x8yRBMNrTFyY8HBO3+ePvMjeD/iViXM7TwsO+vYI/JOu9LU/T5qOnKPKO2+
         fcbw==
X-Forwarded-Encrypted: i=1; AL+hErFBiyJjQNrnR9nKSyPfS6+kPvBpJA4qSN1gUgSfiotld9/Hx1OnxQ7UHf8oHdSXlXFoxt2Of0L9bm4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9p3kVn4NGuna5TghS6AGD7uTaSNOn6el5Ac/bC+NG69E57P92r
	ZJmbYX78+i/BUulvOaZA/hVXnKrbBs/+4o7iDo4HwtUe3d07xUlWElqZ
X-Gm-Gg: AZFdTZfkrzroJJsWkedKUBLEQLq/zWrRM7Qv+leiTtMe9tBKLtfd0B8TSt7tF/0+/rT
	9WanA+BDY4IZqiEQsbHq5XE2T4wuTaXL6dDf6fxJ6m9qPalxd9LvfbHI+O1wIICZT044bnEPzA5
	l6xoS6fnH4mWJjiH+rJznaZIQOvbzFDFLoC0uMLkaJLiV3HiNa3yn2aqulNpnFThlDV7nu8PxXr
	D7wK1zQTzNgX3dIwK9tbz5YBsliWKHPJ+HRAQ/WCyla7cSerMkK7LY6j58QxKpSDM7T0dSBjbB3
	YW2omvxeo5+2jKiGSrfKbL5GnQT11X/IhTCe3F+qM3XeoEizB5ts7pA8IdR+twTTaRp8dBQD4JP
	CTyvifUlccXiz9FqnI2KBZpa/5CFg592jjq/UdaTO6YdvCvIjHeJeB3h0PD0khvZVxvkR45PfV8
	76B8EPibYWqdkK6+JUFFBm177MF3MYh4vMjlsTIRlLyD6w/J1fjWs3BuC+vdXyuOd6UrTUwzNcO
	U/4sFuwktiUIZt8ab9Y5vIkDONUBczjNjX0R35vp+X2Z4VwIkjUzkgBKS+GbWd/dIsMljXvRSwZ
	rnPmH47YPXBH+0p6Ob5FHOI1d2QxnTxsJhbqx/XOlw==
X-Received: by 2002:a05:6300:6d93:20b0:400:77e2:eb03 with SMTP id adf61e73a8af0-4014d35f25cmr14065528637.48.1795770499535;
        Fri, 27 Nov 2026 01:08:19 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:18 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 27 Nov 2026 17:07:18 +0800
Message-ID: <20261127090723.741253-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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
RISC-V and LoongArch walks memblock.memory, while x86 performs the
same two-pass operation over system RAM resources. Concurrent memory
hotplug can change range source between the two walks and make the
populate pass overflow cmem->ranges.

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

