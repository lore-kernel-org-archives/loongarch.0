Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E172222D0
	for <loongarch@lists.linux.dev>; Sun, 23 Aug 2026 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787519955; cv=none; b=IdAlr99/9+a7jKrHMqr/uE9Zvl9pcbc4PjMhFhF75ez1FubYG39WvODHGl8vCTQCNYq9EVWgGO8Do5wCLD/Xzm9zg0l3/gY7A/yYrDo9H3qhddtfrapSYDgx869luUbRBGqYNgB77mAsJ5NKjtAt5M9cv9uDow4a8E4Q/SQhEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787519955; c=relaxed/simple;
	bh=a9uUivirqqep2SSyf+0bJ3ogrkz2PPY1AkGPud6qhH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lFD/jOdjHoC87oeC3FohW02/u+dJ73lyfcZpXsYB6CDZsiUQYMR2ssnGxSCOuieqNv1pl8ExoTu129qmGubJ9RYPbdAWiplce5DywfY256kK9bQQUxnzGATU1vmZstZFOgWyB7sR8bCK1/zb1m2bt79QJf4I4krMRqVVUiu8Eyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=blB5dxD5; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="blB5dxD5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/oaiADLDytzNwgjHhlhEarQVcU3S3Tabu4MKpB0nWOA=; b=blB5dxD54tNWHENaTWOiuMDGQl
	kT1AST5fDHd9U1NDaZm2XxR8h/3c2SQBT5qWqijNsHNRtZh05IVhcbMcNI1Yw7kZCDyTOYOE/+I97
	CGYe3Pl8eGbGw4wmrh98/FDJqGgdAFxQOKoMMNXOJBPFepdOvLRgSjDcj20+pd7my8g2CYOf97xjQ
	vcZMmjUHNQqRZ199bjlcmZ/YlpZ0FL0oxIHVfFjSDQoBoWRVf9ju40CWtZw5tSNn7fqIydxohrf6x
	i8/meBW6iX4o9GzEjxV5jFIghLqECsIJLP4k5JKAoXjE8FC4SsGzuZ1SI78nJOEPsBPhL0PmC1cTf
	744DV4/w==;
Received: from [151.115.150.205] (port=39314 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1wyFax-00000007VsN-47hC;
	Sun, 23 Aug 2026 23:19:12 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] LoongArch: kprobes: Avoid preempt count underflow without probe
Date: Sun, 23 Aug 2026 21:18:23 +0000
Message-ID: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

LoongArch uses break 11 for the breakpoint placed after an instruction
that Kprobes executes out of line. Since userspace can issue the same
break instruction, do_bp() can reach kprobe_singlestep_handler() when
there is no current probe.

The handler returns false in this case, but first calls
preempt_enable_no_resched(). The corresponding preempt_disable() is done
by kprobe_breakpoint_handler() on a real Kprobe hit, so it has not run
here. As a result, an ordinary userspace breakpoint underflows the
current task's preempt count.

This also makes in_interrupt() return true until the task schedules. One
visible consequence is socket cgroup attribution: cgroup_sk_alloc()
treats the allocation as interrupt context and assigns the socket to the
root cgroup. A socket opened from the SIGTRAP handler can then avoid a
BPF_CGROUP_INET_SOCK_CREATE policy attached to the task's own cgroup.

Return as soon as kprobe_running() reports no active probe.

The same check appeared in [PATCH v10 2/4] of the original LoongArch
Kprobes series, but was dropped before the feature reached mainline.

Link: https://patchew.org/linux/1670575981-14389-1-git-send-email-yangtiezhu%40loongson.cn/1670575981-14389-3-git-send-email-yangtiezhu%40loongson.cn/
Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Assisted-by: Codex:gpt-5
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
---
 arch/loongarch/kernel/kprobes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 1985ed30dd16f..ddfefea174727 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -275,6 +275,9 @@ bool kprobe_singlestep_handler(struct pt_regs *regs)
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
 	unsigned long addr = instruction_pointer(regs);
 
+	if (!cur)
+		return false;
+
 	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
 	    ((unsigned long)&cur->ainsn.insn[1] == addr)) {
 		restore_local_irqflag(kcb, regs);
-- 
2.47.3

