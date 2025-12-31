Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09052F0689
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767152736; cv=none; b=WicZ6z1zC1+JeTYWWLi4HXQNuGEjySwggaiDZ3GxOc7RkL2c7TmHOYV8vOps0dJLzmXKYN2WmfzDJHrjxglWs7lfZWd58iTwPhAq3RX8A/e8hk+CJHZfh6ByPq04Mk9XukiieIB8Yyj1VH2WWAIsl0MSWg8WVua8hMmK10DIZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767152736; c=relaxed/simple;
	bh=BuuxaCwSCLYg1R0ojnfESNIxbCZSrE0vV6q/iS4ppy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6PwoLVPVCux+gJYFXuVQ+l0+9U1cZglJPpnMLyaDstbvQ4tG+f8WsWfIcozP5CL3rMk417az+duNdCflVCYSnpKK5XpktwYqpPURIKGOjEQsHpJcUn3R/wC9aNvIQ2tnXt+1bE53jCc0ra1aYPOpILv8UCNfoiMJT2slDGLyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MDkQCOg4; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MDkQCOg4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767152731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ej0WdmIZc8uYGH7uI3cqt+SohwtHVALnfZQqf9BhrA=;
	b=MDkQCOg4MxnDXTsUAHz+NV+50tvBkG4ZPJVhxdvt/UI9Grm983Y95OtWBQ5VDiCXFXc/kF
	QdKg9Ky+I5rO8ey/SDnpt2wQ8IY79yf1F4NeyoJyNXDQBLJLjqz32198l3nj8RdHFYEhmn
	vPiaCmqc3uHllNTGVqI4tb3O6bLG+4I=
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
Subject: [PATCH v8 loongarch-next 1/3] LoongArch: Add SCQ support detection
Date: Wed, 31 Dec 2025 11:45:21 +0800
Message-ID: <20251231034523.47014-2-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-1-dongtai.guo@linux.dev>
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Check CPUCFG2_SCQ bit to determine if the CPU supports
SCQ instruction.

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

