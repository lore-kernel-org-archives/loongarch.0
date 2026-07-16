Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFA371041
	for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 03:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170979; cv=none; b=jUsWWBvcVwucLe6XunKNivRgjlLckAcay7qSvLShjNBPcY5r+9XxAvuBjyRNtQfqz7cITTFafEZ8QEowE8iWw5cgkk1QdjJD6L/wxQV7ldM+KnTEYxEo66iBHrqu1X2mN6rP61ce6WlcU6nZFWPQ2F++WlaKWcoh/18jz0NeCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170979; c=relaxed/simple;
	bh=yQCNIPOnKrnUN6v5gjCht54sVgN3yqAMWNrWixGDIBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgRDycWCykoDPqVErmpqWJ8niZgqhX2KHN8SujQcw2o0z7waFVinwaH2FFA0hS+12rEXf2ERPwS5X1uF8h6L7/O2dQWwO6jWwhgUmZvcCu8DQwENnlW4OyiKxGymLArIryoGU23moOwwDGgBvU00EZI8LB3aV/CWbZftslT9Vgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d544c4ae80c211f1aa26b74ffac11d73-20260716
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED
	SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cb35130e-344c-41f8-835f-3928002b64e5,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:cb35130e-344c-41f8-835f-3928002b64e5,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:07a2311b519b5d7fb1217d200017d27b,BulkI
	D:2607161102537R31B0MQ,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|865
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d544c4ae80c211f1aa26b74ffac11d73-20260716
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 378791220; Thu, 16 Jul 2026 11:02:51 +0800
From: Song Hu <husong@kylinos.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	husong@kylinos.cn
Subject: [PATCH] LoongArch: fix silent hang on kernel exec into an NX page
Date: Thu, 16 Jul 2026 11:02:24 +0800
Message-ID: <20260716030224.1696408-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spurious_fault() returns 1 for any non-write fault on a present page
without checking the access permission, so a kernel instruction fetch into
a present NX page (TLBNX) is treated as spurious and the faulting
instruction re-executes forever -- a silent hang that bypasses
fixup_exception() and the oops path.

Recover the access type from the exception code: an exec fault (TLBNX) is
spurious only if the page is executable, a read fault only if it is
readable.  Fold the pmd/pte check together and add pud_leaf/p4d_leaf.

Fixes: 09cfefb7fa70c ("LoongArch: Add memory management")
Signed-off-by: Song Hu <husong@kylinos.cn>
---
 arch/loongarch/mm/fault.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 2c93d33356e5..591a9c7060f2 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -38,6 +38,7 @@ static int __kprobes spurious_fault(unsigned long write, unsigned long address)
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned long prot;
 
 	if (!(address & __UA_LIMIT))
 		return 0;
@@ -58,15 +59,30 @@ static int __kprobes spurious_fault(unsigned long write, unsigned long address)
 	if (!pmd_present(pmdp_get(pmd)))
 		return 0;
 
-	if (pmd_leaf(*pmd)) {
-		return write ? pmd_write(pmdp_get(pmd)) : 1;
+	if (p4d_leaf(p4dp_get(p4d))) {
+		prot = p4d_val(p4dp_get(p4d));
+	} else if (pud_leaf(pudp_get(pud))) {
+		prot = pud_val(pudp_get(pud));
+	} else if (pmd_leaf(*pmd)) {
+		prot = pmd_val(pmdp_get(pmd));
 	} else {
 		pte = pte_offset_kernel(pmd, address);
 		if (!pte_present(ptep_get(pte)))
 			return 0;
-
-		return write ? pte_write(ptep_get(pte)) : 1;
+		prot = pte_val(ptep_get(pte));
 	}
+
+	/*
+	 * The TLB-protect handler passes write=0 for read (TLBNR), exec (TLBNX)
+	 * and privilege (TLBPE) faults alike, so recover the real cause from the
+	 * exception code; otherwise an exec into a present NX page (or a read of
+	 * a NO_READ page) is wrongly treated as spurious and loops forever.
+	 */
+	if (write)
+		return prot & _PAGE_WRITE;
+	if (read_csr_excode() == EXCCODE_TLBNX)
+		return !(prot & _PAGE_NO_EXEC);
+	return !(prot & _PAGE_NO_READ);
 }
 
 static void __kprobes no_context(struct pt_regs *regs,
-- 
2.43.0

