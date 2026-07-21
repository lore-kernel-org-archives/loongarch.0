Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C903C1F46
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624782; cv=none; b=WnvoWWK7pu+mwffr4yM6Jf3cF+E+laHLN2y6gQicAneE+/f0TWzlC4Gg98QBSgLsmZF+jOGEsbRKNQ6L10PtTOgpxoIHapXQNp2BwRX+4VvpKKiExFdxtKPnGy+31jqIEsFHlsixtxWnEpenl8LsWvXFPbsR061vFXO7KkZbHn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624782; c=relaxed/simple;
	bh=6hnBbVGYNLzPEo64qDSzGAeZsF8r3FudhQWYUFXijLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNubbl91g+ayDmoXKXAqNOQKvTEvUmgfxzgg/O2OSr4MjbikAUV3TjQim0tqPCSpWD0QTGXvuFimXl4RIzgeRJo3YjA9mUpFjMt/cOnzIrRjpVbPdCd3YMEnoVhodcCGOI2I1/j/kEpcnCsjJpv5WDDERxbmwu4LhOijFgOxiY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxSeuCNl9qKpMFAA--.21823S3;
	Tue, 21 Jul 2026 17:06:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxb8d_Nl9qdssTAA--.39236S4;
	Tue, 21 Jul 2026 17:06:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 2/2] LoongArch: Skip address pairing for non-exec sections
Date: Tue, 21 Jul 2026 17:06:06 +0800
Message-ID: <20260721090606.8982-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260721090606.8982-1-yangtiezhu@loongson.cn>
References: <20260721090606.8982-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxb8d_Nl9qdssTAA--.39236S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrW8Zr18tryxKw4kKrWfJFc_yoW8CFWkpr
	sxCws5Zr48GrnxJws5J3WkWa4UGaykWw4aqF95J3s2yFsxXF9Yy3Z3KrnxXayUuw4rAw10
	qryFqwn8Z3WUCFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU4AhLUUUUU

The module loader currently runs expensive address pairing logic for all
sections blindly during relocation. For massive modules like amdgpu, this
causes the loader to waste lots of CPU cycles analyzing non-exec sections.

Furthermore, there is an inconsistency since module_frob_arch_sections()
already ignores non-exec sections during the counting phase.

Check the SHF_EXECINSTR flag in apply_relocate_add(). If the section is
non-exec, skip address pairing and then jump to normal relocation. This
eliminates redundant search loops to improve module loading efficiency.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/module.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index 7d4d571ee55e..c84ac1546dc6 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -484,6 +484,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf_Addr v;
 	Elf_Sym *sym;
 	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
+	Elf_Shdr *dst_sec = sechdrs + sechdrs[relsec].sh_info;
 
 	pr_debug("%s: Applying relocate section %u to %u\n", __func__, relsec,
 	       sechdrs[relsec].sh_info);
@@ -522,6 +523,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 		v = sym->st_value + rel[i].r_addend;
 
+		/* Skip address pairing for non-exec sections */
+		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
+			goto apply_normal;
+
 		if (type == R_LARCH_PCADD_LO12 || type == R_LARCH_GOT_PCADD_LO12) {
 			bool found = false;
 			unsigned int j = idx;
@@ -562,6 +567,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			idx = j; /* Record the previous j-loop end index */
 		}
 
+apply_normal:
 		switch (type) {
 		case R_LARCH_B26:
 			err = apply_r_larch_b26(mod, sechdrs, location,
-- 
2.42.0

