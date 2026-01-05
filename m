Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6A31961D
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610530; cv=none; b=PA2xj7yOEn5bU/C6xe+3PXRr8JwMVuitETnRFDA7gx4WR1ag/PmrFKyMvNUqXgHRuhWnhukJsYqWeRg3yRCx5RCY1weLX4aeMZ2yINbtpdWez0fxOEKnVd21ufMngAJU6srMf5e4ND03ZSDdS32eSPXP/CBpi14fJq3VniwctzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610530; c=relaxed/simple;
	bh=v9dGUaKiidFT+wdfksDoj6y+BO3lzpqJ86ZIRN+U4Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+HG1MAUcc4gnTvwxgMZJlxqWXte9EMu9N4n/N+/KE8GkVPbH7HEvIHjRL36kAHtvevFygdd6VzDSueT+l46RnNbF1Vz8kvHufaQcFPj9CKQYDI8o0fra7HrfcIJ3v+ReZaQ9zcFxLI7ejKcW2fRqkwxXqrz4G5TfT8hoCn6f6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gX6+IS4X; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gX6+IS4X"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767610525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmbWiSqYvy7Kpnw5YL2YoBrlTEHHLFtpCiYxR9AYad8=;
	b=gX6+IS4XAGwOSnlm8cnjK+lSAIgm7LzC2F8dNla8NPNwr1hyfzjurZBt8Hx1ysurY+tuwk
	/qX6bFIv7z/ra7grv4VBNeA3n+xMLTM2NyupPR6oomKGLY06RvHXPCzxog+3+5vQosAP97
	nDiJUhpy2NjkuWV4xVFNvLQ9TUOtJ3s=
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
Subject: [PATCH v9 loongarch-next 2/4] LoongArch: Add SCQ support detection
Date: Mon,  5 Jan 2026 18:55:12 +0800
Message-ID: <20260105105514.76021-3-dongtai.guo@linux.dev>
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
 arch/loongarch/kernel/proc.c              | 2 ++
 5 files changed, 10 insertions(+)

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
index 08a227034042..0051f2fcd3ec 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -205,6 +205,10 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_PTW;
 		elf_hwcap |= HWCAP_LOONGARCH_PTW;
 	}
+	if (config & CPUCFG2_SCQ) {
+		c->options |= LOONGARCH_CPU_SCQ;
+		elf_hwcap |= HWCAP_LOONGARCH_CPU_SCQ;
+	}
 	if (config & CPUCFG2_LSPW) {
 		c->options |= LOONGARCH_CPU_LSPW;
 		elf_hwcap |= HWCAP_LOONGARCH_LSPW;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 1d646da010f9..1b9cc05d1f33 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -90,6 +90,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " lbt_arm");
 	if (cpu_has_lbt_mips)
 		seq_puts(m, " lbt_mips");
+	if (cpu_has_scq)
+		seq_puts(m, " scq");
 	seq_puts(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-- 
2.43.0

