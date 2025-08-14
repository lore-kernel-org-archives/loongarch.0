Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65972FE052
	for <loongarch@lists.linux.dev>; Thu, 14 Aug 2025 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179245; cv=none; b=eqhu+MKYCm/1XOvZbFNt8n6SEKt+Sh5+BuhCwax9VyVC/iOsAJBUjm/Y4sr0fyNvvTdTJ68jpRJtkeybp7sXz4oTJ0rDnznnY6a9K49a7IHXgZW8jCIIk4u0pzjqG2EXHiEHXkiOvQ+z4GouGVLLtTHFwV8ku1J0Hj7dcBCnENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179245; c=relaxed/simple;
	bh=IER0MRRvNseY9TrFxRuQeSrmO96ZKX/DXws/3DKAL1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5wPIMcejPNOY3c50GFNiXRBxxyKrZGwfMEfopkYm7abMUH/AjyXiRECii5ViEP5w+VMUsJ/mdvwuRovHtVgFwMQ5WgEdOA+Nmp/x2Gs/FY54ed9Sme8+zm84ft1XDs5Tc57EqMUGz6WLSQAoGjI+7mt/RBhLvvHZRQlut69HCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTa2pP4L; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTa2pP4L"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b109912545so10170351cf.0
        for <loongarch@lists.linux.dev>; Thu, 14 Aug 2025 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755179243; x=1755784043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cGVdhMSMxMUJFIxbLM4xRzA7IRJycF1FbmpblfV0N4=;
        b=BTa2pP4LGc/OIiUFsCUf5CP78PmGacJQNQQPJCeBoX4q/Bb2aAiA2eNySkA8BBo6Ew
         TtkdZJT83SAEHAyhWAnogxM3UjKEFt5XIUTc8Vgp8zNqOy2M1wtOX3b/mfCOtHumfDbO
         JQudGqdXLZLHCb00w47uFBychIXE7Bvc+mE8C1ySvQaZfZyH90tEOKphdciGIDO3rh0u
         CGCM1tfppGBUkuXPmpw/eqn5/c8dp4EpNj2nRNQyyuN78tTp92OpZRpZqV09A0VVvvLb
         dBTYkTL4H8f35D6D8Tq1FEUkPOqkPCDmhmIu8nQ0QZBtxzvGGjVRR5LDm9rL+0g2AUsN
         LiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179243; x=1755784043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cGVdhMSMxMUJFIxbLM4xRzA7IRJycF1FbmpblfV0N4=;
        b=fn/kzgMVkohaKWFexPUxE2wc4WLintKguxm3NkokQPNb1ql6ojpbLPK3W3czi6Zn5y
         LPGdtWUnFferw6KXH567qm+spmAdw/TDCrwjt8grkqmNWMRH+grIY7lMfkCqqVpW0U+F
         YKChGI5z5RTqAxNXTaeWw2Nf/CVmvguNfSVp2TdhgrvBK64SKSvatVAFLd5C5e3cKPY4
         igIPdbzM9FKtj1rb+5ntPeSxDYtUmvG1/Lj08GbdeilC3aZrDPZ6UOp5mLQlCKaBoFBZ
         ebYsnATlxXJRlhdUphdEqZM6JknfI6puhoRWQ/M1qK2LwBfHYJQq8IvG31Rgn3gsdocc
         +l1g==
X-Forwarded-Encrypted: i=1; AJvYcCV4kPiL8Z4U0Ccejqg7P0yKG1xu8mGb2ssMNlL0WN0K7atx/djGfsYrHRpoOYjQy/NmTvZgZq1GNwc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRVmP9cu2/S7FEkBmZSD4FV42pIziJn0NAfB/pn0aiIIU3CdMf
	knqg3b+wQHK8kS2XzkX+3PYHaXMJe+7RnuV6fqS6Rb4FeloCSJE3SMMnOVsjtxdOs8xpcFz/TdF
	i2WtFq+8myLfz0O2ex8JnHztvfiv3vNY=
X-Gm-Gg: ASbGncsINqNOim0Yu36IKZDK0WJ2T06aXN4ZBX8XR8Sz2siXz+AiEVp91PEnM+yJNrC
	PyEAYgZ/oZJStfhzUp4fw5W6VYUci7Gp9w2GsJENbui7EHJsmn9yEFbJbjrDqNCXABPcFjiG0GK
	rb6uifc/wbuoa2eBQw2ymFR0DvMwak4CrwSd5I2s5lJihIrC2jER5+v00T2cnyObBQH60REPr/U
	5rzpnnNKD1bB2uJoI3NFroQpahxAEwD3CEZ7IYE2UKkWjT69Ai1CQw2MU3l
X-Google-Smtp-Source: AGHT+IFSWQGDNpredqZfsz387adNjD53Md7aY+De129O/XNJBc/4J2KIH8hfYVirbsOx+gAdbAzcDi3BtNqWVNAN2ic=
X-Received: by 2002:a05:622a:5507:b0:4b0:a034:cab0 with SMTP id
 d75a77b69052e-4b10a977464mr37194061cf.20.1755179242534; Thu, 14 Aug 2025
 06:47:22 -0700 (PDT)
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
 <20250814120015.GA1626128@chenghao-pc> <CAK3+h2zkVk0LyB_yi1h0f0c--RN0hUP01=2Sf-dACF8R37-Gig@mail.gmail.com>
In-Reply-To: <CAK3+h2zkVk0LyB_yi1h0f0c--RN0hUP01=2Sf-dACF8R37-Gig@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 14 Aug 2025 06:47:10 -0700
X-Gm-Features: Ac12FXzHQIHDO7dVOnB156Kq3O38lemvc6gONNLOlGIB6W-5W6tYpk09NoNmhTY
Message-ID: <CAK3+h2wbvmMeTj91R2R2S6QYWMOsQmBWGPDZkZDUaOFoHHLyVg@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 6:42=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Thu, Aug 14, 2025 at 5:00=E2=80=AFAM Chenghao Duan <duanchenghao@kylin=
os.cn> wrote:
> >
> > On Tue, Aug 12, 2025 at 06:42:08AM -0700, Vincent Li wrote:
> > > On Tue, Aug 12, 2025 at 1:34=E2=80=AFAM Chenghao Duan <duanchenghao@k=
ylinos.cn> wrote:
> > > >
> > > > On Sun, Aug 10, 2025 at 10:39:24AM -0700, Vincent Li wrote:
> > > > > Hi Chenghao,
> > > > >
> > > > > On Sat, Aug 9, 2025 at 12:11=E2=80=AFPM Vincent Li <vincent.mc.li=
@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chenhuacai=
@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi, Chenghao,
> > > > > > >
> > > > > > > Please take a look.
> > > > > > >
> > > > > > > Huacai
> > > > > > >
> > > > > > I reverted loongson-next branch  tailcall count fix patches, st=
ruct
> > > > > > ops trampoline patch, keep the rest of trampoline patches,
> > > > > > module_attach test experienced the same issue, so definitely
> > > > > > trampoline patches issue.
> > > > > >
> > > > >
> > > > > I attempted to isolate which test in module_attach triggers the
> > > > > "Unable to handle kernel paging request..." error, it appears to =
be
> > > > > this one in "prog_tests/module_attach.c"
> > > > >
> > > > > ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read");
> > > > >
> > > > > you can try to comment out other tests in "prog_tests/module_atta=
ch.c"
> > > > > and perform the test, it might help isolate the issue.
> > > > >
> > > >
> > > > Hi Vincent,
> > > >
> > > > The results I tested are different from yours. Could there be other
> > > > differences between us? I am using the latest code of the loongarch=
-next
> > > > branch.
> > > >
> > > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > > bpf_testmod.ko is already unloaded.
> > > > Loading bpf_testmod.ko...
> > > > Successfully loaded bpf_testmod.ko.
> > > > test_module_attach:PASS:skel_open 0 nsec
> > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > WATCHDOG: test case module_attach executes for 10 seconds...
> > > > libbpf: prog 'handle_fmod_ret': BPF program load failed: -EINVAL
> > > > libbpf: prog 'handle_fmod_ret': -- BEGIN PROG LOAD LOG --
> > > > bpf_testmod_test_read() is not modifiable
> > > > processed 0 insns (limit 1000000) max_states_per_insn 0 total_state=
s 0 peak_states 0 mark_read 0
> > > > -- END PROG LOAD LOG --
> > > > libbpf: prog 'handle_fmod_ret': failed to load: -EINVAL
> > > > libbpf: failed to load object 'test_module_attach'
> > > > libbpf: failed to load BPF skeleton 'test_module_attach': -EINVAL
> > > > test_module_attach:FAIL:skel_load failed to load skeleton
> > > > #205     module_attach:FAIL
> > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > Successfully unloaded bpf_testmod.ko.
> > > >
> > >
> > > I build and run the most recent loongarch-next kernel too, can you tr=
y
> > > my config https://www.bpfire.net/download/loongfire/config.txt? I am
> > > on fedora, here are the steps I build, run the kernel, and run the
> > > test
> > >
> > > 1, check branch
> > > [root@fedora linux-loongson]# git branch
> > > * loongarch-next
> > >   master
> > >   no-tailcall
> > >   no-trampoline
> > >
> > > 2, build kernel and reboot
> > > cp config.txt .config; make clean; make -j6; make modules_install;
> > > make install; grub2-mkconfig -o /boot/grub2/grub.cfg; reboot
> > >
> > > 3, after reboot and login, build bpf selftests, run module_attach
> > > test, dmesg to check kernel log
> > > cd tools/testing/selftests/bpf; make -j6; ./test_progs -t module_atta=
ch
> > >
> >
> > Hi Vincent,
> >
> > I tried to refer to the config you provided, but the test results I
> > obtained are as follows. I also specifically tested "modify" to verify
> > the effectiveness of the patch, and the test of module_attach returns -=
EOPNOTSUPP.
> >
> > [root@localhost bpf]# ./test_progs -v -t modify_return
> > bpf_testmod.ko is already unloaded.
> > Loading bpf_testmod.ko...
> > Successfully loaded bpf_testmod.ko.
> > run_test:PASS:skel_load 0 nsec
> > run_test:PASS:modify_return__attach failed 0 nsec
> > run_test:PASS:test_run 0 nsec
> > run_test:PASS:test_run ret 0 nsec
> > run_test:PASS:modify_return side_effect 0 nsec
> > run_test:PASS:modify_return fentry_result 0 nsec
> > run_test:PASS:modify_return fexit_result 0 nsec
> > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > run_test:PASS:modify_return fentry_result2 0 nsec
> > run_test:PASS:modify_return fexit_result2 0 nsec
> > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > run_test:PASS:skel_load 0 nsec
> > run_test:PASS:modify_return__attach failed 0 nsec
> > run_test:PASS:test_run 0 nsec
> > run_test:PASS:test_run ret 0 nsec
> > run_test:PASS:modify_return side_effect 0 nsec
> > run_test:PASS:modify_return fentry_result 0 nsec
> > run_test:PASS:modify_return fexit_result 0 nsec
> > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > run_test:PASS:modify_return fentry_result2 0 nsec
> > run_test:PASS:modify_return fexit_result2 0 nsec
> > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > #200     modify_return:OK
> > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > Successfully unloaded bpf_testmod.ko.
> > [root@localhost bpf]# ./test_progs -v -t module_attach
> > bpf_testmod.ko is already unloaded.
> > Loading bpf_testmod.ko...
> > Successfully loaded bpf_testmod.ko.
> > test_module_attach:PASS:skel_open 0 nsec
> > test_module_attach:PASS:set_attach_target 0 nsec
> > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > test_module_attach:PASS:skel_load 0 nsec
> > libbpf: prog 'kprobe_multi': failed to attach: -EOPNOTSUPP
> > libbpf: prog 'kprobe_multi': failed to auto-attach: -EOPNOTSUPP
> > test_module_attach:FAIL:skel_attach skeleton attach failed: -95
> > #201     module_attach:FAIL
> > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > Successfully unloaded bpf_testmod.ko.
> >
> this is what I got with addition of -v, it appears you failed at
> skel_attach and maybe your libbpf is outdated and does not support
> kprobe_multi? my libbpf is 1.5
>
> /usr/lib64/libbpf.so.1.5.0
>

also double check if you have below in the .config? I recall
kprobe_multi requires CONFIG_FPROBE

[root@fedora linux-loongson]# grep 'KPROBE' .config
CONFIG_KPROBES=3Dy
CONFIG_KPROBES_ON_FTRACE=3Dy
CONFIG_HAVE_KPROBES=3Dy
CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
CONFIG_KPROBE_EVENTS=3Dy
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_BPF_KPROBE_OVERRIDE=3Dy
# CONFIG_KPROBE_EVENT_GEN_TEST is not set


[root@fedora linux-loongson]# grep 'FPROBE' .config
CONFIG_FPROBE=3Dy
CONFIG_FPROBE_EVENTS=3Dy

> [root@fedora bpf]# ./test_progs -v -t module_attach
> bpf_testmod.ko is already unloaded.
> Loading bpf_testmod.ko...
> Successfully loaded bpf_testmod.ko.
> test_module_attach:PASS:skel_open 0 nsec
> test_module_attach:PASS:set_attach_target 0 nsec
> test_module_attach:PASS:set_attach_target_explicit 0 nsec
> test_module_attach:PASS:skel_load 0 nsec
> test_module_attach:PASS:skel_attach 0 nsec
> trigger_module_test_read:PASS:testmod_file_open 0 nsec
> WATCHDOG: test case module_attach executes for 10 seconds...
> WATCHDOG: test case module_attach executes for 120 seconds,
> terminating with SIGSEGV
>
> >
> > Chenghao
> >
> > >
> > > >
> > > >
> > > > Chenghao
> > > >
> > > > >
> > > > > > > On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.mc=
.li@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincent.=
mc.li@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenh=
uacai@kernel.org> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi, Vincent,
> > > > > > > > > >
> > > > > > > > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vin=
cent.mc.li@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Folks,
> > > > > > > > > > >
> > > > > > > > > > > Hengqi mentioned offline that the loongarch kernel lo=
cked up when
> > > > > > > > > > > running full bpf selftests, so I went ahead and ran m=
ake run_tests to
> > > > > > > > > > > perform full bpf selftest, I observed lockup too. It =
appears the
> > > > > > > > > > > lockup happens when running module_attach test which =
includes testing
> > > > > > > > > > > on fentry so this could be related to the trampoline =
patch series. for
> > > > > > > > > > > example, if I just run ./test_progs -t module_attach,=
 the kernel
> > > > > > > > > > > lockup immediately.
> > > > > > > > > > Is this a regression caused by the latest trampoline pa=
tches? Or in
> > > > > > > > > > another word, Does vanilla 6.16 has this problem?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I suspect this is caused by the latest trampoline patches=
 because the
> > > > > > > > > module_attach is to test the fentry feature for kernel mo=
dule
> > > > > > > > > functions, I believe Changhao and I only tested the fentr=
y feature for
> > > > > > > > > non-module kernel functions. I can try kernel without the=
 trampoline
> > > > > > > > > patches and will let you know the result.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I reverted  trampoline patches from loongarch-next branch a=
nd run
> > > > > > > > ./test_progs -t module_attach simply just errors out with t=
he fentry
> > > > > > > > feature not supported
> > > > > > > >
> > > > > > > > [root@fedora bpf]# ./test_progs -t module_attach
> > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTS=
UPP
> > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach failed:=
 -524
> > > > > > > > #205     module_attach:FAIL
> > > > > > > >
> > > > > > > > All error logs:
> > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTS=
UPP
> > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach failed:=
 -524
> > > > > > > > #205     module_attach:FAIL
> > > > > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > > > >
> > > > > > > > I also tested loongarch-next branch with the trampoline pat=
ch series
> > > > > > > > with no lockup kernel config so I can run dmesg to check ke=
rnel error
> > > > > > > > log,  ./test_progs -t module_attach result in below kernel =
log:
> > > > > > > >
> > > > > > > > [  417.429954] bpf_testmod: loading out-of-tree module tain=
ts kernel.
> > > > > > > > [  419.728620] CPU 70475748 Unable to handle kernel paging =
request at
> > > > > > > > virtual address 0000000800000024, era =3D=3D 90000000041d58=
54, ra =3D=3D
> > > > > > > > 90000000041d5848
> > > > > > > > [  419.728629] Oops[#1]:
> > > > > > > > [  419.728632] CPU 70475748 Unable to handle kernel paging =
request at
> > > > > > > > virtual address 0000000000000018, era =3D=3D 90000000057502=
68, ra =3D=3D
> > > > > > > > 9000000004163938
> > > > > > > > [  441.305370] rcu: INFO: rcu_preempt detected stalls on CP=
Us/tasks:
> > > > > > > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > > > > > > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fqs=
=3D2599
> > > > > > > > [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies, g=
=3D60333, q=3D186 ncpus=3D8)
> > > > > > > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > > > > > > [  451.305494] rcu: rcu_preempt kthread starved for 2499 ji=
ffies!
> > > > > > > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> > > > > > > > [  451.305500] rcu:     Unless rcu_preempt kthread gets suf=
ficient CPU
> > > > > > > > time, OOM is now expected behavior.
> > > > > > > > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > > > > > > > [  451.305504] task:rcu_preempt     state:R stack:0     pid=
:15
> > > > > > > > tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> > > > > > > > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > > > > > > > 0000000000000010 90000001003b0680
> > > > > > > > [  451.305519]         90000000058e0000 0000000000000000
> > > > > > > > 0000000000000040 9000000006c2dfd0
> > > > > > > > [  451.305526]         900000000578c9b0 0000000000000001
> > > > > > > > 9000000006b21000 0000000000000005
> > > > > > > > [  451.305533]         00000001000093a8 00000001000093a8
> > > > > > > > 0000000000000000 0000000000000004
> > > > > > > > [  451.305540]         90000000058f04e0 0000000000000000
> > > > > > > > 0000000000000002 b793724be1dfb2b8
> > > > > > > > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > > > > > > > 000000000000003f 9000000006c2dfd0
> > > > > > > > [  451.305554]         9000000006c30c18 0000000000000005
> > > > > > > > 9000000006b0e000 9000000006b21000
> > > > > > > > [  451.305560]         9000000100453c98 90000001003aff80
> > > > > > > > 9000000006c31140 900000000578c9b0
> > > > > > > > [  451.305567]         00000001000093a8 9000000005794d3c
> > > > > > > > 00000000000000b4 0000000000000000
> > > > > > > > [  451.305574]         90000000024021b8 00000001000093a8
> > > > > > > > 9000000004284f20 000000000a400001
> > > > > > > > [  451.305581]         ...
> > > > > > > > [  451.305584] Call Trace:
> > > > > > > > [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> > > > > > > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > > > > > > > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0=
x140
> > > > > > > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0=
x868
> > > > > > > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x=
2e0
> > > > > > > > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > > > > > > > [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+=
0x28/0xc8
> > > > > > > > [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_=
asm+0xc/0x88
> > > > > > > >
> > > > > > > > [  451.305630] rcu: Stack dump where RCU GP kthread last ra=
n:
> > > > > > > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > > > > > > [  451.305636] NMI backtrace for cpu 1 skipped: idling at i=
dle_exit+0x0/0x4
> > > > > > > > [  451.306655] rcu: INFO: rcu_preempt detected expedited st=
alls on
> > > > > > > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > > > > > > > [  451.306665] rcu: blocking rcu_node structures (internal =
RCU debug):
> > > > > > > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > > > > > > [  451.306672] Unable to send backtrace IPI to CPU5 - perha=
ps it hung?
> > > > > > > >
> > > > > > > > So related to trampoline patches for sure unless I am missi=
ng something.
> > > > > > > >
> > > > > > > > > > Huacai
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > A side note, if I put the module_attach test in
> > > > > > > > > > > tools/testing/selftests/bpf/DENYLIST to skip the modu=
le_attach test,
> > > > > > > > > > > the module_attach test is not skipped.
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > >
> > > > > > > > > > > Vincent
