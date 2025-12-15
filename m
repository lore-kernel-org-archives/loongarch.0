Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12AA2D877B
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786324; cv=none; b=lflBmYFqN+10q8jFWYaB+J6kWg9Ov8fk0HxTiDguPTt+eqV2zF4uVjb9h9OhC+6AfljVOTNyidWP/5cu842ypBJb+MWEI8Mwfn0uoFGGtcuXDpclLAeTBv/+w2fM7bInYTKybEgLRzgs7vfoajC1QijnALe2yF5dtfZ9pf4qMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786324; c=relaxed/simple;
	bh=cXc3obyIcw9YvkeOmzuL/bv4CnWdw8pFi4uXyVWqX4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNlAaJqslowC6NPe91FR22QEbS2uyAM0X/7l/A4AsHc4bQCecjghZtHy40/ng/KRRumenyqFtPxdVeQfU8Np78G3eAlNmKGnlmKYmB+Mo42MhqN4XBepGTLCQmTsPGZdQU8aIwOsoE2ufxPBHfbgta8ZGTAIGe6X25MoUyvTaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YPHPN1fv; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YPHPN1fv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoRCdow/Ti3N0HxisM491xXoQW8jb0KI8KhOldrmjGg=;
	b=YPHPN1fvwtk449VtEp3a9wb1ZutBKh3ci5qgGicmulBPJlJNN5Wg9PNeE1gosyho8hKyG5
	FEPdVqo7nwQnyrXhYmTj75g85/HCSKscqALZ23YKZEFVhSyS9uXScf0/cXUpx9dwWLM/G6
	PjjIOkH3b8QJL+5pwmg6BQNWnhqAKO8=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 15 Dec 2025 16:11:39 +0800
Subject: [PATCH v6 1/4] LoongArch: Add SCQ support detection
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-2-v6-1-c3ceeb281916@linux.dev>
References: <20251215-2-v6-0-c3ceeb281916@linux.dev>
In-Reply-To: <20251215-2-v6-0-c3ceeb281916@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786312; l=3909;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=yhUOO3j3lnIAbGqoY3X9QA4Vqj6Mmpm4lGexeO4WKBg=;
 b=P/8HzRI+lNDEHfg7S0Q+zzNlCXx8bOJhitCa2/V5VT0iBBOiv4Se+SY7F6lmYWZKC1uSXJUwy
 A1KE3iKV4ocAlgb32+siWi8AGjoqYJxc0BnIHRTvtN7/jh/Kpt2iYGE
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
 arch/loongarch/kernel/cpu-probe.c         | 2 ++
 arch/loongarch/kernel/proc.c              | 1 +
 5 files changed, 7 insertions(+)

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
index a2060a24b39fd78fa255816fa5518e0ee99b8a8e..5c5ead3eb0895c1a20abba1e19f02226a2657b1f 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -201,6 +201,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_PTW;
 		elf_hwcap |= HWCAP_LOONGARCH_PTW;
 	}
+	if (config & CPUCFG2_SCQ)
+		c->options |= LOONGARCH_CPU_SCQ;
 	if (config & CPUCFG2_LSPW) {
 		c->options |= LOONGARCH_CPU_LSPW;
 		elf_hwcap |= HWCAP_LOONGARCH_LSPW;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 63d2b7e7e844b0647a3e0d988ec2adb6c77b9b14..adfe8a1e3c9dad047bad197bab99fe87ca58b098 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -75,6 +75,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_lbt_x86)	seq_printf(m, " lbt_x86");
 	if (cpu_has_lbt_arm)	seq_printf(m, " lbt_arm");
 	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
+	if (cpu_has_scq)        seq_printf(m, " scp");
 	seq_printf(m, "\n");
 
 	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));

-- 
2.49.0

