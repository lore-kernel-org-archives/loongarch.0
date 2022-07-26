Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A5D7A
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv9Ghtt9i7Wk5AA--.17387S4;
	Tue, 26 Jul 2022 17:40:49 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] LoongArch: Remove unused variable
Date: Tue, 26 Jul 2022 17:40:49 +0800
Message-Id: <20220726094049.7200-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220726094049.7200-1-maobibo@loongson.cn>
References: <20220726094049.7200-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9Dxv9Ghtt9i7Wk5AA--.17387S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGryrCw1xAryrKF13GF1UGFg_yoW5XrWDpF
	9xAwnagr4Ygrn5Zr98JFW5WF1jkasxGwnrZanFv3W8uFnrZ34UXrykCFykZFZFvaykAay0
	qFZ5C3yvga1jgwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/

There are some variables never used or referenced, this patch
removes these varaibles and make the code cleaner.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by:   WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongson.h | 12 ------------
 arch/loongarch/kernel/env.c           | 20 --------------------
 2 files changed, 32 deletions(-)

diff --git a/arch/loongarch/include/asm/loongson.h b/arch/loongarch/include/asm/loongson.h
index 6a8038725ba7..2df649e73371 100644
--- a/arch/loongarch/include/asm/loongson.h
+++ b/arch/loongarch/include/asm/loongson.h
@@ -39,18 +39,6 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 
 #define MAX_PACKAGES 16
 
-/* Chip Config register of each physical cpu package */
-extern u64 loongson_chipcfg[MAX_PACKAGES];
-#define LOONGSON_CHIPCFG(id) (*(volatile u32 *)(loongson_chipcfg[id]))
-
-/* Chip Temperature register of each physical cpu package */
-extern u64 loongson_chiptemp[MAX_PACKAGES];
-#define LOONGSON_CHIPTEMP(id) (*(volatile u32 *)(loongson_chiptemp[id]))
-
-/* Freq Control register of each physical cpu package */
-extern u64 loongson_freqctrl[MAX_PACKAGES];
-#define LOONGSON_FREQCTRL(id) (*(volatile u32 *)(loongson_freqctrl[id]))
-
 #define xconf_readl(addr) readl(addr)
 #define xconf_readq(addr) readq(addr)
 
diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 467946ecf451..82b478a5c665 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -17,21 +17,6 @@ u64 efi_system_table;
 struct loongson_system_configuration loongson_sysconf;
 EXPORT_SYMBOL(loongson_sysconf);
 
-u64 loongson_chipcfg[MAX_PACKAGES];
-u64 loongson_chiptemp[MAX_PACKAGES];
-u64 loongson_freqctrl[MAX_PACKAGES];
-unsigned long long smp_group[MAX_PACKAGES];
-
-static void __init register_addrs_set(u64 *registers, const u64 addr, int num)
-{
-	u64 i;
-
-	for (i = 0; i < num; i++) {
-		*registers = (i << 44) | addr;
-		registers++;
-	}
-}
-
 void __init init_environ(void)
 {
 	int efi_boot = fw_arg0;
@@ -50,11 +35,6 @@ void __init init_environ(void)
 	efi_memmap_init_early(&data);
 	memblock_reserve(data.phys_map & PAGE_MASK,
 			 PAGE_ALIGN(data.size + (data.phys_map & ~PAGE_MASK)));
-
-	register_addrs_set(smp_group, TO_UNCACHE(0x1fe01000), 16);
-	register_addrs_set(loongson_chipcfg, TO_UNCACHE(0x1fe00180), 16);
-	register_addrs_set(loongson_chiptemp, TO_UNCACHE(0x1fe0019c), 16);
-	register_addrs_set(loongson_freqctrl, TO_UNCACHE(0x1fe001d0), 16);
 }
 
 static int __init init_cpu_fullname(void)
-- 
2.31.1

