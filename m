Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D500A1632CC
	for <loongarch@lists.linux.dev>; Fri, 22 Nov 2024 04:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251031; cv=none; b=OgmTLBQvl2ilVXJdGUKxuV3eM4zTFiyBg8TRmLgS31pjph4ioBTnL4fk+rX7Db240RR+izSnCzF79AxY4yQTSWadFYUp9bvn5r4G20a/WHNeiaK/2zO9qSuV4/fF6OuwyAxgqmCKBjIhE+Tq69LytRpibNMtola6LLM4Qt+ExqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251031; c=relaxed/simple;
	bh=sXJC7+BIzrkdr2c8xg26yJGufdpB5vL4s7bxiuKEKkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPWnu2Y9V7y3TfPwAVujyzoZf+mR8kdMxFo5zzV+9VTNnuk/f0XQRGlzOyk1ox1H6TW44sSQIAv+rCIyJlaqDA9bKE8ww0sG+1SIsilGvUAQxPHb3y2Tw7XqKTOkbLBBsZAguXd0j5VZKREPHXGeJ7w+6A1koakJLZSyWYpvndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxeeGMDUBn_rxFAA--.7362S3;
	Fri, 22 Nov 2024 12:50:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxdcCIDUBnIJJiAA--.33733S6;
	Fri, 22 Nov 2024 12:50:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/10] objtool: Handle PC relative relocation type
Date: Fri, 22 Nov 2024 12:49:59 +0800
Message-ID: <20241122045005.14617-5-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCxdcCIDUBnIJJiAA--.33733S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFW7tr1fWw4DuF1kWFW7Awc_yoW8Jw4xpF
	9xuw45KrsI9r17WwsrKa1kWrW5Cws7WryxJrW0kryrAF9xZF1rKay2ka15Ca1UXw1Fva1I
	vFyYkFy7Aa1DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=

When compling with Clang on LoongArch, there exists 32 bit PC relative
relocation type, it needs to get the offset with "S + A - PC" according
to the spec of "ELF for the LoongArch Architecture".

This is preparation for later patch on LoongArch, there is no effect for
the other archs with this patch.

Link: https://github.com/loongson/la-abi-specs/blob/release/laelf.adoc
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 19d1263e64e4..8733ca620cca 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2126,6 +2126,11 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (reloc->sym->type == STT_SECTION) {
 			/* Addend field in the relocation entry associated with the symbol */
 			offset = reloc_addend(reloc);
+			/* Handle the special cases compiled with Clang on LoongArch */
+			if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
+			    reloc_type(reloc) == R_LARCH_32_PCREL)
+				offset = reloc->sym->offset + reloc_addend(reloc) -
+					 (reloc_offset(reloc) - reloc_offset(table));
 		} else {
 			/* The address of the symbol in the relocation entry */
 			offset = reloc->sym->offset;
-- 
2.42.0

