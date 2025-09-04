Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5450329B229
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970262; cv=none; b=aUI5fFgpC2rAYbfYnvkTfIplCJBMe4tXXFkZrptmkkxzKduyrPrJmRIRUv2ca9YjHleaQsq0OgOIzWWC0QnMxy4wbG5H+QFKSFS4jx6TURkivGTXAT54MCkpXexumaG6fzAy+7O6Xn3RKI+N1Yzkw152O9uJtSccoV19EO6bETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970262; c=relaxed/simple;
	bh=EZU3KTl6IPNKUrbj5DDCEcWk5vBANwmZEzz/pD7YdZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uibP1Pw9fQv1+k1COjqUqgiZcY1+jl8UYuEiF8t8uSV/J61MEfWFcKk6g6JqV6JULyKNjz36nWt43N38SZF8x1TRWZMWlqySTQLJuJtZ4sWyyLyVSOfgcL2m5il31m9Fzg3NZcIIYSr0dRepywltPDy8Aw9NT5ZfitekPOjzOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxB9ESPbloUY8GAA--.13651S3;
	Thu, 04 Sep 2025 15:17:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDx_8MNPbloS2h9AA--.2519S4;
	Thu, 04 Sep 2025 15:17:37 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v2 2/2] LoongArch: Remove clockevents shutdown call on offlining
Date: Thu,  4 Sep 2025 15:17:32 +0800
Message-Id: <20250904071732.3513694-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250904071732.3513694-1-maobibo@loongson.cn>
References: <20250904071732.3513694-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8MNPbloS2h9AA--.2519S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/time.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index f3092f2de8b5..6fb92cc1a4c9 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -112,8 +112,6 @@ static int arch_timer_starting(unsigned int cpu)
 
 static int arch_timer_dying(unsigned int cpu)
 {
-	constant_set_state_shutdown(this_cpu_ptr(&constant_clockevent_device));
-
 	/* Clear Timer Interrupt */
 	write_csr_tintclear(CSR_TINTCLR_TI);
 
-- 
2.39.3

