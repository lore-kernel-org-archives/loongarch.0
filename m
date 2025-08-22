Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D428A704
	for <loongarch@lists.linux.dev>; Fri, 22 Aug 2025 05:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755839433; cv=none; b=jpybOdZSgoTkUP6YthUmePF83tEsl4J+mT9ElIqKK1t5ols1USqPg4TSlGOHG/Pybj0Gb5p0J7Q+lF/wdCnHi/oeNVg/6HhX7I7+EPZFYa9Km7MPO5asgIFlzSSSrkgd4bInaGokmKtlIspKSkjcj1zSuYqJtEl1iwYcG2SMqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755839433; c=relaxed/simple;
	bh=AhH083+mvc1ssz3Out+ZnPqhwtIs0jRo9Bf0B1nSpiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbCT61BOr7XbhtnZn+A+HiL7q5GkQiQ8J2QJL3lycjacOou5ecr7XbaaFaF5aMDdghSG/Hy2cZ3xOrVSCTjG4X5W7aetKIMpSzzLdQKFOW3M7WpFLBHSvy1DcriGypydtmri9m/Booudaw7p+9Xa9uvT8WTK44fZcEWPz+D1o/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbszAzng; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbszAzng"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b297962b20so16119701cf.2
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 22:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755839430; x=1756444230; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9x8HEF1V52u1EfPZEb1jx4OB888o3t7fWCWHEji6zao=;
        b=BbszAzngRGkTRAvzKgfh4YL/lnvWIbZh040FcAVc36BGL2VrUSqk6HoOGs2fDwLumh
         kqe2n/gAMKr+ffbfMCmqRyddhujSr5V++my6AWXNrpFGNOdfboXlXOpEaidW3Up94QEc
         E+bsOaucxBTRxLmoVd1K8MmbOOKUgvYh78yX77KyvjICb+4JUWHWN2k5d7QBVvv7TBv4
         RWPxRilcd7NadWBECTGlobuiI/hBmCVKZxVZjSFyQaUxJ115iS+R4qpBe6uqcfszBiXK
         Z9+zJfyb6JMwdkUhgTd2Y57RheWgdb3eDt6X+CqEAvY9ZfjiMiONeIpsfUIYzAH2Bh1i
         6J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755839430; x=1756444230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x8HEF1V52u1EfPZEb1jx4OB888o3t7fWCWHEji6zao=;
        b=fIR+c9SPF78wW9Orn4UUUzTNskFkbW8oIRNhimSf/umZjKJQ8eFz17yBtSh0OCbfJv
         Gy0H44jdF2QnYGCaK0qjEyr4TjE0Of+PRhkIPE4e1X4vbrpHB2yDATGZloj40CY2I/wm
         dK1leCwgbCamejFQyYag3n//+U36xgyJENRRck0D28zHeOkvZbqaQfLAQxzlaD4puScj
         GU0F1cywBhFfVtjbqne8A5PcXwfsjYgmlkMaZByV3KHe7GP55oAEgQJmpqOYiCT+BpA+
         EZx/6UQskyIcnOZH/dFXPvfanb93Ll9Rq6cNULrxJblhjKUjayOUMZZ2TWu0l4SIOQCD
         jztQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsDzTnEvDfqBk8ZDHcf5HThbXb5RHS/fRJXmgdy+nwbzV48/pFWhYeq0NkPKX+SO5DwXOZJIJFtg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMEpONYC5q48M4oRoelqm9TT0lxkxOjqwtUgPepUM8dazSFS4/
	yTD66ddhOTfPseYDc5ey/kpraOgwKQITNXz+f9vAIDoXQC40e5h19OzQmDPEanRPeTGkPQWy8LE
	nEX9GxCCDwMeylcf3/PrWZLlkMNYaiW7Y3WCM
X-Gm-Gg: ASbGncvadZFgFdG8s4luRANiDTp/5gOq9mw+wLaSOlK8hfnTSterpdRu2nY0Z84RBgF
	M4q401OUYMENx+jcevdi64d/NryaCIlJN5e7FZ3JhJBTCYlGCosuCPhdKD9kRYpXG8lqaPXrdi8
	ljSx/XAdVsd8PC/xrawwJF59kLC76PsmfCVD8qYRYCnUwdDfsNKQUbPJysnKGPWRAaorgGVI4c8
	wItTns=
X-Google-Smtp-Source: AGHT+IE0uh48rpYXCTEyzxggGTrvLIADEz3SBOHcOP+BU2VHUlEWOe1Qhlw/zhE2Wr1OUuWtVRFouMP6h1bPoM9Exb0=
X-Received: by 2002:a05:622a:24a:b0:4b0:7e8c:64cd with SMTP id
 d75a77b69052e-4b2aaa57eabmr23700061cf.4.1755839429557; Thu, 21 Aug 2025
 22:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
 <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com>
 <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com>
 <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
 <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
 <CAK3+h2wcOQr0iv=-K7WOCQkMkQb7b6gR77W7GSwuVqJuvc+fxQ@mail.gmail.com>
 <20250812083441.GA1119757@chenghao-pc> <CAK3+h2x1gjuqEsUSj+B-9sb73kRo3bStH6ROw=1LVSqQGMNcUw@mail.gmail.com>
 <20250814120015.GA1626128@chenghao-pc> <CAK3+h2zO5bMnGTNb30=ggi8bg1-+gbaP1HfBoatJ4FVMuRgZdw@mail.gmail.com>
 <20250822031102.GA331509@chenghao-pc>
In-Reply-To: <20250822031102.GA331509@chenghao-pc>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 21 Aug 2025 22:10:16 -0700
X-Gm-Features: Ac12FXzZfLNsCD_BaGXvk3gnCaw3g_Fb_nE1G5liGYQ_LyyKdLH4xh2XEQS1xWI
Message-ID: <CAK3+h2y6fgzG8MfFU+bwUNa7N+PJeAYwXnr+4kC-DF+yGezgPQ@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:11=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> On Thu, Aug 21, 2025 at 08:04:07AM -0700, Vincent Li wrote:
> > On Thu, Aug 14, 2025 at 5:00=E2=80=AFAM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > On Tue, Aug 12, 2025 at 06:42:08AM -0700, Vincent Li wrote:
> > > > On Tue, Aug 12, 2025 at 1:34=E2=80=AFAM Chenghao Duan <duanchenghao=
@kylinos.cn> wrote:
> > > > >
> > > > > On Sun, Aug 10, 2025 at 10:39:24AM -0700, Vincent Li wrote:
> > > > > > Hi Chenghao,
> > > > > >
> > > > > > On Sat, Aug 9, 2025 at 12:11=E2=80=AFPM Vincent Li <vincent.mc.=
li@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chenhuac=
ai@kernel.org> wrote:
> > > > > > > >
> > > > > > > > Hi, Chenghao,
> > > > > > > >
> > > > > > > > Please take a look.
> > > > > > > >
> > > > > > > > Huacai
> > > > > > > >
> > > > > > > I reverted loongson-next branch  tailcall count fix patches, =
struct
> > > > > > > ops trampoline patch, keep the rest of trampoline patches,
> > > > > > > module_attach test experienced the same issue, so definitely
> > > > > > > trampoline patches issue.
> > > > > > >
> > > > > >
> > > > > > I attempted to isolate which test in module_attach triggers the
> > > > > > "Unable to handle kernel paging request..." error, it appears t=
o be
> > > > > > this one in "prog_tests/module_attach.c"
> > > > > >
> > > > > > ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read");
> > > > > >
> > > > > > you can try to comment out other tests in "prog_tests/module_at=
tach.c"
> > > > > > and perform the test, it might help isolate the issue.
> > > > > >
> > > > >
> > > > > Hi Vincent,
> > > > >
> > > > > The results I tested are different from yours. Could there be oth=
er
> > > > > differences between us? I am using the latest code of the loongar=
ch-next
> > > > > branch.
> > > > >
> > > > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > > > bpf_testmod.ko is already unloaded.
> > > > > Loading bpf_testmod.ko...
> > > > > Successfully loaded bpf_testmod.ko.
> > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > WATCHDOG: test case module_attach executes for 10 seconds...
> > > > > libbpf: prog 'handle_fmod_ret': BPF program load failed: -EINVAL
> > > > > libbpf: prog 'handle_fmod_ret': -- BEGIN PROG LOAD LOG --
> > > > > bpf_testmod_test_read() is not modifiable
> > > > > processed 0 insns (limit 1000000) max_states_per_insn 0 total_sta=
tes 0 peak_states 0 mark_read 0
> > > > > -- END PROG LOAD LOG --
> > > > > libbpf: prog 'handle_fmod_ret': failed to load: -EINVAL
> > > > > libbpf: failed to load object 'test_module_attach'
> > > > > libbpf: failed to load BPF skeleton 'test_module_attach': -EINVAL
> > > > > test_module_attach:FAIL:skel_load failed to load skeleton
> > > > > #205     module_attach:FAIL
> > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > Successfully unloaded bpf_testmod.ko.
> > > > >
> > > >
> > > > I build and run the most recent loongarch-next kernel too, can you =
try
> > > > my config https://www.bpfire.net/download/loongfire/config.txt? I a=
m
> > > > on fedora, here are the steps I build, run the kernel, and run the
> > > > test
> > > >
> > > > 1, check branch
> > > > [root@fedora linux-loongson]# git branch
> > > > * loongarch-next
> > > >   master
> > > >   no-tailcall
> > > >   no-trampoline
> > > >
> > > > 2, build kernel and reboot
> > > > cp config.txt .config; make clean; make -j6; make modules_install;
> > > > make install; grub2-mkconfig -o /boot/grub2/grub.cfg; reboot
> > > >
> > > > 3, after reboot and login, build bpf selftests, run module_attach
> > > > test, dmesg to check kernel log
> > > > cd tools/testing/selftests/bpf; make -j6; ./test_progs -t module_at=
tach
> > > >
> > >
> > > Hi Vincent,
> > >
> > > I tried to refer to the config you provided, but the test results I
> > > obtained are as follows. I also specifically tested "modify" to verif=
y
> > > the effectiveness of the patch, and the test of module_attach returns=
 -EOPNOTSUPP.
> > >
> > > [root@localhost bpf]# ./test_progs -v -t modify_return
> > > bpf_testmod.ko is already unloaded.
> > > Loading bpf_testmod.ko...
> > > Successfully loaded bpf_testmod.ko.
> > > run_test:PASS:skel_load 0 nsec
> > > run_test:PASS:modify_return__attach failed 0 nsec
> > > run_test:PASS:test_run 0 nsec
> > > run_test:PASS:test_run ret 0 nsec
> > > run_test:PASS:modify_return side_effect 0 nsec
> > > run_test:PASS:modify_return fentry_result 0 nsec
> > > run_test:PASS:modify_return fexit_result 0 nsec
> > > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > > run_test:PASS:modify_return fentry_result2 0 nsec
> > > run_test:PASS:modify_return fexit_result2 0 nsec
> > > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > > run_test:PASS:skel_load 0 nsec
> > > run_test:PASS:modify_return__attach failed 0 nsec
> > > run_test:PASS:test_run 0 nsec
> > > run_test:PASS:test_run ret 0 nsec
> > > run_test:PASS:modify_return side_effect 0 nsec
> > > run_test:PASS:modify_return fentry_result 0 nsec
> > > run_test:PASS:modify_return fexit_result 0 nsec
> > > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > > run_test:PASS:modify_return fentry_result2 0 nsec
> > > run_test:PASS:modify_return fexit_result2 0 nsec
> > > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > > #200     modify_return:OK
> > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > Successfully unloaded bpf_testmod.ko.
> > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > bpf_testmod.ko is already unloaded.
> > > Loading bpf_testmod.ko...
> > > Successfully loaded bpf_testmod.ko.
> > > test_module_attach:PASS:skel_open 0 nsec
> > > test_module_attach:PASS:set_attach_target 0 nsec
> > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > test_module_attach:PASS:skel_load 0 nsec
> > > libbpf: prog 'kprobe_multi': failed to attach: -EOPNOTSUPP
> > > libbpf: prog 'kprobe_multi': failed to auto-attach: -EOPNOTSUPP
> >
> > the -EOPNOTSUPP comes from libbpf, but I am not sure if it is error in
> > kernel leads to libbpf error or libbpf itself, you can do strace -f
> > -s1024 -o /tmp/module_attatch.txt  ./test_progs -v -t module_attach.
> > The strace should have bpf syscall and I think it can tell you if the
> > -EOPNOTSUPP is the result of kernel error or libbpf, you can share the
> > strace if you want.
> >
> 2037  read(16, "", 8192)                =3D 0
> 2037  close(16)                         =3D 0
> 2037  bpf(BPF_LINK_CREATE, {link_create=3D{prog_fd=3D61, target_fd=3D0, a=
ttach_type=3DBPF_TRACE_KPROBE_MULTI, flags=3D0, kprobe_multi=3D{flags=3D0, =
cnt=3D1, syms=3DNULL, addrs=3D[0xffff8000035717d0], cookies=3DNULL}}}, 64) =
=3D -1 EOPNOTSUPP (=E4=B8=8D=E6=94=AF=E6=8C=81=E7=9A=84=E6=93=8D=E4=BD=9C)

so bpf syscall cmd BPF_LINK_CREATE returns  '-1 EOPNOTSUPP' exactly? I
could not tell because I thought the return value is '-1'

> 2037  write(1, "libbpf: prog 'kprobe_multi': failed to attach: -EOPNOTSUP=
P\n", 59) =3D 59
> 2037  write(1, "libbpf: prog 'kprobe_multi': failed to auto-attach: -EOPN=
OTSUPP\n", 64) =3D 64
> 2037  write(1, "test_module_attach:FAIL:skel_attach skeleton attach faile=
d: -95\n", 64) =3D 64
>
> not support attach_type BPF_TRACE_KPROBE_MULTI
>

Could you share your kernel config (.config used for kernel compiling
or running kernel /boot/config-*)  ? I wonder if you have the FPROBE
really configured, since include/linux/fprobe.h has:

#ifdef CONFIG_FPROBE
int register_fprobe(struct fprobe *fp, const char *filter, const char
*notfilter);
int register_fprobe_ips(struct fprobe *fp, unsigned long *addrs, int num);
int register_fprobe_syms(struct fprobe *fp, const char **syms, int num);
int unregister_fprobe(struct fprobe *fp);
bool fprobe_is_registered(struct fprobe *fp);
int fprobe_count_ips_from_filter(const char *filter, const char *notfilter)=
;
#else
static inline int register_fprobe(struct fprobe *fp, const char
*filter, const char *notfilter)
{
        return -EOPNOTSUPP;
}
static inline int register_fprobe_ips(struct fprobe *fp, unsigned long
*addrs, int num)
{
        return -EOPNOTSUPP;
}
static inline int register_fprobe_syms(struct fprobe *fp, const char
**syms, int num)
{
        return -EOPNOTSUPP;
}
static inline int unregister_fprobe(struct fprobe *fp)
{
        return -EOPNOTSUPP;
}
static inline bool fprobe_is_registered(struct fprobe *fp)
{
        return false;
}
static inline int fprobe_count_ips_from_filter(const char *filter,
const char *notfilter)
{
        return -EOPNOTSUPP;
}
#endif

> Chenghao
>
>
> >
> > > test_module_attach:FAIL:skel_attach skeleton attach failed: -95
> > > #201     module_attach:FAIL
> > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > Successfully unloaded bpf_testmod.ko.
> > >
> > >
> > > Chenghao
> > >
> > > >
> > > > >
> > > > >
> > > > > Chenghao
> > > > >
> > > > > >
> > > > > > > > On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vincent.=
mc.li@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vincen=
t.mc.li@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <che=
nhuacai@kernel.org> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi, Vincent,
> > > > > > > > > > >
> > > > > > > > > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <v=
incent.mc.li@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Folks,
> > > > > > > > > > > >
> > > > > > > > > > > > Hengqi mentioned offline that the loongarch kernel =
locked up when
> > > > > > > > > > > > running full bpf selftests, so I went ahead and ran=
 make run_tests to
> > > > > > > > > > > > perform full bpf selftest, I observed lockup too. I=
t appears the
> > > > > > > > > > > > lockup happens when running module_attach test whic=
h includes testing
> > > > > > > > > > > > on fentry so this could be related to the trampolin=
e patch series. for
> > > > > > > > > > > > example, if I just run ./test_progs -t module_attac=
h, the kernel
> > > > > > > > > > > > lockup immediately.
> > > > > > > > > > > Is this a regression caused by the latest trampoline =
patches? Or in
> > > > > > > > > > > another word, Does vanilla 6.16 has this problem?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I suspect this is caused by the latest trampoline patch=
es because the
> > > > > > > > > > module_attach is to test the fentry feature for kernel =
module
> > > > > > > > > > functions, I believe Changhao and I only tested the fen=
try feature for
> > > > > > > > > > non-module kernel functions. I can try kernel without t=
he trampoline
> > > > > > > > > > patches and will let you know the result.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I reverted  trampoline patches from loongarch-next branch=
 and run
> > > > > > > > > ./test_progs -t module_attach simply just errors out with=
 the fentry
> > > > > > > > > feature not supported
> > > > > > > > >
> > > > > > > > > [root@fedora bpf]# ./test_progs -t module_attach
> > > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENO=
TSUPP
> > > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach faile=
d: -524
> > > > > > > > > #205     module_attach:FAIL
> > > > > > > > >
> > > > > > > > > All error logs:
> > > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENO=
TSUPP
> > > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach faile=
d: -524
> > > > > > > > > #205     module_attach:FAIL
> > > > > > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > > > > >
> > > > > > > > > I also tested loongarch-next branch with the trampoline p=
atch series
> > > > > > > > > with no lockup kernel config so I can run dmesg to check =
kernel error
> > > > > > > > > log,  ./test_progs -t module_attach result in below kerne=
l log:
> > > > > > > > >
> > > > > > > > > [  417.429954] bpf_testmod: loading out-of-tree module ta=
ints kernel.
> > > > > > > > > [  419.728620] CPU 70475748 Unable to handle kernel pagin=
g request at
> > > > > > > > > virtual address 0000000800000024, era =3D=3D 90000000041d=
5854, ra =3D=3D
> > > > > > > > > 90000000041d5848
> > > > > > > > > [  419.728629] Oops[#1]:
> > > > > > > > > [  419.728632] CPU 70475748 Unable to handle kernel pagin=
g request at
> > > > > > > > > virtual address 0000000000000018, era =3D=3D 900000000575=
0268, ra =3D=3D
> > > > > > > > > 9000000004163938
> > > > > > > > > [  441.305370] rcu: INFO: rcu_preempt detected stalls on =
CPUs/tasks:
> > > > > > > > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > > > > > > > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/72379 fq=
s=3D2599
> > > > > > > > > [  441.305386] rcu:     (detected by 4, t=3D5252 jiffies,=
 g=3D60333, q=3D186 ncpus=3D8)
> > > > > > > > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > > > > > > > [  451.305494] rcu: rcu_preempt kthread starved for 2499 =
jiffies!
> > > > > > > > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D1
> > > > > > > > > [  451.305500] rcu:     Unless rcu_preempt kthread gets s=
ufficient CPU
> > > > > > > > > time, OOM is now expected behavior.
> > > > > > > > > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > > > > > > > > [  451.305504] task:rcu_preempt     state:R stack:0     p=
id:15
> > > > > > > > > tgid:15    ppid:2      task_flags:0x208040 flags:0x000008=
00
> > > > > > > > > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > > > > > > > > 0000000000000010 90000001003b0680
> > > > > > > > > [  451.305519]         90000000058e0000 0000000000000000
> > > > > > > > > 0000000000000040 9000000006c2dfd0
> > > > > > > > > [  451.305526]         900000000578c9b0 0000000000000001
> > > > > > > > > 9000000006b21000 0000000000000005
> > > > > > > > > [  451.305533]         00000001000093a8 00000001000093a8
> > > > > > > > > 0000000000000000 0000000000000004
> > > > > > > > > [  451.305540]         90000000058f04e0 0000000000000000
> > > > > > > > > 0000000000000002 b793724be1dfb2b8
> > > > > > > > > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > > > > > > > > 000000000000003f 9000000006c2dfd0
> > > > > > > > > [  451.305554]         9000000006c30c18 0000000000000005
> > > > > > > > > 9000000006b0e000 9000000006b21000
> > > > > > > > > [  451.305560]         9000000100453c98 90000001003aff80
> > > > > > > > > 9000000006c31140 900000000578c9b0
> > > > > > > > > [  451.305567]         00000001000093a8 9000000005794d3c
> > > > > > > > > 00000000000000b4 0000000000000000
> > > > > > > > > [  451.305574]         90000000024021b8 00000001000093a8
> > > > > > > > > 9000000004284f20 000000000a400001
> > > > > > > > > [  451.305581]         ...
> > > > > > > > > [  451.305584] Call Trace:
> > > > > > > > > [  451.305586] [<900000000578b868>] __schedule+0x410/0x15=
20
> > > > > > > > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > > > > > > > > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98=
/0x140
> > > > > > > > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8=
/0x868
> > > > > > > > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/=
0x2e0
> > > > > > > > > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > > > > > > > > [  451.305619] [<9000000005787b60>] ret_from_kernel_threa=
d+0x28/0xc8
> > > > > > > > > [  451.305624] [<90000000041620e4>] ret_from_kernel_threa=
d_asm+0xc/0x88
> > > > > > > > >
> > > > > > > > > [  451.305630] rcu: Stack dump where RCU GP kthread last =
ran:
> > > > > > > > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > > > > > > > [  451.305636] NMI backtrace for cpu 1 skipped: idling at=
 idle_exit+0x0/0x4
> > > > > > > > > [  451.306655] rcu: INFO: rcu_preempt detected expedited =
stalls on
> > > > > > > > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > > > > > > > > [  451.306665] rcu: blocking rcu_node structures (interna=
l RCU debug):
> > > > > > > > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > > > > > > > [  451.306672] Unable to send backtrace IPI to CPU5 - per=
haps it hung?
> > > > > > > > >
> > > > > > > > > So related to trampoline patches for sure unless I am mis=
sing something.
> > > > > > > > >
> > > > > > > > > > > Huacai
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > A side note, if I put the module_attach test in
> > > > > > > > > > > > tools/testing/selftests/bpf/DENYLIST to skip the mo=
dule_attach test,
> > > > > > > > > > > > the module_attach test is not skipped.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > >
> > > > > > > > > > > > Vincent
