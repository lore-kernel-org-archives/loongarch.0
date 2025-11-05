Received: from smtps.ntu.edu.tw (smtps.ntu.edu.tw [140.112.2.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE441CAA6C
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 05:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.112.2.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762320474; cv=none; b=AhzPEgCOebD6nEzt1s3Ub4RHKjFQKO+aI7/1rZR+N6fhW+SeF/X1+Q/Gda6vb+Aj0lQA+HAnJSjYXcvfRvV9ThxTMJx1EuuSllfZiiS899MbsMMTcZzwB+qi4n7wYfJY6bYjMxeFdJrtqYTHLL9gTMMRraJWjL45v38dPXdI9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762320474; c=relaxed/simple;
	bh=9c2BMqJuhx1IaP9qMLxc2QvyeAVWck9b8Fg5dSSv9Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKu8v7uMMkjlkEc/Q1a0/STMXx+qWtzREwTjIhPofbw7oRrcOtUmnZNNsLo5J73zxCpGQIBrhGGFtjDfQY/8zqTCSCRmtremgHbwar3ByX6NJI1etAZuSz4L9lp8oTjjq3mhZLLLZwy6L9Z5yLG6DPu1aTtmb9ubhgl+R58ixuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw; spf=pass smtp.mailfrom=ntu.edu.tw; arc=none smtp.client-ip=140.112.2.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ntu.edu.tw
Received: from x415ea.. (unknown [101.12.130.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id A2260320A2;
	Wed,  5 Nov 2025 13:27:45 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: chenhuacai@kernel.org
Cc: yangtiezhu@loongson.cn,
	oleg@redhat.com,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v2] LoongArch: ptrace: Merge ptrace_hbp_set_*()
Date: Wed,  5 Nov 2025 13:27:24 +0800
Message-ID: <20251105052724.5994-1-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029153649.33345-1-b10902118@ntu.edu.tw>
References: <20251029153649.33345-1-b10902118@ntu.edu.tw>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hw_break_set(), those functions actually can be combined into one.
This eliminates intermediate calls to modify_user_hw_breakpoint() that
may leave hardware registers in a partially updated state.

This is a refactor only; no functional change.

Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
---
 arch/loongarch/kernel/ptrace.c | 69 +++++++++-------------------------
 1 file changed, 17 insertions(+), 52 deletions(-)

diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 8edd0954e55a..c6cd51569a64 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -581,13 +581,15 @@ static int ptrace_hbp_get_addr(unsigned int note_type,
 	return 0;
 }
 
-static int ptrace_hbp_set_ctrl(unsigned int note_type,
+static int ptrace_hbp_set(unsigned int note_type,
 			       struct task_struct *tsk,
-			       unsigned long idx, u32 uctrl)
+			       unsigned long idx, u64 addr,
+				   u64 mask, u32 uctrl)
 {
 	int err;
 	struct perf_event *bp;
 	struct perf_event_attr attr;
+	struct arch_hw_breakpoint *info;
 	struct arch_hw_breakpoint_ctrl ctrl;
 	struct thread_info *ti = task_thread_info(tsk);
 
@@ -597,6 +599,17 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 
 	attr = bp->attr;
 
+	/* addr */
+	/* Kernel-space address cannot be monitored by user-space */
+	if ((unsigned long)addr >= XKPRANGE)
+		return -EINVAL;
+	attr.bp_addr = addr;
+
+	/* mask */
+	info = counter_arch_bp(bp);
+	info->mask = mask;
+
+	/* ctrl */
 	switch (note_type) {
 	case NT_LOONGARCH_HW_BREAK:
 		ctrl.type = LOONGARCH_BREAKPOINT_EXECUTE;
@@ -623,46 +636,6 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 	return modify_user_hw_breakpoint(bp, &attr);
 }
 
-static int ptrace_hbp_set_mask(unsigned int note_type,
-			       struct task_struct *tsk,
-			       unsigned long idx, u64 mask)
-{
-	struct perf_event *bp;
-	struct perf_event_attr attr;
-	struct arch_hw_breakpoint *info;
-
-	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
-	if (IS_ERR(bp))
-		return PTR_ERR(bp);
-
-	attr = bp->attr;
-	info = counter_arch_bp(bp);
-	info->mask = mask;
-
-	return modify_user_hw_breakpoint(bp, &attr);
-}
-
-static int ptrace_hbp_set_addr(unsigned int note_type,
-			       struct task_struct *tsk,
-			       unsigned long idx, u64 addr)
-{
-	struct perf_event *bp;
-	struct perf_event_attr attr;
-
-	/* Kernel-space address cannot be monitored by user-space */
-	if ((unsigned long)addr >= XKPRANGE)
-		return -EINVAL;
-
-	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
-	if (IS_ERR(bp))
-		return PTR_ERR(bp);
-
-	attr = bp->attr;
-	attr.bp_addr = addr;
-
-	return modify_user_hw_breakpoint(bp, &attr);
-}
-
 #define PTRACE_HBP_ADDR_SZ	sizeof(u64)
 #define PTRACE_HBP_MASK_SZ	sizeof(u64)
 #define PTRACE_HBP_CTRL_SZ	sizeof(u32)
@@ -733,10 +706,6 @@ static int hw_break_set(struct task_struct *target,
 					 offset, offset + PTRACE_HBP_ADDR_SZ);
 		if (ret)
 			return ret;
-
-		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
-		if (ret)
-			return ret;
 		offset += PTRACE_HBP_ADDR_SZ;
 
 		if (!count)
@@ -746,21 +715,17 @@ static int hw_break_set(struct task_struct *target,
 					 offset, offset + PTRACE_HBP_MASK_SZ);
 		if (ret)
 			return ret;
-
-		ret = ptrace_hbp_set_mask(note_type, target, idx, mask);
-		if (ret)
-			return ret;
 		offset += PTRACE_HBP_MASK_SZ;
 
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl,
 					 offset, offset + PTRACE_HBP_CTRL_SZ);
 		if (ret)
 			return ret;
+		offset += PTRACE_HBP_CTRL_SZ;
 
-		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
+		ret = ptrace_hbp_set(note_type, target, idx, addr, mask, ctrl);
 		if (ret)
 			return ret;
-		offset += PTRACE_HBP_CTRL_SZ;
 
 		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
 					  offset, offset + PTRACE_HBP_PAD_SZ);
-- 
2.51.0

