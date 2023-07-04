Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716155672
	for <loongarch@lists.linux.dev>; Tue,  4 Jul 2023 12:53:50 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8DxxPBcFqRk0AQAAA--.54S3;
	Tue, 04 Jul 2023 20:53:48 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax98xaFqRkXDAbAA--.63241S4;
	Tue, 04 Jul 2023 20:53:48 +0800 (CST)
From: Feiyang Chen <chenfeiyang@loongson.cn>
To: chenhuacai@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	dvyukov@google.com,
	andreyknvl@gmail.com,
	loongarch@lists.linux.dev,
	kasan-dev@googlegroups.com,
	chris.chenfeiyang@gmail.com,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 2/2] LoongArch: Allow building with kcov coverage
Date: Tue,  4 Jul 2023 20:53:32 +0800
Message-Id: <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1688369658.git.chenfeiyang@loongson.cn>
References: <cover.1688369658.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax98xaFqRkXDAbAA--.63241S4
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XrWxur48WF4UGrW5try7Jwc_yoWkZwc_A3
	y3tw48Gr1rGw48Cr4qgFyrJw1DAa1kWFnYkF9I9r17ZFy5X3WfGr45J345Zr1rK3yjgrs8
	ZrW0qF98CrWjvosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb38YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_
	GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU4AhLUUUUU

Add ARCH_HAS_KCOV to the LoongArch Kconfig. Also disable
instrumentation of vdso.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/loongarch/Kconfig       | 1 +
 arch/loongarch/vdso/Makefile | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ed9a148cdcde..4c21a961ab88 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -14,6 +14,7 @@ config LOONGARCH
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
+	select ARCH_HAS_KCOV
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 7bb794604af3..7dc87377688b 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -5,6 +5,8 @@ ifdef CONFIG_KASAN
 KASAN_SANITIZE := n
 endif
 
+KCOV_INSTRUMENT := n
+
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
-- 
2.39.3

