Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365615AC
	for <loongarch@lists.linux.dev>; Tue, 13 Dec 2022 03:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E86C433EF;
	Tue, 13 Dec 2022 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670901016;
	bh=CdvdAdS5jLjYKwNJdlUzw0ngvoQU+3buJ2cmorcHmeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jkXWvDIMOd0wDwhOi2HefKyt/fKhOtF/kqfqjCn86OUmc2dKGKhfPwXrIAoxAuTKg
	 dBUFAfFV3Nka8GSk5UvwwQljN+8P/cJTqICGvVZcwMOFjtTZd2FLG4C/H7ruOhCumO
	 Awhri52tNRBwIs4YxOKjGA+OqaxOfaqwtEulnYCySg6P91d0+pZI9iIW5nfr98/Jwd
	 ILHYXgWB/FuOQpAcX5AqbVrN6IlkEblTLHSvyegSbomz1ehk4F/HmFNa2OKSe+2M/H
	 CpqdIGPW5+ozY8bP39fjPzxncm1aaP/VSFop5o0YGfxjnGovTDNDP3sXfgoT5X6uod
	 ddb0eZU8jDfKg==
Date: Tue, 13 Dec 2022 12:10:13 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Jeff Xie <xiehuan09@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add kprobe and kretprobe support for LoongArch
Message-Id: <20221213121013.b09182c5842171f3f25a2e59@kernel.org>
In-Reply-To: <CAAhV-H6e2HzXs9PCcdnebPBvGZrx5vRXji1vGXfPwkEihBOiKA@mail.gmail.com>
References: <1670575981-14389-1-git-send-email-yangtiezhu@loongson.cn>
	<CAAhV-H6e2HzXs9PCcdnebPBvGZrx5vRXji1vGXfPwkEihBOiKA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Dec 2022 18:01:44 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, Masami,
> 
> This series looks good to me now, but I'm not familiar with kprobes.
> So, if you have any comments, please let me know.

Sorry I missed this series. Let me add some comments.
BTW, I don't have any board to run the loongarch, so I'll make
comments just about style issues.

Thanks,

> 
> And Jeff,
> 
> As we all know, you are an expert in this domain, so could you please
> help me to test this series?
> 
> If there are no objections, I plan to merge this series in a few days.
> But since the next merge window will be open soon, if there are any
> problems, I will revert the patches to wait for the next cycle.
> 
> Thanks,
> Huacai
> 
> On Fri, Dec 9, 2022 at 4:53 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > v10:
> >   -- Remove sign_extend() based on the latest code
> >   -- Rename insns_are_not_supported() to insns_not_supported()
> >   -- Rename insns_are_not_simulated() to insns_not_simulated()
> >   -- Set KPROBE_HIT_SSDONE if cur->post_handler is not NULL
> >   -- Enable preemption for KPROBE_REENTER in kprobe_fault_handler()
> >
> > v9:
> >   -- Rename sign_extended() to sign_extend()
> >   -- Modify kprobe_fault_handler() to handle all of kprobe_status
> >
> > v8:
> >   -- Put "regs->csr_prmd &= ~CSR_PRMD_PIE;" ahead to save one line
> >   -- Add code comment of preempt_disable()
> >   -- Put kprobe_page_fault() in __do_page_fault()
> >   -- Modify the check condition of break insn in kprobe_breakpoint_handler()
> >
> > v7:
> >   -- Remove stop_machine_cpuslocked() related code
> >
> > v6:
> >   -- Add a new patch to redefine larch_insn_patch_text() with
> >      stop_machine_cpuslocked()
> >   -- Modify kprobe_breakpoint_handler() to consider the original
> >      insn is break and return the correct value
> >   -- Modify do_bp() to refresh bcode when original insn is break
> >
> > v5:
> >   -- Rebase on the latest code
> >   -- Use stop_machine_cpuslocked() to modify insn to avoid CPU race
> >
> > v4:
> >   -- Remove kprobe_exceptions_notify() in kprobes.c
> >   -- Call kprobe_breakpoint_handler() and kprobe_singlestep_handler()
> >      in do_bp()
> >
> > v3:
> >   -- Rebase on the latest code
> >   -- Check the alignment of PC in simu_branch() and simu_pc()
> >   -- Add ibar in flush_insn_slot()
> >   -- Rename kprobe_{pre,post}_handler() to {post_}kprobe_handler
> >   -- Add preempt_disable() and preempt_enable_no_resched()
> >   -- Remove r0 save/restore and do some minor changes
> >      in kprobes_trampoline.S
> >   -- Do not enable CONFIG_KPROBES by default
> >
> > v2:
> >   -- Split simu_branch() and simu_pc() into a single patch
> >   -- Call kprobe_page_fault() in do_page_fault()
> >   -- Add kprobes_trampoline.S for kretprobe
> >
> > Tiezhu Yang (4):
> >   LoongArch: Simulate branch and PC instructions
> >   LoongArch: Add kprobe support
> >   LoongArch: Add kretprobe support
> >   samples/kprobes: Add LoongArch support
> >
> >  arch/loongarch/Kconfig                     |   2 +
> >  arch/loongarch/include/asm/inst.h          |  20 ++
> >  arch/loongarch/include/asm/kprobes.h       |  59 +++++
> >  arch/loongarch/include/asm/ptrace.h        |   1 +
> >  arch/loongarch/kernel/Makefile             |   2 +
> >  arch/loongarch/kernel/inst.c               | 123 ++++++++++
> >  arch/loongarch/kernel/kprobes.c            | 364 +++++++++++++++++++++++++++++
> >  arch/loongarch/kernel/kprobes_trampoline.S |  96 ++++++++
> >  arch/loongarch/kernel/traps.c              |  13 +-
> >  arch/loongarch/mm/fault.c                  |   3 +
> >  samples/kprobes/kprobe_example.c           |   8 +
> >  11 files changed, 687 insertions(+), 4 deletions(-)
> >  create mode 100644 arch/loongarch/include/asm/kprobes.h
> >  create mode 100644 arch/loongarch/kernel/kprobes.c
> >  create mode 100644 arch/loongarch/kernel/kprobes_trampoline.S
> >
> > --
> > 2.1.0
> >


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
