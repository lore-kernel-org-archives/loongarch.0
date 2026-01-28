Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992A1DDF3
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585768; cv=none; b=UVv1/kHN5qvlxExWo/Iylql7+gMO4q8fkPbRX6Lrn/f/ecIGrGIiQTh3mglzc78f/og3caeXhvlSbz/1Yu0u3YEZgdr2MIuaKGF438vqUv+epyKy/Udm+LpnMqZuM+ceuFfkTcAQ4/OYmiCCTOehCwDrEvXMIWAdgEpveHYOlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585768; c=relaxed/simple;
	bh=5Fn6vv3OFcP5nxl3f3zquvoa7JS4fcZES6NH26QgRUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHNGo23eeQJnojleVVr7F47n6qZIQdZATX7FwXIy2pKb6+9OZmk6q7/9y9HE+TemDBQqrgBiEoTHxRomFvpT2VxE4C54f+PfEus63hEf51Vlo9770ATU232eUPuO+6XD02XHUv4dyAqTNq5BoFCJdmvZ/5bfnD7lYSlPottPOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNr1iCKA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNr1iCKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D845FC19422
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769585767;
	bh=5Fn6vv3OFcP5nxl3f3zquvoa7JS4fcZES6NH26QgRUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qNr1iCKAjQTNxNaG3Qaab4TbxxCY+KRxA311VkCslhhfSiW7t3/k00YyJn4438QID
	 JbIVzf6zsKGJBmGJcLiY9t/zz6SxqFsaVqpVAk8uU0lNWDftycD41Z2v5ftzaDhbtu
	 OR2vqpwcxNsI0+FNb9oWRyzWdci6cnkThmd/JgDtGtCQh5gSCYgT5Wjln65ivmsRoK
	 yanTQB55pkGVAO0n7/IuFJjViqLk2UPTRdQ+1IuclTWLvorD2JSYnGDikmBoAQgi5y
	 +Xu0oq76gA7aOyKvNxaSsvGIg+BIZhfLepqkMtOsKn4WPOPXZADqNzPQM5+H6FuilZ
	 cvVSyA50GNR0w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso8662631a12.1
        for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 23:36:07 -0800 (PST)
X-Gm-Message-State: AOJu0YzM6mmYGkbxIFO5ca9mqzpVeeo1MmMOjrtq8iaZxK96Chueh4s2
	lLHEoOkF9cyZKq5KweVlA/JqnYbCRkwhlse38OMAx4bZIVgotq3EJ97KfhQD3A2CZtiuqAhgDpD
	Ywja0EJ/qNS34tyuQCfieviwibpzV614=
X-Received: by 2002:a17:907:3c8c:b0:b88:5c68:ece2 with SMTP id
 a640c23a62f3a-b8dab1b9675mr294410166b.22.1769585766039; Tue, 27 Jan 2026
 23:36:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121095911.20868-1-yangtiezhu@loongson.cn> <20260121095911.20868-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260121095911.20868-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Jan 2026 15:35:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KAcjHdExr-voiB_xJOcTvFD4Hm90YD_=FzV8swOS1Rg@mail.gmail.com>
X-Gm-Features: AZwV_Qhic8IvSseZJnrmeT7MmwKb_9H8TfqrYtLmGMsKRYDiRHdGm9WooPvB6eM
Message-ID: <CAAhV-H7KAcjHdExr-voiB_xJOcTvFD4Hm90YD_=FzV8swOS1Rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] LoongArch: Handle percpu handler address for ORC unwinder
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Wed, Jan 21, 2026 at 5:59=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
> ORC unwinder"), the system can not boot normally under some configs,
> there are many error messages "cannot find unwind pc".
Unfortunately, after this series sometimes there are still error
messages, such as:
cannot find unwind pc at ffff80000231fe1c

Obviously, this is no longer related to per-cpu handler, and from the
call stack it seems related to BPF:

[   75.025389] CPU: 0 UID: 0 PID: 175 Comm: systemd-udevd Not tainted
6.19-rc7+ #721
[   75.025409] Hardware name: Loongson Loongson-3A6000-7A2000-EVB/EVB,
BIOS Loongson-FwSdk-V5.0.0343-stable2511 01/13/26 20:10:42
[   75.025422] Stack : 0000000000000000 0000000000000000
9000000000223c20 9000000116460000
[   75.025455]         900000010009f5e0 900000010009f5e8
0000000000000000 900000010009f728
[   75.025487]         900000010009f720 900000010009f720
900000010009f490 0000000000000001
[   75.025519]         0000000000000001 900000010009f5e8
9e6a35e67549a6db 000000fffffffffe
[   75.025551]         0000010000000000 0000000000000022
0000000fffffffff ffff800000000000
[   75.025582]         0000800000000000 9000000000000000
00000003f3fe4000 900000010009f9e0
[   75.025615]         0000000000000000 9000000002fd9000
0000000000000000 9000000002c15220
[   75.025646]         9000000002ea5820 900000010009f848
90000000040c1320 ffff80000231fe1c
[   75.025679]         90000000003a8f20 0000000000000000
9000000000223c3c 000055557726cb04
[   75.025710]         00000000000000b0 0000000000000004
0000000000000000 0000000000071c1d
[   75.025739]         ...
[   75.025751] Call Trace:
[   75.025756] [<9000000000223c3c>] show_stack+0x5c/0x190
[   75.025782] [<9000000001f2cc34>] dump_stack_lvl+0x6c/0x9c
[   75.025807] [<9000000000236714>] unwind_next_frame+0x764/0xa70
[   75.025837] [<9000000000231e14>] arch_stack_walk+0xd4/0x1b0
[   75.025863] [<900000000038aa04>] stack_trace_save+0x54/0x90
[   75.025892] [<9000000000612f80>] kasan_save_stack+0x30/0x60
[   75.025914] [<9000000000615a68>] __kasan_record_aux_stack+0x108/0x130
[   75.025941] [<90000000002b1c40>] task_work_add+0x100/0x300
[   75.025968] [<90000000002d3cd8>] sched_tick+0x158/0x3e0
[   75.025987] [<900000000038fa40>] update_process_times+0xf0/0x160
[   75.026011] [<90000000003a9018>] tick_nohz_handler+0xf8/0x260
[   75.026038] [<90000000003908dc>] __hrtimer_run_queues+0x20c/0x330
[   75.026062] [<9000000000392190>] hrtimer_interrupt+0x1a0/0x3f0
[   75.026086] [<90000000002285ac>] constant_timer_interrupt+0x5c/0x80
[   75.026110] [<900000000034358c>] __handle_irq_event_percpu+0x6c/0x190
[   75.026139] [<90000000003436c4>] handle_irq_event_percpu+0x14/0xa0
[   75.026167] [<900000000034d66c>] handle_percpu_irq+0x8c/0xe0
[   75.026189] [<9000000000342670>] generic_handle_domain_irq+0x50/0xc0
[   75.026217] [<9000000000ffaad4>] handle_cpu_irq+0x54/0x90
[   75.026245] [<9000000001f2d128>] handle_loongarch_irq+0x28/0x40
[   75.026269] [<9000000001f2d1bc>] do_vint+0x7c/0xf0
[   75.026289] [<900000000023fa20>] mem_to_shadow+0x0/0x2b0
[   75.026313] [<9000000000615af4>] kasan_check_range+0x64/0x2c0
[   75.026336] [<9000000001b2b7a0>] bpf_skb_load_helper_32+0x40/0x220





Huacai

>
> The kernel boots normally with the defconfig, so no problem found out
> at the first time. Here is one way to reproduce:
>
>   cd linux
>   make mrproper defconfig -j"$(nproc)"
>   scripts/config -e KASAN
>   make olddefconfig all -j"$(nproc)"
>   sudo make modules_install
>   sudo make install
>   sudo reboot
>
> The address that can not unwind is not a valid kernel address which is
> between "pcpu_handlers[cpu]" and "pcpu_handlers[cpu] + vec_sz" due to
> the code of eentry was copied to the new area of pcpu_handlers[cpu] in
> setup_tlb_handler(), handle this special case to get the valid address
> to unwind normally.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/setup.h |  2 ++
>  arch/loongarch/kernel/unwind_orc.c | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/=
asm/setup.h
> index 3c2fb16b11b6..79eb63e749f9 100644
> --- a/arch/loongarch/include/asm/setup.h
> +++ b/arch/loongarch/include/asm/setup.h
> @@ -14,6 +14,8 @@
>
>  extern unsigned long eentry;
>  extern unsigned long tlbrentry;
> +extern unsigned long pcpu_handlers[NR_CPUS];
> +extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
>  extern char init_command_line[COMMAND_LINE_SIZE];
>  extern void tlb_init(int cpu);
>  extern void cpu_cache_init(void);
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index d6b3688a1ce9..e0c0dc22eb08 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -351,6 +351,21 @@ EXPORT_SYMBOL_GPL(unwind_start);
>  static inline unsigned long bt_address(unsigned long ra)
>  {
>         extern unsigned long eentry;
> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> +       int cpu;
> +       int vec_sz =3D sizeof(exception_handlers);
> +
> +       for_each_possible_cpu(cpu) {
> +               if (!pcpu_handlers[cpu])
> +                       continue;
> +
> +               if (ra >=3D pcpu_handlers[cpu] &&
> +                   ra < pcpu_handlers[cpu] + vec_sz) {
> +                       ra =3D eentry + (ra - pcpu_handlers[cpu]);
> +                       break;
> +               }
> +       }
> +#endif
>
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 unsigned long func;
> --
> 2.42.0
>
