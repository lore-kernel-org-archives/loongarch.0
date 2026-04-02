Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3BF36C0CD
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 04:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775105310; cv=none; b=TmMgNXIGsjV0sNc0Q/x/dJBL0VmIG1BELqT2SMzFvrivht/QAkxZ9j2VVX922OzfbN8IHxpPg4Mz0WngKpAKolb9pjXTNJK/CPYoZ5DY7JD6SH7Oc8843pst9NwsS89jPILvZjAUqZ1gu7mG6OEO1JlcFVQJ/li+1wwL1QNG+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775105310; c=relaxed/simple;
	bh=HfC3G30ogwpT+dAYXY9ox9i2u9dNTRxmeSzM6odWwEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m313tomi6mchyGOz+rY8GrQXGnEbNFBFYLABA8K6OaCm7atzzFISvY6mWGhrZyfpej92QcLEvlQIS7vr8d36NOiy9KOetOpR3X8ifi96cjDJEkC8nkD4h5Xayebyj7sMu9yZb1k6vmjcavJUdrg1F/yVAtMjBaHBQ6U5XhLsfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Wasox+wk; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Wasox+wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1775105303;
	bh=Uy07XJtVZkmXHnLa/q3/GsYhj+3mS0aEul5Mip+s9F4=;
	h=From:To:Cc:Subject:Date:From;
	b=Wasox+wkQtyPSkTpgPVwLyKh8d7fdj9wrmGFg8QBhFy0xsUvDg0HtRSC9/p1C/Zyc
	 kwVqJ4KpDb4PWUkscTKslXsj1KoDr2KL1tgkND/MPGfcbCikxuLpu7Sjx0UL9J8HM6
	 intZoeqM/hVQOL+v7lZz6F0oRWkeJR9fTcMsvMbY=
Received: from stargazer (unknown [IPv6:2409:8a4c:e10:180:5633:9efb:acb8:d769])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 210CD65992;
	Thu,  2 Apr 2026 00:48:19 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	Zixing Liu <liushuyu@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyang Lian <lianyangyang@kylinos.cn>,
	Yawei Li <liyawei@loongson.cn>,
	George Guo <dongtai.guo@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: detect and disable sc.q if erratic
Date: Thu,  2 Apr 2026 12:47:30 +0800
Message-ID: <20260402044732.164294-2-xry111@xry111.site>
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
 arch/loongarch/kernel/cpu-probe.c | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 657bbae6c1c7..943e5826c71b 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -132,6 +132,36 @@ static void set_isa(struct cpuinfo_loongarch *c, unsigned int isa)
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
+	register long tmp;
+
+	asm (
+		"1:ll.d\t$r0, %[mem]\n\t"
+		"move\t%[tmp], $r0\n\t"
+		"sc.q\t%[tmp], %[one], %[mem]\n\t"
+		"beqz\t%[tmp], 1b"
+		: [mem] "=ZB" (mem), [tmp] "=&r" (tmp)
+		: [one] "r" (1));
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
@@ -177,7 +207,7 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
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

