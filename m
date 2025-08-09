Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD9BA36
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754719389; cv=none; b=o5iNAzgfq1A/Z1REkqqo+Za895UWcmQvIFjF4mPHzRvD5fLP/jPworXaWYsHe17z272zOQncQm6RV5LrjBbQKzeycLvmPVhcBXr1i8pKi3858KJdFoHLdB4QXJhjIt01eCou3oKlsiA4zVFdGERTeNwDZ7v8Lttn4cQkR+rPYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754719389; c=relaxed/simple;
	bh=cu6ic+hqsXqjP1CMCnZy/h5lCQmu9UW1vg4i8YFYEz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0G6t7wF09YBIUm5PFK6yLz3GnHIauvfqAQYH828lqSPamFMShAM0paPHLc+vZ+mMsAi333uF4DGvrW/yeZm0+f4EmiTzPFZ8f576Ks3wU2sMX4kl3+lPBofcH8FD3X7egQXYfglbvWZRsh9Xr9L2/E/Pd8hFyG/SyYpzuwWITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmTiITMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmTiITMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B71C4CEF8
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 06:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754719389;
	bh=cu6ic+hqsXqjP1CMCnZy/h5lCQmu9UW1vg4i8YFYEz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BmTiITMM/xeJn/GYiOVTPuvfpdnuqk4Gw00x8CAp/1Pcxw9qY4BfY28D8HyEmIEPM
	 VsKVuBqthA6mx62WwDf9exVY83hSBqfAKJg1410nNN0YLXWLozq2XJV5n+QqP5228q
	 waWIVg5ZXaM/H/quflifr33xNKZw/4Q1+8YLSc2DJg8QrTOV4Kn1v2BZ30yV3lYrw6
	 miDin+9YQlPsVfu2Hb31yrH0Q3e13BgbWDCC/yziodvvnw7RUx/BB1hyVvyaytkdlL
	 Xfm4/rPF3TtqDurWBXq1ANDMpaygWbEfT4+RK9TmtfaZ8YO2ccZMNdwW6PGNmPWfJb
	 52RHLsedW5MoA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61521cd7be2so3867083a12.3
        for <loongarch@lists.linux.dev>; Fri, 08 Aug 2025 23:03:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSNCL9Oeb92qVHcHJqq1mIag/QmiQJyALzhMfeWLzQW+QCjY/Z
	AI17YTI+OC9d9BpvcCyHI7ydn8hT8Q0IlypYnWPnAAHFlM4deapiTujUPpQgAyzap758Q3XD15M
	PszZFPn/hnH2x4ntXsYENZY5p25VicCk=
X-Google-Smtp-Source: AGHT+IEUWcT4PvLbLJT8D0+avWEGz1iVHotlssqrovX530obMjw8EMQ0cNwY55zUUZ4fkdDjelWkqqS4SBv3sQydiU4=
X-Received: by 2002:a05:6402:430f:b0:615:522e:29fe with SMTP id
 4fb4d7f45d1cf-617e2c4bc5dmr4942391a12.19.1754719387647; Fri, 08 Aug 2025
 23:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
 <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
 <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com> <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com>
In-Reply-To: <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 9 Aug 2025 14:02:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
X-Gm-Features: Ac12FXxWrB-Fa60o7bU6x-m6xqfI-rxhE8oPObIHs6-co2dCYi9MXxCpk8Us06M
Message-ID: <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: loongarch@lists.linux.dev, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Chenghao,

Please take a look.

Huacai

On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
> > >
> > > Hi, Vincent,
> > >
> > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vincent.mc.li@gma=
il.com> wrote:
> > > >
> > > > Hi Folks,
> > > >
> > > > Hengqi mentioned offline that the loongarch kernel locked up when
> > > > running full bpf selftests, so I went ahead and ran make run_tests =
to
> > > > perform full bpf selftest, I observed lockup too. It appears the
> > > > lockup happens when running module_attach test which includes testi=
ng
> > > > on fentry so this could be related to the trampoline patch series. =
for
> > > > example, if I just run ./test_progs -t module_attach, the kernel
> > > > lockup immediately.
> > > Is this a regression caused by the latest trampoline patches? Or in
> > > another word, Does vanilla 6.16 has this problem?
> > >
> >
> > I suspect this is caused by the latest trampoline patches because the
> > module_attach is to test the fentry feature for kernel module
> > functions, I believe Changhao and I only tested the fentry feature for
> > non-module kernel functions. I can try kernel without the trampoline
> > patches and will let you know the result.
> >
>
> I reverted  trampoline patches from loongarch-next branch and run
> ./test_progs -t module_attach simply just errors out with the fentry
> feature not supported
>
> [root@fedora bpf]# ./test_progs -t module_attach
> test_module_attach:PASS:skel_open 0 nsec
> test_module_attach:PASS:set_attach_target 0 nsec
> test_module_attach:PASS:set_attach_target_explicit 0 nsec
> test_module_attach:PASS:skel_load 0 nsec
> libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> #205     module_attach:FAIL
>
> All error logs:
> test_module_attach:PASS:skel_open 0 nsec
> test_module_attach:PASS:set_attach_target 0 nsec
> test_module_attach:PASS:set_attach_target_explicit 0 nsec
> test_module_attach:PASS:skel_load 0 nsec
> libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> #205     module_attach:FAIL
> Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
>
> I also tested loongarch-next branch with the trampoline patch series
> with no lockup kernel config so I can run dmesg to check kernel error
> log,  ./test_progs -t module_attach result in below kernel log:
>
> [  417.429954] bpf_testmod: loading out-of-tree module taints kernel.
> [  419.728620] CPU 70475748 Unable to handle kernel paging request at
> virtual address 0000000800000024, era =3D=3D 90000000041d5854, ra =3D=3D
> 90000000041d5848
> [  419.728629] Oops[#1]:
> [  419.728632] CPU 70475748 Unable to handle kernel paging request at
> virtual address 0000000000000018, era =3D=3D 9000000005750268, ra =3D=3D
> 9000000004163938
> [  441.305370] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  441.305380] rcu:     5-...0: (29 ticks this GP)
> idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fqs=3D2599
> [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies, g=3D60333, q=3D=
186 ncpus=3D8)
> [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> [  451.305494] rcu: rcu_preempt kthread starved for 2499 jiffies!
> g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> [  451.305500] rcu:     Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [  451.305502] rcu: RCU grace-period kthread stack dump:
> [  451.305504] task:rcu_preempt     state:R stack:0     pid:15
> tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> [  451.305510] Stack : 9000000100467e80 0000000000000402
> 0000000000000010 90000001003b0680
> [  451.305519]         90000000058e0000 0000000000000000
> 0000000000000040 9000000006c2dfd0
> [  451.305526]         900000000578c9b0 0000000000000001
> 9000000006b21000 0000000000000005
> [  451.305533]         00000001000093a8 00000001000093a8
> 0000000000000000 0000000000000004
> [  451.305540]         90000000058f04e0 0000000000000000
> 0000000000000002 b793724be1dfb2b8
> [  451.305547]         00000001000093a9 b793724be1dfb2b8
> 000000000000003f 9000000006c2dfd0
> [  451.305554]         9000000006c30c18 0000000000000005
> 9000000006b0e000 9000000006b21000
> [  451.305560]         9000000100453c98 90000001003aff80
> 9000000006c31140 900000000578c9b0
> [  451.305567]         00000001000093a8 9000000005794d3c
> 00000000000000b4 0000000000000000
> [  451.305574]         90000000024021b8 00000001000093a8
> 9000000004284f20 000000000a400001
> [  451.305581]         ...
> [  451.305584] Call Trace:
> [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0x140
> [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0x868
> [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x2e0
> [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+0x28/0xc8
> [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_asm+0xc/0x88
>
> [  451.305630] rcu: Stack dump where RCU GP kthread last ran:
> [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> [  451.305636] NMI backtrace for cpu 1 skipped: idling at idle_exit+0x0/0=
x4
> [  451.306655] rcu: INFO: rcu_preempt detected expedited stalls on
> CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> [  451.306665] rcu: blocking rcu_node structures (internal RCU debug):
> [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> [  451.306672] Unable to send backtrace IPI to CPU5 - perhaps it hung?
>
> So related to trampoline patches for sure unless I am missing something.
>
> > > Huacai
> > >
> > > >
> > > > A side note, if I put the module_attach test in
> > > > tools/testing/selftests/bpf/DENYLIST to skip the module_attach test=
,
> > > > the module_attach test is not skipped.
> > > >
> > > > Thanks
> > > >
> > > > Vincent
