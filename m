Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B1218FC89
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 02:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741227528; cv=none; b=WTOlXUeNxMXsN0o48v/sMv9rPovtN0Pw5oCdSXOAjE7q0FgFfEnlWg6K3vP8znhmgQjsREC8rWtWsMUeLIGKvoSTZeD5lGJJjp6AjjsB/TPT1uIF6rpqAeXdChey0igqlv6h7HK9nPaCJ2DFe7NDRxgnOiSfPrzo8ZPPd+4jOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741227528; c=relaxed/simple;
	bh=jLfpy/qnkcbGYZhTHsjTZaBDtnUpzhXTHsBHIvEg9Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xy30EZkCtSSTXUQ5iOUFRhjS68GeSp+uKKlPVts8jUPmtS+P7syX81qRBXE0pIXiFeRCDf0slj0TFpS2gCcIrYM1x5tFNScyUcve+xmbiXQ5WspeoPiXQ9vXLY66Zx/jqOcHdu42DGd6W9wdKan/dW9AG8dOwcpUtyosHFWp2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx63ECBslnfcqLAA--.42297S3;
	Thu, 06 Mar 2025 10:18:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxu8QABslnjKE4AA--.11561S3;
	Thu, 06 Mar 2025 10:18:41 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v2 1/2] LoongArch: KVM: Reload guest CSR registers after S4
Date: Thu,  6 Mar 2025 10:18:39 +0800
Message-Id: <20250306021840.2120016-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250306021840.2120016-1-maobibo@loongson.cn>
References: <20250306021840.2120016-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxu8QABslnjKE4AA--.11561S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

On host HW guest CSR registers are lost after suspend and resume
operation. Since last_vcpu of boot CPU still records latest vCPU pointer
so that guest CSR register skips to reload when boot CPU resumes and
vCPU is scheduled.

Here last_vcpu is cleared so that guest CSR registers will reload from
scheduled vCPU context after suspend and resume.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index f6d3242b9234..af4d730196ef 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -317,6 +317,12 @@ int kvm_arch_enable_virtualization_cpu(void)
 	kvm_debug("GCFG:%lx GSTAT:%lx GINTC:%lx GTLBC:%lx",
 		  read_csr_gcfg(), read_csr_gstat(), read_csr_gintc(), read_csr_gtlbc());
 
+	/*
+	 * HW Guest CSR registers are lost after CPU suspend and resume.
+	 * Clear last_vcpu so that Guest CSR registers forced to reload
+	 * from vCPU SW state
+	 */
+	this_cpu_ptr(vmcs)->last_vcpu = NULL;
 	return 0;
 }
 
-- 
2.39.3

