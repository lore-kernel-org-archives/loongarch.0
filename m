Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA137C6D4
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021153; cv=none; b=MFcnJ9B7VV2Hxw6iB1V68dPOqbxTCl0RktehcUxaYF1+QDYVRU8MHqCe55BacynwPvh43eT1SxNInn0KbVEBJlCwskVbYWADzBP+/BUukb6fdxLy7mVd9YIblYGckvpY6+v5wtXMvTHMGm6uKhguyHbzqhsqPiic+lsEWVUmF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021153; c=relaxed/simple;
	bh=ddMC6GuOu91dUFa8L1OCiIs3xpwVs976fbpbYf68F5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rexp7EiAM2GV5IhfRqDQZMBJ0UH/J5KnqJS7tyWbNmcubKk+smyZrP/0+KmwU9P3rRY2PTX7hfuDMm7hMDKnD72vy/+qgUBET/tmx8Dxs/glItrKgH5Xs4GPIRNq1T7QzEuEiPbgQjonwsL3GJlAKQt41vNPGRTlr1YM0SEcWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxnOpcN7Nmxy8KAA--.31914S3;
	Wed, 07 Aug 2024 16:59:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxvmdaN7NmO8EHAA--.24061S2;
	Wed, 07 Aug 2024 16:59:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Fix objtool issues about do_syscall() and Clang on LoongArch
Date: Wed,  7 Aug 2024 16:59:02 +0800
Message-ID: <20240807085906.27397-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxvmdaN7NmO8EHAA--.24061S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtryxXFW3uF4kJw15Xr15ZFc_yoWDWrX_WF
	92gFyUCr4rXF9rta4DKw1ruas7AF48Grs3GF1vqrya9ry3AFn8GFyYk34DC3Z0grWrWFZ8
	urW8tFyFy34YkosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

With this series, there is no objtool warning about do_syscall() and
there is handle_syscall() which is the previous frame of do_syscall()
in the call trace when running "echo l > /proc/sysrq-trigger".

Compiled with GCC and Clang, tested with the following two configs:

(1) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=n
(2) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y

Tiezhu Yang (4):
  objtool: Handle frame pointer related instructions
  LoongArch: Remove STACK_FRAME_NON_STANDARD(do_syscall)
  LoongArch: Set AS_HAS_THIN_ADD_SUB as y if AS_IS_LLVM
  LoongArch: Enable objtool for Clang

 arch/loongarch/Kconfig                |  4 ++--
 arch/loongarch/kernel/syscall.c       |  4 ----
 tools/objtool/arch/loongarch/decode.c | 11 ++++++++++-
 tools/objtool/check.c                 | 23 ++++++++++++++++++++---
 tools/objtool/include/objtool/elf.h   |  1 +
 5 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.42.0

