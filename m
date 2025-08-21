Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6B2EC57C
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788662; cv=none; b=eHWk1stDoQ5EwHYA9wd9bTOEZm9UT55nf8An4QQzbXZiStiXy25A0jDqAxBvYtKTPTyhP6EUdJho6HsGpa/IR6xUSAv8CqpH9O0bui1LlYrg/7t9dY9bRU4+JvclDLQSfIa4jqDwIwlVK350LCq/w8gR1+QPWyQM16r0tKatWDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788662; c=relaxed/simple;
	bh=Z9moueMaDyONJC7bZ8vtwHZymaer7jS0z1njng54DkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pV0cgC0eEIudMqvSLL7HLsfuQexfFfEOIKr2O+bF1cPNKOG8JnC0bLjNiGDLRCObDg8ykJD1bgCpx1vHFsrZyCJa7hqJ+oopQ0JbzuofN9pGK7pcVUjDy6gwrZAKROcfaRYnw25+gTOuFXx4bvVMooKmJHEtvzKMbBgp+JNzIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GraRCBep; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GraRCBep"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b133b24ed7so8696111cf.3
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755788659; x=1756393459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjdQTZdi0T+ZFPqGpTLa5e9k8nLr1uqoa1IO3jYp6gI=;
        b=GraRCBep0K1IDBC5utrsjorrUCcQkFT1x7IYmKTb6UUtAfjQmdc7SI3KW873qmFK9K
         R5vx03eDljnfOHaPWev8DEgI3yS8KQs/pUTOZMpw84lW6+tttvZ8gLqLMuUURs+I0eBV
         bFyX4b5mvW8p6lhG/9A0xDPwOcGoZhJo7thzvCU2k83KimRsk0nqB4iDN4FnTVobZdhK
         U1Q4Fy7Anq/9+EgJQTiithDYOOB5KFUQ1b0ZQzVPkOrmCdguohailDdGpk4lL004veJI
         e6+7VYWjeB3WrPEZ2tIhb8V1j/8zLnZtcTr8QS0QlDHKRvFJ7FfqMBZkdbEkzrK5xRUa
         dofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755788659; x=1756393459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjdQTZdi0T+ZFPqGpTLa5e9k8nLr1uqoa1IO3jYp6gI=;
        b=I9TZqkiqc6rJa7fM+Pjp4R67cAI95SeNpz+wGAowxbvop/4w/lQEohG2YeDfFRQUPe
         mcg7uu0X6FJE0GVM6urM+WyieGGlP/ZM98t/aR8/JTJR/3oQpnyWu0BNujmx6G2RlJpI
         XR/YfexVeTczkeVLwc3z5JjkYVru5XXdo8pad8E7NBp13PyWjbKTx8Tmcc2FSEaKs9FD
         iWgCcRoI+RcpLs7W+51DuWjxpbtdum7IPmY4sZe77qGN5+l6WwxCd1BgG8eLacAX4KbF
         jtzAqnEcDAZJbHmDE5Qvk10VoQIMWe7mj866F8c3yCH2MlXcMVZsdYuPRJ8tLDgrx4Xe
         vQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVKeoK+qg0tHn1C+9BpUT1BNtxVitvYEbU2Mzcvkb6qHHMQJAX+3ODRavoSjFMf2vcZluh06qo7M5M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx99V0h4lBkZEELl6VcfNjr6Fxc0mrLFU4ml9H9bUYdmxGGpHmR
	c6jEGx1BiC/VhcoZePhTU2VwBJfgK+qtEx4lZLL8hVdVJxovghkg2aF2r9RTAEuT7csvhcMj39G
	hpnccBeKPz3XL2YjBau8PF1dJGsKWh1Q=
X-Gm-Gg: ASbGnct2QjQ0tLPaTqiTdSaHq2jV5fudlCtEmIEUSBqeIp/YbqTIadHy3km0jp85dH5
	FqUwbIUTnrPfcVa8BFe87e8K2K1UgbNZHkAHjQ7NFY0JIyNtjCdsd/fXfbmeTTO524v/37oTu0z
	eD1ipUo3FlF9UVMljW8S7lgMu3ARH9GDlm6mJvpe0MtGWZF08fZgCYw6np4sRIuMhka++6++4Qn
	IFyzWTzNx04FtahwA==
X-Google-Smtp-Source: AGHT+IGzkSC6SzKMRE3SK5Ujxmd8roHkxEHRZxjtbGRGkCiOS1lv4fO46TWotRToW+ezIN5Dcq1ORov6zUUJFxLAucY=
X-Received: by 2002:ac8:7fc1:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b29ff9a2bfmr30734471cf.63.1755788658532; Thu, 21 Aug 2025
 08:04:18 -0700 (PDT)
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
 <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
 <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
 <CAK3+h2wcOQr0iv=-K7WOCQkMkQb7b6gR77W7GSwuVqJuvc+fxQ@mail.gmail.com>
 <20250812083441.GA1119757@chenghao-pc> <CAK3+h2x1gjuqEsUSj+B-9sb73kRo3bStH6ROw=1LVSqQGMNcUw@mail.gmail.com>
 <20250814120015.GA1626128@chenghao-pc>
In-Reply-To: <20250814120015.GA1626128@chenghao-pc>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 21 Aug 2025 08:04:07 -0700
X-Gm-Features: Ac12FXyoXlIdqaq61u2s0qfjDf6RMNDehj4vbuvGvotgScVDKucQZFeANEgQPBA
Message-ID: <CAK3+h2zO5bMnGTNb30=ggi8bg1-+gbaP1HfBoatJ4FVMuRgZdw@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 5:00=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Tue, Aug 12, 2025 at 06:42:08AM -0700, Vincent Li wrote:
> > On Tue, Aug 12, 2025 at 1:34=E2=80=AFAM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > On Sun, Aug 10, 2025 at 10:39:24AM -0700, Vincent Li wrote:
> > > > Hi Chenghao,
> > > >
> > > > On Sat, Aug 9, 2025 at 12:11=E2=80=AFPM Vincent Li <vincent.mc.li@g=
mail.com> wrote:
> > > > >
> > > > > On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chenhuacai@k=
ernel.org> wrote:
> > > > > >
> > > > > > Hi, Chenghao,
> > > > > >
> > > > > > Please take a look.
> > > > > >
> > > > > > Huacai
> > > > > >
> > > > > I reverted loongson-next branch  tailcall count fix patches, stru=
ct
> > > > > ops trampoline patch, keep the rest of trampoline patches,
> > > > > module_attach test experienced the same issue, so definitely
> > > > > trampoline patches issue.
> > > > >
> > > >
> > > > I attempted to isolate which test in module_attach triggers the
> > > > "Unable to handle kernel paging request..." error, it appears to be
> > > > this one in "prog_tests/module_attach.c"
> > > >
> > > > ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read");
> > > >
> > > > you can try to comment out other tests in "prog_tests/module_attach=
.c"
> > > > and perform the test, it might help isolate the issue.
> > > >
> > >
> > > Hi Vincent,
> > >
> > > The results I tested are different from yours. Could there be other
> > > differences between us? I am using the latest code of the loongarch-n=
ext
> > > branch.
> > >
> > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > bpf_testmod.ko is already unloaded.
> > > Loading bpf_testmod.ko...
> > > Successfully loaded bpf_testmod.ko.
> > > test_module_attach:PASS:skel_open 0 nsec
> > > test_module_attach:PASS:set_attach_target 0 nsec
> > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > WATCHDOG: test case module_attach executes for 10 seconds...
> > > libbpf: prog 'handle_fmod_ret': BPF program load failed: -EINVAL
> > > libbpf: prog 'handle_fmod_ret': -- BEGIN PROG LOAD LOG --
> > > bpf_testmod_test_read() is not modifiable
> > > processed 0 insns (limit 1000000) max_states_per_insn 0 total_states =
0 peak_states 0 mark_read 0
> > > -- END PROG LOAD LOG --
> > > libbpf: prog 'handle_fmod_ret': failed to load: -EINVAL
> > > libbpf: failed to load object 'test_module_attach'
> > > libbpf: failed to load BPF skeleton 'test_module_attach': -EINVAL
> > > test_module_attach:FAIL:skel_load failed to load skeleton
> > > #205     module_attach:FAIL
> > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > Successfully unloaded bpf_testmod.ko.
> > >
> >
> > I build and run the most recent loongarch-next kernel too, can you try
> > my config https://www.bpfire.net/download/loongfire/config.txt? I am
> > on fedora, here are the steps I build, run the kernel, and run the
> > test
> >
> > 1, check branch
> > [root@fedora linux-loongson]# git branch
> > * loongarch-next
> >   master
> >   no-tailcall
> >   no-trampoline
> >
> > 2, build kernel and reboot
> > cp config.txt .config; make clean; make -j6; make modules_install;
> > make install; grub2-mkconfig -o /boot/grub2/grub.cfg; reboot
> >
> > 3, after reboot and login, build bpf selftests, run module_attach
> > test, dmesg to check kernel log
> > cd tools/testing/selftests/bpf; make -j6; ./test_progs -t module_attach
> >
>
> Hi Vincent,
>
> I tried to refer to the config you provided, but the test results I
> obtained are as follows. I also specifically tested "modify" to verify
> the effectiveness of the patch, and the test of module_attach returns -EO=
PNOTSUPP.
>
> [root@localhost bpf]# ./test_progs -v -t modify_return
> bpf_testmod.ko is already unloaded.
> Loading bpf_testmod.ko...
> Successfully loaded bpf_testmod.ko.
> run_test:PASS:skel_load 0 nsec
> run_test:PASS:modify_return__attach failed 0 nsec
> run_test:PASS:test_run 0 nsec
> run_test:PASS:test_run ret 0 nsec
> run_test:PASS:modify_return side_effect 0 nsec
> run_test:PASS:modify_return fentry_result 0 nsec
> run_test:PASS:modify_return fexit_result 0 nsec
> run_test:PASS:modify_return fmod_ret_result 0 nsec
> run_test:PASS:modify_return fentry_result2 0 nsec
> run_test:PASS:modify_return fexit_result2 0 nsec
> run_test:PASS:modify_return fmod_ret_result2 0 nsec
> run_test:PASS:skel_load 0 nsec
> run_test:PASS:modify_return__attach failed 0 nsec
> run_test:PASS:test_run 0 nsec
> run_test:PASS:test_run ret 0 nsec
> run_test:PASS:modify_return side_effect 0 nsec
> run_test:PASS:modify_return fentry_result 0 nsec
> run_test:PASS:modify_return fexit_result 0 nsec
> run_test:PASS:modify_return fmod_ret_result 0 nsec
> run_test:PASS:modify_return fentry_result2 0 nsec
> run_test:PASS:modify_return fexit_result2 0 nsec
> run_test:PASS:modify_return fmod_ret_result2 0 nsec
> #200     modify_return:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> Successfully unloaded bpf_testmod.ko.
> [root@localhost bpf]# ./test_progs -v -t module_attach
> bpf_testmod.ko is already unloaded.
> Loading bpf_testmod.ko...
> Successfully loaded bpf_testmod.ko.
> test_module_attach:PASS:skel_open 0 nsec
> test_module_attach:PASS:set_attach_target 0 nsec
> test_module_attach:PASS:set_attach_target_explicit 0 nsec
> test_module_attach:PASS:skel_load 0 nsec
> libbpf: prog 'kprobe_multi': failed to attach: -EOPNOTSUPP
> libbpf: prog 'kprobe_multi': failed to auto-attach: -EOPNOTSUPP

the -EOPNOTSUPP comes from libbpf, but I am not sure if it is error in
kernel leads to libbpf error or libbpf itself, you can do strace -f
-s1024 -o /tmp/module_attatch.txt  ./test_progs -v -t module_attach.
The strace should have bpf syscall and I think it can tell you if the
-EOPNOTSUPP is the result of kernel error or libbpf, you can share the
strace if you want.


> test_module_attach:FAIL:skel_attach skeleton attach failed: -95
> #201     module_attach:FAIL
> Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> Successfully unloaded bpf_testmod.ko.
>
>
> Chenghao
>
> >
> > >
> > >
> > > Chenghao
> > >
> > > >
> > > > > > On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.mc.l=
i@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincent.mc=
.li@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenhua=
cai@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > Hi, Vincent,
> > > > > > > > >
> > > > > > > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vince=
nt.mc.li@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Folks,
> > > > > > > > > >
> > > > > > > > > > Hengqi mentioned offline that the loongarch kernel lock=
ed up when
> > > > > > > > > > running full bpf selftests, so I went ahead and ran mak=
e run_tests to
> > > > > > > > > > perform full bpf selftest, I observed lockup too. It ap=
pears the
> > > > > > > > > > lockup happens when running module_attach test which in=
cludes testing
> > > > > > > > > > on fentry so this could be related to the trampoline pa=
tch series. for
> > > > > > > > > > example, if I just run ./test_progs -t module_attach, t=
he kernel
> > > > > > > > > > lockup immediately.
> > > > > > > > > Is this a regression caused by the latest trampoline patc=
hes? Or in
> > > > > > > > > another word, Does vanilla 6.16 has this problem?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I suspect this is caused by the latest trampoline patches b=
ecause the
> > > > > > > > module_attach is to test the fentry feature for kernel modu=
le
> > > > > > > > functions, I believe Changhao and I only tested the fentry =
feature for
> > > > > > > > non-module kernel functions. I can try kernel without the t=
rampoline
> > > > > > > > patches and will let you know the result.
> > > > > > > >
> > > > > > >
> > > > > > > I reverted  trampoline patches from loongarch-next branch and=
 run
> > > > > > > ./test_progs -t module_attach simply just errors out with the=
 fentry
> > > > > > > feature not supported
> > > > > > >
> > > > > > > [root@fedora bpf]# ./test_progs -t module_attach
> > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUP=
P
> > > > > > > test_module_attach:FAIL:skel_attach skeleton attach failed: -=
524
> > > > > > > #205     module_attach:FAIL
> > > > > > >
> > > > > > > All error logs:
> > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUP=
P
> > > > > > > test_module_attach:FAIL:skel_attach skeleton attach failed: -=
524
> > > > > > > #205     module_attach:FAIL
> > > > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > > >
> > > > > > > I also tested loongarch-next branch with the trampoline patch=
 series
> > > > > > > with no lockup kernel config so I can run dmesg to check kern=
el error
> > > > > > > log,  ./test_progs -t module_attach result in below kernel lo=
g:
> > > > > > >
> > > > > > > [  417.429954] bpf_testmod: loading out-of-tree module taints=
 kernel.
> > > > > > > [  419.728620] CPU 70475748 Unable to handle kernel paging re=
quest at
> > > > > > > virtual address 0000000800000024, era =3D=3D 90000000041d5854=
, ra =3D=3D
> > > > > > > 90000000041d5848
> > > > > > > [  419.728629] Oops[#1]:
> > > > > > > [  419.728632] CPU 70475748 Unable to handle kernel paging re=
quest at
> > > > > > > virtual address 0000000000000018, era =3D=3D 9000000005750268=
, ra =3D=3D
> > > > > > > 9000000004163938
> > > > > > > [  441.305370] rcu: INFO: rcu_preempt detected stalls on CPUs=
/tasks:
> > > > > > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > > > > > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fqs=3D=
2599
> > > > > > > [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies, g=
=3D60333, q=3D186 ncpus=3D8)
> > > > > > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > > > > > [  451.305494] rcu: rcu_preempt kthread starved for 2499 jiff=
ies!
> > > > > > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> > > > > > > [  451.305500] rcu:     Unless rcu_preempt kthread gets suffi=
cient CPU
> > > > > > > time, OOM is now expected behavior.
> > > > > > > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > > > > > > [  451.305504] task:rcu_preempt     state:R stack:0     pid:1=
5
> > > > > > > tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> > > > > > > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > > > > > > 0000000000000010 90000001003b0680
> > > > > > > [  451.305519]         90000000058e0000 0000000000000000
> > > > > > > 0000000000000040 9000000006c2dfd0
> > > > > > > [  451.305526]         900000000578c9b0 0000000000000001
> > > > > > > 9000000006b21000 0000000000000005
> > > > > > > [  451.305533]         00000001000093a8 00000001000093a8
> > > > > > > 0000000000000000 0000000000000004
> > > > > > > [  451.305540]         90000000058f04e0 0000000000000000
> > > > > > > 0000000000000002 b793724be1dfb2b8
> > > > > > > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > > > > > > 000000000000003f 9000000006c2dfd0
> > > > > > > [  451.305554]         9000000006c30c18 0000000000000005
> > > > > > > 9000000006b0e000 9000000006b21000
> > > > > > > [  451.305560]         9000000100453c98 90000001003aff80
> > > > > > > 9000000006c31140 900000000578c9b0
> > > > > > > [  451.305567]         00000001000093a8 9000000005794d3c
> > > > > > > 00000000000000b4 0000000000000000
> > > > > > > [  451.305574]         90000000024021b8 00000001000093a8
> > > > > > > 9000000004284f20 000000000a400001
> > > > > > > [  451.305581]         ...
> > > > > > > [  451.305584] Call Trace:
> > > > > > > [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> > > > > > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > > > > > > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0x1=
40
> > > > > > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0x8=
68
> > > > > > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x2e=
0
> > > > > > > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > > > > > > [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+0x=
28/0xc8
> > > > > > > [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_as=
m+0xc/0x88
> > > > > > >
> > > > > > > [  451.305630] rcu: Stack dump where RCU GP kthread last ran:
> > > > > > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > > > > > [  451.305636] NMI backtrace for cpu 1 skipped: idling at idl=
e_exit+0x0/0x4
> > > > > > > [  451.306655] rcu: INFO: rcu_preempt detected expedited stal=
ls on
> > > > > > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > > > > > > [  451.306665] rcu: blocking rcu_node structures (internal RC=
U debug):
> > > > > > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > > > > > [  451.306672] Unable to send backtrace IPI to CPU5 - perhaps=
 it hung?
> > > > > > >
> > > > > > > So related to trampoline patches for sure unless I am missing=
 something.
> > > > > > >
> > > > > > > > > Huacai
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > A side note, if I put the module_attach test in
> > > > > > > > > > tools/testing/selftests/bpf/DENYLIST to skip the module=
_attach test,
> > > > > > > > > > the module_attach test is not skipped.
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > >
> > > > > > > > > > Vincent
