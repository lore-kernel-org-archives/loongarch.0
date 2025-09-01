Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8A821FF44
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756711328; cv=none; b=T4zjAH1sN/tUCThdM53Dqo9GLH9F0y42lQ46DhAFEPqzDjaoSgTnsudwq4LLdxfStUw4WOZ907ad8CzydZFtIonVWaZ9Vn5w83Fg9b5MZnV3tL8yQ5Unk4PEhOfU85FZp8wYB80RVXPLRfUgPFhXwNfF+u76gg1FIkqLTqWTPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756711328; c=relaxed/simple;
	bh=yDz+grzfuSXFL1I6+ka8l/Oc6n/W6Hy1mLlCIP3m+kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFIBrYzlxPGGs5oR0MbUPHY1zMcHq9gxM95erDv59mbhgSFnpf0RYPlnFemx9iSQKSPH70liPLRBUln8dq+R7L9WmX13eT9/4QMJYcRnybk44f5dlGRubGJUMrE6iL65E+8t+sEG0n9cnRx1i/nP2qnGyhv2AfJx1p3bH4fkQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxb_CaSbVoCUUFAA--.10959S3;
	Mon, 01 Sep 2025 15:22:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+SVSbVoxHB2AA--.44622S3;
	Mon, 01 Sep 2025 15:22:01 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
Date: Mon,  1 Sep 2025 15:21:54 +0800
Message-ID: <20250901072156.31361-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250901072156.31361-1-yangtiezhu@loongson.cn>
References: <20250901072156.31361-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+SVSbVoxHB2AA--.44622S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrKr1fKry3XrW7tryktFc_yoW8GryrpF
	WUCrWjkrWYgrZ8K3WDJa1Igry5CwsFqr17Gry8Wa9rA390vFnxtw4akr10va9Fqrn3Ww1I
	qayjgF9IkayqyagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SksDUUUUU==

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
the following objtool warning:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
  falls through to next function __efistub_exit_boot_func()

This is because efi_boot_kernel() doesn't end with a return instruction
or an unconditional jump, then objtool has determined that the function
can fall through into the next function.

At the beginning, try to do something to make efi_boot_kernel() ends with
an unconditional jump instruction, but it is not a proper way.

After more analysis, one simple way is to ignore these EFISTUB functions
in validate_branch() of objtool since they are useless for stack unwinder.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d14f20ef1db1..2dcebf75d95e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3567,6 +3567,10 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			    !strncmp(func->name, "__pfx_", 6))
 				return 0;
 
+			/* Ignore EFISTUB functions which are useless for stack unwinder */
+			if (!strncmp(func->name, "__efistub_", 10))
+				return 0;
+
 			if (file->ignore_unreachables)
 				return 0;
 
-- 
2.42.0

