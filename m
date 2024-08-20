Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2BC18FC89
	for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157461; cv=none; b=sDQuHAgpXFhsolYiPPc2mVGyFbilgta9Y7zSrt6TNnNqpWO8RNURbQdP7c1WvWsKUNlPR/DC4GEOeGJUEgbzZ6zY1QAz1ZFWYurEdX35o9mAcFf34OfW8KU6srLb+HKNfdtkXMSKF4JdvKbboOmEl6Su1X6nN3+QeVJzQ8BLDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157461; c=relaxed/simple;
	bh=t9x4TYYD0UVihjjijunrAnfnxESPR+7kSgN2YaQSQ9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOMCxLbgi88xhaYcBtmoeV6auk34HYKc8FEwD1fqSLFseuO+5wpX+uBe3ymrcizSycX4OzmIuP19xBkvy+PD04RKzQMP9mPlLzbxlJvLJXxh00lvjKaKKPyNc+yBqxH6/rfU4lPQd1GocknebRlCFThGbi/obFMhwDousXkvPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxHusRjsRmxiYaAA--.57546S3;
	Tue, 20 Aug 2024 20:37:37 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxkeEMjsRmL5MbAA--.56855S4;
	Tue, 20 Aug 2024 20:37:36 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] LoongArch: Add ifdefs to fix LSX and LASX related issues
Date: Tue, 20 Aug 2024 20:37:31 +0800
Message-ID: <20240820123731.31568-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240820123731.31568-1-yangtiezhu@loongson.cn>
References: <20240820123731.31568-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxkeEMjsRmL5MbAA--.56855S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF1kGr1fur43GrWxWr4fCrX_yoW5XFWrpr
	9xCrs5Kr45WFn2y3yDZwn5WFZ0ka97Gr1agF4qy34fCF4qqFnrXr18tFn8XFyjgws7Ja1F
	gFWrGw4YqayUAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=

There exist some issues when building kernel if CONFIG_CPU_HAS_LBT is set
but CONFIG_CPU_HAS_LSX and CONFIG_CPU_HAS_LASX are not set. In this case,
there are no definitions of _restore_lsx and _restore_lasx and there are
also no definitions of kvm_restore_lsx and kvm_restore_lasx in fpu.S and
switch.S respectively, just add some ifdefs to fix the issues.

  AS      arch/loongarch/kernel/fpu.o
arch/loongarch/kernel/fpu.o: warning: objtool: unexpected relocation symbol type in .rela.discard.func_stack_frame_non_standard: 0
arch/loongarch/kernel/fpu.o: warning: objtool: unexpected relocation symbol type in .rela.discard.func_stack_frame_non_standard: 0

  AS [M]  arch/loongarch/kvm/switch.o
arch/loongarch/kvm/switch.o: warning: objtool: unexpected relocation symbol type in .rela.discard.func_stack_frame_non_standard: 0
arch/loongarch/kvm/switch.o: warning: objtool: unexpected relocation symbol type in .rela.discard.func_stack_frame_non_standard: 0

  MODPOST Module.symvers
ERROR: modpost: "kvm_restore_lsx" [arch/loongarch/kvm/kvm.ko] undefined!
ERROR: modpost: "kvm_restore_lasx" [arch/loongarch/kvm/kvm.ko] undefined!

Cc: stable@vger.kernel.org # 6.9+
Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408120955.qls5oNQY-lkp@intel.com/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/fpu.S | 4 ++++
 arch/loongarch/kvm/switch.S | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index 69a85f2479fb..6ab640101457 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -530,6 +530,10 @@ SYM_FUNC_END(_restore_lasx_context)
 
 #ifdef CONFIG_CPU_HAS_LBT
 STACK_FRAME_NON_STANDARD _restore_fp
+#ifdef CONFIG_CPU_HAS_LSX
 STACK_FRAME_NON_STANDARD _restore_lsx
+#endif
+#ifdef CONFIG_CPU_HAS_LASX
 STACK_FRAME_NON_STANDARD _restore_lasx
 #endif
+#endif
diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
index 80e988985a6a..0c292f818492 100644
--- a/arch/loongarch/kvm/switch.S
+++ b/arch/loongarch/kvm/switch.S
@@ -277,6 +277,10 @@ SYM_DATA(kvm_enter_guest_size, .quad kvm_enter_guest_end - kvm_enter_guest)
 
 #ifdef CONFIG_CPU_HAS_LBT
 STACK_FRAME_NON_STANDARD kvm_restore_fpu
+#ifdef CONFIG_CPU_HAS_LSX
 STACK_FRAME_NON_STANDARD kvm_restore_lsx
+#endif
+#ifdef CONFIG_CPU_HAS_LASX
 STACK_FRAME_NON_STANDARD kvm_restore_lasx
 #endif
+#endif
-- 
2.42.0

