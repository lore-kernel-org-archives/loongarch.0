Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF435CB6A
	for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 02:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688279; cv=none; b=dRCP/RkiY41/cxteoM04KsxTHsI2G1LNL5e7FKSXW/VpZTtzW02tykbr54mptktYy0aGhY1W2MsPFnpG84kgG1c2pKnzQES+6jTsKV3cHK4QAC+s9Vk7prc1MLFsUBBogrb5Z9643VhOvgVjOWeK2DYkMog2RJ6HX5rKa5lIqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688279; c=relaxed/simple;
	bh=BJ0IKsBgLgz3JUgDxXySZluvJltGvsDIOfbrMpb1WoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQbduDFrEtvT2kiV40ltEBvAs0zAEyPgkq73OJMd+cHJllkZR2QOgeX95y2M5k1A+/9Nr46s7QGa3R/h4xmDEvnYVrJjXerQpPN+jJG7Fj7OSkyJ0ZxnXDyydbRdQ7xR+me0pEhDwkqk4fOM8oh1CdtuJ1HQPUinyW4CGgJx9nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G+HCaCRt; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G+HCaCRt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784688275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbRfHugWJGRkfrsPXZfeFa5Uuh+s7ST/lFxt/I3r+1Q=;
	b=G+HCaCRtxOSPrHT+5pNlkW6NFdYKvKLMm4b5976XKa41yGMMLSl1iipW/F8HJmREtXfurx
	j7VQjgm27SsCF8NWVxPO4VqnrSicGXMXlR5XzgNSN3JAZlwp6tMNs9flIcVnZaJ2h+6ijP
	jJKY7XcpKNTfunhsnMhHCEISL0q4xfI=
From: haoran.jiang@linux.dev
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yangtiezhu@loongson.cn,
	pjw@kernel.org,
	palmer@dabbelt.com,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH] LoongArch: Fix oops during single-step debugging
Date: Wed, 22 Jul 2026 10:44:09 +0800
Message-Id: <20260722024409.158142-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

When entering KDB via a breakpoint and then performing
single-step debugging,an oops is triggered.During
single-step debugging, kdb_local() expects the reason
to be KDB_REASON_SSTEP, but it is actually KDB_REASON_OOPS.
In kdb_stub(), when determining the reason, the ex_vector for
single-step should be 0, as already implemented on other
architectures such as arm64 and riscv.

Before the patch:
[112]kdb> ss

Entering kdb (current=0x900020009f520000, pid 10661) on
processor 112 Oops: (null)
due to oops @ 0x90000000005b57a4

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
---
 arch/loongarch/kernel/kgdb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
index 17664a6043b1..ed39f5cee9da 100644
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -252,7 +252,8 @@ static int kgdb_loongarch_notify(struct notifier_block *self, unsigned long cmd,
 	if (atomic_read(&kgdb_active) != -1)
 		kgdb_nmicallback(smp_processor_id(), regs);
 
-	if (kgdb_handle_exception(args->trapnr, args->signr, cmd, regs))
+	if (kgdb_handle_exception((regs->csr_era == stepped_address ? 0 : args->trapnr),
+				args->signr, cmd, regs))
 		return NOTIFY_DONE;
 
 	if (atomic_read(&kgdb_setting_breakpoint))
-- 
2.43.0

