Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27252CA5A
	for <loongarch@lists.linux.dev>; Thu, 29 May 2025 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481071; cv=none; b=CPjukXnNXvWpN2iAZ4hTz91MnDrXFpiVKwjO1ZsqpHRKfaH2aRhMNxmsJccsbbbkJ25j2Q46zHx0SL89yPotQRGUiARi0KkMSqF7G4B+NeVxbWmvjEgXbocq4slGjhOCkr5riyQLBf3C+X15/YPnLTYbaQKwks75utDxDlQ+Ejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481071; c=relaxed/simple;
	bh=wOBSgxrE3eFgY8U43apRcxIY0s0fPyaGRr5Is1W7FEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o+e7JwjmkRpnqLdNFbComPpXDjTycT4pLtVdJnEvDQEALejQMQ7nfaQM04hN2h+scZ7gaZ+F1jqmCcFjG15fS7iJv1idvEOxMurtxQaziqAZqRf85bPAP2C9c1sBBILWM2IBwLgc/BS5IwAOyDbV7Zi1Zgy8oeYymTUpGOONqks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx7eIntDdoex4BAQ--.50849S3;
	Thu, 29 May 2025 09:11:03 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMCx_cYmtDdoR0P5AA--.57458S2;
	Thu, 29 May 2025 09:11:02 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] LoongArch: KVM: Enhancement about eiointc emulation
Date: Thu, 29 May 2025 09:10:57 +0800
Message-Id: <20250529011102.378749-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_cYmtDdoR0P5AA--.57458S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

This series fix two issue about kernel eiointc emulation, one is caused
by type forced assignment, the other is to use physical cpu with
interrupt route.

Also there is code cleanup with kernel eiointc emulation.

Bibo Mao (5):
  LoongArch: KVM: Fix interrupt route update with eiointc
  LoongArch: KVM: Check interrupt route from physical cpu with eiointc
  LoongArch: KVM: Use standard bitops API with eiointc
  LoongArch: KVM: Remove unused parameter len
  LoongArch: KVM: Add stat information with kernel irqchip

 arch/loongarch/include/asm/kvm_host.h |  9 +--
 arch/loongarch/kvm/intc/eiointc.c     | 98 ++++++++++++++-------------
 arch/loongarch/kvm/intc/ipi.c         | 28 ++------
 arch/loongarch/kvm/intc/pch_pic.c     |  4 +-
 arch/loongarch/kvm/vcpu.c             |  5 +-
 5 files changed, 65 insertions(+), 79 deletions(-)


base-commit: feacb1774bd5eac6382990d0f6d1378dc01dd78f
-- 
2.39.3

