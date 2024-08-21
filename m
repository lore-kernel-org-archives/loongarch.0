Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B6D21096F
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235118; cv=none; b=UG3oWd6yWD1o4y6xtZQcqhSSjasib7DNmkvb9nCXeT1Ad91C+l0pF0RIlUr/C+zCspcKg/k6+ZeO8ZYSJCEhzBmitbCJXpSKWegDb+c9q3szosdapDwic9IxEY9qJWYdDXeLrmxf5qM6lz/I3hs6pQWtOgwqdXQlwgC8DGatuI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235118; c=relaxed/simple;
	bh=/bFmMeiy0T5fSe7EuWC53jhXfJ/0O37Sn4G03HWLoBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OSlH+7QgafJhiK2gAZSivrmtXE0goVH3ox7BcfYOhhPs1CAzjvDTKgEluoNJebNI0YJl8YXS0AIBh+i8ykvdak/CSZVINBYfZ28BlERC1IQ2Fc4S+dSCEq//whHZ3XBfGsxK1sHeTE1RLcjiYh4pFa555aXaKVOn4B2ZiA+RyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxmOlqvcVm3BAbAA--.56939S3;
	Wed, 21 Aug 2024 18:11:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMAxouFqvcVm_oIcAA--.60915S2;
	Wed, 21 Aug 2024 18:11:54 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Wed, 21 Aug 2024 18:11:51 +0800
Message-Id: <20240821101153.2262290-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxouFqvcVm_oIcAA--.60915S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are four times about EIOINTC_REG_ISR register group access in
eiointc irq handler, in order to get all irq status about 256 interrupt
vectors. It causes four times VM-exits since eiointc register are
software emulated, here multiple interrupt pin routing is introduced
and each 64 interrupt vector is routed to one interrupt pin.

With this method, there will be only on one EIOINTC_REG_ISR register
group acces in irq handler, it will reduce VM-exits.

Bibo Mao (2):
  irqchip/loongson-eiointc: Route interrupt parsed from acpi table
  irqchip/loongson-eiointc: Add multiple interrupt pin routing support

 arch/loongarch/kernel/irq.c            |  3 +-
 arch/loongarch/kernel/smp.c            |  2 +-
 drivers/irqchip/irq-loongson-eiointc.c | 66 +++++++++++++++++++++++---
 3 files changed, 62 insertions(+), 9 deletions(-)


base-commit: 1fb918967b56df3262ee984175816f0acb310501
-- 
2.39.3

