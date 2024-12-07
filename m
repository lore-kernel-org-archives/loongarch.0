Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE617597
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536765; cv=none; b=HoW4OrvWrXUndfZTjOEITLqduW1npPcO6Pj8OuE1X39jjzmqXEDiPIIxIiNrqm5RMpX6u/AKjCex06Ya3D0avhQZPk6FVLevHDo9y180IKst2Y5y2xoAxc8XtrWcYDITpgVOl4KIC2HB5DLhI1hdAZiQhnVkmcE9iLJD5aVErMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536765; c=relaxed/simple;
	bh=+Yo60HJbO1w1xRhZcdknx9CjoWsBzS+fiO+D0jDFnjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c24hJn/LSFwD2PHFkVDB7g1Kn8kdy/DYoNt9bYEblrAKvkwxthpx26eMPEOV5bKrxbDlSjOPCM0ZfdquEhnbk40KGrlFZJoDCcEnCLZnwJEvmoWUQrKi29pPLq3tm6Sj5IGOE/211kSV4DhoG8/27Yk0AZ0nW7I7OPPbLlFb7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxGeD4q1NnDK1SAA--.29195S3;
	Sat, 07 Dec 2024 09:59:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S2;
	Sat, 07 Dec 2024 09:59:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] Add jump table support for objtool on LoongArch
Date: Sat,  7 Dec 2024 09:59:05 +0800
Message-ID: <20241207015915.1159-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur48Cry7Gr17tw4xGF48GrX_yoW8Jw4kpF
	43CrZFgr18Xr97A3srJ34YgFW3Ga1xWr1Iq3W3Jry5AFWUXr1UJr4fZayDtFyjgw4YgFWI
	qF1rW3WUGF4qy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU7fMaUUUUU

This version is based on tip/tip.git objtool/core branch [1], add some weak
and arch-specific functions to make the generic code more readable, tested
with the latest upstream mainline Binutils, GCC and Clang.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core

Tiezhu Yang (10):
  objtool: Handle various symbol types of rodata
  objtool: Handle different entry size of rodata
  objtool: Handle PC relative relocation type
  objtool: Handle unreachable entry of rodata
  objtool/LoongArch: Add support for switch table
  objtool/LoongArch: Get each table size of rodata
  objtool/LoongArch: Add support for goto table
  LoongArch: Enable jump table for objtool
  LoongArch: Convert unreachable() to BUG()
  drm/amd/display: Mark dc_fixpt_from_fraction() noinline

 arch/loongarch/Kconfig                        |   3 +
 arch/loongarch/Makefile                       |   6 +-
 arch/loongarch/kernel/machine_kexec.c         |   4 +-
 .../drm/amd/display/dc/basics/fixpt31_32.c    |   2 +-
 tools/objtool/arch/loongarch/decode.c         |  31 +++-
 .../objtool/arch/loongarch/include/arch/elf.h |   7 +
 tools/objtool/arch/loongarch/special.c        | 164 +++++++++++++++++-
 tools/objtool/check.c                         |  36 +++-
 tools/objtool/include/objtool/arch.h          |   3 +
 9 files changed, 239 insertions(+), 17 deletions(-)

-- 
2.42.0

