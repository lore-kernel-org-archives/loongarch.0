Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ED9385D99
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 03:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783309155; cv=none; b=WrjWfgX5HRN79OnEWsbT7n5GBDN96CXfpTlNaZ5cnqhflVqwk9s5cfArpPGyx+U2VL4ZOkHQIUy7pabaVNErITa7BxPyJJXCb5H8QzN30v/JV6OtwBtWHl89TuFYWtclbLCKZvPougrwbSzGsWIiPbU1zdlE9fkX9NR0e+WcsDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783309155; c=relaxed/simple;
	bh=PH77AhTUJx3zvGAbs2xGTdjsLN+bCJb7FSnkmuPeyuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/r+JMlDnwLwV832BRZweTLzkmPTsNIK8PX3tKtuxYlHwQ7+PQarLYc1hTuNeE/cqCRpyr5UvolmU7zevOoiKU6Dku85t3L085+vKzAQxZeGn+BcEAwNDMNgNw1Npz4CYyCmr7MDg/iopcd0wJLiSxpYDxmcEwj1rkLiMucAlcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx5+pdI0tqUUQAAA--.1297S3;
	Mon, 06 Jul 2026 11:39:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAx3cZbI0tq3LoBAA--.10774S2;
	Mon, 06 Jul 2026 11:39:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Optimize BPF tailcall for LoongArch
Date: Mon,  6 Jul 2026 11:39:02 +0800
Message-ID: <20260706033906.1988-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3cZbI0tq3LoBAA--.10774S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw43CF1xuw4xCFyfXFW7Jrc_yoWkXwb_ua
	4xtaykGw4UXFW7CF129F1fZr97Cayj9FyUGrWvqrWku3y3AF1DZr4kWrW09wsFgrZxKr90
	y39F93yxZr1a9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Based on 7.2-rc1, tested on a Loongson-3A6000 physical machine.

This version addresses the review comments of AI, changes are isolated
to patch 3/4, the rest of the series remains unchanged.

v1 -> v2:
- [Patch 3/4] Use ctx->image to inject a safe dummy offset during
  Pass 1, safely bypassing the 16-bit signed immediate range check.
- [Patch 3/4] Update the commit message to reflect the new code.

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

