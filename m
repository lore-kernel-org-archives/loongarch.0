Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362FB45000
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946236; cv=none; b=S+/n3sBAB5a1E829G4cx3Y7iT6zi4m5oNkvenOZqz45oC8rNeXvH/2Q4Srf0A4h66JiqCAE7R8JBlijlUuXnJoKUx2yKgI6/cCY05Q73TZ2srnKrAOoqFz6Khg0G5TbKJ+L4YbSrWbFTNHMSk68cHNeFzDjn4zrFg+cP5/yFECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946236; c=relaxed/simple;
	bh=nKeaxvgNMriPPMsxwBnxWrBlViJ8Cq0Mt0VPr9E812g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TWx929H4A79X2rOQuCO8cXHuKgrXU+B9sZVb9rJI8bIwCf6te+G/h+JqPCjppjI5w96k0tg8ZnIKYMlTcQZVtVPkJPn25cLBpmoyosqtNZVDeadlyWNCqtK1eUrQkEaFUhV6oWAaDTCtBuySaUT++RJl/RzZh49bLO0p6vD/I/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOowhVZmTO0AAA--.3895S3;
	Wed, 29 May 2024 09:30:25 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxusYrhVZm5nEMAA--.32890S2;
	Wed, 29 May 2024 09:30:20 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 0/3] LoongArch: ptrace: Fix some watchpoint function
Date: Wed, 29 May 2024 09:30:16 +0800
Message-Id: <20240529013019.15235-1-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxusYrhVZm5nEMAA--.32890S2
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtr1UCr48WFW3XrW8try3KFX_yoWkKFc_uF
	WfAayDGw1kWFy5tan0qr1fArWFka1xWFnYkF1vqrsFqwn5Jr93GrsxWwsIvr1Iqay8XrZ8
	Jr4rtrs3ZwnI9osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqE5I8CrVACY4xI64kE6c02F40Ex7xfMIIYY7kG6xAYrbIjqfuFe4nvWSU5
	nxnvy29KBjDU0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zV
	CF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I
	8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj
	6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYY7kG6xAYrw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUyzpB
	DUUUU

LoongArch defines hardware watchpoint functions for fetch and load/store
operations. After the software configures the watchpoints for fetch and
load/store, the processor hardware will monitor the access addresses of
the fetch and load/store operations and trigger a watchpoint exception
when the watchpoint setting conditions are met.

Fix some hardware watchpoint issues on user-space and kernel interface.

All changes are made according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints

Testing for this series can use this gdb patch:
https://sourceware.org/pipermail/gdb-patches/2024-May/209371.html


Hui Li (3):
  LoongArch: ptrace: Fix watchpoint setting error
  LoongArch: Trigger user-space watchpoints correctly
  LoongArch: Fix multiple hardware watchpoint issues

 arch/loongarch/include/asm/hw_breakpoint.h |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 82 +++++++++++-----------
 arch/loongarch/kernel/ptrace.c             | 48 +++++++------
 3 files changed, 71 insertions(+), 61 deletions(-)

-- 
2.38.1

