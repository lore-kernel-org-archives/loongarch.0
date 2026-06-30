Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723DA33065C
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786440; cv=none; b=sOZo5zESzhwB9wle/qy2s/ptL5+jKkLRTWTvHeFSr86T1rL71pIrOGhOcE/zuMmxm2q43Vq7mbbeKgDk8Qqup2NVMcIVqdz8tIOEjpG8m5cKXzqformYlLpMyldwOFXdZnG+iS0qQYPlSkcHhQK5UK4dS/6xElam3x1oe/lKH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786440; c=relaxed/simple;
	bh=ZbM5dCLMCpWJRKOvrmr2YY453aP52FVdWtdmadgpFtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbeT/Yp+GvKU58k3dufrMAs+BxuNOllFMhWe3SzpjQUzPVvR9bsrwHB3i7LjOh8X1+m8FArW3kXJm/b3Lrx4f9/YrK+4wMSg2hxBDPxXd54qNXnbLYz4YN3Uky+2XsGC7eNmarpLqZmmzsuq/a3oomC3jKtRjWBmiUqHR0q3Q4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxRXh7KUNqz3cZAA--.40612S3;
	Tue, 30 Jun 2026 10:27:07 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxbcJ6KUNqIH24AA--.20759S2;
	Tue, 30 Jun 2026 10:27:06 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Optimize BPF tailcall for LoongArch
Date: Tue, 30 Jun 2026 10:27:01 +0800
Message-ID: <20260630022705.11536-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxbcJ6KUNqIH24AA--.20759S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Wr45Kry3KF4kXw4fJF1UArc_yoW3Crg_ua
	4IgaykJw1UZay3AF4j9Fs3Jr9rCFWUWFyrGrZFqrW8Gw13Jw1kZr4kWw48uw4jgrZ8GrWD
	t3y7urWIvr1jvosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

Based on 7.2-rc1, tested on a Loongson-3A6000 physical machine.

Here are the test results:

  $ sudo modprobe test_bpf test_suite=test_tail_calls
  $ dmesg -t | tail -1
  test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
  $ sudo ./test_progs -t tailcalls | tail -1
  Summary: 1/37 PASSED, 0 SKIPPED, 0 FAILED

Tiezhu Yang (4):
  LoongArch: BPF: Optimize redundant TCC loads in epilogue
  LoongArch: BPF: Move arena register slot below TCC context
  LoongArch: BPF: Refactor jump offset calculation in tail call
  LoongArch: BPF: Implement branchless conditional move for TCC

 arch/loongarch/include/asm/inst.h |   6 ++
 arch/loongarch/net/bpf_jit.c      | 112 +++++++++++++++---------------
 2 files changed, 63 insertions(+), 55 deletions(-)

-- 
2.42.0

