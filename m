Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0034830AAD8;
	Thu, 20 Nov 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626815; cv=none; b=lVrMV+YeexifmurOoCBwrThUi/5DPL+2/9pMMN4pJiuslhyRbbebjgboE9bUigCtOGp2Oyx3VtM5dAzd5wryO+DuVJWZ5fJ4dUjeH11ariuRGVoHnImLx03D/JzBudWw/K6jcwjyjU2U2fEpTiUoDd+1L1g+Vd1N54JD7Dwpv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626815; c=relaxed/simple;
	bh=rNu6BVfLf8/TPcH5Yc7CtdVi1A47GoTn9ZbzgRKaNWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNUf/BNSPKCHxblE5r0/ieQ9fuhXRlkEdbkiFqNWLA0cNsBpoWRYOk6+uKKk4EGn3Kux/HrblVNfvYh68k4AwHFvY3x3EezmDJRszFPAwLJS04XvtSy3e2qzqoKGMRuJ9ZOyAnQ04p17egGeb65NHmLHLJIL7zZ8tM4FVCaOKMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91097C116C6;
	Thu, 20 Nov 2025 08:20:12 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Consolidate CPU names in /proc/cpuinfo
Date: Thu, 20 Nov 2025 16:19:53 +0800
Message-ID: <20251120081953.2292138-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some processors have no IOCSR.VENDOR and IOCSR.CPUNAME, some processors
have these registers but there is no valid information.

Consolidate CPU names in /proc/cpuinfo:
1. Add "PRID" to display the PRID & Core-Name;
2. Let "Model Name" display "Unknown" if no valid name.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/cpu.h  | 21 +++++++++++++++++++
 arch/loongarch/kernel/cpu-probe.c | 34 ++++++++++---------------------
 arch/loongarch/kernel/proc.c      |  2 ++
 3 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index d4cd4041bee7..f3efb00b6141 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -55,6 +55,27 @@ enum cpu_type_enum {
 	CPU_LAST
 };
 
+static inline char *id_to_core_name(unsigned int id)
+{
+	if ((id & PRID_COMP_MASK) != PRID_COMP_LOONGSON)
+		return "Unknown";
+
+	switch (id & PRID_SERIES_MASK) {
+	case PRID_SERIES_LA132:
+		return "LA132";
+	case PRID_SERIES_LA264:
+		return "LA264";
+	case PRID_SERIES_LA364:
+		return "LA364";
+	case PRID_SERIES_LA464:
+		return "LA464";
+	case PRID_SERIES_LA664:
+		return "LA664";
+	default:
+		return "Unknown";
+	}
+}
+
 #endif /* !__ASSEMBLER__ */
 
 /*
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 6f943d1391ff..a2060a24b39f 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -277,7 +277,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 	uint32_t config;
 	uint64_t *vendor = (void *)(&cpu_full_name[VENDOR_OFFSET]);
 	uint64_t *cpuname = (void *)(&cpu_full_name[CPUNAME_OFFSET]);
-	const char *core_name = "Unknown";
+	const char *core_name = id_to_core_name(c->processor_id);
 
 	switch (BIT(fls(c->isa_level) - 1)) {
 	case LOONGARCH_CPU_ISA_LA32R:
@@ -291,35 +291,23 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 		break;
 	}
 
-	switch (c->processor_id & PRID_SERIES_MASK) {
-	case PRID_SERIES_LA132:
-		core_name = "LA132";
-		break;
-	case PRID_SERIES_LA264:
-		core_name = "LA264";
-		break;
-	case PRID_SERIES_LA364:
-		core_name = "LA364";
-		break;
-	case PRID_SERIES_LA464:
-		core_name = "LA464";
-		break;
-	case PRID_SERIES_LA664:
-		core_name = "LA664";
-		break;
-	}
-
 	pr_info("%s Processor probed (%s Core)\n", __cpu_family[cpu], core_name);
 
-	if (!cpu_has_iocsr)
+	if (!cpu_has_iocsr) {
+		__cpu_full_name[cpu] = "Unknown";
 		return;
-
-	if (!__cpu_full_name[cpu])
-		__cpu_full_name[cpu] = cpu_full_name;
+	}
 
 	*vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
 	*cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
 
+	if (!__cpu_full_name[cpu]) {
+		if (((char *)vendor)[0] == 0)
+			__cpu_full_name[cpu] = "Unknown";
+		else
+			__cpu_full_name[cpu] = cpu_full_name;
+	}
+
 	config = iocsr_read32(LOONGARCH_IOCSR_FEATURES);
 	if (config & IOCSRF_CSRIPI)
 		c->options |= LOONGARCH_CPU_CSRIPI;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index cea30768ae92..63d2b7e7e844 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -17,6 +17,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	unsigned long n = (unsigned long) v - 1;
 	unsigned int isa = cpu_data[n].isa_level;
+	unsigned int prid = cpu_data[n].processor_id;
 	unsigned int version = cpu_data[n].processor_id & 0xff;
 	unsigned int fp_version = cpu_data[n].fpu_vers;
 
@@ -37,6 +38,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "global_id\t\t: %d\n", cpu_data[n].global_id);
 	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
 	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
+	seq_printf(m, "PRID\t\t\t: %s (%08x)\n", id_to_core_name(prid), prid);
 	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
 	seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
 	seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",
-- 
2.47.3

