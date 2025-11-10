Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A4B18C008
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 02:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762743567; cv=none; b=DYc9ltoXVnG43bFzOdZ3f0xuawsPI5PlKVXvil1Dx+Zp0xB+2FVQ/dyZjHtbQLhhi92TvfMRB6Df5gBrc9ZCb0VaxKluS3JF4XFk4QUTZOEM5x+7f1JlId3IuanE0by7bfH0gAI2/Z/dVM4YP/+OU+pEjb86GDwK+COvX/Hp1kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762743567; c=relaxed/simple;
	bh=+dsENBxvt7oLk7m1a0TfvgNSVGNJsMnxhIyL5ScW6jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvnI7PUD3dHwF8LOzTx7Icx13gZXRHTiUhjxkXEczhkkvXc9KH5zR5/q7b/WPhZC/bzfjxS0EK2OLxfpeJjc15CMn9uCwryc5ZkaadItZUE1ZjK1Hy8UecIUiRI3iXR/q0jynhn9YFRgv25/dpbCk2dfrzzOY15UD/I5HPvgFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxK9IDVRFpvkEhAA--.4285S3;
	Mon, 10 Nov 2025 10:59:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxXMH7VBFp6YktAQ--.14886S2;
	Mon, 10 Nov 2025 10:59:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] LoongArch: Refine init_hw_perf_events()
Date: Mon, 10 Nov 2025 10:59:04 +0800
Message-ID: <20251110025906.17096-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxXMH7VBFp6YktAQ--.14886S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU

This version is based on 6.18-rc5, use the proper patch title
to make it clear.

Tiezhu Yang (2):
  LoongArch: Use CPUCFG6_PMNUM_SHIFT to get PMU number
  LoongArch: Detect PMU bits via CPUCFG instruction

 arch/loongarch/include/asm/loongarch.h | 1 +
 arch/loongarch/kernel/perf_event.c     | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.42.0

