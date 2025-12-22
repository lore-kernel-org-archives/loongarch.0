Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763D61E2606
	for <loongarch@lists.linux.dev>; Mon, 22 Dec 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404839; cv=none; b=srST7IZmMFZQ1Ihgx6xDS6n3v3QNftEW7UUxv3z6VurvYFrPFT3apekFfKsnU8/b+rxL+eDecjPLmX4XXTNnNjmZOLkBd8WhMr7R3677L60LKSRigvXt7RHhDIshfOtOJ++e9Pss0iY9Lv+5FrkopVkdrFrPB7+nGH5KMvMiIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404839; c=relaxed/simple;
	bh=lROeOcWhUnInlzVqAwbfImHEp+MDu7ampUOQE1mrDy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i72lDtA0HmwrP7LQFWH/6D0ffEojQ0FW7BgkEiAE8xUENwr7/EzNfEKgTQ0hvRMczVYN6LZvP2dKv/wJYlgMwV/ByHA53KF4++bVfiOK/Qm5JNojTb0zxXeJtiQT2iAmywbyPzV8+c+IdO+zqX7KU6v7G83hHUIQqHrCEo7QF3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8CxLMN_Mklpu_EBAA--.6029S3;
	Mon, 22 Dec 2025 19:58:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by front1 (Coremail) with SMTP id qMiowJCxGOB6MklpP2IDAA--.10467S4;
	Mon, 22 Dec 2025 19:58:54 +0800 (CST)
From: Xianglai Li <lixianglai@loongson.cn>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	lixianglai@loongson.cn
Cc: stable@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 2/2] LoongArch: KVM: fix "unreliable stack" issue
Date: Mon, 22 Dec 2025 19:34:09 +0800
Message-Id: <20251222113409.2343711-3-lixianglai@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20251222113409.2343711-1-lixianglai@loongson.cn>
References: <20251222113409.2343711-1-lixianglai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOB6MklpP2IDAA--.10467S4
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Insert the appropriate UNWIND macro definition into the kvm_exc_entry in
the assembly function to guide the generation of correct ORC table entries,
thereby solving the timeout problem of loading the livepatch-sample module
on a physical machine running multiple vcpus virtual machines.

While solving the above problems, we have gained an additional benefit,
that is, we can obtain more call stack information

Stack information that can be obtained before the problem is fixed:
[<0>] kvm_vcpu_block+0x88/0x120 [kvm]
[<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
[<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
[<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
[<0>] kvm_handle_exit+0x160/0x270 [kvm]
[<0>] kvm_exc_entry+0x100/0x1e0

Stack information that can be obtained after the problem is fixed:
[<0>] kvm_vcpu_block+0x88/0x120 [kvm]
[<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
[<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
[<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
[<0>] kvm_handle_exit+0x160/0x270 [kvm]
[<0>] kvm_exc_entry+0x100/0x1e0
[<0>] kvm_arch_vcpu_ioctl_run+0x260/0x488 [kvm]
[<0>] kvm_vcpu_ioctl+0x200/0xcd8 [kvm]
[<0>] sys_ioctl+0x498/0xf00
[<0>] do_syscall+0x94/0x190
[<0>] handle_syscall+0xb8/0x158

Cc: stable@vger.kernel.org
Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
---
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: Charlie Jenkins <charlie@rivosinc.com>
Cc: Xianglai Li <lixianglai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>

 arch/loongarch/kvm/switch.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
index 93845ce53651..e3ecb24a3bc5 100644
--- a/arch/loongarch/kvm/switch.S
+++ b/arch/loongarch/kvm/switch.S
@@ -170,6 +170,7 @@ SYM_CODE_START(kvm_exc_entry)
 	/* restore per cpu register */
 	ld.d	u0, a2, KVM_ARCH_HPERCPU
 	addi.d	sp, sp, -PT_SIZE
+	UNWIND_HINT_REGS
 
 	/* Prepare handle exception */
 	or	a0, s0, zero
@@ -214,6 +215,7 @@ SYM_FUNC_START(kvm_enter_guest)
 	addi.d	a2, sp, -PT_SIZE
 	/* Save host GPRs */
 	kvm_save_host_gpr a2
+	st.d	ra, a2, PT_ERA
 
 	addi.d	a2, a1, KVM_VCPU_ARCH
 	st.d	sp, a2, KVM_ARCH_HSP
-- 
2.39.1

