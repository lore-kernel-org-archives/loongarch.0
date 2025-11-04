Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953DF306B3F
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241417; cv=none; b=mGd1mmjwz0KU9qbCi03iq+L26r8vCya67b7T0VSyfy0qao0iXNtNKHtPoerg4N+TL8PzdhTNEZRzvxKaAyXtl1oqxxjpfMByFyhFwi4ri84n6xIYfZ4qbo0TC72jCn3UVjxBwUFjUp+P5Du8oWbcRTvqzXXEYShzF+EyrlrxWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241417; c=relaxed/simple;
	bh=4qu48qG7YL4eZS1i6WIUe1h73DZmFPEKiZYJlND7Mn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lK5e4m5WUedqhu2kDpf7vhw9ulJhK0Yt0PSuV2B2k3OzcZIiUX/g4W3yNhBBqu1WldpxaaQBlBRkKYFbaJqMVWxLKZAkzM5/iSgk4IbfuCBIXQ5Xao1ttgS5d/cTtlwh2SRlgGzn0hkTMtZIIp9e8S+BUOeim7FwKFmavOonKqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8CxK9KCqwlpr5keAA--.64341S3;
	Tue, 04 Nov 2025 15:30:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJAxfcGBqwlpo+MlAQ--.61910S2;
	Tue, 04 Nov 2025 15:30:09 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com,
	linmag7@gmail.com,
	thuth@redhat.com,
	maobibo@loongson.cn,
	apopple@nvidia.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>
Subject: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
Date: Tue,  4 Nov 2025 15:30:06 +0800
Message-ID: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxfcGBqwlpo+MlAQ--.61910S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWftFWkAFyxAw1xWw47KFX_yoW8Zr4UpF
	s7CF9Yvay5Kr1xZay3JF17Xr15AwsrGas7J3sFk3WkG3Wqq3yjqr1xKwn8Zr1rXay8Zr18
	X3yFgw45WF4UJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
this could lead to loss of valid data in certain scenarios.

The new modification involves checking whether the original PTE has the
_PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
that the pte_dirty interface can return accurate information.

Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index bd128696e96d..106abfa5183b 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -424,8 +424,13 @@ static inline unsigned long pte_accessible(struct mm_struct *mm, pte_t a)
 
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-	return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
-		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
+	unsigned long val = (pte_val(pte) & _PAGE_CHG_MASK) |
+		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
+
+	if (pte_val(pte) & _PAGE_DIRTY)
+		val |= _PAGE_MODIFIED;
+
+	return __pte(val);
 }
 
 extern void __update_tlb(struct vm_area_struct *vma,
@@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
 
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
-	pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
+	unsigned long val = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
 				(pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
-	return pmd;
+
+	if (pmd_val(pmd) & _PAGE_DIRTY)
+		val |= _PAGE_MODIFIED;
+
+	return __pmd(val);
 }
 
 static inline pmd_t pmd_mkinvalid(pmd_t pmd)
-- 
2.41.0

