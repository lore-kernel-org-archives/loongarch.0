Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7016A395
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064707; cv=none; b=p1DH9/pu5AC4zncufcsOClENoY+k8gr9ILYOdj7EBadK/NBonaoS7rbFlW6qso+TNQQScDEMmOWjHCil7lzFUtbfOVval7HGxtMj4S7+ObA4jbTvoZ/Pp/m+M0EaASS1/vKbLGAXC5Ka6+rkCYMSQzZI4jbV5qkRt97UGipqbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064707; c=relaxed/simple;
	bh=n1kGV6WpmQcZbO0VPSlilB0UhV5iiSEmokXmy5caMNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiHQz0xmpktDcqv3jnqRckRtX3ZtlAWy5m6arjeTnOk5JF3zgRjrVb5p6ZnYUNLG6jBQ7YySsyv9tdvYo1zn4PpUBaiSyuZIi4psThuZ9HHOZg24Ptnd2L5sDOgRq7bcBi09r83e74XlkHzrUHXDwVWk6S+A5S+ObjFZWxDaQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 450bb486c9e511f0a38c85956e01ac42-20251125
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED
	SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:70d965af-1493-451b-b76d-2405cd05909f,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:70d965af-1493-451b-b76d-2405cd05909f,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:1335b17ab73d1136a2a5b6f76db14da7,BulkI
	D:251125175820DMKWCLFD,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	850|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 450bb486c9e511f0a38c85956e01ac42-20251125
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1144435812; Tue, 25 Nov 2025 17:58:19 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: yangtiezhu@loongson.cn,
	zhangtianyang@loongson.cn,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	duanchenghao@kylinos.cn
Subject: [PATCH] LoongArch: Change the signal return for user-mode ADE exceptions
Date: Tue, 25 Nov 2025 17:57:58 +0800
Message-Id: <20251125095758.1345956-1-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a user-mode process accesses an invalid address, the SIGSEGV signal
is returned.
For example, when user-space accesses a kernel-space virtual address.

Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
---
 arch/loongarch/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index da5926fead4a..508d3126cdb2 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -537,7 +537,7 @@ asmlinkage void noinstr do_ade(struct pt_regs *regs)
 	irqentry_state_t state = irqentry_enter(regs);
 
 	die_if_kernel("Kernel ade access", regs);
-	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)regs->csr_badvaddr);
+	force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)regs->csr_badvaddr);
 
 	irqentry_exit(regs, state);
 }
-- 
2.25.1

