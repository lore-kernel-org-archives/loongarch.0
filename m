Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B951158A31
	for <loongarch@lists.linux.dev>; Fri, 22 Nov 2024 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251032; cv=none; b=t4EAMvVhcStAROZzzBC+WsnCcBnUnD8pVig3HE2dmm8whFdBNHMENOGaLXs52F9dMvDym/ckxwf/2TqqRF0rBicc3oeYDYTb8FE9NHNfN6areJA8nNPC0sUOe3hEclgxBGCAdUwPF0MHQJfR5cgkcueik6dUnt+WdFhkN901q7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251032; c=relaxed/simple;
	bh=JD5fhBPzeT0CyzSwrSAsbW9I9WzcrYZsAKX3gGjoAbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPoLE+6v6+VY7ipJF+WAWvaMFcfHRgkgyivfecl1VTcUHiuX4qu6rAaGa2tJdctXgm1A6pfFJWOJ3EtXvuvBPsvz9KwF6SZrKbUEYdNmb15v5d/qkd+3FbIURkQObm/3FN4Zlb9JGlRFrC+twWOvoioXQJo0gOHmAuAN3Z8bLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxUa+JDUBn7bxFAA--.5887S3;
	Fri, 22 Nov 2024 12:50:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxdcCIDUBnIJJiAA--.33733S2;
	Fri, 22 Nov 2024 12:50:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/10] Add jump table support for objtool on LoongArch
Date: Fri, 22 Nov 2024 12:49:55 +0800
Message-ID: <20241122045005.14617-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxdcCIDUBnIJJiAA--.33733S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr48uFWUWF1rWF4DGr48uFX_yoWkKrc_ZF
	yxWF95Gr4rXa45ta4xtas5urWjkFs5Jr45JFykXr12vF15Jr15WF42vr1DZrZ5Kry5ZFs8
	tF4vkryxCwnrWosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

This series is based on 6.12-rc7, tested with the latest upstream
mainline Binutils, GCC and Clang, most of the patches are aim to
handle the special cases compiled with Clang on LoongArch.

v4:
  -- Avoid EM_LOONGARCH and R_LARCH_32_PCREL undeclared error
     for various compiling environments.

  -- Remove the check condition "dest_insn->type == INSN_NOP"
     for unreachable entry of rodata.

Tiezhu Yang (10):
  objtool: Handle various symbol types of rodata
  objtool: Handle special cases of dead end insn
  objtool: Handle different entry size of rodata
  objtool: Handle PC relative relocation type
  objtool: Handle unreachable entry of rodata
  objtool: Handle unsorted table offset of rodata
  objtool/LoongArch: Get each table size of rodata
  objtool/LoongArch: Add support for switch table
  objtool/LoongArch: Add support for goto table
  LoongArch: Enable jump table for objtool

 arch/loongarch/Kconfig                 |   3 +
 arch/loongarch/Makefile                |   4 +
 tools/objtool/arch/loongarch/special.c | 156 ++++++++++++++++++++++++-
 tools/objtool/check.c                  |  75 +++++++++++-
 tools/objtool/include/objtool/check.h  |   1 +
 5 files changed, 233 insertions(+), 6 deletions(-)

-- 
2.42.0

