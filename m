Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4129D3C1FCE
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901035; cv=none; b=QbroBEpQcT3Jkt9iStAEwnC4hALfNO6/Q0Bpt93giJuGebRvyfQ2uJeZ8reNqzxEAsh9vBF2hYVSe0dWz2Zw3GU3qEBXZj05V9nbKd+Sbr0eHqDsh9+26vadDlM1NObAj0cb1D5A0SLseEn0AIx44Lh0B/lU+G12B1mWCnyz4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901035; c=relaxed/simple;
	bh=I2mBj6m3uQwrGDLTzOoMnWLS8SJi/YF3eDUkn5H9od0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUP2ci+dMVSqIJL1fosEdR95jxP/+/A82dRp/zurm9/FqBJmM9f14CgD7fFB6AdxZfhuyVMvNR32lX5tBURS7ZsI3vOyUryNIGdSPuzk6nzDCBCysakhnvHTcrsFMxOL74qfngE1IpE7a8EUmbJ2sN3QjiRqjB6cW1ovDjB22MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx+8KdSW9pTKcKAA--.34410S3;
	Tue, 20 Jan 2026 17:23:42 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxHOGSSW9pD3InAA--.14911S2;
	Tue, 20 Jan 2026 17:23:32 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] LoongArch: Fix errors about "cannot find unwind pc at"
Date: Tue, 20 Jan 2026 17:23:27 +0800
Message-ID: <20260120092331.813-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGSSW9pD3InAA--.14911S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=

This series is based on 6.19-rc6, tested on Loongson-3A6000.

Tiezhu Yang (4):
  LoongArch: Use %px to print address in unwind_next_frame()
  LoongArch: Handle percpu handler address in bt_address()
  LoongArch: Remove some extern variables in source files
  LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT

 arch/loongarch/include/asm/setup.h      |  2 ++
 arch/loongarch/kernel/unwind_orc.c      | 14 ++++++++++++--
 arch/loongarch/kernel/unwind_prologue.c |  6 +-----
 arch/loongarch/mm/tlb.c                 |  1 -
 4 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.42.0

