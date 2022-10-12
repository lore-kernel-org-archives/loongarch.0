Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A58F6F
	for <loongarch@lists.linux.dev>; Wed, 12 Oct 2022 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1665573181; bh=jQXI5aEReKrw+ZRZjXWpuy3D8HVFbu5pIl125t8w5MA=;
	h=From:To:Cc:Subject:Date:From;
	b=YInqk2tXDllQoaKT8SucQez+0E2IhD+nG3xXtlMN3R1btmb5/JqcpxxxIK//2m/ib
	 INpXBiREeIuwhCsrF1PyMWMFcLviOZxsoscEoMPhulmLn4rdSrsit+2KSF8Vhdz2nC
	 YoxTD/DCAKibg5q494Tnp0z2P7dnez0l05hUsIVE=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 334E1600CF;
	Wed, 12 Oct 2022 19:12:59 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Expose LBT features in cpuinfo and ELF HWCAP
Date: Wed, 12 Oct 2022 19:12:54 +0800
Message-Id: <20221012111254.3194431-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Although proper context switching support for LBT is not present yet,
this fixes an apparent oversight where other similarly not-yet-supported
features e.g. LSX, LASX, Crypto, or LVZ are being reported but the LBT
ones are not.

Fixes: 628c3bb40e9a ("LoongArch: Add boot and setup routines")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 arch/loongarch/kernel/cpu-probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 529ab8f44ec6..82de5264d2c9 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -123,6 +123,18 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 		c->options |= LOONGARCH_CPU_LVZ;
 		elf_hwcap |= HWCAP_LOONGARCH_LVZ;
 	}
+	if (config & CPUCFG2_X86BT) {
+		c->options |= LOONGARCH_CPU_LBT_X86;
+		elf_hwcap |= HWCAP_LOONGARCH_LBT_X86;
+	}
+	if (config & CPUCFG2_ARMBT) {
+		c->options |= LOONGARCH_CPU_LBT_ARM;
+		elf_hwcap |= HWCAP_LOONGARCH_LBT_ARM;
+	}
+	if (config & CPUCFG2_MIPSBT) {
+		c->options |= LOONGARCH_CPU_LBT_MIPS;
+		elf_hwcap |= HWCAP_LOONGARCH_LBT_MIPS;
+	}
 
 	config = read_cpucfg(LOONGARCH_CPUCFG6);
 	if (config & CPUCFG6_PMP)
-- 
2.38.0

