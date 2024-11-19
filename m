Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0513B7B3
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999423; cv=none; b=pSFMlYEbgZHiCcwJyPYPmsFkDYv/SiXwLrP1Lgq02qsnqkpyH2wtn8kPxIO1ZfkubYNLyXr9b3AAlN89UUkkAJZjD5ssoXbL3Sw4VZwMzn6Aay/wlyZ9P4WN8vu5Uy9iR7Mn7PeaEhl5z0ymU7RJf+4R445+ca5lv7rxn8SPvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999423; c=relaxed/simple;
	bh=ebRZMPmXGKiaPpS5pNKT/Qy1wqQ6Awo19ORuU2KqlLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aw2816hp6LGrzXD24sil+yJg6UsPb/psJwCtx+zdVMo1jLVnKkKF0PMTUK+OVDdrKAaV64DMVXfBOVL3sftARfbITxb9jT+d/b8zAnwMwjBIILFEqRt2nuNuVi80yB8T5P+Wlznd87XBL59N618qzMkzjJheD1JF6kQPlv/WGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax6+G6NjxnTzZCAA--.63980S3;
	Tue, 19 Nov 2024 14:56:58 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S2;
	Tue, 19 Nov 2024 14:56:57 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] Add jump table support for objtool on LoongArch
Date: Tue, 19 Nov 2024 14:56:45 +0800
Message-ID: <20241119065655.21123-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr48uFWUWF1rWF4ftr45XFc_yoWDXrg_ur
	yxWF95Gr1rW3W5tayxtF95uFyjkFsYqr45JFykXr129r15Jr15WF42vr1DZrs5KrZ8ZFs8
	tF4vyryxCwnFgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UUUUU==

This series is based on 6.12-rc7, tested with the latest upstream
mainline Binutils, GCC and Clang, most of the patches are aim to
handle the special cases compiled with Clang on LoongArch.

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
 tools/objtool/check.c                  |  68 ++++++++++-
 tools/objtool/include/objtool/check.h  |   1 +
 5 files changed, 226 insertions(+), 6 deletions(-)

-- 
2.42.0

