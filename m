Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BEB13D891
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762487898; cv=none; b=SGTiBpSmLDeL6XclMw88LVlCO5fyzbG5HRzSNCRJN17yqRSPXfgVwVPsZNEWdOQVcv+tPdk4pFcble0379w3ihrvJE1NbzysTrQ085xzML0BCHq2wG+RVJHp6XJamMmFRf80sJFgsPoBWd3kADUDo9eRC2xhq65HeAurVZYIzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762487898; c=relaxed/simple;
	bh=PXrE+deCMowO9AFWIGSKYMU86NoDQh1TE8UqdrIAGWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7DPAeL+PdKodY5yeUjY3zC7739T1ExwhJFAYmMSs0SfJ+PjOK3ZDNq2TOGEON5Hskyg6qc2Y82alsvwGjQd8HbvdgAtc2vIXwjSlhgMBYE8lZcIBf2yqyi588K0RPKx2rdYEfDPg98ID7f9O/VExlhGbN8tiJlf8l5ePKtazMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8Bxnr9Pbg1pEx8gAA--.2467S3;
	Fri, 07 Nov 2025 11:58:07 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDxQ+RObg1pVHgqAQ--.1001S2;
	Fri, 07 Nov 2025 11:58:06 +0800 (CST)
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
Subject: [PATCH v2] LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY
Date: Fri,  7 Nov 2025 11:58:05 +0800
Message-ID: <20251107035805.3094024-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+RObg1pVHgqAQ--.1001S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFW8uw1rtryfCrW8Zw45CFX_yoW8Wry7pF
	s7AFykua1rKF1xAay3GF13Xr13AwsrGFn7GrnFkF1kGasIq3yUXrW8Krn8AFyrXay8Za48
	XrsYgw45WF47AwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Now, if the pte is dirty _PAGE_DIRTY but without _PAGE_MODIFIED, after
pte_modify() we lose _PAGE_DIRTY, then pte_dirty() returns false. So
we need _PAGE_MODIFIED to record _PAGE_DIRTY here.

The new modification involves checking whether the original PTE has the
_PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
that the pte_dirty interface can return accurate information.

Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index bd128696e96d..e0b92fe850b3 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -424,6 +424,9 @@ static inline unsigned long pte_accessible(struct mm_struct *mm, pte_t a)
 
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
+	if (pte_val(pte) & _PAGE_DIRTY)
+		pte_val(pte) |= _PAGE_MODIFIED;
+
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
 		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
 }
@@ -547,6 +550,9 @@ static inline struct page *pmd_page(pmd_t pmd)
 
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
+	if (pmd_val(pmd) & _PAGE_DIRTY)
+		pmd_val(pmd) |= _PAGE_MODIFIED;
+
 	pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
 				(pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
 	return pmd;
-- 
2.41.0

