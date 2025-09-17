Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593C221CC68
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071425; cv=none; b=N9oje02YdlCfblGkbvubdGhw+ytApqRv123LvXwEBsTmC7K/Z9Otn+1KVVpz0GgKUUOToKm8ejrh3vnsamtoVGFekWS13vkJxz5rhrkz09zjX6/eekvR0bKTn5NN/yoQffrRW0KWxo8CzeHFjky5ApeXqCVnVFIkYQaFTnL0BYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071425; c=relaxed/simple;
	bh=I0X2tXYkS1K5lUBZlYDUhEDPaSom/PRfWEqw7ItlcJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbkNZi9IyNJP+BWNnspvMNkpzShZ9upwvEbO4MhYlXPRk0MdsJyKhhakiOG10jx7OOv9jcgVQroPs4SvYR2/bPC0lUZUkY9rZOEfnTEe8YYjMLDztZA7N6hd2DvVrwomPyY7cTPG7oXsjEQ31HUrHXOaEAuU5LCcNKHCBbH/Luk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9N6CspoGC4LAA--.23823S3;
	Wed, 17 Sep 2025 09:10:18 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+RwCsposWOaAA--.35728S2;
	Wed, 17 Sep 2025 09:10:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fix objtool warnings if LTO is enabled for LoongArch (Part 2)
Date: Wed, 17 Sep 2025 09:10:03 +0800
Message-ID: <20250917011007.4540-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+RwCsposWOaAA--.35728S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr4kKr15Kw4UAFW3Wr4kuFX_yoW8Aw4rpF
	43uay7Kr4Fyr4kXw4DJw4S9Fy3AwsxGr1aqF1UK345A390vFsFqws7Ar4xXFyDK3sagryI
	qF4rKa4UKF1DZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==

The previous patches [1] [2] are to fix most of the warnings (total 3030):

  sibling call from callable instruction with modified stack frame

This series is a follow up to fix 2 kinds of warnings (total 24), it only
touches the objtool and LoongArch related code:

  falls through to next function
  unreachable instruction

With this series, there is only 1 kind of warning (total 3), it does not
only touch the objtool and LoongArch related code:

  missing __noreturn in .c/.h or NORETURN() in noreturns.h

In order to silence the above warnings, it needs to change the related
code to give the functions __noreturn attribute, and have a NORETURN()
annotation in tools/objtool/noreturns.h. IMO, it will touch all of the
archs and the generic code, so this needs much more work to avoid the
side effect or regression, once it is done I will send out the patch.

How to reproduce:

  $ make ARCH=loongarch LLVM=1 clean defconfig
  $ scripts/config -d LTO_NONE -e LTO_CLANG_THIN
  $ make ARCH=loongarch LLVM=1 olddefconfig all

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a47bc954cf0e [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dfea6644d20 [2]

Tiezhu Yang (4):
  objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
  objtool/LoongArch: Fix unreachable instruction warnings about image
    header
  objtool/LoongArch: Fix unreachable instruction warnings about entry
    points
  LoongArch: Remove is_entry_func() related code

 arch/loongarch/kernel/Makefile     |  2 --
 arch/loongarch/kernel/head.S       |  7 +++----
 arch/loongarch/kernel/unwind_orc.c | 11 -----------
 tools/objtool/check.c              |  4 ++++
 4 files changed, 7 insertions(+), 17 deletions(-)

-- 
2.42.0

