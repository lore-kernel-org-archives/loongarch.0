Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDA032B118
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275047; cv=none; b=PvGDTbSY7e94Ic5p1M2iEnW4p5T4kHeegAVV+XXNtfsv5QJRHw8ALRHYRNmu72rMnoaIztw7BfnO+fCUVM2sH6KPbzhtVQn5+nwk4Rv1B+wp95OVk0anbepKKHKlDx5risVrWlF/QlBXDUGpNv1YEtAPg8yvfVvuzQGya7yi+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275047; c=relaxed/simple;
	bh=ym+ZvLteeJXRkmKHdlqOSEVJpCko5cWQOCUxXgmJOko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3k4zjAx1Ka430j2aRb6Kr+V7u8yu8wiXRolA601w7a7q6P+8LPPhXak8gSdNsc84/QbLn+T69pieB6jSvk/oEtI+Yf7CJcD2KJfpa88ie3iMNrcO4r26YraHaec8CX9E+zeIp83c/dqKNPVdUosxoqZWNQol1vvkl03p0Nm9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx5+pj4FlqGnsEAA--.17841S3;
	Fri, 17 Jul 2026 15:57:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxq8Rc4FlqDNUPAA--.25915S4;
	Fri, 17 Jul 2026 15:57:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] LoongArch: mm: Expand modules virtual address space to 2GB
Date: Fri, 17 Jul 2026 15:57:15 +0800
Message-ID: <20260717075715.25513-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260717075715.25513-1-yangtiezhu@loongson.cn>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxq8Rc4FlqDNUPAA--.25915S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uryfuFWkuw1rJr1fZFyxZwc_yoW8Xr43pF
	WDAr9YyrW8Wr1SyaykXwnxWr1Yva93GrZIgw4rWr18AF9Iv3WDZr4kX3W3ZF18Xa93KFyx
	XFyI9w4ava4DJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8XyCJUUUUU==

Frequent "execmem: unable to allocate memory" warnings are observed
during kernel module loading when updating the latest kernel.

This is because the modules virtual address region on LoongArch is
tightly constrained to 256MB, while ARM64 and RISC-V are natively
configured with a spacious 2GB region.

Expand the modules virtual address space to 2GB for LoongArch to
eliminate these allocation bottlenecks.

This change only applies to 64-bit kernels (CONFIG_64BIT), 32-bit
kernels (CONFIG_32BIT) are entirely unaffected since they do not
define separate module address regions.

With this patch, there are no "execmem: unable to allocate memory"
warnings anymore for 64-bit kernels.

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

