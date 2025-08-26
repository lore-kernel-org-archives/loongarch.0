Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2421F956
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 06:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190809; cv=none; b=Irs8qE4lUnb7NshD+ga3pLDVuS7yO7sEkZ7me+eswWzZEaQF2TBA261aaIzZHxbJn3rEo2eHy82H7j2XVgKO45PfkIce3Fhnd1DCeKUglA2EV4/lDAHexvMZmwE36igacb3W0KfXVKk3hcP4G5nOnOKnLqSFJPC2YltdVMrUyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190809; c=relaxed/simple;
	bh=w0qS4kCOp7ylBVCxLD0AVRIRenhm1PIkxviGeN4Ri/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdveVJbKxXPB1HVtMAD1fRYnykkg/E7nzBo3dnLPHQBC+jp0bN/3McucZRn7sucXRkroQhyq5EvgUbDp5yrGMRY9GiNQ5wslPOFEZOJpS5xIu340bRCRHO9z98DP8pYXmuE3ArqxoKXcPYsUl4sjPLJXP3mRp5OEkA5PztjofIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3tJRWK1oI0EDAA--.6214S3;
	Tue, 26 Aug 2025 14:46:41 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxTMFKWK1o6GppAA--.11160S3;
	Tue, 26 Aug 2025 14:46:40 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] objtool/LoongArch: Fix fall through warning about efi_boot_kernel()
Date: Tue, 26 Aug 2025 14:46:30 +0800
Message-ID: <20250826064631.9617-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250826064631.9617-1-yangtiezhu@loongson.cn>
References: <20250826064631.9617-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxTMFKWK1o6GppAA--.11160S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF4rCF15tF13ury3Ar4rtFc_yoW5Cry7p3
	WUCrWUWr4Fyrs7Aa48Jw4Y9ry3Zws7trWagasrXryrZanIqFsIvr4qvrnFvF4kAFWDKw4Y
	qFy8tr9Iya1DArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
the following objtool warning:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
  falls through to next function __efistub_exit_boot_func()

This is because efi_boot_kernel() doesn't end with a return instruction
or an unconditional jump, then objtool has determined that the function
can fall through into the next function.

Actually, efi_boot_kernel()'s last instruction is "jirl $ra, $a3, 0", it
is a call to a noreturn function pointer real_kernel_entry() which points
to the symbol kernel_entry() in arch/loongarch/kernel/head.S.

drivers/firmware/efi/libstub/loongarch.c:

typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
					  unsigned long systab);

efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
			     unsigned long kernel_addr, char *cmdline_ptr)
{
	kernel_entry_t real_kernel_entry;
	...
	real_kernel_entry = (void *)kernel_entry_address(kernel_addr, image);

	real_kernel_entry(true, (unsigned long)cmdline_ptr,
			  (unsigned long)efi_system_table);
}

According to the description of tools/objtool/Documentation/objtool.txt,
in order to silence this warning, at the beginning just add the noreturn
real_kernel_entry() to objtool's hard-coded global_noreturns array, but
there is no effect, because it is not a valid symbol.

There exists an alternative way to silence this warning, the first thing
is to remove the attribute __noreturn for real_kernel_entry(), otherwise
the compiler can not generate instructions after that, and then just add
"while (1);" at the end of efi_boot_kernel(), so that efi_boot_kernel()
ends with an unconditional jump instruction "b".

Note that at the end of efi_boot_kernel(), using unreachable() has no
effect because it can still generate fall-through code, using BUG() is
not proper because it will generate the following ld.lld warning:

  vmlinux.o:(.init__bug_table) is being placed in '.init__bug_table'

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/firmware/efi/libstub/loongarch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 3782d0a187d1..e309fd78fca7 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -10,7 +10,7 @@
 #include "efistub.h"
 #include "loongarch-stub.h"
 
-typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
+typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
 					  unsigned long systab);
 
 efi_status_t check_platform_features(void)
@@ -81,4 +81,7 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 
 	real_kernel_entry(true, (unsigned long)cmdline_ptr,
 			  (unsigned long)efi_system_table);
+
+	/* We should never get here */
+	while (1);
 }
-- 
2.42.0

