Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B6270830
	for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847580; cv=none; b=POuWb4WDd1e0PWBJcHlNqRtTnTO2x0ezsST0kE/plxsOYz9tez+im4T/7ip+ABoT1AcANmWht9JmEVhe7uNE4LOWg5W5j/cEz/wb6TPV/EuionOaLxQH8cGI8RHOlOZqhyk4j+jNNaBqhcNPghyl/NoS3iZQm0idfrVzVG+/A5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847580; c=relaxed/simple;
	bh=8B3WCaMy0ebgOQe8/cCfJiL3mTvktRY89XgCyx9Nljk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzld+xdbzAemdYA2LUas1gWd9W/Msj9oEaCYuDsUBoeF945v5ivYQajHkUsPBSuZY8YAejp6kPOZpoikEvmusHsPvby+bq2bDEeC09WtImhXHkA4v+JrzItATxVZJhf8DR6LMQ56q24LVxbHcOT7Ilu1EmFb0tQCI31cJyM1hVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2uf4LdR; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2uf4LdR"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e7f9bba93fso463859485a.3
        for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754847576; x=1755452376; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFPJDb9jwD/BLJQf5jamfpxsqKh5dUHcRdMh9enxd18=;
        b=N2uf4LdRm0NBLsm0H5h6wZOSDW0pVUdWVjpYJYfEBFKTs2vm+QeExysY+jt9H6CON2
         WKP16fAVDsZ9wwj4Wo2SlI9RZbrPUPYhwRTm1VoIFtvIHO7hcxCps915zsUh+WNAQfRn
         TnzcDXu+PJ5y+Sl1OSWaPNZC8uEImVG56CQ5ZbkXwL8+tsZKMwAMSzk9r/w3Oc48NAbv
         0Sj5DeQgxHYz4WA+dEjICbSWsTQuxc6grEK+0KOLRFmopKHjE+o88eeRcCcIE1hITREA
         tjIvL0Ph33t0QsY8w9doAv2DEaL8luwa5Z3MfZ4CaccL22IqFjEi6zfFmAGdA8vpmG7u
         ENzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754847576; x=1755452376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFPJDb9jwD/BLJQf5jamfpxsqKh5dUHcRdMh9enxd18=;
        b=QqfZleVaZG/uyilr0Xxzt4z9XGC6OKk3LMDjn3P16GmLsroQO6x240BV8LMUzAdsB/
         WhDZHqLFxDDMKxrw59ld/1yXFPr0OAgzJik0m+14om46pUoZmUIShnddPKA676ZaBlG7
         yrlxp0gd/S79nbaFm3J100BjM6wNHECRbxSPdpVyl09/vAm6dNfX+cEJbqNI2K34z4RP
         Fmn3c8JB5WiGHjiwYmOWmspEUrMnzVKTFbp8OV+yH+l1Hr6GCrCneK/1vN9nWXc1QmoB
         PTkouSexXdDrv8nHohhUST+TsTNPCgP699HDEHJct5b2yVzPV9AYpIE/Dw0X1W4XnlkQ
         TXBA==
X-Gm-Message-State: AOJu0Yz322Qpj03C40Axvng6FJxpljq11fGKu46bQe9/AOaZ9euvjuWR
	pTdXWODx9PUkXCxRXJwC5vowvljZiQK+4C/xJSjFclyQy9J0F0vttlskC+O6Jkd/yXUgOx7LxNj
	KY5Go6k48oss+Py39Ikg+jVNRdQ6ROPY=
X-Gm-Gg: ASbGnct9VJxFHFXd16w9z+H6gl0LWpFkvsb62fwl40bOSNa0ZChpPeQ+CzxB+Kg1Z1D
	osMIPM0RyCXnW5NrBTCYB3G5eqgDWY9f5EOjBNCWJ1BIC3BB4EgeWfRYhyJkacnoe3P0fhAADI7
	g9PAiQaR1TU80HQH5Yk3MEzFSr6ohxFQOgsgON48VZDV/rPin2OFtbdzCEEFOG4sV/Ooj+1WEbt
	IHUnZ8=
X-Google-Smtp-Source: AGHT+IFHM6GVhoT34acA8AsFUWl/l2c7keLyViDjguxemcWOqRwXnBB5+zYTGA2LuRTpnSlRV0gqo6m5y4xtsVrlej8=
X-Received: by 2002:a05:620a:560d:b0:7e8:261a:39a9 with SMTP id
 af79cd13be357-7e82c67fc7amr1093703985a.19.1754847575801; Sun, 10 Aug 2025
 10:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
 <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
 <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com>
 <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com>
 <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com> <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
In-Reply-To: <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 10 Aug 2025 10:39:24 -0700
X-Gm-Features: Ac12FXwqw7D2jr5XsVYn9sgn-6SCV4H8B0sepGtT8ZE68rsvYFO9KknFtpT8QLo
Message-ID: <CAK3+h2wcOQr0iv=-K7WOCQkMkQb7b6gR77W7GSwuVqJuvc+fxQ@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenghao,

On Sat, Aug 9, 2025 at 12:11=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Chenghao,
> >
> > Please take a look.
> >
> > Huacai
> >
> I reverted loongson-next branch  tailcall count fix patches, struct
> ops trampoline patch, keep the rest of trampoline patches,
> module_attach test experienced the same issue, so definitely
> trampoline patches issue.
>

I attempted to isolate which test in module_attach triggers the
"Unable to handle kernel paging request..." error, it appears to be
this one in "prog_tests/module_attach.c"

ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read");

you can try to comment out other tests in "prog_tests/module_attach.c"
and perform the test, it might help isolate the issue.


> > On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> > >
> > > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincent.mc.li@gmai=
l.com> wrote:
> > > >
> > > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenhuacai@kern=
el.org> wrote:
> > > > >
> > > > > Hi, Vincent,
> > > > >
> > > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vincent.mc.li=
@gmail.com> wrote:
> > > > > >
> > > > > > Hi Folks,
> > > > > >
> > > > > > Hengqi mentioned offline that the loongarch kernel locked up wh=
en
> > > > > > running full bpf selftests, so I went ahead and ran make run_te=
sts to
> > > > > > perform full bpf selftest, I observed lockup too. It appears th=
e
> > > > > > lockup happens when running module_attach test which includes t=
esting
> > > > > > on fentry so this could be related to the trampoline patch seri=
es. for
> > > > > > example, if I just run ./test_progs -t module_attach, the kerne=
l
> > > > > > lockup immediately.
> > > > > Is this a regression caused by the latest trampoline patches? Or =
in
> > > > > another word, Does vanilla 6.16 has this problem?
> > > > >
> > > >
> > > > I suspect this is caused by the latest trampoline patches because t=
he
> > > > module_attach is to test the fentry feature for kernel module
> > > > functions, I believe Changhao and I only tested the fentry feature =
for
> > > > non-module kernel functions. I can try kernel without the trampolin=
e
> > > > patches and will let you know the result.
> > > >
> > >
> > > I reverted  trampoline patches from loongarch-next branch and run
> > > ./test_progs -t module_attach simply just errors out with the fentry
> > > feature not supported
> > >
> > > [root@fedora bpf]# ./test_progs -t module_attach
> > > test_module_attach:PASS:skel_open 0 nsec
> > > test_module_attach:PASS:set_attach_target 0 nsec
> > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > test_module_attach:PASS:skel_load 0 nsec
> > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > > #205     module_attach:FAIL
> > >
> > > All error logs:
> > > test_module_attach:PASS:skel_open 0 nsec
> > > test_module_attach:PASS:set_attach_target 0 nsec
> > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > test_module_attach:PASS:skel_load 0 nsec
> > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > > #205     module_attach:FAIL
> > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > >
> > > I also tested loongarch-next branch with the trampoline patch series
> > > with no lockup kernel config so I can run dmesg to check kernel error
> > > log,  ./test_progs -t module_attach result in below kernel log:
> > >
> > > [  417.429954] bpf_testmod: loading out-of-tree module taints kernel.
> > > [  419.728620] CPU 70475748 Unable to handle kernel paging request at
> > > virtual address 0000000800000024, era =3D=3D 90000000041d5854, ra =3D=
=3D
> > > 90000000041d5848
> > > [  419.728629] Oops[#1]:
> > > [  419.728632] CPU 70475748 Unable to handle kernel paging request at
> > > virtual address 0000000000000018, era =3D=3D 9000000005750268, ra =3D=
=3D
> > > 9000000004163938
> > > [  441.305370] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fqs=3D2599
> > > [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies, g=3D60333, =
q=3D186 ncpus=3D8)
> > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > [  451.305494] rcu: rcu_preempt kthread starved for 2499 jiffies!
> > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> > > [  451.305500] rcu:     Unless rcu_preempt kthread gets sufficient CP=
U
> > > time, OOM is now expected behavior.
> > > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > > [  451.305504] task:rcu_preempt     state:R stack:0     pid:15
> > > tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> > > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > > 0000000000000010 90000001003b0680
> > > [  451.305519]         90000000058e0000 0000000000000000
> > > 0000000000000040 9000000006c2dfd0
> > > [  451.305526]         900000000578c9b0 0000000000000001
> > > 9000000006b21000 0000000000000005
> > > [  451.305533]         00000001000093a8 00000001000093a8
> > > 0000000000000000 0000000000000004
> > > [  451.305540]         90000000058f04e0 0000000000000000
> > > 0000000000000002 b793724be1dfb2b8
> > > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > > 000000000000003f 9000000006c2dfd0
> > > [  451.305554]         9000000006c30c18 0000000000000005
> > > 9000000006b0e000 9000000006b21000
> > > [  451.305560]         9000000100453c98 90000001003aff80
> > > 9000000006c31140 900000000578c9b0
> > > [  451.305567]         00000001000093a8 9000000005794d3c
> > > 00000000000000b4 0000000000000000
> > > [  451.305574]         90000000024021b8 00000001000093a8
> > > 9000000004284f20 000000000a400001
> > > [  451.305581]         ...
> > > [  451.305584] Call Trace:
> > > [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0x140
> > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0x868
> > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x2e0
> > > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > > [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+0x28/0xc8
> > > [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_asm+0xc/0x=
88
> > >
> > > [  451.305630] rcu: Stack dump where RCU GP kthread last ran:
> > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > [  451.305636] NMI backtrace for cpu 1 skipped: idling at idle_exit+0=
x0/0x4
> > > [  451.306655] rcu: INFO: rcu_preempt detected expedited stalls on
> > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > > [  451.306665] rcu: blocking rcu_node structures (internal RCU debug)=
:
> > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > [  451.306672] Unable to send backtrace IPI to CPU5 - perhaps it hung=
?
> > >
> > > So related to trampoline patches for sure unless I am missing somethi=
ng.
> > >
> > > > > Huacai
> > > > >
> > > > > >
> > > > > > A side note, if I put the module_attach test in
> > > > > > tools/testing/selftests/bpf/DENYLIST to skip the module_attach =
test,
> > > > > > the module_attach test is not skipped.
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > Vincent
