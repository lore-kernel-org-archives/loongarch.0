Received: from mail.srv.csmantle.top (mail.srv.csmantle.top [77.93.157.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE3349CD1;
	Sun,  6 Sep 2026 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.93.157.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788681851; cv=none; b=PsyXfBcluDTCwo4krd13e32/wVlAazBgxqriEtFjNWdbO97J3URRU2WCYBfdNJAj5GT1nO9cA8gh+o2oXuEmvCbO+aqJIkxv1dlj964mPhDe1j7yqPhe+hCWgcprswJNTF66cNuLb0L0ZaWAcNfMQxEpLz2KaGeUR5oadgLM+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788681851; c=relaxed/simple;
	bh=tfsLKLzJKY/aZg8IJo2yk/L9IF7bTOERIxt85G7Y6SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j72lwOLlJ0MBKxc2pQLj3oWNrCMnEleXvZpuj0e+sJZFURBZzb/rBWE2bITWsKaXpn85fbYTG4D9pRN9a2NJ58Y0zZwEPP/B6QuhobxSNVVwCrufQPT99jpF3FuJQrc5EDcMmfWZw+5yiw4XG8JsG/+jUNqp+1R3hh8SPaMxllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top; spf=pass smtp.mailfrom=csmantle.top; dkim=permerror (0-bit key) header.d=csmantle.top header.i=@csmantle.top header.b=4DAp5AZn; dkim=pass (3072-bit key) header.d=csmantle.top header.i=@csmantle.top header.b=dSmvUGF1; arc=none smtp.client-ip=77.93.157.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csmantle.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csmantle.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=csmantle.top header.i=@csmantle.top header.b="4DAp5AZn";
	dkim=pass (3072-bit key) header.d=csmantle.top header.i=@csmantle.top header.b="dSmvUGF1"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=csmantle.top; s=self-ed25519; h=BIMI-Selector:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:In-Reply-To:References:BIMI-Selector;
	bh=LhiyZ2fwxi6yNvGpWEpXEM4HejJGowV2Ge60yMxCS3Q=; t=1788681849; x=1789286649; 
	b=4DAp5AZnHy0OYwyF5V5NGmejRJ56P+22XI0BX9U5ODkqR/iF2ZAZTDTAh6xaVXLx7wjmWwjle7T
	2906ujvBQBg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=csmantle.top; s=self-rsa3072; h=BIMI-Selector:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:In-Reply-To:References:BIMI-Selector;
	bh=LhiyZ2fwxi6yNvGpWEpXEM4HejJGowV2Ge60yMxCS3Q=; t=1788681849; x=1789286649; 
	b=dSmvUGF1ywSxiWRrOVVcxuvN1zcBSgu0ruxWRYYdf2XvsnUU+xWh9mp/qaVOQvJUoFgD73/I5Of
	Sj7kaa3jZhFsEiZvD1/5gPDVqgMsa1t0P8+BqQbY2/vFDGf2EYjKmA7EinjdyzkxMtd370bpC0hgc
	sZCU4C6WHOHtHtJ2F3Mmw4/V4Pqz5cPhoVW9ZlFMnFlX0bAAL+3qjwb/T/WVjoMUTJciM+TL696Fn
	FWnUkkjK2DH2VE5VHRjS4DAki73WBvdmIndqBZPkbnqXAI58L+TotlnQ1tsg8dSvWREcFLnPjMJZd
	D8IpfGKcbEUT3MyvZKKlsgl2Mr5o5tkE1U2QBglolTlpK3yYIm9x+djX+7/+Xmz1Qx5rTdGSF6Oca
	3xmBSx5gODLQsMKqft3X4bmwmfZl87feiGZ7hWjTS/BFLH56F8uC42HGLISnGookYzdU8gwbgGnHO
	zw1Oh9Xrck55bxJKAggi1q52CdhMXORjD8z5OzzNZhUmRdV6BZND;
Received: from [47.76.78.191] (helo=loongcatbox)
	by mail.srv.csmantle.top with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rong.bao@csmantle.top>)
	id 1x37qm-00000000GG0-26aV;
	Sun, 06 Sep 2026 16:03:41 +0800
From: Rong Bao <rong.bao@csmantle.top>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yawei Li <liyawei@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rong Bao <rong.bao@csmantle.top>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	George Guo <dongtai.guo@linux.dev>,
	Yangyang Lian <lianyangyang@kylinos.cn>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Rong Bao <baorong2005@126.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: expose LAMCAS existence via cpuinfo and hwcap
Date: Sun,  6 Sep 2026 16:02:52 +0800
Message-ID: <20260906080316.3774-1-rong.bao@csmantle.top>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rcpt-Check: Accepted by authentication
X-42: Don't panic! 
BIMI-Selector: v=BIMI1; s=me

Currently, neither /proc/cpuinfo nor hwcap exposes the existence of the
LAMCAS extension, which is part of LA64v1.1. For example, on a Loongson
3B6000, /proc/cpuinfo is as follows:

        processor               : 23
        package                 : 0
        core                    : 11
        global_id               : 31
        CPU Family              : Loongson-64bit
        Model Name              : Loongson-3B6000
        PRID                    : LA664 (0014d011)
        CPU Revision            : 0x11
        FPU Revision            : 0x01
        CPU MHz                 : 2200.00
        BogoMIPS                : 4400.00
        TLB Entries             : 2112
        Address Sizes           : 48 bits physical, 48 bits virtual
        ISA                     : loongarch32r loongarch32s loongarch64
        Features                : cpucfg lam lam_bh scq ual fpu lsx lasx
        crc32 complex crypto lspw lvz lbt_x86 lbt_arm lbt_mips
        Hardware Watchpoint     : yes, iwatch count: 8, dwatch count: 4

... while the CPUCFG 2 instruction reads "0x7e7ccfcf", whose bit 28 is 1,
indicating the actual presence of LAMCAS.

This hinders user-space inspection and detection of LAMCAS. For example,
in SpiderMonkey, we need to switch to larchintrin.h and raw __cpucfg()
to manually perform the bit extraction. Also, a curious user reading
/proc/cpuinfo might be puzzled by the lack (of display) of LAMCAS.

Expose the existence of LAMCAS via cpuinfo and hwcap. The definition
point of the new LOONGARCH_CPU_LAMCAS flag is chosen to match the
practices in commit 1dd3e8a8eeb4059fb34b07578362380cf35b7ed5 ("LoongArch:
Define instruction formats for AM{SWAP/ADD}.{B/H} and DBAR").

After this patch, /proc/cpuinfo looks like the following:

        processor               : 23
        package                 : 0
        core                    : 11
        global_id               : 31
        CPU Family              : Loongson-64bit
        Model Name              : Loongson-3B6000
        PRID                    : LA664 (0014d011)
        CPU Revision            : 0x11
        FPU Revision            : 0x01
        CPU MHz                 : 2200.00
        BogoMIPS                : 4400.00
        TLB Entries             : 2112
        Address Sizes           : 48 bits physical, 48 bits virtual
        ISA                     : loongarch32r loongarch32s loongarch64
        Features                : cpucfg lam lam_bh lamcas scq ual fpu lsx
        lasx crc32 complex crypto lspw lvz lbt_x86 lbt_arm lbt_mips
        Hardware Watchpoint     : yes, iwatch count: 8, dwatch count: 4

Note the addition of "lamcas" to the "Features" row.

Link: https://bugzil.la/2069431 ("[loong64] Use LA64v1.1 LAMCAS
 extension to simplify atomic cmpxchg operations")
Signed-off-by: Rong Bao <rong.bao@csmantle.top>
---
v1 -> v2:
- Addressed review comments and correctly re-stylized "LoongArch" in
  subject.

v1: https://lore.kernel.org/loongarch/20260905032010.4962-1-rong.bao@csmantle.top/

 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          | 64 ++++++++++++-----------
 arch/loongarch/include/uapi/asm/hwcap.h   |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  4 ++
 arch/loongarch/kernel/proc.c              |  2 +
 5 files changed, 41 insertions(+), 31 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
index 62059c5551b9cdcc63c26033f8ccb44d63b18482..19cb0ccd0fb62bbbeb80a31bc447c101560bed32 100644
--- a/arch/loongarch/include/asm/cpu-features.h
+++ b/arch/loongarch/include/asm/cpu-features.h
@@ -36,6 +36,7 @@
 #define cpu_has_cpucfg		cpu_opt(LOONGARCH_CPU_CPUCFG)
 #define cpu_has_lam		cpu_opt(LOONGARCH_CPU_LAM)
 #define cpu_has_lam_bh		cpu_opt(LOONGARCH_CPU_LAM_BH)
+#define cpu_has_lamcas		cpu_opt(LOONGARCH_CPU_LAMCAS)
 #define cpu_has_scq		cpu_opt(LOONGARCH_CPU_SCQ)
 #define cpu_has_ual		cpu_opt(LOONGARCH_CPU_UAL)
 #define cpu_has_fpu		cpu_opt(LOONGARCH_CPU_FPU)
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index 91b96938861eb9f81882b128ab0bd0a925ce0dbb..334ca9d69ec4a649848133d0a81555bfc37fbf9d 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -96,41 +96,43 @@ static inline char *id_to_core_name(unsigned int id)
 #define CPU_FEATURE_CPUCFG		0	/* CPU has CPUCFG */
 #define CPU_FEATURE_LAM			1	/* CPU has Atomic instructions */
 #define CPU_FEATURE_LAM_BH		2	/* CPU has AM{SWAP/ADD}[_DB].{B/H} instructions */
-#define CPU_FEATURE_SCQ			3	/* CPU has SC.Q instruction */
-#define CPU_FEATURE_UAL			4	/* CPU supports unaligned access */
-#define CPU_FEATURE_FPU			5	/* CPU has FPU */
-#define CPU_FEATURE_LSX			6	/* CPU has LSX (128-bit SIMD) */
-#define CPU_FEATURE_LASX		7	/* CPU has LASX (256-bit SIMD) */
-#define CPU_FEATURE_CRC32		8	/* CPU has CRC32 instructions */
-#define CPU_FEATURE_COMPLEX		9	/* CPU has Complex instructions */
-#define CPU_FEATURE_CRYPTO		10	/* CPU has Crypto instructions */
-#define CPU_FEATURE_LVZ			11	/* CPU has Virtualization extension */
-#define CPU_FEATURE_LBT_X86		12	/* CPU has X86 Binary Translation */
-#define CPU_FEATURE_LBT_ARM		13	/* CPU has ARM Binary Translation */
-#define CPU_FEATURE_LBT_MIPS		14	/* CPU has MIPS Binary Translation */
-#define CPU_FEATURE_TLB			15	/* CPU has TLB */
-#define CPU_FEATURE_CSR			16	/* CPU has CSR */
-#define CPU_FEATURE_IOCSR		17	/* CPU has IOCSR */
-#define CPU_FEATURE_WATCH		18	/* CPU has watchpoint registers */
-#define CPU_FEATURE_VINT		19	/* CPU has vectored interrupts */
-#define CPU_FEATURE_CSRIPI		20	/* CPU has CSR-IPI */
-#define CPU_FEATURE_EXTIOI		21	/* CPU has EXT-IOI */
-#define CPU_FEATURE_PREFETCH		22	/* CPU has prefetch instructions */
-#define CPU_FEATURE_PMP			23	/* CPU has perfermance counter */
-#define CPU_FEATURE_SCALEFREQ		24	/* CPU supports cpufreq scaling */
-#define CPU_FEATURE_FLATMODE		25	/* CPU has flat mode */
-#define CPU_FEATURE_EIODECODE		26	/* CPU has EXTIOI interrupt pin decode mode */
-#define CPU_FEATURE_GUESTID		27	/* CPU has GuestID feature */
-#define CPU_FEATURE_HYPERVISOR		28	/* CPU has hypervisor (running in VM) */
-#define CPU_FEATURE_PTW			29	/* CPU has hardware page table walker */
-#define CPU_FEATURE_LSPW		30	/* CPU has LSPW (lddir/ldpte instructions) */
-#define CPU_FEATURE_MSGINT		31	/* CPU has MSG interrupt */
-#define CPU_FEATURE_AVECINT		32	/* CPU has AVEC interrupt */
-#define CPU_FEATURE_REDIRECTINT		33	/* CPU has interrupt remapping */
+#define CPU_FEATURE_LAMCAS		3	/* CPU has AMCAS[_DB].{B/H/W/D} instructions */
+#define CPU_FEATURE_SCQ			4	/* CPU has SC.Q instruction */
+#define CPU_FEATURE_UAL			5	/* CPU supports unaligned access */
+#define CPU_FEATURE_FPU			6	/* CPU has FPU */
+#define CPU_FEATURE_LSX			7	/* CPU has LSX (128-bit SIMD) */
+#define CPU_FEATURE_LASX		8	/* CPU has LASX (256-bit SIMD) */
+#define CPU_FEATURE_CRC32		9	/* CPU has CRC32 instructions */
+#define CPU_FEATURE_COMPLEX		10	/* CPU has Complex instructions */
+#define CPU_FEATURE_CRYPTO		11	/* CPU has Crypto instructions */
+#define CPU_FEATURE_LVZ			12	/* CPU has Virtualization extension */
+#define CPU_FEATURE_LBT_X86		13	/* CPU has X86 Binary Translation */
+#define CPU_FEATURE_LBT_ARM		14	/* CPU has ARM Binary Translation */
+#define CPU_FEATURE_LBT_MIPS		15	/* CPU has MIPS Binary Translation */
+#define CPU_FEATURE_TLB			16	/* CPU has TLB */
+#define CPU_FEATURE_CSR			17	/* CPU has CSR */
+#define CPU_FEATURE_IOCSR		18	/* CPU has IOCSR */
+#define CPU_FEATURE_WATCH		19	/* CPU has watchpoint registers */
+#define CPU_FEATURE_VINT		20	/* CPU has vectored interrupts */
+#define CPU_FEATURE_CSRIPI		21	/* CPU has CSR-IPI */
+#define CPU_FEATURE_EXTIOI		22	/* CPU has EXT-IOI */
+#define CPU_FEATURE_PREFETCH		23	/* CPU has prefetch instructions */
+#define CPU_FEATURE_PMP			24	/* CPU has perfermance counter */
+#define CPU_FEATURE_SCALEFREQ		25	/* CPU supports cpufreq scaling */
+#define CPU_FEATURE_FLATMODE		26	/* CPU has flat mode */
+#define CPU_FEATURE_EIODECODE		27	/* CPU has EXTIOI interrupt pin decode mode */
+#define CPU_FEATURE_GUESTID		28	/* CPU has GuestID feature */
+#define CPU_FEATURE_HYPERVISOR		29	/* CPU has hypervisor (running in VM) */
+#define CPU_FEATURE_PTW			30	/* CPU has hardware page table walker */
+#define CPU_FEATURE_LSPW		31	/* CPU has LSPW (lddir/ldpte instructions) */
+#define CPU_FEATURE_MSGINT		32	/* CPU has MSG interrupt */
+#define CPU_FEATURE_AVECINT		33	/* CPU has AVEC interrupt */
+#define CPU_FEATURE_REDIRECTINT		34	/* CPU has interrupt remapping */
 
 #define LOONGARCH_CPU_CPUCFG		BIT_ULL(CPU_FEATURE_CPUCFG)
 #define LOONGARCH_CPU_LAM		BIT_ULL(CPU_FEATURE_LAM)
 #define LOONGARCH_CPU_LAM_BH		BIT_ULL(CPU_FEATURE_LAM_BH)
+#define LOONGARCH_CPU_LAMCAS		BIT_ULL(CPU_FEATURE_LAMCAS)
 #define LOONGARCH_CPU_SCQ		BIT_ULL(CPU_FEATURE_SCQ)
 #define LOONGARCH_CPU_UAL		BIT_ULL(CPU_FEATURE_UAL)
 #define LOONGARCH_CPU_FPU		BIT_ULL(CPU_FEATURE_FPU)
diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/include/uapi/asm/hwcap.h
index 90e96113ba51003cd4dde5c7c79744f5e0755a03..d354787b937c3ae9eb8c3d58a4e7e96bd066f6fd 100644
--- a/arch/loongarch/include/uapi/asm/hwcap.h
+++ b/arch/loongarch/include/uapi/asm/hwcap.h
@@ -20,5 +20,6 @@
 #define HWCAP_LOONGARCH_LSPW		(1 << 14)
 #define HWCAP_LOONGARCH_SCQ		(1 << 15)
 #define HWCAP_LOONGARCH_LAM_BH		(1 << 16)
+#define HWCAP_LOONGARCH_LAMCAS		(1 << 17)
 
 #endif /* _UAPI_ASM_HWCAP_H */
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 74d31f260dfd889e66a1f55c5bcc47a3657d101f..93176e4d017b4d8fc82c817a7064af0656133c15 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -182,6 +182,10 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_LAM_BH;
 		elf_hwcap |= HWCAP_LOONGARCH_LAM_BH;
 	}
+	if (config & CPUCFG2_LAMCAS) {
+		c->options |= LOONGARCH_CPU_LAMCAS;
+		elf_hwcap |= HWCAP_LOONGARCH_LAMCAS;
+	}
 	if (config & CPUCFG2_SCQ) {
 		c->options |= LOONGARCH_CPU_SCQ;
 		elf_hwcap |= HWCAP_LOONGARCH_SCQ;
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index d4ce5b585453700caf2187c3dcc8f4f3cc8a9226..f86be83ad6f134c5793667fa6dbe2bf82fd58a2e 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -66,6 +66,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " lam");
 	if (cpu_has_lam_bh)
 		seq_puts(m, " lam_bh");
+	if (cpu_has_lamcas)
+		seq_puts(m, " lamcas");
 	if (cpu_has_scq)
 		seq_puts(m, " scq");
 	if (cpu_has_ual)

base-commit: 654ae5d73c05bd2943d65636ce6cd0aa46e62f18
-- 
2.55.0

