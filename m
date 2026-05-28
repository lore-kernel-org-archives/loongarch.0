Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55B233955
	for <loongarch@lists.linux.dev>; Thu, 28 May 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976718; cv=none; b=qZ6uFw4BQwypBeDVS/ISKG2+70+jOGzGb2cH+Jv/MSnvZvEjMUS+nRNzTw1MZGtApDXCYC2nuM9SV7dWt5DjCa+xLonXut/0Q2tSvGiIoEbo6zCWy2/BT2bx4wJVFFN2I+vsjQaRsfQJPwzPHoFxU8/QftA+Spq2Okku6Ne730c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976718; c=relaxed/simple;
	bh=l52I/z7XJH2APwRLqgnwRHl+vcigrCoeaI76EFL82KU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V66MIy1lpzUWnzzHGLxZKWnrmsDBi5CIMsBb8U9ha7MU5m3gMXfQ9V4Hte5dI1eoNAFzT5Dyh0W8xN/1HyHJFbafyMs9rsWrIxbUsCcWA5IPd+xKjs07lNk0y8UW42Hpl6+mJyDK/+P/lxJRZN50gUNU8rLjgG6QjBmHW41ZhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xRsmP2J/; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xRsmP2J/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779976714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RpXKe3wAdCVMwU6Llg7SIPesFhMG6uKuOmrHw+vv3aU=;
	b=xRsmP2J/Wc1nZ1o5rPayKbAFVobYl2GUM5iGPW1+XlquxVmWhJrJH9jzUSOBmIDK4F/4Jm
	zNQqMKa7+OshJ7HDSbUjK1ecchz2CP1BX4twxNCO7+DpSUfvukNGmLRs3/qb4PHJAHsF98
	KR3RhpGYhIS7N/T26khNBhLO2mWHCPw=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH 1/1] LoongArch: kexec: avoid overwriting QEMU's machine FDT at 0x100000
Date: Thu, 28 May 2026 21:58:28 +0800
Message-Id: <20260528135828.196953-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

QEMU places its machine FDT at physical address 0x100000 when booting
with '-kernel'.  KEXEC_CONTROL_CODE was defined at the same address, so
machine_kexec_prepare() overwrites the FDT with the relocation trampoline
before jumping to the new kernel.

The kexec'd kernel's fdt_setup() reads the FDT pointer from the EFI
config table (FDTPTR = 0x100000) and finds trampoline code instead of a
valid FDT, so earlycon auto-detection fails and the second kernel boots
silently with no console output.

Move KEXEC_CONTROL_CODE to 0x180000, which is still within the first 2MB
reserved by memblock_init() and does not conflict with the QEMU FDT.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index d7fafda1d541..44df7dbd3de5 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -21,8 +21,13 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 
-/* 0x100000 ~ 0x200000 is safe */
-#define KEXEC_CONTROL_CODE	TO_CACHE(0x100000UL)
+/*
+ * Both addresses are within the first 2MB which is always reserved by
+ * memblock_init().  Avoid 0x100000 because QEMU places its machine FDT
+ * there when using '-kernel'; overwriting it silences earlycon in the
+ * kexec'd kernel.
+ */
+#define KEXEC_CONTROL_CODE	TO_CACHE(0x180000UL)
 #define KEXEC_CMDLINE_ADDR	TO_CACHE(0x108000UL)
 
 static unsigned long reboot_code_buffer;
-- 
2.25.1

