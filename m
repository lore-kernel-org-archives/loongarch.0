Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC9F273F9;
	Tue,  6 Jan 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709414; cv=none; b=oSY2ptkipunQJ91RBnB4BwQYauhUA/pSMjzOFIpnRIxawd4klUoZnxWMGQkm4+qln304tZG84UwvMWSyhNHEIXHCEgphpn8tcWNnhMqODQMWz4GN97syI1jxneH2JI9CW21qIWGZ5FexphVUBNLuse9skdx4K755cqUi6a+XdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709414; c=relaxed/simple;
	bh=WXQx7n/64It6G/tx4LjmovhM5OD7byHIWCCOHwUe5Yc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=YyPZvnKMvTKk3t6cuP/HW//RXHCxLHRxyJd9lgg5d6Nkfi43Fg7/2ENPKyXEZZPWi7FywUMHsTrQrzn84z2uMJBwCZ4yypPm4fCtVwrzeRETiQoBFR5q6VBrWaFbz074oad/s0fePNtiQa0OHsA8ZTpIgNyISPa//dEpWU0qA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tK7zmpCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tK7zmpCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D85C116C6;
	Tue,  6 Jan 2026 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767709413;
	bh=WXQx7n/64It6G/tx4LjmovhM5OD7byHIWCCOHwUe5Yc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=tK7zmpCJ/bAbuk1bRPR5oPOpa1+BLYnw2x0VvPOLtsTtWEAbNKL6QVWXG2AFKwgRh
	 3URSbHoadWp2QdJG+CoSRaJp8mhEp3tCrD+1MagpDLTi/PAbaDAC3BafupNnOOWv6w
	 rlSznaTRA01qTbubgibNYlKdqLqkUeRcrYxZQ6Hw=
Subject: Patch "LoongArch: BPF: Enhance the bpf_arch_text_poke() function" has been added to the 6.18-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,duanchenghao@kylinos.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 06 Jan 2026 15:23:30 +0100
In-Reply-To: <20260106025502.951868-1-chenhuacai@loongson.cn>
Message-ID: <2026010630-linguini-alone-bebe@gregkh>
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

    LoongArch: BPF: Enhance the bpf_arch_text_poke() function

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-bpf-enhance-the-bpf_arch_text_poke-function.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-205029-greg=kroah.com@vger.kernel.org Tue Jan  6 03:55:40 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Tue,  6 Jan 2026 10:55:02 +0800
Subject: LoongArch: BPF: Enhance the bpf_arch_text_poke() function
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Chenghao Duan <duanchenghao@kylinos.cn>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20260106025502.951868-1-chenhuacai@loongson.cn>

From: Chenghao Duan <duanchenghao@kylinos.cn>

commit 73721d8676771c6c7b06d4e636cc053fc76afefd upstream.

Enhance the bpf_arch_text_poke() function to enable accurate location
of BPF program entry points.

When modifying the entry point of a BPF program, skip the "move t0, ra"
instruction to ensure the correct logic and copy of the jump address.

Cc: stable@vger.kernel.org
Fixes: 677e6123e3d2 ("LoongArch: BPF: Disable trampoline for kernel module function trace")
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/net/bpf_jit.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1307,6 +1307,10 @@ int bpf_arch_text_poke(void *ip, enum bp
 		       void *old_addr, void *new_addr)
 {
 	int ret;
+	unsigned long size = 0;
+	unsigned long offset = 0;
+	void *image = NULL;
+	char namebuf[KSYM_NAME_LEN];
 	bool is_call = (poke_type == BPF_MOD_CALL);
 	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
@@ -1314,9 +1318,20 @@ int bpf_arch_text_poke(void *ip, enum bp
 	/* Only poking bpf text is supported. Since kernel function entry
 	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
 	 */
-	if (!is_bpf_text_address((unsigned long)ip))
+	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
 		return -ENOTSUPP;
 
+	image = ip - offset;
+
+	/* zero offset means we're poking bpf prog entry */
+	if (offset == 0) {
+		/* skip to the nop instruction in bpf prog entry:
+		 * move t0, ra
+		 * nop
+		 */
+		ip = image + LOONGARCH_INSN_SIZE;
+	}
+
 	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
 	if (ret)
 		return ret;


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.18/loongarch-bpf-enable-trampoline-based-tracing-for-module-functions.patch
queue-6.18/loongarch-use-__pmd-__pte-for-swap-entry-conversions.patch
queue-6.18/loongarch-refactor-register-restoration-in-ftrace_common_return.patch
queue-6.18/loongarch-bpf-enhance-the-bpf_arch_text_poke-function.patch
queue-6.18/loongarch-bpf-adjust-the-jump-offset-of-tail-calls.patch
queue-6.18/loongarch-correct-the-calculation-logic-of-thread_count.patch
queue-6.18/loongarch-add-new-pci-id-for-pci_fixup_vgadev.patch
queue-6.18/loongarch-fix-arch_dup_task_struct-for-config_randstruct.patch
queue-6.18/loongarch-bpf-zero-extend-bpf_tail_call-index.patch
queue-6.18/loongarch-bpf-save-return-address-register-ra-to-t0-before-trampoline.patch
queue-6.18/loongarch-fix-build-errors-for-config_randstruct.patch
queue-6.18/samples-ftrace-adjust-loongarch-register-restore-order-in-direct-calls.patch
queue-6.18/loongarch-bpf-sign-extend-kfunc-call-arguments.patch
queue-6.18/loongarch-use-unsigned-long-for-_end-and-_text.patch
