Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B153B13B7B3
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999425; cv=none; b=huyNcFArQ8Pgo80LfenU8xZY3AU+A7xEcJ8NsZXd8Sh59UmkiDToWc7fOkDhHHsNOcVkHQft+wKOLzz9TYw5QGwnXle8/9YFFA5DycMUvS/q1ewt9LsB0rcTlpY9QHvcFnND9WKuTUpq3Eoic6ed3CBFH0bTxkJvv8zgneDPXAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999425; c=relaxed/simple;
	bh=ABz/vWnPLoWfMePrVIQsijD1UvXElWP1z/6f+ice6nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6+ZKunhebZ6QZYLumB1DXwtc9efvpGYm8RXqWwHFl77IP3vtx4UHrKvY5iIDFIunq03bao8Q8jdvbrLGNKMZcVWHrmg6HVv8cSj18w3zxtAGP+RxYi40ebXK6UHAkM/YLp6MHF/IrsgZ2kx5etreSMvQykrISKKUya9xJC7tvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxaeG+NjxnYzZCAA--.63921S3;
	Tue, 19 Nov 2024 14:57:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S6;
	Tue, 19 Nov 2024 14:57:00 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] objtool: Handle PC relative relocation type
Date: Tue, 19 Nov 2024 14:56:49 +0800
Message-ID: <20241119065655.21123-5-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFW7tr1fWw4DuF1kWFW7Awc_yoW8Jw4xpF
	y3u3y5KrsI9r17GwsrKa1kWrW5Cws7Wry7Xry09ry8ZF9xZF15Kay29a15Ca1UWwnYgayI
	vF9xKFy3A3WDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

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
index af824bfd0973..eb4c89501493 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2118,6 +2118,11 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
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

