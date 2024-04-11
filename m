Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D425D60B95
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712797520; cv=none; b=hnile6os5DQ/athhVWee9XxTnDw3TiNNDs3DAdzQC9NeqEl2zEke43dipI0UPWxcFzN97EoKqVx1Qx2Efzewq3UYrtnIoDZD7AwTTgcqBdDajicPKdagOdBZtzrifnRrtvqZvbdl0tyQhH2PDqPkwWdYo/XAghXiz2AoENANUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712797520; c=relaxed/simple;
	bh=uLjUWodJ/mW4SI5I2DSTZyWJ+aNR+7qDAvJxBsFdLtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNmasDbJ5WoNaDX3YRWIQUaWTv6aIVpOOd150a0ksbJspqB50GjzZI/Q3e0pY5CgU+1u9CLQDycdUNEOsAhyoTcXpfKFivZSEWNSzejD5G4KOT0jMXI1952IPc99TfUQBMLJBqnocNl/WGGvKEi9HkTEf500iSUoGQjJ7PS3c+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxafBMNxdm85AlAA--.21021S3;
	Thu, 11 Apr 2024 09:05:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhhFHNxdmnrx3AA--.22869S5;
	Thu, 11 Apr 2024 09:05:15 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 3/4] LoongArch: Save and restore PERCPU_BASE_KS for ACPI S3 state
Date: Thu, 11 Apr 2024 09:05:09 +0800
Message-ID: <20240411010510.22135-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240411010510.22135-1-yangtiezhu@loongson.cn>
References: <20240411010510.22135-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxhhFHNxdmnrx3AA--.22869S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFyxAF4UCw13tFW8JF43Arc_yoW8CrWUpr
	9FyFWDKw48tFn7CF90qa1UXr1UZ39agrWIqF9Fk3yj9rnrXry8Wr4rK3Z8XF10qwn5ua10
	v3ySya4avF1UGwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU1xpnPUUUUU==

Currently, per_cpu_offset(x) is defined as __per_cpu_offset[x])
only under CONFIG_SMP in include/asm-generic/percpu.h, that is
to say, the implementation of loongarch_common_resume() which
calls per_cpu_offset(0) is not suitable for the case of non-SMP,
so do not write per_cpu_offset(0) to PERCPU_BASE_KS when resume,
just save the value of PERCPU_BASE_KS when suspend and restore
it when resume to make it work well for both SMP and non-SMP.

Tested with the command "rtcwake -d rtc1 -s 20 -m mem -v", dmesg
shows that "PM: suspend entry (deep)" and "PM: suspend exit".

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/power/suspend.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/power/suspend.c b/arch/loongarch/power/suspend.c
index 166d9e06a64b..7a97949ddade 100644
--- a/arch/loongarch/power/suspend.c
+++ b/arch/loongarch/power/suspend.c
@@ -16,6 +16,7 @@
 #include <asm/tlbflush.h>
 
 u64 loongarch_suspend_addr;
+static u64 saved_pcpu_base;
 
 struct saved_registers {
 	u32 ecfg;
@@ -36,6 +37,7 @@ void loongarch_common_suspend(void)
 	saved_regs.pwctl1 = csr_read32(LOONGARCH_CSR_PWCTL1);
 	saved_regs.ecfg = csr_read32(LOONGARCH_CSR_ECFG);
 	saved_regs.euen = csr_read32(LOONGARCH_CSR_EUEN);
+	saved_pcpu_base = csr_read64(PERCPU_BASE_KS);
 
 	loongarch_suspend_addr = loongson_sysconf.suspend_addr;
 }
@@ -44,7 +46,7 @@ void loongarch_common_resume(void)
 {
 	sync_counter();
 	local_flush_tlb_all();
-	csr_write64(per_cpu_offset(0), PERCPU_BASE_KS);
+	csr_write64(saved_pcpu_base, PERCPU_BASE_KS);
 	csr_write64(eentry, LOONGARCH_CSR_EENTRY);
 	csr_write64(eentry, LOONGARCH_CSR_MERRENTRY);
 	csr_write64(tlbrentry, LOONGARCH_CSR_TLBRENTRY);
-- 
2.42.0

