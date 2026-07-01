Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96774B8DE7
	for <loongarch@lists.linux.dev>; Wed,  1 Jul 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921662; cv=none; b=TrC6i40C5EpDUqHCVw0Dy3HBRCjteUwimMMd+amk9klOImLN8qMThaHC93HqCLiVA4qCgtSufxdCQyBO3FUEMkIHFoJiw40/J5l+AQwGhQ1a2MRjiOSvPfqL//kaz6DvlsPVBtMtk68uGlJI4NJNf+0J7abG9+EEBWa9hP/xd0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921662; c=relaxed/simple;
	bh=Hclpxo6Mb/NX5D92b3oIuNr6EzdlEWsnr8pmfef7jjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oEwKAvimh60gQn/YP6kFQwgWSWFfnYQnYP5c+TsHqZmPdxh1svbFLoZLbs1Wkut0JuAQ9rSkyB97O4dOM/cnN2FIRzGqEfY28FGnSntzU46WwFnr7oz/T5KNkbxMOtICuIn3812lPnONAhLp150xwUhcG7QJKXerlTehK4yJzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uuF1W+lv; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uuF1W+lv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782921651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtPSTualifLMKrPscdaxYYSvvAOa0qqvuPKQOXD1RRA=;
	b=uuF1W+lvBMPu2iHRn32L2o+mlCX5e9ZBVhPZQ7+Gjhk7o6DV+HjbYoTSjvqQglDQTUVQVr
	VkDWJrrp9sATf4rcXa9yyrbYvHADY85dp1G8BUTCMwSlSFOcrtTBhylBTT8ZMSEH4183Zj
	m/DIYNcek9JhiMIvBWZE6vSQEErGEs4=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: maobibo@loongson.cn,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v4 1/2] LoongArch: kexec: use core control page for relocation trampoline to avoid QEMU FDT conflict
Date: Wed,  1 Jul 2026 23:59:56 +0800
Message-Id: <20260701155957.534779-2-dongtai.guo@linux.dev>
In-Reply-To: <20260701155957.534779-1-dongtai.guo@linux.dev>
References: <20260701155957.534779-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

KEXEC_CONTROL_CODE was hardcoded to TO_CACHE(0x100000).  QEMU places its
machine FDT at physical 0x100000 when booting with '-kernel', so
machine_kexec_prepare() overwrote the FDT with the relocation trampoline.
The kexec'd kernel's fdt_setup() then read trampoline code instead of a
valid FDT, earlycon auto-detection failed, and the second kernel booted
silently with no console output.

The trampoline does not need a fixed address.  It is executed by the
current kernel to relocate and enter the new kernel, and is dead once the
new kernel starts.  Drop KEXEC_CONTROL_CODE and reuse the
control_code_page that the kexec core already allocates (as arm64 and
riscv do).  That page is excluded from the relocation copy and lives
nowhere near 0x100000, so the QEMU FDT is left intact.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index ced49194d9de..7ced6ca2dadb 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -21,8 +21,6 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 
-/* 0x100000 ~ 0x200000 is safe */
-#define KEXEC_CONTROL_CODE	TO_CACHE(0x100000UL)
 #define KEXEC_CMDLINE_ADDR	TO_CACHE(0x108000UL)
 
 static unsigned long reboot_code_buffer;
@@ -76,9 +74,14 @@ int machine_kexec_prepare(struct kimage *kimage)
 		}
 	}
 
-	/* kexec/kdump need a safe page to save reboot_code_buffer */
-	kimage->control_code_page = virt_to_page((void *)KEXEC_CONTROL_CODE);
-
+	/*
+	 * kexec/kdump need a safe page to save reboot_code_buffer.  Reuse the
+	 * control_code_page allocated by the kexec core (as arm64 and riscv
+	 * do) instead of a fixed address: the trampoline is only executed by
+	 * the current kernel before entering the new kernel, so it needs no
+	 * fixed or reserved location.  This also stops machine_kexec_prepare()
+	 * from overwriting QEMU's machine FDT at 0x100000.
+	 */
 	reboot_code_buffer = (unsigned long)page_address(kimage->control_code_page);
 	memcpy((void *)reboot_code_buffer, relocate_new_kernel, relocate_new_kernel_size);
 
-- 
2.25.1

