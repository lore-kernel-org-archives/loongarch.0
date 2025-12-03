Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43F6265CDD
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 04:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734481; cv=none; b=PuRDCvhphokM2HijS6N76PhAygy8Zka2fGEkqhVBtYx/ITcAVgxImsFx/AcdarQo5LNAffdl5U5M/euWzZxuOoD1SXK/41Za0fWTYsX9oxbxb/mp01Xivc/UPmQGf/cGaRR/cYDCM+DROWEYv1Tcb8gerw61xkwAFvlzXopVs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734481; c=relaxed/simple;
	bh=RWnfQ6Y1oVsduJGynYYvmZMZGiwwAqlghmD8ss7NNlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGNgzuxoaACP/+NGXj1p3krdWBCeUvO2QRaz9SCwZTk66V+9399GrbbluZGJnYrttYWgF5H1lqkCPe1Zh2O+xpZmM9lsFOfcuBfl2P7nWhzENV8k/mLJrOrpvF1hHUJqAuarQIKlLZow6kYn/VqwX3KWL7id2SlUiM7mjuWW7j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8AxRNAKti9pOpQqAA--.25336S3;
	Wed, 03 Dec 2025 12:01:14 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDxbMECti9pitZEAQ--.61845S4;
	Wed, 03 Dec 2025 12:01:13 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 2/5] LoongArch: Architectural preparation for Redirect irqchip
Date: Wed,  3 Dec 2025 12:00:59 +0800
Message-ID: <20251203040105.32490-3-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203040105.32490-1-zhangtianyang@loongson.cn>
References: <20251203040105.32490-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMECti9pitZEAQ--.61845S4
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWUuF4rurWkJF15KrWkKrX_yoWrGw4Upr
	yDArWkKrW5KF4xKa4qqrn09r4UWa97Cr42qw47urWUAF1UZ348Xr1ktFZxZFZ0qanxXa4I
	93Z5Cw1jv3WDZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUjU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUS_HUUUUUU

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

