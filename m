Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99351FF5E3
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058468; cv=none; b=RUgkvuQo3HhxltFIAsZEjElCLiPIqy/XfKpKGGAqTg6iZN0qf4GeB/waOYkHR2N1Fqovt/2p641BnwICtkrTJKvEjxF9YLzk9kvI7utGLUcitovk+506BMpaZz7VEUngbjyyLVQi72batQq3qyhdXS86VTa3z8HDgtwmYJqPK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058468; c=relaxed/simple;
	bh=Tu71z43R1/men9r6Uqy83l8nEqXDO/VCDH5sN+hrXKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuZPTdLhKlcq8AWDRzMttgaGWHsqEOaI8MXpgmAS1lhvXLUzrhYLwJwC7Q8Ek8JvmGBZReKaqqGKZ8ynM7aMVVLrLHju9bPs3ye3f+1w43K7HvPLKGZelFs+AHG94/EXxrFuF7Iq7LxJ9mwFT6g0LLp7yiLYQGaEOatWuRf8DOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P3tcutCO; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P3tcutCO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767058464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2mug8qAnjz7RRf26MzSBJvjU5q9D1Z2KIWQRhOyl0w=;
	b=P3tcutCOBC4fgEil3cgByW8bgOac3cinwSFXQZKspnmVlwm3JGY08S5INgHhQFhR/U76LQ
	qdXTTeTI0FE6dXHChdLHnlEx36lKy2jOj9IHMlLyEMnndAH/Sr7B/uMWbfQHCrX2kkyoyv
	WtA0sL06iSeezhCRxBk0tTsP9KPA9/c=
From: George Guo <dongtai.guo@linux.dev>
To: hengqi.chen@gmail.com
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH v7 loongarch-next 1/4] LoongArch: Add SCQ support detection
Date: Tue, 30 Dec 2025 09:34:14 +0800
Message-ID: <20251230013417.37393-2-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-1-dongtai.guo@linux.dev>
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Check CPUCFG2_SCQ bit to determin if the CPU supports
SCQ instrction.

Co-developed-by: Yangyang Lian <lianyangyang@kylinos.cn>
Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/cpu-features.h | 1 +
 arch/loongarch/include/asm/cpu.h          | 2 ++
 arch/loongarch/include/asm/loongarch.h    | 1 +
 arch/loongarch/kernel/cpu-probe.c         | 2 ++
 arch/loongarch/kernel/proc.c              | 1 +
 5 files changed, 7 insertions(+)

diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
index 3745d991a99a..39c7fe64c3ef 100644
--- a/arch/loongarch/include/asm/cpu-features.h
+++ b/arch/loongarch/include/asm/cpu-features.h
@@ -67,5 +67,6 @@
 #define cpu_has_msgint		cpu_opt(LOONGARCH_CPU_MSGINT)
 #define cpu_has_avecint		cpu_opt(LOONGARCH_CPU_AVECINT)
 #define cpu_has_redirectint	cpu_opt(LOONGARCH_CPU_REDIRECTINT)
+#define cpu_has_scq		cpu_opt(LOONGARCH_CPU_SCQ)
 
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index f3efb00b6141..5531039027ec 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -125,6 +125,7 @@ static inline char *id_to_core_name(unsigned int id)
 #define CPU_FEATURE_MSGINT		29	/* CPU has MSG interrupt */
 #define CPU_FEATURE_AVECINT		30	/* CPU has AVEC interrupt */
 #define CPU_FEATURE_REDIRECTINT		31	/* CPU has interrupt remapping */
+#define CPU_FEATURE_SCQ			32	/* CPU has SC.Q instruction */
 
 #define LOONGARCH_CPU_CPUCFG		BIT_ULL(CPU_FEATURE_CPUCFG)
 #define LOONGARCH_CPU_LAM		BIT_ULL(CPU_FEATURE_LAM)
@@ -158,5 +159,6 @@ static inline char *id_to_core_name(unsigned int id)
 #define LOONGARCH_CPU_MSGINT		BIT_ULL(CPU_FEATURE_MSGINT)
 #define LOONGARCH_CPU_AVECINT		BIT_ULL(CPU_FEATURE_AVECINT)
 #define LOONGARCH_CPU_REDIRECTINT	BIT_ULL(CPU_FEATURE_REDIRECTINT)
+#define LOONGARCH_CPU_SCQ		BIT_ULL(CPU_FEATURE_SCQ)
 
 #endif /* _ASM_CPU_H */
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index e6b8ff61c8cc..817cd90941d9 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -94,6 +94,7 @@
 #define  CPUCFG2_LSPW			BIT(21)
 #define  CPUCFG2_LAM			BIT(22)
 #define  CPUCFG2_PTW			BIT(24)
+#define  CPUCFG2_SCQ			BIT(30)
 
 #define LOONGARCH_CPUCFG3		0x3
 #define  CPUCFG3_CCDMA			BIT(0)
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 08a227034042..382c472c6bfe 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -205,6 +205,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_PTW;
 		elf_hwcap |= HWCAP_LOONGARCH_PTW;
 	}
+	if (config & CPUCFG2_SCQ)
+		c->options |= LOONGARCH_CPU_SCQ;
 	if (config & CPUCFG2_LSPW) {
 		c->options |= LOONGARCH_CPU_LSPW;
 		elf_hwcap |= HWCAP_LOONGARCH_LSPW;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index a8800d20e11b..252fa1d03b85 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -75,6 +75,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_lbt_x86)	seq_printf(m, " lbt_x86");
 	if (cpu_has_lbt_arm)	seq_printf(m, " lbt_arm");
 	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
+	if (cpu_has_scq)        seq_printf(m, " scq");
 	seq_printf(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-- 
2.49.0

