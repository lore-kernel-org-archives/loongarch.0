Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2091CF7D5
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786962; cv=none; b=FRl7h5Tpxdh1a0aK7xsM15VC+UJTm0s2v7UsTsYrJPATlBHRz73UPdiwZLmQHKIMlIDeoIi8dtdebYkng9O7FGsNJRIiBcyPgaDFu96u86Nn5q31NJ1QIAyt5xCP/qBzgeebZ+TKkxRAlhUps1CX2HNYw7IR3BGaBdbergc/yOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786962; c=relaxed/simple;
	bh=3XZ0kMOkmhXJkUgXZqo3ZjEbGyvsIUXKZG61LlH0dTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtRus2dYuN3/+TbnhTS1Gc/HysmGuvbex5MFSvkuJSVTdFZTa7LvyAlqCAxKqXERK+wwC3Vwq/ZsEHrLxmG5ltx6ctMlg2pvKzZEHGDJfRb5pSZy6GJYbvxRhLdttMfC5y5mParKLcJAFlPozGZepNq6i/d+S+1F1cDB4Ii8Bpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ayWeislS; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ayWeislS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLJdLwQTD/0wHQRSqI/Lqi0DxQEzBBtNavs5xmL24Kw=;
	b=ayWeislSn7/ZmidHHP3gcOyrfJ/n2g4DzRUKwm7oUNbiZMOsyVWcBbHLMXPdJKg531gW7f
	6xy9aBRO/8zaQJMi6F5wxut0avt3MEEwiUBjKFPfksjGgNSv3gBxBDtb4fdVV3wWJ8Gx74
	HE6DgvKziq9eBfy+CU8aNYyUUIqCMQk=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 15 Dec 2025 16:22:01 +0800
Subject: [PATCH v6 1/4] LoongArch: Add SCQ support detection
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-2-v6-1-09a486e8df99@linux.dev>
References: <20251215-2-v6-0-09a486e8df99@linux.dev>
In-Reply-To: <20251215-2-v6-0-09a486e8df99@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786949; l=3909;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=OKOY1aPzYkum+Trqg6DK3AnIryJ6rYAevr9PZQRiEA0=;
 b=qjgmEmnYqY6Ezu/QUXekCmlvLCFb9jgzhiLHAOM5v2G8vw+iF0DcWCLXQYd+aVEWzAiJbs2oM
 NDoAuPRR29+B7hBfbhb/ONJ6roQ/doq5zQe+JYcvfcB04FVsAErZrTQ
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
index 63d2b7e7e844b0647a3e0d988ec2adb6c77b9b14..f1ad1773425eba5becfd31bc730eed0f2d19589d 100644
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

