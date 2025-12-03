Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33F52550D4
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734086; cv=none; b=Qu3qvIABlGSSOhw0JkUM79tsA8iRJAxzHB2Bysb4BYsE4TcMxMR68vfVUvhzD3QL4nIscEtkeM3egw6AycdwKYZEB+nq0aS/GX5vaV7PvcnQ43u1GCvto7cRvnHmz1h21WVT6Y7UYMsv3eWOnE9EQuR6nZrz/rQkFraGFkhsjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734086; c=relaxed/simple;
	bh=RWnfQ6Y1oVsduJGynYYvmZMZGiwwAqlghmD8ss7NNlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB/ut0llxTzg1eeMEXIhqkFXtsCql4vP+khpDWObLedVpzSmweF4DgAkdd9sSvJFP83BXfBEmHegsZRwUoq3ty9ttV9pTRnmLjgrpKYS3llJXNOxFP/YgMrCBl+xV1OUhGW9uJC+hIcJK2i1+ug1eJKOJRQyl6di8KNtxPCBf4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8CxaNF8tC9pOJMqAA--.26692S3;
	Wed, 03 Dec 2025 11:54:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJBxpeRvtC9pdtVEAQ--.50913S4;
	Wed, 03 Dec 2025 11:54:31 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com,
	linmag7@gmail.com,
	thuth@redhat.com,
	maobibo@loongson.cn,
	apopple@nvidia.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 2/5] LoongArch: Architectural preparation for Redirect irqchip
Date: Wed,  3 Dec 2025 11:54:18 +0800
Message-ID: <20251203035422.32205-3-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203035422.32205-1-zhangtianyang@loongson.cn>
References: <20251203035422.32205-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeRvtC9pdtVEAQ--.50913S4
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWUuF4rurWkJF15KrWkKrX_yoWrGw4Upr
	yDArWkKrW5KF4xKa4qqrn09r4UWa97Cr42qw47urWUAF1UZ348Xr1ktFZxZFZ0qanxXa4I
	93Z5Cw1jv3WDZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUFc_-DUUUU

Add architectural preparation for Redirect irqchip, including:
1. CPUCFG feature bits definition for Redirect irqchip;
2. Detection of Redirect irqchip in cpu_probe();
3. New IOCSR register Definition for Redirect irqchop

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 arch/loongarch/include/asm/cpu-features.h | 1 +
 arch/loongarch/include/asm/cpu.h          | 2 ++
 arch/loongarch/include/asm/loongarch.h    | 6 ++++++
 arch/loongarch/kernel/cpu-probe.c         | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
index fc83bb32f9f0..03f7e93e81e0 100644
--- a/arch/loongarch/include/asm/cpu-features.h
+++ b/arch/loongarch/include/asm/cpu-features.h
@@ -68,5 +68,6 @@
 #define cpu_has_ptw		cpu_opt(LOONGARCH_CPU_PTW)
 #define cpu_has_lspw		cpu_opt(LOONGARCH_CPU_LSPW)
 #define cpu_has_avecint		cpu_opt(LOONGARCH_CPU_AVECINT)
+#define cpu_has_redirectint	cpu_opt(LOONGARCH_CPU_REDIRECTINT)
 
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index dfb982fe8701..27b9cfbfbaa8 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -102,6 +102,7 @@ enum cpu_type_enum {
 #define CPU_FEATURE_PTW			27	/* CPU has hardware page table walker */
 #define CPU_FEATURE_LSPW		28	/* CPU has LSPW (lddir/ldpte instructions) */
 #define CPU_FEATURE_AVECINT		29	/* CPU has AVEC interrupt */
+#define CPU_FEATURE_REDIRECTINT		30      /* CPU has interrupt remmap */
 
 #define LOONGARCH_CPU_CPUCFG		BIT_ULL(CPU_FEATURE_CPUCFG)
 #define LOONGARCH_CPU_LAM		BIT_ULL(CPU_FEATURE_LAM)
@@ -133,5 +134,6 @@ enum cpu_type_enum {
 #define LOONGARCH_CPU_PTW		BIT_ULL(CPU_FEATURE_PTW)
 #define LOONGARCH_CPU_LSPW		BIT_ULL(CPU_FEATURE_LSPW)
 #define LOONGARCH_CPU_AVECINT		BIT_ULL(CPU_FEATURE_AVECINT)
+#define LOONGARCH_CPU_REDIRECTINT	BIT_ULL(CPU_FEATURE_REDIRECTINT)
 
 #endif /* _ASM_CPU_H */
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 09dfd7eb406e..2cb4b407fbff 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1137,6 +1137,7 @@
 #define  IOCSRF_FLATMODE		BIT_ULL(10)
 #define  IOCSRF_VM			BIT_ULL(11)
 #define  IOCSRF_AVEC			BIT_ULL(15)
+#define  IOCSRF_REDIRECTINT		BIT_ULL(16)
 
 #define LOONGARCH_IOCSR_VENDOR		0x10
 
@@ -1196,6 +1197,11 @@
 
 #define LOONGARCH_IOCSR_EXTIOI_NODEMAP_BASE	0x14a0
 #define LOONGARCH_IOCSR_EXTIOI_IPMAP_BASE	0x14c0
+#define LOONGARCH_IOCSR_REDIRECT_CFG		0x15e0
+#define LOONGARCH_IOCSR_REDIRECT_TBR		0x15e8  /* IRT BASE REG*/
+#define LOONGARCH_IOCSR_REDIRECT_CQB		0x15f0  /* IRT CACHE QUEUE BASE */
+#define LOONGARCH_IOCSR_REDIRECT_CQH		0x15f8  /* IRT CACHE QUEUE HEAD, 32bit */
+#define LOONGARCH_IOCSR_REDIRECT_CQT		0x15fc  /* IRT CACHE QUEUE TAIL, 32bit */
 #define LOONGARCH_IOCSR_EXTIOI_EN_BASE		0x1600
 #define LOONGARCH_IOCSR_EXTIOI_BOUNCE_BASE	0x1680
 #define LOONGARCH_IOCSR_EXTIOI_ISR_BASE		0x1800
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index fedaa67cde41..543474fd1399 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -289,6 +289,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 		c->options |= LOONGARCH_CPU_EIODECODE;
 	if (config & IOCSRF_AVEC)
 		c->options |= LOONGARCH_CPU_AVECINT;
+	if (config & IOCSRF_REDIRECTINT)
+		c->options |= LOONGARCH_CPU_REDIRECTINT;
 	if (config & IOCSRF_VM)
 		c->options |= LOONGARCH_CPU_HYPERVISOR;
 }
-- 
2.41.0

