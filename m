Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1904A224AE8
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 03:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511753; cv=none; b=JlG71P28txuhLsfcxb9PuIOCgUmFzms4izmgRb/0KaNL1wm+o/BJeKb4bjjPRbxvB1k+K/dkqcKJfwLOXKuz99R5348PbSp2ZeEwyYX9LRYOTLmM2CyA4HQlXPgOPr3u1wzkUQdDBKlo3Tz0O5++9rZbUG+a1NukhfkYkTnyp5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511753; c=relaxed/simple;
	bh=+BqLR3/i8/FdiIqdrzF+jBGnkYRMM7cabAiMqCdxGAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFa+xjLLvnygDX0/cBpjTfQJltRzWWcyprGgNmr0xM3luWI3yuI1qNvtaawlhfyzqVkSMB8wJydl+y7RapGnBFc7uFm6YhmnnEyFB+xTR1MSFwmMGVVi+yVn5KM/3ff67qNe0yNlrgcCdghh0uM8P1pbp/XTjyOmEgH1ZsqqFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PC8EOnzq; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PC8EOnzq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765511748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2NV8ZwW83bzQy1RCyaUHPf+vApGHTLwEI1D2JJxit8E=;
	b=PC8EOnzqj+anUY7Z3+zZQdFdz/PsDi4AzyiszqiqTWzjQZmI4Q2rSa3B3M2eAtw9+QYMV7
	FyaenA84qwMB6ykQz+OexY6WxcQ6ft7xSGjA1Sgb4IezIvnO+u6HYAg8VAhrdy7unkziRp
	/g9nLRHqx+8o9OAjj96S1y0w4fm2cxY=
From: George Guo <dongtai.guo@linux.dev>
Date: Fri, 12 Dec 2025 11:55:21 +0800
Subject: [PATCH v5 1/4] LoongArch: Add SCQ support detection
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-2-v5-1-704b3af55f7d@linux.dev>
References: <20251212-2-v5-0-704b3af55f7d@linux.dev>
In-Reply-To: <20251212-2-v5-0-704b3af55f7d@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765511741; l=3297;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=asp3zEGHKQM1Bn/cuBBd7v6/IsNBRe16HsbU8xem4UU=;
 b=uOvtcHHCxtaO2sSwHFKirjMXKmFZcUUzS9StAcaR2q+L25+rYTDy1aWcSoPneKjW/QBZ8oy6u
 I/n9cOdikGJCHhuncgYWhsoj3TltXRqIhIL/6gS1NeWc3phMu4vZNNz
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
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
 arch/loongarch/kernel/cpu-probe.c         | 4 ++++
 4 files changed, 8 insertions(+)

diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
index bd5f0457ad21d89ab902fb1971cc8b41b1d340ad..860cb58a92ba0c0316a8009d97441043374e7f10 100644
--- a/arch/loongarch/include/asm/cpu-features.h
+++ b/arch/loongarch/include/asm/cpu-features.h
@@ -70,5 +70,6 @@
 #define cpu_has_msgint		cpu_opt(LOONGARCH_CPU_MSGINT)
 #define cpu_has_avecint		cpu_opt(LOONGARCH_CPU_AVECINT)
 #define cpu_has_redirectint	cpu_opt(LOONGARCH_CPU_REDIRECTINT)
+#define cpu_has_scq		cpu_opt(LOONGARCH_CPU_SCQ)
 
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index f3efb00b61414a9b111ade9fe9beb410b927d937..5531039027ec763f21c7a6a88685ec81fa61d3cc 100644
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
index 3de03cb864b248cd0fb5de9ec5a86b1436ccbdef..be04b3e6f5b0cd6c5d561efcfd99502bc24e5eee 100644
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
index a2060a24b39fd78fa255816fa5518e0ee99b8a8e..47815a55b7b48bbffd4954a9b8bdf7021d7e234d 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -201,6 +201,10 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_PTW;
 		elf_hwcap |= HWCAP_LOONGARCH_PTW;
 	}
+	if (config & CPUCFG2_SCQ)
+		c->options |= LOONGARCH_CPU_SCQ;
+	else
+		pr_warn_once("CPU does NOT support SCQ\n");
 	if (config & CPUCFG2_LSPW) {
 		c->options |= LOONGARCH_CPU_LSPW;
 		elf_hwcap |= HWCAP_LOONGARCH_LSPW;

-- 
2.49.0

