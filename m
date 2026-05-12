Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57C92D73BC
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574038; cv=none; b=ci2OyQFkMvYGZJ/PulZcCtqHgQFb4E1yOrBY+2MZIaLKSE3q4EJoStCOfHchsP22QONp7l2Ba7v6fraOKvbVxlEp8j9zLkP0nTU5MFtQY65YxIh2HP+yrfekD/yeLsJjl6gl50BBa8BSozSJm2mFagC+OvB/ycwWNUkO0x65Msc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574038; c=relaxed/simple;
	bh=/nM26s2V5J1gAHo1bP9pMHXIYK9rDAmZ3vwSoalfdpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JtlJTKVMcgZUcCh+uRUDS6MyWrJtZyPHRRjFtGFvlHgjHA4cabuQYeSGBM1Gjq86BLfEdq/IglZoD9VgrO5YDN0uuNuVelPi84/Nw7nZ3aVGTbuvg5fze1BdMgaXDz/HK+WCF3y9bZbIffW5CYAEnDy8IutxypgeyMYqkdFpIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxQ_DQ4gJqZAsJAA--.27960S3;
	Tue, 12 May 2026 16:20:33 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHO4gJqAwKAAA--.32306S2;
	Tue, 12 May 2026 16:20:32 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
Date: Tue, 12 May 2026 16:20:25 +0800
Message-ID: <20260512082029.2131-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMHO4gJqAwKAAA--.32306S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

This series addresses ftrace and kprobes issues observed under heavy
tracing loads.

Tiezhu Yang (4):
  LoongArch: ftrace: Fix stale per-CPU kprobe state after task migration
  LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
  LoongArch: kprobes: Fix single-stepping instruction slot preparation
  LoongArch: kprobes: Fix handling of fatal unrecoverable recursions

 arch/loongarch/kernel/ftrace_dyn.c | 23 +++++++++++++++++++++++
 arch/loongarch/kernel/kprobes.c    | 19 +++++++++++--------
 2 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.42.0

