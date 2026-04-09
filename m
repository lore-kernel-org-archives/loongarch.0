Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E837996B
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737213; cv=none; b=IaeyVpjRuLp+ANwsuXZMQ0CAETr4EAxCq+gYaWSdj5Bhay/eEnykiY2jsfLvi9jOU3WHlWxHXfONTOWS2wX47552T1JQ8gPUwRhcf8JCtL8ntP7yTTpnC10Pe8oxIShXJd55IE/Tm/Q0gJlf/b7CisvxlhQoQ+si5SHDkbaA/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737213; c=relaxed/simple;
	bh=/UHkqcK+CDc6x5qAm5VSMvQGRc3kdJ2fymBfyxlD4NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=etU2cpZhVdfo1kUCcrwOlj5UGt69YlpTk1Exb8seAxMZks2U6j6b6bjPoRP36sq4DkhuhqwdexbB7Utn2H3P9PYs8wF3xNoJr2paUDxo490TRTx3XMJriNdoeg8JMTlG3VP+Bg3gN/FxF+Tec4ZFKr2kmdAhV3fPsRkbREHA+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ltO9OhuU; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ltO9OhuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1775737203;
	bh=7HPLgZaVAXKWBpXgEoNUTsMht1vFm0t3+42DjDwUhqU=;
	h=From:To:Cc:Subject:Date:From;
	b=ltO9OhuURiAWfHCvCRRfv1QX09vcM+QFFphHnPJoA/EIKKHFqQiWcGWzR5xI5nsbo
	 riS9+nYESDwaJW96JugN6gFb7qM5jlL2tIMh0gDFj+B0RcnI3RpFoiAng70QL2UxjS
	 UGmKkRa5Zytp7pfGH3hJeoVoVDyMzpSsi2uB+ItQ=
Received: from stargazer (unknown [IPv6:2409:8a4c:e10:9f70:826e:a0d5:6bcd:5ab7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DF71D65992;
	Thu,  9 Apr 2026 08:19:59 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	loongarch@lists.linux.dev,
	Zixing Liu <liushuyu@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	George Guo <dongtai.guo@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: detect and disable sc.q if erratic
Date: Thu,  9 Apr 2026 20:19:34 +0800
Message-ID: <20260409121936.871418-1-xry111@xry111.site>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've observed that, on some Loongson 2K3000/3B6000M systems with earlier
firmware revisions, the sc.q instruction may write incorrect data into
the upper half of the written 128-bit datum.

It seems upgrading the firmware (for example, the 202602 release from
Loongson [1]) will resolve the issue. But since not all systems may be
running the most up-to-date firmware, based on firmware update avail-
ability and the environment in which they are running in.

To help with system compatibility and ensure correct behavior, check if
sc.q behaves erratically and disable if so.

Link: https://github.com/loongson/Firmware/pull/156 [1]
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/kernel/cpu-probe.c | 39 ++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 657bbae6c1c7..5fcf2672172f 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -132,6 +132,43 @@ static void set_isa(struct cpuinfo_loongarch *c, unsigned int isa)
 	}
 }
 
+/*
+ * Some LoongArch has broken sc.q which incorrectly handles the upper word
+ * when the lower word is zero. Newer firmware versions (such as the 202602
+ * release from Loongson) seem to contain a workaround for this issue.
+ *
+ * Disable sc.q if erratic to ensure reliability and compatibility.
+ */
+static bool sc_q_is_sane(void)
+{
+	struct {
+		long word[2];
+	} __aligned(16) mem;
+	register long tmp asm("t0");
+	register long one asm("t1") = 1;
+	register long *ptr asm("t2") = &mem.word[0];
+
+	/*
+	 * The sc.q instruction is hard coded with .word so the HWCAP bit
+	 * exported to the userspace won't depend on the assembler version
+	 * used to build the kernel.
+	 */
+	asm (
+		"1:ll.d\t$r0, %[ptr], 0\n\t"
+		"move\t%[tmp], $r0\n\t"
+		".word\t0x385735cc\n\t" /* sc.q %[tmp], %[one], %[ptr]*/
+		"beqz\t%[tmp], 1b"
+		: [tmp] "=&r" (tmp), "=m" (mem)
+		: [ptr] "r" (ptr), [one] "r" (one));
+
+	if (mem.word[1] != 1) {
+		pr_warn_once("Warning: sc.q is erratic on this platform, disabling for both kernel and HWCAP. Please try a firmware update.");
+		return false;
+	}
+
+	return true;
+}
+
 static void cpu_probe_common(struct cpuinfo_loongarch *c)
 {
 	unsigned int config;
@@ -177,7 +214,7 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_LAM;
 		elf_hwcap |= HWCAP_LOONGARCH_LAM;
 	}
-	if (config & CPUCFG2_SCQ) {
+	if ((config & CPUCFG2_SCQ) && sc_q_is_sane()) {
 		c->options |= LOONGARCH_CPU_SCQ;
 		elf_hwcap |= HWCAP_LOONGARCH_SCQ;
 	}
-- 
2.53.0

