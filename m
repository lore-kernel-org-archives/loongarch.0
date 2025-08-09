Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6971B3937
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754766715; cv=none; b=LFu+rPSnKMHSPYADSrLltle/F7qJbBwvUZsi8C1WHlfWynDwEN6+MbeXnIgpRFPgU4wlNsFeTZnabReQrNaOmbfkVGvaGFL33gKHfIyTD6TFEGB1GQ25xNkz8SxGftCmlnO6V72xV/eO93DyHongLmC+JBB3aH9Xk3YTq3aJ03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754766715; c=relaxed/simple;
	bh=5YPMc099e9uCbP2aasb7HL3eBpSYPy2UWG7Bpea6OK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukAoJxbxUjeIbz9MyL59+EMAlQv+McK7rNXeohOCzra4DohTjNJhctWKvIWq85MzGeynYJunNFckIrEMm7HBpMT70UWJ0YsjFR5basxQOgJlQJuzHYJgo6WdVtb5uqC0GaZV/sLr/dkNQtBUVUiG7ft4lhwCjy/UHyQnxadQMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwpstQui; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwpstQui"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b06d162789so36540311cf.2
        for <loongarch@lists.linux.dev>; Sat, 09 Aug 2025 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754766713; x=1755371513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V6eBYxSdgYaB2lp9sNM5N0NalSVYrbAQ5RTYRmvkTA=;
        b=SwpstQui9xBRP4GoQURTG+am0GQBsBXBE7h4XTS1wc3ApCMUcp+0zbnALrbctUjrSv
         +VVkxKLdIuUIOVBjnQwvUPtT3D0A8gySXMHAJ4qF+/mLQUQvfPHXbUeKjGrACrRQ+3OC
         F7GvdjDYx5ig1AozcybYPovbf74swEcYqK4DNF+pgcZxrW5omqoh6tlM1kIBw7ykvL5J
         WyK0LeUuiBpX1OWjr/XrX+tkbvzzF1DvYoMXXUTBXTuDVu8fp9d+yp3YMV6B1rqcJegO
         lZ9xn3eSWoaAr52YGrqVUf3XWhX3KnVbqyxaprs53uKazJZhz5saIr/gHBtW9W1+SkBH
         LJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754766713; x=1755371513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V6eBYxSdgYaB2lp9sNM5N0NalSVYrbAQ5RTYRmvkTA=;
        b=qU3aawdVkZRR81i3azU1HDhp1JvHzzcXOaERFXhF356zbDTdoH/+mDlUbgJbvXmeOq
         k2yHHASmVj0hof4jUST/vzuE36lxMnj5zz9YlMK/ZSvkEveKJyOiGRcNMHJcw4J9GG2Y
         EOsuf1p7H2S3v74cGwUDOGlvH3x0iMrPvdQHpYxKk9ghLMTFnVvlPKz3lkBuYf2vyjqe
         op2NhbmbktEGJvadgvxFAY05xiDeu5tLboyFkUrSLBH9ABmrtlajFmiMsb0Fcr2J01KR
         aWvJUMdbwGPA1OoX6NvG67GSlTwuF0LgZ/repmvFD9VA3lHAqVfmIkBBtlq7UVGzpiAJ
         haHQ==
X-Gm-Message-State: AOJu0YzBMhmzu3fuJW8IHU9Ms9V7VdiIP+iWQrGZccat38+8YAm3AlnR
	kNV5wFVC9/+JSTraUQXO+VHbZe/K4S/J5QkNQfXxmQWPQAXtDsw8eswMV8lJJHdc7dZWobOSko/
	RLZZGVGJpcIumK2FGH8SrTMRQWaTEdnI=
X-Gm-Gg: ASbGnctWalXJD8dozBXAL6bI7o1lK0/4GSpFek3KPIw1ad0gRS93XQotG1kih++M7km
	Qfd/GJBlGeF+0npGSgn9H8Dj0DnvD+j4McVBNq10f8OcknQiCnAB77RGeUv1ImoC55fEhuab66p
	QXzMuPZ09UqJfk+LZ2dxmSvFXGl1E/U9oiCXmpPu2SuVpGZsziPN17anBBfo/sg4qdZ/+b+2LRJ
	heDlI/zwC9Zg6VIcw==
X-Google-Smtp-Source: AGHT+IHa77DmA8J9yT5RTfuSE3tZxvftwFK7fzX8GZ5KKLnx1OZtphfWKFUHxp3e3Kwpl2T+8GplfxiE8S+A/TIiGbs=
X-Received: by 2002:a05:622a:58c6:b0:4af:1554:794 with SMTP id
 d75a77b69052e-4b0aed4faebmr118175811cf.45.1754766712899; Sat, 09 Aug 2025
 12:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
 <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
 <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com>
 <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com> <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 9 Aug 2025 12:11:41 -0700
X-Gm-Features: Ac12FXzev_i9JRPVIZOSwAMAZmfpTcNGA3hLVIE_9re4E_vLH9HCqVT-VdyWGv4
Message-ID: <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Chenghao,
>
> Please take a look.
>
> Huacai
>
I reverted loongson-next branch  tailcall count fix patches, struct
ops trampoline patch, keep the rest of trampoline patches,
module_attach test experienced the same issue, so definitely
trampoline patches issue.

> On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel=
.org> wrote:
> > > >
> > > > Hi, Vincent,
> > > >
> > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vincent.mc.li@g=
mail.com> wrote:
> > > > >
> > > > > Hi Folks,
> > > > >
> > > > > Hengqi mentioned offline that the loongarch kernel locked up when
> > > > > running full bpf selftests, so I went ahead and ran make run_test=
s to
> > > > > perform full bpf selftest, I observed lockup too. It appears the
> > > > > lockup happens when running module_attach test which includes tes=
ting
> > > > > on fentry so this could be related to the trampoline patch series=
. for
> > > > > example, if I just run ./test_progs -t module_attach, the kernel
> > > > > lockup immediately.
> > > > Is this a regression caused by the latest trampoline patches? Or in
> > > > another word, Does vanilla 6.16 has this problem?
> > > >
> > >
> > > I suspect this is caused by the latest trampoline patches because the
> > > module_attach is to test the fentry feature for kernel module
> > > functions, I believe Changhao and I only tested the fentry feature fo=
r
> > > non-module kernel functions. I can try kernel without the trampoline
> > > patches and will let you know the result.
> > >
> >
> > I reverted  trampoline patches from loongarch-next branch and run
> > ./test_progs -t module_attach simply just errors out with the fentry
> > feature not supported
> >
> > [root@fedora bpf]# ./test_progs -t module_attach
> > test_module_attach:PASS:skel_open 0 nsec
> > test_module_attach:PASS:set_attach_target 0 nsec
> > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > test_module_attach:PASS:skel_load 0 nsec
> > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > #205     module_attach:FAIL
> >
> > All error logs:
> > test_module_attach:PASS:skel_open 0 nsec
> > test_module_attach:PASS:set_attach_target 0 nsec
> > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > test_module_attach:PASS:skel_load 0 nsec
> > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > #205     module_attach:FAIL
> > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> >
> > I also tested loongarch-next branch with the trampoline patch series
> > with no lockup kernel config so I can run dmesg to check kernel error
> > log,  ./test_progs -t module_attach result in below kernel log:
> >
> > [  417.429954] bpf_testmod: loading out-of-tree module taints kernel.
> > [  419.728620] CPU 70475748 Unable to handle kernel paging request at
> > virtual address 0000000800000024, era =3D=3D 90000000041d5854, ra =3D=
=3D
> > 90000000041d5848
> > [  419.728629] Oops[#1]:
> > [  419.728632] CPU 70475748 Unable to handle kernel paging request at
> > virtual address 0000000000000018, era =3D=3D 9000000005750268, ra =3D=
=3D
> > 9000000004163938
> > [  441.305370] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fqs=3D2599
> > [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies, g=3D60333, q=
=3D186 ncpus=3D8)
> > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > [  451.305494] rcu: rcu_preempt kthread starved for 2499 jiffies!
> > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> > [  451.305500] rcu:     Unless rcu_preempt kthread gets sufficient CPU
> > time, OOM is now expected behavior.
> > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > [  451.305504] task:rcu_preempt     state:R stack:0     pid:15
> > tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > 0000000000000010 90000001003b0680
> > [  451.305519]         90000000058e0000 0000000000000000
> > 0000000000000040 9000000006c2dfd0
> > [  451.305526]         900000000578c9b0 0000000000000001
> > 9000000006b21000 0000000000000005
> > [  451.305533]         00000001000093a8 00000001000093a8
> > 0000000000000000 0000000000000004
> > [  451.305540]         90000000058f04e0 0000000000000000
> > 0000000000000002 b793724be1dfb2b8
> > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > 000000000000003f 9000000006c2dfd0
> > [  451.305554]         9000000006c30c18 0000000000000005
> > 9000000006b0e000 9000000006b21000
> > [  451.305560]         9000000100453c98 90000001003aff80
> > 9000000006c31140 900000000578c9b0
> > [  451.305567]         00000001000093a8 9000000005794d3c
> > 00000000000000b4 0000000000000000
> > [  451.305574]         90000000024021b8 00000001000093a8
> > 9000000004284f20 000000000a400001
> > [  451.305581]         ...
> > [  451.305584] Call Trace:
> > [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0x140
> > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0x868
> > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x2e0
> > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+0x28/0xc8
> > [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_asm+0xc/0x88
> >
> > [  451.305630] rcu: Stack dump where RCU GP kthread last ran:
> > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > [  451.305636] NMI backtrace for cpu 1 skipped: idling at idle_exit+0x0=
/0x4
> > [  451.306655] rcu: INFO: rcu_preempt detected expedited stalls on
> > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > [  451.306665] rcu: blocking rcu_node structures (internal RCU debug):
> > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > [  451.306672] Unable to send backtrace IPI to CPU5 - perhaps it hung?
> >
> > So related to trampoline patches for sure unless I am missing something=
.
> >
> > > > Huacai
> > > >
> > > > >
> > > > > A side note, if I put the module_attach test in
> > > > > tools/testing/selftests/bpf/DENYLIST to skip the module_attach te=
st,
> > > > > the module_attach test is not skipped.
> > > > >
> > > > > Thanks
> > > > >
> > > > > Vincent
