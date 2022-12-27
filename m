Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBCAA21
	for <loongarch@lists.linux.dev>; Tue, 27 Dec 2022 07:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFD9C433D2;
	Tue, 27 Dec 2022 07:27:14 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Yinyu Cai <caiyinyu@loongson.cn>
Subject: [PATCH] LoongArch: Add HWCAP_LOONGARCH_CPUCFG to elf_hwcap
Date: Tue, 27 Dec 2022 15:27:24 +0800
Message-Id: <20221227072724.47564-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HWCAP_LOONGARCH_CPUCFG is missing in elf_hwcap, so add it for glibc's
later use.

Cc: stable@vger.kernel.org
Reported-by: Yinyu Cai <caiyinyu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cpu-probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 255a09876ef2..3a3fce2d7846 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -94,7 +94,7 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 	c->options = LOONGARCH_CPU_CPUCFG | LOONGARCH_CPU_CSR |
 		     LOONGARCH_CPU_TLB | LOONGARCH_CPU_VINT | LOONGARCH_CPU_WATCH;
 
-	elf_hwcap |= HWCAP_LOONGARCH_CRC32;
+	elf_hwcap = HWCAP_LOONGARCH_CPUCFG | HWCAP_LOONGARCH_CRC32;
 
 	config = read_cpucfg(LOONGARCH_CPUCFG1);
 	if (config & CPUCFG1_UAL) {
-- 
2.31.1

