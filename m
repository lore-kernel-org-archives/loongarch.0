Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78241DE3B2
	for <loongarch@lists.linux.dev>; Tue,  3 Dec 2024 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226501; cv=none; b=d3QP38c1XX6wEx+9X8rNij7f3ZxKHm6NTL8RRQgEOt88hmjrF6LtzoWpfprzRSFi8/kyaFHKN76D810mOrNW0wASp+7KJoq5PIbYtKfZ1tRrpzensosfTkFDmQF7wb+lq3kNiEvY8fPgyAEFiII2WcAW/wzIIVnJXuzSNhr7RT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226501; c=relaxed/simple;
	bh=TqawTQjbMSMJ23s8nCMeSH4mAdv9G2HhO1QDLyCtIGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qa24OaLTfVkX7NDL4a5tY2SdNnVuFnfBHK+ZVLEiWyiWxV/HzNGzcQa8iYem5zAWvqnCOq03S9Z+J61Dt1Vv3HT16mlc6On7lKI4bVe5GT9ayh3wMeYEQdlcaMkM03YiOHQETsubXss2oyiwJadAxFs7cBgXdGsFkWqE7bYahSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8AxquH+705n2LJPAA--.26923S3;
	Tue, 03 Dec 2024 19:48:14 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMAxmsH3705ne9JzAA--.9972S2;
	Tue, 03 Dec 2024 19:48:14 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH V2 1/2] LoongArch: KVM: Protect kvm_check_requests() with SRCU
Date: Tue,  3 Dec 2024 19:47:58 +0800
Message-ID: <20241203114759.419261-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxmsH3705ne9JzAA--.9972S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF4UXF1DXFyrWry7tr13GFX_yoW5WF1xpr
	9xAr4xGr48Xry7Aw1UAF1DAr1UX3yDAF1xJry8Jr18Ar1UZr1DJFyUJrW8Jry5G34rAF17
	Jr1Utr15tr1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcyxRUUUUU

When we enable lockdep we get such a warning:

 =============================
 WARNING: suspicious RCU usage
 6.12.0-rc7+ #1891 Tainted: G        W
 -----------------------------
 include/linux/kvm_host.h:1043 suspicious rcu_dereference_check() usage!
 other info that might help us debug this:
 rcu_scheduler_active = 2, debug_locks = 1
 1 lock held by qemu-system-loo/948:
  #0: 90000001184a00a8 (&vcpu->mutex){+.+.}-{4:4}, at: kvm_vcpu_ioctl+0xf4/0xe20 [kvm]
 stack backtrace:
 CPU: 0 UID: 0 PID: 948 Comm: qemu-system-loo Tainted: G        W          6.12.0-rc7+ #1891
 Tainted: [W]=WARN
 Hardware name: Loongson Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS vUDK2018-LoongArch-V2.0.0-prebeta9 10/21/2022
 Stack : 0000000000000089 9000000005a0db9c 90000000071519c8 900000012c578000
         900000012c57b920 0000000000000000 900000012c57b928 9000000007e53788
         900000000815bcc8 900000000815bcc0 900000012c57b790 0000000000000001
         0000000000000001 4b031894b9d6b725 0000000004dec000 90000001003299c0
         0000000000000414 0000000000000001 000000000000002d 0000000000000003
         0000000000000030 00000000000003b4 0000000004dec000 90000001184a0000
         900000000806d000 9000000007e53788 00000000000000b4 0000000000000004
         0000000000000004 0000000000000000 0000000000000000 9000000107baf600
         9000000008916000 9000000007e53788 9000000005924778 0000000010000044
         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
         ...
 Call Trace:
 [<9000000005924778>] show_stack+0x38/0x180
 [<90000000071519c4>] dump_stack_lvl+0x94/0xe4
 [<90000000059eb754>] lockdep_rcu_suspicious+0x194/0x240
 [<ffff8000022143bc>] kvm_gfn_to_hva_cache_init+0xfc/0x120 [kvm]
 [<ffff80000222ade4>] kvm_pre_enter_guest+0x3a4/0x520 [kvm]
 [<ffff80000222b3dc>] kvm_handle_exit+0x23c/0x480 [kvm]

Fix it by protecting kvm_check_requests() with SRCU.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index cab1818be68d..d18a4a270415 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -240,7 +240,7 @@ static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
  */
 static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
 {
-	int ret;
+	int idx, ret;
 
 	/*
 	 * Check conditions before entering the guest
@@ -249,7 +249,9 @@ static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
 	if (ret < 0)
 		return ret;
 
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
 	ret = kvm_check_requests(vcpu);
+	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 
 	return ret;
 }
-- 
2.43.5

