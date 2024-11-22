Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869FD70821
	for <loongarch@lists.linux.dev>; Fri, 22 Nov 2024 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251029; cv=none; b=ru1riyyGUhUfQ8I4jBtbzQfW9VNVCSeD7iRwevqoOu2+rd5jcpG1H/OXOYbjDgBbG7VPa0CpcYXGRSNmq2Lg8l7suB0e597fYFN2pLB0m7csvF34CQ7FakX7MH0VIlfPCDZV8+VGhPfvJHDgNNz07u9BCgq6ya8zVyNFzKmhYGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251029; c=relaxed/simple;
	bh=sUA2iDpfr8XXjasNoatf2r79oIC71AizCNh+S9ZSSqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gtsga146wOdEmVv5M6fFNgKGZHOygfLgm8LK2qn0Ci7IY2npUtlVPZM6qmnlceAsJcIULaWjV6qCMto+siywHRXhoGg9F9aqRHPcVfG8vBAene7eMWA9f3xmumB5VrdMr3BP0An5Y6vQYiFYyaq/DdfaGjFZE4MtSHbVYxYo1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxCeGLDUBn+rxFAA--.5428S3;
	Fri, 22 Nov 2024 12:50:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxdcCIDUBnIJJiAA--.33733S5;
	Fri, 22 Nov 2024 12:50:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/10] objtool: Handle different entry size of rodata
Date: Fri, 22 Nov 2024 12:49:58 +0800
Message-ID: <20241122045005.14617-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241122045005.14617-1-yangtiezhu@loongson.cn>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxdcCIDUBnIJJiAA--.33733S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1fCr4kWw48AFW5ur1xJFc_yoW8Aw48pF
	43C3yrtr4Fqr17W3ZrKan5urZxCw4Igry8JFZ7try8twsFqr1rtFZak3s0kFWUXr9Yg3Wf
	Zr90yry8uF4DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In the most cases, the entry size of rodata is 8 bytes because the
relocation type is 64 bit, but when compling with Clang on LoongArch,
there exists 32 bit relocation type, the entry size of rodata should
be 4 bytes in this case.

This is preparation for later patch on LoongArch, there is no effect
for the other archs with this patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 191950551352..19d1263e64e4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -26,6 +26,10 @@
 #define EM_LOONGARCH		258
 #endif
 
+#ifndef R_LARCH_32_PCREL
+#define R_LARCH_32_PCREL	99
+#endif
+
 struct alternative {
 	struct alternative *next;
 	struct instruction *insn;
@@ -2096,6 +2100,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct reloc *reloc = table;
 	struct alternative *alt;
 	unsigned long offset;
+	unsigned long rodata_entry_size;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2107,8 +2112,15 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (reloc != table && reloc == next_table)
 			break;
 
+		/* Handle the special cases compiled with Clang on LoongArch */
+		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
+		    reloc_type(reloc) == R_LARCH_32_PCREL)
+			rodata_entry_size = 4;
+		else
+			rodata_entry_size = 8;
+
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
+		if (prev_offset && reloc_offset(reloc) != prev_offset + rodata_entry_size)
 			break;
 
 		if (reloc->sym->type == STT_SECTION) {
-- 
2.42.0

