Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B736074D;
	Tue, 24 Mar 2026 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369884; cv=none; b=YAorzG9yg3QXN8MEd6AVRYkHKHaXjbreE2NVrT1zN2YOEMaYSuQqNkPYUeFcI+kt3VfmpxVkOGBlmU2H+g7VVWRrUdLL+Grl+/NYFGUA9ds3Q+y2IzHLT13SS4LTZL0Y3ARL8Z+d3Yb4OChwuvrFOd3GuKwezfWpbgeGLEIUgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369884; c=relaxed/simple;
	bh=yn2nBBvGUP4VCIrQE/ORrl6ivc1Oe5X0ZlBpwgBoEKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pJ0Z2yBakdzJneEiqLmKwgcqTKOp39nl0HGhTm8dwjX0chvMp45n4XyxUOJIITqJ+D2Ucb0IguLmi4iKPxYMIp5qZuodaptUoyNJTTq9GcoUW7PJ7568iRItjbeGvwqq902Pt+5ySJc7NzkyjWVAmNtIcCPhx0XZ5XpK4tZgN74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0Q0kFNSK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0Q0kFNSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9A5C19424;
	Tue, 24 Mar 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774369883;
	bh=yn2nBBvGUP4VCIrQE/ORrl6ivc1Oe5X0ZlBpwgBoEKI=;
	h=From:To:Cc:Subject:Date:From;
	b=0Q0kFNSK9lmw9I10KjVLh2z4djgLDbUNH0K4NLkwD+1hmCEFwFJ4Ziu8VqEsJJ0x2
	 msfS6GguqPAkyeqFOXib+4OESMr3dqs0uqGkZ66i/EA/+8NcrJvXDm02HT8jD2QI82
	 hqgBL4YxZhD9rqSTbefXtZm59OQTq1qPxFjr4SPM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: loongarch@lists.linux.dev
Cc: arnd@arndb.de,
	jiaxun.yang@flygoat.com,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	stable <stable@kernel.org>
Subject: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
Date: Tue, 24 Mar 2026 17:30:57 +0100
Message-ID: <2026032456-crinkle-washable-96ea@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=yn2nBBvGUP4VCIrQE/ORrl6ivc1Oe5X0ZlBpwgBoEKI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJmH9jjqL7bRfc/qKdh12qDtScC9uWc2b1LTLxWsvvhBa 434DUWTjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiI2UOGmYyJfa8iDRf8874/ 98+Cz18+zec+5cQwP3rb65+vVZ+t873+Qdlmgtq71UUT/gAA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The LoongArch syscall number is directly controlled by userspace, but
does not have a array_index_nospec() boundry to prevent access past the
syscall function pointer tables.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Assisted-by: gkh_clanker_2000
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
My scripts caught this as I think LoongArch is vulnerable to the
old-style Spectre 1 issues, but I couldn't find where it was addressed
in the syscall path.  Did I just miss it somewhere, or is this patch
still needed?

 arch/loongarch/kernel/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index 1249d82c1cd0..f2c98bbafce3 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -8,6 +8,7 @@
 #include <linux/capability.h>
 #include <linux/entry-common.h>
 #include <linux/errno.h>
+#include <linux/nospec.h>
 #include <linux/linkage.h>
 #include <linux/objtool.h>
 #include <linux/randomize_kstack.h>
@@ -74,6 +75,7 @@ void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
 	add_random_kstack_offset();
 
 	if (nr < NR_syscalls) {
+		nr = array_index_nospec(nr, NR_syscalls);
 		syscall_fn = sys_call_table[nr];
 		regs->regs[4] = syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
 					   regs->regs[7], regs->regs[8], regs->regs[9]);
-- 
2.53.0

