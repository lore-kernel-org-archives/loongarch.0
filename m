Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACB3191CF
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610528; cv=none; b=WV+Z7jB95vvqOMA1d5Urfk+2MK3ZJwiziLwejiQwkZb87iwIB/PVxE3qAgN9Pk828suaaxVxCCKb893MV2iDU8ijBvfBs2BixL/xXBhFsFYvB2tT+h9ImK57svkToGhz6Akj8IgXaaW1mSJs6UUFV2PxepOdEXqGmPEDlFMqXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610528; c=relaxed/simple;
	bh=sJvta61e7Mf0t7zmQWhXb474jlF4nrYsgrlBrZYj6vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r177M+g/B69jOcR5qCHHbSnf3vI5k7BZCPOREpNsnN4rGmtncLfeiBI8Mqh5AhBJsSir8+VgarWEWqahEt//UEfi2I0Zk1dbe4gu4KblUzX0s3AII8xyFg7VKS5XvbnXUGMRhu3V/lbaGAl1nDKC7ZwVSW8+u3t6NEqnH20+ZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AcfHgUpA; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AcfHgUpA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767610523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qVCFGif6aX0Q2JIbCH2ROkDXMNqpato8z92+S7+prM=;
	b=AcfHgUpAIJlaSq71+UGdtDOe0+F8XFJp+DddB/Hu3/tjYpivNEoh4bfHOj7fnJVs6cZ15f
	hdnVDNXPS6dhEofox4Ep+gft8yrcIs2nkJ/bTIyjZggi2cyj5B+E09osdtvQHNdXzL7ZKF
	R/PMBo/HvFrDDSaQFg5cjpV/Nhdz2mQ=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v9 loongarch-next 1/4] LoongArch: Replace seq_printf with seq_puts for simple strings
Date: Mon,  5 Jan 2026 18:55:11 +0800
Message-ID: <20260105105514.76021-2-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-1-dongtai.guo@linux.dev>
References: <20260105105514.76021-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Fix warnings like: "Prefer seq_puts to seq_printf" by checkpatch.pl.

Replace seq_printf() calls with seq_puts() in show_cpuinfo()
when outputting simple constant strings without format specifiers.

This improves performance slightly as seq_puts() avoids parsing
the format string.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/proc.c | 61 ++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index a8800d20e11b..1d646da010f9 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -50,32 +50,47 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "Address Sizes\t\t: %d bits physical, %d bits virtual\n",
 		      cpu_pabits + 1, cpu_vabits + 1);
 
-	seq_printf(m, "ISA\t\t\t:");
+	seq_puts(m, "ISA\t\t\t:");
 	if (isa & LOONGARCH_CPU_ISA_LA32R)
-		seq_printf(m, " loongarch32r");
+		seq_puts(m, " loongarch32r");
 	if (isa & LOONGARCH_CPU_ISA_LA32S)
-		seq_printf(m, " loongarch32s");
+		seq_puts(m, " loongarch32s");
 	if (isa & LOONGARCH_CPU_ISA_LA64)
-		seq_printf(m, " loongarch64");
-	seq_printf(m, "\n");
+		seq_puts(m, " loongarch64");
+	seq_puts(m, "\n");
 
-	seq_printf(m, "Features\t\t:");
-	if (cpu_has_cpucfg)	seq_printf(m, " cpucfg");
-	if (cpu_has_lam)	seq_printf(m, " lam");
-	if (cpu_has_ual)	seq_printf(m, " ual");
-	if (cpu_has_fpu)	seq_printf(m, " fpu");
-	if (cpu_has_lsx)	seq_printf(m, " lsx");
-	if (cpu_has_lasx)	seq_printf(m, " lasx");
-	if (cpu_has_crc32)	seq_printf(m, " crc32");
-	if (cpu_has_complex)	seq_printf(m, " complex");
-	if (cpu_has_crypto)	seq_printf(m, " crypto");
-	if (cpu_has_ptw)	seq_printf(m, " ptw");
-	if (cpu_has_lspw)	seq_printf(m, " lspw");
-	if (cpu_has_lvz)	seq_printf(m, " lvz");
-	if (cpu_has_lbt_x86)	seq_printf(m, " lbt_x86");
-	if (cpu_has_lbt_arm)	seq_printf(m, " lbt_arm");
-	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
-	seq_printf(m, "\n");
+	seq_puts(m, "Features\t\t:");
+	if (cpu_has_cpucfg)
+		seq_puts(m, " cpucfg");
+	if (cpu_has_lam)
+		seq_puts(m, " lam");
+	if (cpu_has_ual)
+		seq_puts(m, " ual");
+	if (cpu_has_fpu)
+		seq_puts(m, " fpu");
+	if (cpu_has_lsx)
+		seq_puts(m, " lsx");
+	if (cpu_has_lasx)
+		seq_puts(m, " lasx");
+	if (cpu_has_crc32)
+		seq_puts(m, " crc32");
+	if (cpu_has_complex)
+		seq_puts(m, " complex");
+	if (cpu_has_crypto)
+		seq_puts(m, " crypto");
+	if (cpu_has_ptw)
+		seq_puts(m, " ptw");
+	if (cpu_has_lspw)
+		seq_puts(m, " lspw");
+	if (cpu_has_lvz)
+		seq_puts(m, " lvz");
+	if (cpu_has_lbt_x86)
+		seq_puts(m, " lbt_x86");
+	if (cpu_has_lbt_arm)
+		seq_puts(m, " lbt_arm");
+	if (cpu_has_lbt_mips)
+		seq_puts(m, " lbt_mips");
+	seq_puts(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
@@ -83,7 +98,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
-	seq_printf(m, "\n\n");
+	seq_puts(m, "\n\n");
 
 	return 0;
 }
-- 
2.43.0

