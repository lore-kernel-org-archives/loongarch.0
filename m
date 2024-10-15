Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DF61E7C34
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992367; cv=none; b=Nv7hQWYtCALyfB84jajHugKIb5Yp4TRNLy5ABgR2a/+2jcmOxdUPF4L4AWcfHsJiEngPH2fbbvGCA8PNbxmC+Ozvs7Nw+RHgorYNveoe7vm43ZJCbUW2RNRIhA86GobPD3GedONO85sBGuhjXiadUqmHo29CSpnpZSAOdTkOQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992367; c=relaxed/simple;
	bh=rr0nWEYrqLlVaPbZ9c1h3jCsPjkNEijFpvF3AjTKWk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaz3hhUTwnSlNxLsXOkAHzP6e5PFSyFI3jouAPJ1tOD5u1ubWRB8AwPmdim7f1BkYLeGVfGbl0ikOatDh7yXlcJiLNlDMVmwjr6hyqXwTwBy/fpor7ACdjbTYZyeD7pzSx8Sf744rIBjKol+Z5pIYhYOhhbAfSIzdh+lCKAk/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxrnNpVA5n_38dAA--.43417S3;
	Tue, 15 Oct 2024 19:39:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxbcdkVA5n6E0uAA--.9583S8;
	Tue, 15 Oct 2024 19:39:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] objtool/LoongArch: Add support for goto table
Date: Tue, 15 Oct 2024 19:39:15 +0800
Message-ID: <20241015113915.12623-7-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241015113915.12623-1-yangtiezhu@loongson.cn>
References: <20241015113915.12623-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbcdkVA5n6E0uAA--.9583S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWktry3tF13Ar4UZryfZrc_yoW8GFykpa
	13C3s8Kw45XrWxKr13tay8uFy3Aa1xW3W2grWIkr93Zw43XF4rtF1SvF98tFWxWw4rtr4I
	qrs5Kr15AF1UA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2F4iUUUUU

If find_reloc_by_table_annotate() failed, it means that there
is no relocation info of switch table address in the section
".rela.discard.tablejump_annotate", then objtool can find the
relocation against the nearest instruction before the jump
instruction with find_reloc_by_dest_range(), which points to
the goto table.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/special.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index 65b1ed297d57..d2a6071d772f 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -47,8 +47,18 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 	unsigned long table_offset;
 
 	annotate_reloc = find_reloc_by_table_annotate(file, insn);
-	if (!annotate_reloc)
-		return NULL;
+	if (!annotate_reloc) {
+		annotate_reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+							  insn->offset, insn->len);
+		if (!annotate_reloc)
+			return NULL;
+
+		if (!annotate_reloc->sym->sec->rodata)
+			return NULL;
+
+		if (reloc_type(annotate_reloc) != R_LARCH_NONE)
+			return NULL;
+	}
 
 	table_sec = annotate_reloc->sym->sec;
 	table_offset = annotate_reloc->sym->offset;
-- 
2.42.0

