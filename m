Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA0D14AD1A
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999423; cv=none; b=fxDGxXkI0lvWNL6GG+UopO6r0OwnGd3/1NthqdkNYWKEN6hXrcAYWO3w/ur/ApsVt76sgZO5zs7MxbD4m5OAlzW/m99uFtrJtXVh2LniDbBdDz4mRSDh+n9UeaAySxWcCckO/ELl80pHxJJoqwmwySmgihog+7t5bxWN3sWXVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999423; c=relaxed/simple;
	bh=WuYh2QNbB1DXYMDkZ4MpKfVONFKDR2ri1ITDB4mHoqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCP1EdybcXxxaLOa1b1LK88D/aBjUcbizVDgzvqMN8dz+3D9NjfXwd1baqI6bLPtymmO2unvNqpnGAOxDbAwGvERlhBLl80hIufHtBl4i4juqJfVE0TJC9lGjGgiKDxTS+BGZ3eEV3Z/ICKhNBdRtbb4WZOUd5TSUwDitcibEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxquC7NjxnVzZCAA--.64883S3;
	Tue, 19 Nov 2024 14:56:59 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S4;
	Tue, 19 Nov 2024 14:56:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] objtool: Handle special cases of dead end insn
Date: Tue, 19 Nov 2024 14:56:47 +0800
Message-ID: <20241119065655.21123-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241119065655.21123-1-yangtiezhu@loongson.cn>
References: <20241119065655.21123-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4kuryfGr4DKr17uw47ZFc_yoW8WF4Dpa
	y5Cay3Jr4DXr48W3W7Wws5WryfKw4fGrW8XryfJ34UK3s8Xwn5KFn3tay2v3Zxua1ag3Wa
	qFsI934UZF1DArcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

There are some "unreachable instruction" objtool warnings when compling
with Clang on LoongArch, this is because the "break" instruction is set
as dead end due to its type is INSN_BUG in decode_instructions() at the
beginning, and it does not set insn->dead_end of the "break" instruction
as false after checking ".rela.discard.reachable" in add_dead_ends(), so
the next instruction of "break" is marked as unreachable.

Actually, it can find the reachable instruction after parsing the section
".rela.discard.reachable", in some cases, the "break" instruction may not
be the first previous instruction with scheduling by Machine Instruction
Scheduler of LLVM, it should find more times and then set insn->dead_end
of the "break" instruction as false.

This is preparation for later patch on LoongArch, there is no effect for
the other archs with this patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9601235e908d..6607cd56459b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -711,6 +711,18 @@ static int add_dead_ends(struct objtool_file *file)
 		}
 
 		insn->dead_end = false;
+
+		/* Handle the special cases compiled with Clang on LoongArch */
+		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
+		    reloc->sym->type == STT_SECTION) {
+			while (insn && insn_func(insn)) {
+				insn = prev_insn_same_sym(file, insn);
+				if (insn && insn->dead_end) {
+					insn->dead_end = false;
+					break;
+				}
+			}
+		}
 	}
 
 	return 0;
-- 
2.42.0

