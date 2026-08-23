Received: from confino.investici.org (confino.investici.org [93.190.126.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67675389105
	for <loongarch@lists.linux.dev>; Sun, 23 Aug 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.190.126.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787520370; cv=none; b=s/Wzdxq3uph5ubYGaIUFRXvDs03iVjhXi1gpRA+bbhv3ScnDq5rMfGVrRQlRd1u1iYhBMRGSmPqUCUskmx9+ReqP63R0wH34vWE6M8QUJb+AkWHfLfFigcoaOzjBmY+bIR+beL6UZk4CwI1bPd1i0dzpwrW5lNbpPhZ6ma9lKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787520370; c=relaxed/simple;
	bh=wKzJWn82fUMqa0HfybNnuPWnwaOuobZfx7MwhVm/d1Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=UW7CE3hckY/m7zZO41jix+jdivEksNm2xPUTXZ4qJAM2BecBb2xBgQkPrxEer/6od/Hj55tRrtNq7ApH49DF9pCHzxOco8V4LJ48CCy/wdVAdB4KC4De0UuPbsllu0IlxXmlz4MDJk0ac2RSSZjSAqyrmtqmnpHZ0QUtGlaF1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=YlBQNxV7; arc=none smtp.client-ip=93.190.126.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="YlBQNxV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1787520363;
	bh=hrch7mC6LGFik4KCSe8XV/PJ0NT7/d+/jraNd/COJOk=;
	h=Date:From:To:CC:Subject:In-Reply-To:From;
	b=YlBQNxV7TjxH5YQv7QppvdgiV6twuWpp9GTuzPNjO+6T8Lorww6af+rtQfJ457g7o
	 YrLv9RhKe3BdAaHjXKo/GSyaG7hegyI/oqgRQ0R0Ff2glnWYHtVfzprCJ9jCpqk4Qc
	 X/tH9b51rx2KvIlUzT/6oYhWZ6yWdUs3gtSWe+yI=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4hSnCb6D9xz10x1;
	Sun, 23 Aug 2026 21:26:03 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4hSnCb1zssz10wc;
	Sun, 23 Aug 2026 21:26:03 +0000 (UTC)
Date: Sun, 23 Aug 2026 22:26:03 +0100
From: Bradley Morgan <include@grrlz.net>
To: jeremy.jean@oss.cyber.gouv.fr
CC: chenhuacai@kernel.org, kernel@xen0n.name, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_LoongArch=3A_kprobes=3A_Avoid?=
 =?US-ASCII?Q?_preempt_count_underflow_without_probe?=
In-Reply-To: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
Message-ID: <C83E8B31-D9CB-4BB7-9DA6-34F789BDCE48@grrlz.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 23 August 2026 22:18:23 BST, "Jérémy Jean"
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>LoongArch uses break 11 for the breakpoint placed after an instruction
>that Kprobes executes out of line. Since userspace can issue the same
>break instruction, do_bp() can reach kprobe_singlestep_handler() when
>there is no current probe.
>

Intresting

>The handler returns false in this case, but first calls
>preempt_enable_no_resched(). The corresponding preempt_disable() is done
>by kprobe_breakpoint_handler() on a real Kprobe hit, so it has not run
>here. As a result, an ordinary userspace breakpoint underflows the
>current task's preempt count.
>

checked. Guess that's true

>This also makes in_interrupt() return true until the task schedules. One
>visible consequence is socket cgroup attribution: cgroup_sk_alloc()
>treats the allocation as interrupt context and assigns the socket to the
>root cgroup. A socket opened from the SIGTRAP handler can then avoid a
>BPF_CGROUP_INET_SOCK_CREATE policy attached to the task's own cgroup.
>
>Return as soon as kprobe_running() reports no active probe.
>

Ideal.

>The same check appeared in [PATCH v10 2/4] of the original LoongArch
>Kprobes series, but was dropped before the feature reached mainline.
>

wonder why.

>Link: https://patchew.org/linux/1670575981-14389-1-git-send-email-yangtiezhu%40loongson.cn/1670575981-14389-3-git-send-email-yangtiezhu%40loongson.cn/

Lore please.

>Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
>Assisted-by: Codex:gpt-5

5.6-sol? Or normal GPT 5?

>Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
>---
> arch/loongarch/kernel/kprobes.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
>index 1985ed30dd16f..ddfefea174727 100644
>--- a/arch/loongarch/kernel/kprobes.c
>+++ b/arch/loongarch/kernel/kprobes.c
>@@ -275,6 +275,9 @@ bool kprobe_singlestep_handler(struct pt_regs *regs)
> 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> 	unsigned long addr = instruction_pointer(regs);
> 
>+	if (!cur)
>+		return false;


comment?

/* do_bp() can reach
 * kprobe_singlestep_handler() when
 * there is no current probe, which
 * may cause issues.
 */

My one isn't perfect, but feel free to bikeshed


Well, I'm not a loongarch expert, but I am good with kprobes, hence this
review.


>+
> 	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
> 	    ((unsigned long)&cur->ainsn.insn[1] == addr)) {
> 		restore_local_irqflag(kcb, regs);
>

Thanks!
