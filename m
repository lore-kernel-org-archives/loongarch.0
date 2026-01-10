Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138E33F362
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768050699; cv=none; b=DYfAQW9uvL3Y64ECSFKCxoMuvJ8ErhhRSwYDsIYSz9Sn2K8s8uKse+9CjY8jXDpyFLPYGq52iI/LpOYOy49RBsLwUZs5Zca/ew1hwi000+ESN014a5dTIhq7ddLG+i9huweFdQhiQnn6looYJNAfEfW8rctRmOUsxJq0j/cRWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768050699; c=relaxed/simple;
	bh=zTpLRTSy0ZUqiQJ+KvqsMfzFVY6/tmYVMzLvCconr3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+dWfND6FvbXuNWb8m8IkiKfsLUUkzlEjv7yK6f4Bp42dTnusnPOdAxAsgFpE6W3xHc5G4gaQdXjGort8tkiMkgHLk4x8BhTDHuMeQZzXVVasPKl3FnTrverybEqwLY4Mc2UU8nJYBqdpKm6clD0cY04hvBAIhOHJC+3k1cTEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KM3bz/v7; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KM3bz/v7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768050694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlejOwTnBJqaPxH2B148xQWvfCM7iTTuVyvcvolJRno=;
	b=KM3bz/v7BSQvKc3Vt4/QgNGzBOvcoP+MQ5VhhG2tkQO1yfhDTXGI8tyGn9ZEyS6ozZQX7s
	HfUp91vsbgQUDchxI/wOBJUVrK7DxpmWgoROXdRVSB82MEaPQB/68FNZsNIrHhXgXRCvyb
	xCl92OOuasJWmCjj2v71YqsoYrPMT20=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH v10 loongarch-next 1/3] LoongArch: Add SCQ support detection
Date: Sat, 10 Jan 2026 21:11:22 +0800
Message-ID: <20260110131124.99866-2-dongtai.guo@linux.dev>
In-Reply-To: <20260110131124.99866-1-dongtai.guo@linux.dev>
References: <20260110131124.99866-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Check CPUCFG2_SCQ bit to determine if the CPU supports
SCQ instruction.

Co-developed-by: Yangyang Lian <lianyangyang@kylinos.cn>
Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/cpu-features.h | 1 +
 arch/loongarch/include/asm/cpu.h          | 2 ++
 arch/loongarch/include/uapi/asm/hwcap.h   | 1 +
 arch/loongarch/kernel/cpu-probe.c         | 4 ++++
 arch/loongarch/kernel/proc.c              | 1 +
 5 files changed, 9 insertions(+)

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
diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/include/uapi/asm/hwcap.h
index 2b34e56cfa9e..a3c570d407b9 100644
--- a/arch/loongarch/include/uapi/asm/hwcap.h
+++ b/arch/loongarch/include/uapi/asm/hwcap.h
@@ -18,5 +18,6 @@
 #define HWCAP_LOONGARCH_LBT_MIPS	(1 << 12)
 #define HWCAP_LOONGARCH_PTW		(1 << 13)
 #define HWCAP_LOONGARCH_LSPW		(1 << 14)
+#define HWCAP_LOONGARCH_CPU_SCQ		(1 << 15)
 
 #endif /* _UAPI_ASM_HWCAP_H */
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 08a227034042..7c7708ce4063 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -177,6 +177,10 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_LAM;
 		elf_hwcap |= HWCAP_LOONGARCH_LAM;
 	}
+	if (config & CPUCFG2_SCQ) {
+		c->options |= LOONGARCH_CPU_SCQ;
+		elf_hwcap |= HWCAP_LOONGARCH_CPU_SCQ;
+	}
 	if (config & CPUCFG2_FP) {
 		c->options |= LOONGARCH_CPU_FPU;
 		elf_hwcap |= HWCAP_LOONGARCH_FPU;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index a8800d20e11b..a60471b96440 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -62,6 +62,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "Features\t\t:");
 	if (cpu_has_cpucfg)	seq_printf(m, " cpucfg");
 	if (cpu_has_lam)	seq_printf(m, " lam");
+	if (cpu_has_scq)	seq_printf(m, " scq");
 	if (cpu_has_ual)	seq_printf(m, " ual");
 	if (cpu_has_fpu)	seq_printf(m, " fpu");
 	if (cpu_has_lsx)	seq_printf(m, " lsx");
-- 
2.49.0

