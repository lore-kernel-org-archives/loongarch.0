Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB99396B9C
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901036; cv=none; b=YPa3aSVra7fnS/eCKzvqXtZCiqIUUx4+9t7xoQ8JdZnXlvTP18/yImBuZg1JR7r4y5wiSEaCY8VBiY9v+hfamK2VowQs/wU3IlH71+0Spw3u4EF+nIw4y+L18a7DjVcdNd43d6TFFl1bBcfL1SByQZXhMiICZUc3PnVAvPqSw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901036; c=relaxed/simple;
	bh=2h4PtkOGSRTqVcNMM24Gl+VAeX14j8kxXXAjmJcVMmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qojibmwDPBkKYDuKiLAxFdpsrXKej06mnqrGJUn2p38gGliIocPzIW+NlCalpdc78mCY63ZbzS70/hKRCgv06J8ksbpq+9Eg7nx5Im/Fe5CU1XQa+9XOdWiAuwQw86QUxpKQ+s1qjdGXeYqFTxwNcr+bU5HqOMzo2ImwYw062ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxMvGeSW9pUqcKAA--.35186S3;
	Tue, 20 Jan 2026 17:23:42 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxHOGSSW9pD3InAA--.14911S4;
	Tue, 20 Jan 2026 17:23:42 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] LoongArch: Handle percpu handler address in bt_address()
Date: Tue, 20 Jan 2026 17:23:29 +0800
Message-ID: <20260120092331.813-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260120092331.813-1-yangtiezhu@loongson.cn>
References: <20260120092331.813-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGSSW9pD3InAA--.14911S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw4kWr4DKw13Ar18XFWrWFX_yoW5Jr1UpF
	9rCr4DJrW8Wr92qa4DAFyUur98Arn7Gw12gF4ag34rCF17XFyfCrs2vrnrCFyDJ3ykXF18
	Xas5Ca4Y9F4YyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=

After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
ORC unwinder"), the system can not boot normally under some configs,
there are many error messages "cannot find unwind pc at".

The kernel boots normally with the defconfig, so no problem found out
at the first time. Here is one way to reproduce:

  cd linux
  make mrproper defconfig -j"$(nproc)"
  scripts/config -e KASAN
  make olddefconfig all -j"$(nproc)"
  sudo make modules_install
  sudo make install
  sudo reboot

The address that can not unwind is not a valid kernel address which is
between "pcpu_handlers[cpu]" and "pcpu_handlers[cpu] + vec_sz" that is
a very big address.

The root cause is that the code of eentry was copied to the new area of
pcpu_handlers[cpu] in setup_tlb_handler(), handle this special case to
get the real address in bt_address() to unwind normally.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/setup.h |  2 ++
 arch/loongarch/kernel/unwind_orc.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 3c2fb16b11b6..79eb63e749f9 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -14,6 +14,8 @@
 
 extern unsigned long eentry;
 extern unsigned long tlbrentry;
+extern unsigned long pcpu_handlers[NR_CPUS];
+extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
 extern char init_command_line[COMMAND_LINE_SIZE];
 extern void tlb_init(int cpu);
 extern void cpu_cache_init(void);
diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index d6b3688a1ce9..40f4d6c12cf6 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -352,6 +352,18 @@ static inline unsigned long bt_address(unsigned long ra)
 {
 	extern unsigned long eentry;
 
+#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
+	for (int cpu = 1; cpu < num_possible_cpus(); cpu++) {
+		int vec_sz = sizeof(exception_handlers);
+
+		if (ra >= pcpu_handlers[cpu] &&
+		    ra < pcpu_handlers[cpu] + vec_sz) {
+			ra = eentry + (ra - pcpu_handlers[cpu]);
+			break;
+		}
+	}
+#endif
+
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
-- 
2.42.0

