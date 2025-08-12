Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBA9283FE2
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005253; cv=none; b=KZa6Uxc+l4z9T/e4oCSPW12lCwhqvacq6SEPNaIiJrZa3wGwFRnwTdfmii4CLWLAAeUXco2B1RwRLLjWQR9TJByCw6sFZeyoMAgYx0c8Yhe8L4Z6z1f0PYT2mkhqNmGzoRZH+oifJzg2iFxuuO0MUl2EkWa6+V+GPCREIv26Gwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005253; c=relaxed/simple;
	bh=YZ09Id6v7EjDAgnRDASiWJGhvIAMhXex9LIsQ5F9RnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEgYZdHnLfzOj40v6GwWafbCcGuO5xxlITaUUp6++Hwz4fT+RK4satXBTEc5tW85EXJr3rhCvRANRwkfZh3fP4jqUVz8MyTzqxcLX95GBCzXuSj0WtofmszY1l5osmx5ZaiP8eoinkRgnMsMbjfICg3As3/lDXIlVBBc3yHm69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axx2k6QZtoJvg+AQ--.19352S3;
	Tue, 12 Aug 2025 21:27:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxdOQ0QZtoOLVGAA--.6029S4;
	Tue, 12 Aug 2025 21:27:22 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: Pass annotate-tablejump option if LTO is enabled
Date: Tue, 12 Aug 2025 21:27:16 +0800
Message-ID: <20250812132716.1465-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250812132716.1465-1-yangtiezhu@loongson.cn>
References: <20250812132716.1465-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdOQ0QZtoOLVGAA--.6029S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrKr4rCw4xZry5ZF18Zwc_yoW8Kr1kp3
	9xCFZYqFs5Xrn7Kr9rJ3y2gr98KrZxK3W7WFyay348AwsxXa12vr10qF9FqFyrZws5XrWI
	qrZ3KrZ8KF4DCacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist
many objtool warnings "sibling call from callable instruction with
modified stack frame".

For this special case, the related object file shows that there is
no generated relocation section '.rela.discard.tablejump_annotate'
for the table jump instruction jirl, thus objtool can not know that
what is the actual destination address.

It needs to do something on the LLVM side to make sure that there is
the relocation section '.rela.discard.tablejump_annotate' if LTO is
enabled, but in order to maintain compatibility for the current LLVM
compiler, this can be done in the kernel Makefile for now. Ensure it
is aware of linker with LTO, '--loongarch-annotate-tablejump' needs
to be passed via '-mllvm' to ld.lld.

Note that it should also pass the compiler option -mannotate-tablejump
rather than only pass '-mllvm --loongarch-annotate-tablejump' to ld.lld
if LTO is enabled, otherwise there are no jump info for some table jump
instructions.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/loongarch/20250731175655.GA1455142@ax162/
Fixes: e20ab7d454ee ("LoongArch: Enable jump table for objtool")
Co-developed-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index b0703a4e02a2..6cdbcbbe730e 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -103,6 +103,12 @@ KBUILD_CFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)
 ifdef CONFIG_OBJTOOL
 ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
 KBUILD_CFLAGS			+= -mannotate-tablejump
+# The annotate-tablejump option can not be passed to LLVM backend when LTO is enabled.
+# Ensure it is aware of linker with LTO, '--loongarch-annotate-tablejump' needs to be
+# passed via '-mllvm' to ld.lld.
+ifdef CONFIG_LTO_CLANG
+KBUILD_LDFLAGS			+= -mllvm --loongarch-annotate-tablejump
+endif
 else
 KBUILD_CFLAGS			+= -fno-jump-tables # keep compatibility with older compilers
 endif
-- 
2.42.0

