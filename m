Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4CC1F428F
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756711328; cv=none; b=HaEugji8sy9rJtlmPFRSQN+UISrhzKjkTTl/K44GAAdnq/cRTLxujPU5BCS4xgCHJpPU7/CTAoSl/aTF5rGIPn8p5T0C0U/mBKqWI3nBuRYjtyQ9kUd7QavVEvVks387uJxk3jjDBuOISIMg6yClcSuePYq6yr69zv/kDm3U13U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756711328; c=relaxed/simple;
	bh=obL7c1tGfPBGJZt879nv1mrfS5NVBR4SM48Dq8CY58Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DusToBm1ZmSlrNCct2yj/bNyzXqxHlrDdcmEiVSWHtyVAw42MFIKw0GwlZOjwaKbBXhnijHwDke2Y9fvfRrAzYEtj5VMI9BeJGZUs//xbpdMfmciGjf25rMRYVzVDVqBXW6XYkLvavpVeAikvWRUHVJHf9IS3sPKiqh7OL+39cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxN9GaSbVoDUUFAA--.10879S3;
	Mon, 01 Sep 2025 15:22:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+SVSbVoxHB2AA--.44622S4;
	Mon, 01 Sep 2025 15:22:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] objtool/LoongArch: Fix unreachable instruction warnings about EFISTUB
Date: Mon,  1 Sep 2025 15:21:55 +0800
Message-ID: <20250901072156.31361-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxE+SVSbVoxHB2AA--.44622S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45AFyUKw1fCF17tF4rCrX_yoW5XrW5pF
	47C34jyF4DWFyDuw4UGF4ag3yavan8Xr4ktFy8Ja43Jayj9asFqasYyw12kFyqqr45WF43
	Xr4UKryUCa4jy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8gAw7UUUUU==

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
following objtool warnings:

  vmlinux.o: warning: objtool: .head.text+0x0: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x18: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x38: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x3c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x40: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x44: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x54: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x58: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x6c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x84: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x94: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x9c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xc4: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xf8: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0xfc: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x104: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x10c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x11c: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x120: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x124: unreachable instruction
  vmlinux.o: warning: objtool: .head.text+0x144: unreachable instruction

The instructions in the .head.text section are related with EFISTUB,
they are image header and can be ignored by objtool, so just check the
section name in ignore_unreachable_insn() to ignore it.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 2dcebf75d95e..b7397b0f9f79 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4039,6 +4039,10 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	    !strcmp(insn->sec->name, ".altinstr_aux"))
 		return true;
 
+	/* Ignore EFISTUB instructions usually in the .head.text section. */
+	if (!strcmp(insn->sec->name, ".head.text"))
+		return true;
+
 	/*
 	 * Whole archive runs might encounter dead code from weak symbols.
 	 * This is where the linker will have dropped the weak symbol in
-- 
2.42.0

