Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F306403E94
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687964; cv=none; b=PzX6OuQE2nFf19m9IVdnVOu1BPH3/Cw8kT6/zkgybq3TCYbetn5njoO1otJuXXvV7g4IBHDJWY6JvG5oJ6C6DDePMO4rHV1CALEHWfD3rcn/VsF3Jqvu7vS7Q9wV9t/Lr9KlrOO8fm32FAKY+ecj65AqkkcdZLYha4Jt21a2BPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687964; c=relaxed/simple;
	bh=AzDfBwQS2I0z3VQojQVGuftJ6+yTgQ8GbV020NKnw5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYcKkAE9IMckZzXTOcTuqG45cNpIX56lOsNQ07uDCikW7NEbNGXTeaN4p7wE2ybmyOSbrRZ5XFaMWSHVLN0HyXQ9ke9Qr89QBVewM3dr0Av8/kBfePXi2YkIQR7x4uzr4gMLLmxVuo9bY8rSbFNKUGJ3jFo/fdXL8zxMdU6dEgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ1G1VuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ1G1VuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EF01F00A3A
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783687963;
	bh=XUVP+WFMdP+TCX3id+9l0wCEL74Rof95/+D8WXkSiQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PQ1G1VuREl4wzomtLegwBBWa0w4rD3CrXIHnk5M0dTl4aLwslskEyclf8/iEf+ROr
	 Tj6HPUXmC0TLVyVgsEMwZVlGslbHGOqSYrR2iC+SLKvIvhgiGz6uElJh98gtdbccil
	 ahzB9hcDbB4IwNLA1iVwdhbCZmqADYq7uc2wDr5CF8WKU6AJcNeRLc6sndqQw3CsF/
	 eiwKzfUEtiUg38aNl3LtC3i6Y4lSyq1tN3sU1Qq6ZrLAaLoanEsqzlWnfbb8rtO7dH
	 JEsbZRMkXlh53TbLxwL0b9hVn/tqItBZzpxhcWbTaA1OiMtgJvuIaM4tHVj8WwSU9q
	 Rik56R6OqDqVg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee0aso1067936a12.3
        for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 05:52:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwazpiEYVRnZKHL9ebC2hN48mfSYbMe1sn0/ohKTnuMLHBstVlE
	Hf6cODlas7Uywf40Z9P1VJgIyBZ3KvesmtFPbXI+0/a4UCmnTEN7FwFSEitS24FOCtmdGSE06x1
	Sp3FMIECtFt0/USXAg6gCSnfrAiMmkDo=
X-Received: by 2002:a05:6402:4502:b0:698:4405:4feb with SMTP id
 4fb4d7f45d1cf-69ab4453aadmr4761526a12.3.1783687962131; Fri, 10 Jul 2026
 05:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707064556.371881-1-haoran.jiang@linux.dev>
In-Reply-To: <20260707064556.371881-1-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Jul 2026 20:52:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7GwHp1q-c5igf82h5gk1G5uDx+-gcrtqZsYHn_vbnR1g@mail.gmail.com>
X-Gm-Features: AUfX_mzKGKJ1Nh9M-pX-NWTZX0hXwxVypZ-QWS578Kinu7KnwDNw1mJPPd9sKdg
Message-ID: <CAAhV-H7GwHp1q-c5igf82h5gk1G5uDx+-gcrtqZsYHn_vbnR1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support to dump the kernel page tables
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Tue, Jul 7, 2026 at 2:47=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> From: Haoran Jiang <jianghaoran@kylinos.cn>
>
> Enforce the W^X principle on page tables,
> and also support the kernel page dump feature.
>
> The following tests were performed:
>
> kdb:
> echo kgdbts=3DV1 > /sys/module/kgdbts/parameters/kgdbts
>
> ebpf:
> ./test_progs -t struct_ops -d struct_ops_multi_pages
> ./test_progs -t fexit_stress
> ./test_progs -t module_fentry_shadow
> ./test_progs -t fentry_test/fentry
> ./test_progs -t fexit_test/fexit
> ./test_progs -t modify_return
> ./test_progs -t fexit_sleep
> ./test_progs -t test_overhead
> ./test_progs -t trampoline_count
> ./test_progs -t kprobe
> ./test_progs -t uprobe
>
> livepatch:
> insmod samples/livepatch/livepatch_sample.ko
>
> kprobe:
> insmod samples/kprobes/kprobe_example.ko
> insmod samples/kprobes/kretprobe_example.ko
>
> unxibench:
> before this patch:
> running 1 parallel copy of tests: 1492
> running 128 parallel copies of tests:  8765
>
> after this patch:
> running 1 parallel copy of tests:  1440
> running 128 parallel copies of tests:  8749
>
I hope you have verified ftrace, kprobes, jump label, kgdb, etc. on
modules, not only on the kernel itself. Otherwise the tests are not
enough.

@Tiezhu, you are familiar with all the above mechanisms, so please
help to review, and double check whether uprobes need to be modified.

Huacai

>
> Haoran Jiang (2):
>   LoongArch: Enforce W^X for page-mapped virtual memory region
>   LoongArch: Add support to dump the kernel page tables
>
>  arch/loongarch/Kconfig                    |   2 +
>  arch/loongarch/include/asm/pgtable-bits.h |  12 +-
>  arch/loongarch/kernel/ftrace_dyn.c        |  16 +
>  arch/loongarch/kernel/inst.c              |  25 +-
>  arch/loongarch/kernel/jump_label.c        |   3 +
>  arch/loongarch/kernel/kgdb.c              |  50 +++
>  arch/loongarch/kernel/kprobes.c           |   4 +-
>  arch/loongarch/mm/Makefile                |   1 +
>  arch/loongarch/mm/ptdump.c                | 474 ++++++++++++++++++++++
>  9 files changed, 575 insertions(+), 12 deletions(-)
>  create mode 100644 arch/loongarch/mm/ptdump.c
>
> --
> 2.43.0
>
