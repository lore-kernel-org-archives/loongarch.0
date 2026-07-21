Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D143C13F2
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624780; cv=none; b=jfCtVf0zEI091TWAxAsvkM2GWrHK0eWl0ed/6uTfz1AdtKBBodC3d4ogqUCfIK040SRojs7e32/AJyBLiUsRwFQIBNlmFK+Vrv+dkeHo12L3NSm7giK0Ui8p2vaQPXYqrlYHu4nj949JRRCizyZCvqeFa7IChKenA/P/l1Pt22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624780; c=relaxed/simple;
	bh=p0lkgSry27wiwao79AF6pts01/8WmlkMsYsp66GzW44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQwQczZ6JfzjyfdzItRWgxl2dIwdthOZJWsUQgV95cvYVf6SC2Xxp/Rcq0l/il/9V4Ms0ipm3FNDjke9vdy+brE5bcQqaq+KS3uvFSCbItv5I5uvxPipO+EHfFLlFO7SDv0tge29+Wd5N0Mk+20i76AMaG+4XfgA88jIX/xxFe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxKOuBNl9qJZMFAA--.22163S3;
	Tue, 21 Jul 2026 17:06:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxb8d_Nl9qdssTAA--.39236S3;
	Tue, 21 Jul 2026 17:06:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 1/2] LoongArch: Expand module virtual address space to 2GB
Date: Tue, 21 Jul 2026 17:06:05 +0800
Message-ID: <20260721090606.8982-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxb8d_Nl9qdssTAA--.39236S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF13Xw18ur4UXw4fJFyUtwc_yoW8Ar4UpF
	sxC3s8tFW8Wr1fCFWvywsrWF1aya97GFWIga15Wry8Cr9xW3WkXFs7t3s8XFykZan7C3WI
	vFyS9w13ZaykA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcZXoDUUUU

The current 256MB module virtual address space is easily exhausted
when loading massive graphics drivers such as amdgpu along with the
large unstripped symbol tables, resulting in allocation failures of
"execmem: unable to allocate memory".

Thus, expand the module virtual address space to 2GB while keeping
the current normal code model '-mcmodel=normal', rather than using
the medium code model '-mcmodel=medium'. This approach avoids the
extra performance overhead and larger binary size of forcing every
function call into a 2-instruction sequence of 'pcaddu18i + jirl'.

Given that individual module code segments rarely exceed 128MB, most
jumps remain fast direct calls by using the bl instruction. For the
long-distance jumps exceeding the 128MB limit, apply_r_larch_b26()
emits PLT entries, while signed_imm_check() guarantees the run-time
safety by rejecting any out-of-bound instruction offsets.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 223528c04d73..e5952ecd6a73 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -96,7 +96,7 @@ struct vm_area_struct;
 #ifdef CONFIG_64BIT
 
 #define MODULES_VADDR	(vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
-#define MODULES_END	(MODULES_VADDR + SZ_256M)
+#define MODULES_END	(MODULES_VADDR + SZ_2G)
 
 #ifdef CONFIG_KFENCE
 #define KFENCE_AREA_SIZE	(((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
-- 
2.42.0

