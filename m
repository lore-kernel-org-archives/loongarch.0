Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2062FE24;
	Thu, 16 Nov 2023 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.22.233.25])
	by gateway (Coremail) with SMTP id _____8Dxfet5E1Zl7os6AA--.47154S3;
	Thu, 16 Nov 2023 21:04:58 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.233.25])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP912E1ZlOydEAA--.20248S2;
	Thu, 16 Nov 2023 21:04:56 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Jinyang He <hejinyang@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: Record pc instead of offset in la-abs relocation
Date: Thu, 16 Nov 2023 21:03:31 +0800
Message-ID: <20231116130331.241395-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP912E1ZlOydEAA--.20248S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFyxuF43Zw47Aw4Uur4kuFX_yoW8Zry8pF
	9rZr1ktF4rWr1fKF1Dtas8urn8JanrWr1aganxKa48Aa1aqF1DXr1vg3sFvFyUta1FqrWI
	ga4rKwnaqa1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU

To clarify, the previous version functioned flawlessly. However, it's
worth noting that the LLVM's LoongArch backend currently lacks support
for cross-section label calculations. With this patch, we enable the use
of clang to compile relocatable kernels.

Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/include/asm/asmmacro.h | 3 +--
 arch/loongarch/include/asm/setup.h    | 2 +-
 arch/loongarch/kernel/relocate.c      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
index c9544f358c33..655db7d7a427 100644
--- a/arch/loongarch/include/asm/asmmacro.h
+++ b/arch/loongarch/include/asm/asmmacro.h
@@ -609,8 +609,7 @@
 	lu32i.d	\reg, 0
 	lu52i.d	\reg, \reg, 0
 	.pushsection ".la_abs", "aw", %progbits
-	768:
-	.dword	768b-766b
+	.dword	766b
 	.dword	\sym
 	.popsection
 #endif
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index a0bc159ce8bd..ee52fb1e9963 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -25,7 +25,7 @@ extern void set_merr_handler(unsigned long offset, void *addr, unsigned long len
 #ifdef CONFIG_RELOCATABLE
 
 struct rela_la_abs {
-	long offset;
+	long pc;
 	long symvalue;
 };
 
diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 6c3eff9af9fb..288b739ca88d 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -52,7 +52,7 @@ static inline void __init relocate_absolute(long random_offset)
 	for (p = begin; (void *)p < end; p++) {
 		long v = p->symvalue;
 		uint32_t lu12iw, ori, lu32id, lu52id;
-		union loongarch_instruction *insn = (void *)p - p->offset;
+		union loongarch_instruction *insn = (void *)p->pc;
 
 		lu12iw = (v >> 12) & 0xfffff;
 		ori    = v & 0xfff;
-- 
2.42.1

