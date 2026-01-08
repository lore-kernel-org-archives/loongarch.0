Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4A433BF8;
	Thu,  8 Jan 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868922; cv=none; b=hlPv+zV9HPOt0VkSpKg26Dtd88onpB1InL4D9JecNe2Wm7qQ+zh5bwpQwMSBUHjZrdBiTD5ZikifF8utjGF6N3QWcjc+NPBBxIGgJgVtdfTjnfA0mNqBIBInAcMex1O7HKzvrO44jvDQlrg2ZCt45N+NJWMnTMg0h95VPH1ZHqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868922; c=relaxed/simple;
	bh=rgFzpJ8fVkHaTvat56wDu/P4LKyj8XcLcivT8LTqPA8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=skWhJjBifoKU+Hn6NExrXBUtMpWQW6nyZgEZVUXsA1R9Xd8gEppPpvrr4hMFDJ35q9SpvhFZJL1w3PoZdH6p1pmmsCGnsPvfkOM1aUdI2qRe0THbob3YWLc4iYN0ylIkxolw8mD9Fm122n1Dg+dlVwcDv5hECVTA2vLvgSEnkHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G+BR0aHs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G+BR0aHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360CBC116C6;
	Thu,  8 Jan 2026 10:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767868921;
	bh=rgFzpJ8fVkHaTvat56wDu/P4LKyj8XcLcivT8LTqPA8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=G+BR0aHsyWgqqa+qUgGc+SSvyUTVsmsy5ms+VKSGxE/IB4rexrGlbTSTDoJjjDuT2
	 FXB9RhNU3g0m/8OkrZfXxi+xGah375SJ7fg5wWkm/5ZQgD50gPGEZYZmTGCwto/DVi
	 NtatrqfhbqaWeFsLFacyFpZoFqSdArpwnWXfhkLM=
Subject: Patch "LoongArch: Refactor register restoration in ftrace_common_return" has been added to the 6.6-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,duanchenghao@kylinos.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 11:40:50 +0100
In-Reply-To: <20260106031300.961198-1-chenhuacai@loongson.cn>
Message-ID: <2026010850-backroom-faceless-cb27@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    LoongArch: Refactor register restoration in ftrace_common_return

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-refactor-register-restoration-in-ftrace_common_return.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-205031-greg=kroah.com@vger.kernel.org Tue Jan  6 04:16:59 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Tue,  6 Jan 2026 11:13:00 +0800
Subject: LoongArch: Refactor register restoration in ftrace_common_return
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Chenghao Duan <duanchenghao@kylinos.cn>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20260106031300.961198-1-chenhuacai@loongson.cn>

From: Chenghao Duan <duanchenghao@kylinos.cn>

commit 45cb47c628dfbd1994c619f3eac271a780602826 upstream.

Refactor the register restoration sequence in the ftrace_common_return
function to clearly distinguish between the logic of normal returns and
direct call returns in function tracing scenarios. The logic is as
follows:

1. In the case of a normal return, the execution flow returns to the
traced function, and ftrace must ensure that the register data is
consistent with the state when the function was entered.

ra = parent return address; t0 = traced function return address.

2. In the case of a direct call return, the execution flow jumps to the
custom trampoline function, and ftrace must ensure that the register
data is consistent with the state when ftrace was entered.

ra = traced function return address; t0 = parent return address.

Cc: stable@vger.kernel.org
Fixes: 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/kernel/mcount_dyn.S |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

--- a/arch/loongarch/kernel/mcount_dyn.S
+++ b/arch/loongarch/kernel/mcount_dyn.S
@@ -93,7 +93,6 @@ SYM_INNER_LABEL(ftrace_graph_call, SYM_L
  * at the callsite, so there is no need to restore the T series regs.
  */
 ftrace_common_return:
-	PTR_L		ra, sp, PT_R1
 	PTR_L		a0, sp, PT_R4
 	PTR_L		a1, sp, PT_R5
 	PTR_L		a2, sp, PT_R6
@@ -103,12 +102,17 @@ ftrace_common_return:
 	PTR_L		a6, sp, PT_R10
 	PTR_L		a7, sp, PT_R11
 	PTR_L		fp, sp, PT_R22
-	PTR_L		t0, sp, PT_ERA
 	PTR_L		t1, sp, PT_R13
-	PTR_ADDI	sp, sp, PT_SIZE
 	bnez		t1, .Ldirect
+
+	PTR_L		ra, sp, PT_R1
+	PTR_L		t0, sp, PT_ERA
+	PTR_ADDI	sp, sp, PT_SIZE
 	jr		t0
 .Ldirect:
+	PTR_L		t0, sp, PT_R1
+	PTR_L		ra, sp, PT_ERA
+	PTR_ADDI	sp, sp, PT_SIZE
 	jr		t1
 SYM_CODE_END(ftrace_common)
 
@@ -155,6 +159,8 @@ SYM_CODE_END(return_to_handler)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 SYM_CODE_START(ftrace_stub_direct_tramp)
-	jr		t0
+	move		t1, ra
+	move		ra, t0
+	jr		t1
 SYM_CODE_END(ftrace_stub_direct_tramp)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.6/loongarch-use-__pmd-__pte-for-swap-entry-conversions.patch
queue-6.6/loongarch-refactor-register-restoration-in-ftrace_common_return.patch
queue-6.6/loongarch-correct-the-calculation-logic-of-thread_count.patch
queue-6.6/loongarch-add-new-pci-id-for-pci_fixup_vgadev.patch
queue-6.6/loongarch-bpf-zero-extend-bpf_tail_call-index.patch
queue-6.6/loongarch-mask-all-interrupts-during-kexec-kdump.patch
queue-6.6/loongarch-fix-build-errors-for-config_randstruct.patch
queue-6.6/samples-ftrace-adjust-loongarch-register-restore-order-in-direct-calls.patch
queue-6.6/loongarch-bpf-sign-extend-kfunc-call-arguments.patch
queue-6.6/loongarch-use-unsigned-long-for-_end-and-_text.patch
queue-6.6/loongarch-add-machine_kexec_mask_interrupts-implementation.patch
