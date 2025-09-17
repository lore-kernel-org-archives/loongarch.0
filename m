Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4272116E7
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071424; cv=none; b=dn723qZbo/3liUIORF01+9jIGp/K4xL5pwvoHX6pGFF+Ot20UPN+tP4T2+fFxB7yZ5yVf/q9XpJq/49DY6kjd7HIvZVHxFYfEU92P6zEltdXNXY6od43Gb98wN4UrfNaZptiNi0Gn+YSMbusQHyjS+Xb37XAq3O4hLDg+iWhtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071424; c=relaxed/simple;
	bh=QfrYnkE+7NUVkdHiavBpJx3gy03Ynprngwwcd3bbCLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUFOkpLn6gw5pgb62L4IsDlkDMm4woHqPXzP0IBlBLAYmwtFQNqplfVAzteAzSE3IFpLsJN3cbnShMiKlLVP0bJn8hRlIbXjLvqk6CXBDPTnWECKZzxPWwh6WNhCYSEQWMQ31hPjTlUOQHN/atoyuA/jix9itHJx05Xq0f63DZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3796CspoHS4LAA--.22700S3;
	Wed, 17 Sep 2025 09:10:18 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+RwCsposWOaAA--.35728S3;
	Wed, 17 Sep 2025 09:10:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
Date: Wed, 17 Sep 2025 09:10:04 +0800
Message-ID: <20250917011007.4540-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250917011007.4540-1-yangtiezhu@loongson.cn>
References: <20250917011007.4540-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+RwCsposWOaAA--.35728S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrKr1fKry3XrW7tryktFc_yoW8Zr4rpF
	45CrWakrZ8WrWkG3W8Jw48Wr9xCrsxtrW7Gry8J3sIy3s0qrnFqw4akF10va9rXrnag3WI
	qay0gryakayqyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8niSPUUUUU==

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
the following objtool warning:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
  falls through to next function __efistub_exit_boot_func()

This is because efi_boot_kernel() doesn't end with a return instruction
or an unconditional jump, then objtool has determined that the function
can fall through into the next function.

At the beginning, try to do something to make efi_boot_kernel() ends with
an unconditional jump instruction, but this modification seems not proper
and makes LoongArch different to other architectures.

Furthermore, it is not proper to link efistub separately for LoongArch,
ARM64 and RISC-V too due to there is technical reason why vmlinux.o needs
efistub linked in.

For example, there are two ways of populating the core kernel's struct
screen_info via the stub, the latter is preferred because it makes the
EFIFB earlycon available very early, but it only works if the EFI stub
is part of the core kernel image itself. For more information, please
see the comments in drivers/firmware/efi/libstub/screen_info.c.

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

