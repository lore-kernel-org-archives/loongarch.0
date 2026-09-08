Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA67536F8E9
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853157; cv=none; b=H6ZdK49WHbThmgasRRqaSse6LKwYXxy0cSEEXR7R6ZJyhFhJXL5CYImLPpJ7IRNKDJ4t2XYA+e4B5Lx8hgsBn2OjF/AG45RiHfBMK0NCmukoUUBan8LuiCZexPTr4S8IYKV/AzcjvCOfVqs/YAt579hrs+wabb7HyQtU1cYM+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853157; c=relaxed/simple;
	bh=dEb+aLy3u3BijpcnfQZEEQWczVw14PtEPSi7ZSnMsJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2khTUWy2yQv6VCmd/JyGGkRhsrN0A4iYhtVUBlcX2xuN9jLiyWUkDwDwfUNaV2lQwC0EuolYR+I4ngLaK0k6Lrz3CKbC5lKaCBPVw3YOptEKvw0UuCRScAirTPP560zUJeIjjUHTlTnsCGlfoYUsJSLu2Wq/q4qPUss17SdB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxQNGhu59qKLgJAA--.28166S3;
	Tue, 08 Sep 2026 15:39:13 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx1cybu59qhQ4dAA--.34427S2;
	Tue, 08 Sep 2026 15:39:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: Remove arch-specific __smp_mb__{before,after}_atomic()
Date: Tue,  8 Sep 2026 15:39:06 +0800
Message-ID: <20260908073906.31781-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx1cybu59qhQ4dAA--.34427S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw47tr17Cr1UKF1xtF1kWFX_yoW5Gr15pF
	WxCrn7KFWkWF48Jw1Dt3WUuw13J3yvkrW7XrWFgFykuw1qgryUJr4xWr43uFyUAan5WFyS
	vrZYv34Ykas8JacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=

When running the BPF selftest "test_progs -t timer_lockup" on a LoongArch
machine, the kernel intermittently experiences soft lockups and panics in
hrtimer_cancel().

The root cause is that bpf_timer_cancel() relies on smp_mb__after_atomic()
to provide a full data barrier after a relaxed atomic_inc() to ensure the
proper store-load ordering before performing lockless dependency checks on
weakly-ordered architectures such as LoongArch, but the current definition
of smp_mb__after_atomic() is a plain compiler barrier.

This allows a subsequent read to bypass the prior write due to store-load
reordering, enabling concurrent CPUs to simultaneously bypass the software
deadlock detection, enter hrtimer_cancel(), and then trigger a severe ABBA
deadlock in the hrtimer core.

Moreover, there are hundreds of smp_mb__after_atomic() call sites across
the core kernel (kernel/, drivers/, mm/, net/, fs/) that currently lack
necessary full data barriers on LoongArch, which have potential risks.

To comply with the LKMM specification, fix this by removing the incorrect
arch-specific definition of __smp_mb__after_atomic(), so that this macro
can automatically fall back to the generic definition in asm-generic that
maps to __smp_mb() and emits the required hardware DBAR instruction. While
at it, do the same thing for __smp_mb__before_atomic().

With this patch, the BPF timer_lockup selftest was stressed for 1 million
consecutive loops on a physical LoongArch machine without encountering any
further lockups.

Reported-by: Vincent Li <vincent.mc.li@gmail.com>
Closes: https://lore.kernel.org/loongarch/CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com/
Fixes: 46859ac8af52 ("LoongArch: Add multi-processor (SMP) support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/barrier.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/include/asm/barrier.h
index 4b663f197706..84c6d739119d 100644
--- a/arch/loongarch/include/asm/barrier.h
+++ b/arch/loongarch/include/asm/barrier.h
@@ -57,9 +57,6 @@
 #define __WEAK_LLSC_MB		"			\n"
 #endif
 
-#define __smp_mb__before_atomic()	barrier()
-#define __smp_mb__after_atomic()	barrier()
-
 /**
  * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise
  * @index: array element index
-- 
2.42.0

