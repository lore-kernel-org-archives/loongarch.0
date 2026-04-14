Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D861237D13E
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151404; cv=none; b=USPuSkjDPnVZPwsowU8Tvap+CuCVI3CZSfCVkLPrBxY8YYqpo3OviP7PXFNTOe4oFGrM0yvTLeY7Ire4dZikuv4eDQfF8tWljDnOjjVcdzinlTWGmEv8CuL6CpXIJvFf2rlmLNggcrB04EBzPXEhGARorIDnNNf5c+QUIqweFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151404; c=relaxed/simple;
	bh=Z+bwjUhmShsgv2GqX9EsdR4Sma3va+gfYpHzP5mkAU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rrrcYNitoELLdAUhzD5I0c1d0qcI9G30+7knYNHt9gL60iEBHXXL8wZSyTP50Fmv4bIv5pnisCPlTuL+HsIJ+IemcVGfpzi18C6l1B+uWKWWLqTFJGfEv+dCABrlFguMbH0TVxY4vWqYY/wtDwXdAKGHjaCtq42kE2R4a1e5MsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxoOpn691p_mkAAA--.2057S3;
	Tue, 14 Apr 2026 15:23:19 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxfcJi691pErxsAA--.8539S5;
	Tue, 14 Apr 2026 15:23:19 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] LoongArch: KVM: Move unconditional delay in timer clear scenery
Date: Tue, 14 Apr 2026 15:23:13 +0800
Message-Id: <20260414072313.3801110-4-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260414072313.3801110-1-maobibo@loongson.cn>
References: <20260414072313.3801110-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxfcJi691pErxsAA--.8539S5
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

When timer interrupt arrives in guest kernel, guest kernel clears
the timer interrupt and program timer with the next incoming event.

During this stage, timer tick is -1 and timer interrupt status is
disabled in ESTAT register. KVM hypervisor need write zero with timer
tick register and wait timer interrupt injection from HW side, and
then clear timer interrupt.

So there is 2 cycle delay in KVM hypervisor to emulate such scenery,
and the delay is unnecessary if there is no need to clear timer
interrupt.

Here move 2 timer cycle delay in timer clear scenery and add timer
estat checking after delay, and set max timer expire value if timer
interrupt does not arrive still.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/timer.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
index 29c2aaba63c3..c83f72a7c746 100644
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -96,15 +96,27 @@ void kvm_restore_timer(struct kvm_vcpu *vcpu)
 		 * and set CSR TVAL with -1
 		 */
 		write_gcsr_timertick(0);
-		__delay(2); /* Wait cycles until timer interrupt injected */
 
 		/*
 		 * Writing CSR_TINTCLR_TI to LOONGARCH_CSR_TINTCLR will clear
 		 * timer interrupt, and CSR TVAL keeps unchanged with -1, it
 		 * avoids spurious timer interrupt
 		 */
-		if (!(estat & CPU_TIMER))
+		if (!(estat & CPU_TIMER)) {
+			__delay(2); /* Wait cycles until timer interrupt injected */
+
+			/*
+			 * Fail to restore timer with timer tick == -1 and
+			 * timer interrupt disabled.
+			 *
+			 * Write timer tick with max value, timer will go
+			 * down from max tick value
+			 */
+			estat = kvm_read_hw_gcsr(LOONGARCH_CSR_ESTAT);
+			if (!(estat & CPU_TIMER))
+				write_gcsr_timertick(CSR_TCFG_VAL);
 			gcsr_write(CSR_TINTCLR_TI, LOONGARCH_CSR_TINTCLR);
+		}
 		return;
 	}
 
-- 
2.39.3

