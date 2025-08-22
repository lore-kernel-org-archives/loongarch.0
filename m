Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C129E10F
	for <loongarch@lists.linux.dev>; Fri, 22 Aug 2025 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755840816; cv=none; b=eMTXBXIwopx6525frB1Hbfy+wk5VsyHDpeFovN6IlswqNwbl+rtGsiVIH+9PPQqbor98M9cG7z4SaDrN/PZe+pIoBwLzLiTPDPPOam+E47xpF5vn1yuLI5jS+1X+EHGoJnmyeRtFLV/euvKjvi0WKijIR16U3RfmrKbehn63sVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755840816; c=relaxed/simple;
	bh=frZknL4zDEQyTOypX1i3hulVJG3u85iYnlKKld5Py8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRTGTRe3Pj4Q5aeICaou7l708xM/9eASamNDmVrx/53pQ9HJdw/epTdXSf9rzkxh0BOZpM1VL2HPHYPn5BH43+/kW73k28U3QulDhiV7GToFm+rjaXyZKlDRGvrHnQbA9vVyXiRyQivyrs1zul9mgXZy4AF8z5/8bgsW6Jxa6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNqAerl7; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNqAerl7"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b133b24e66so13601471cf.2
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755840813; x=1756445613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rZkb7dQe4gZSCd1sWl9qfkx5crNBAuB5K9smx2+OYI=;
        b=XNqAerl7z9bGVG3Q6cCHIB5hnqGk/Ixg1xFG+ljVCbRQYnCr27varKQv8knvj+rjwt
         JuTMiS0IDpXaNaWbZa5E7nyYzG3haRqkUqDLkh0qr0Vpx4sDurcCQ+A/olF/3KspgKDu
         o27Z/fo6ctR0BgcPuEoql6VgCzLyAWb7x5klVbTvuzOo5/f0pgbunh73J+k7yB8Ur2s6
         oR72Xw/xE9pnRf3VRJxApDDi40laDtDiMY1yPUNzjwmmLJl1YzIowQJOJ7l22JoXhCRl
         fQ1dI09KvFXUgqniB9ah438nBmHHMNkFFKMXrj/+JCYedniMfnLzMYS8W6GgH+BWCvIt
         0mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755840813; x=1756445613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rZkb7dQe4gZSCd1sWl9qfkx5crNBAuB5K9smx2+OYI=;
        b=AYCxMMM68YLSQVCnwybyGtCy9m5bGnzBB7BoM/c+QZ3M1jNHsC4zpUtmApuFqAeqp9
         zPjUoHOmfFNpWUmNYvW02XSTfGkBk5Vq0JQmRsBw84L56wtUbNrljVk6egMX0qAMHEnu
         HCbklaY0SJwfB5DCTR3mKfDeg7hbI5RnUPhgqWoIhI3vmp7PsPsPBaDlOkIaMi0IKxAL
         6RnmFcPgL1c8R7zmdIAa1zDntxwxounQafF917UFdc/JWegSyl/ZAyRLrxdl09uDtyok
         /76YOU6FAxkqZWKhhjaKs8/kXnsSZZ1kMRtOGuNnmOmrqCmp7jUztplG5/G0MdSeHQPH
         wGZA==
X-Forwarded-Encrypted: i=1; AJvYcCXWsKEPSDZsPzPPI/QZq5i55utQkAk4ImPbntOpSC3/qkKCt11XIcrjfJx5SIbNafQkHyvQeYUCpBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAkZ9IFhN1GVSRbHWgqcP4OAvt1O6gJ4TiBAei5Bd6uLyxLejA
	QSEzTDdyoDmmAnf5KBdvDU7GfZWCN0rGd4FMNnHuHyqxP2g0uSwTxiahL7J1cSQICQmHIZ5zuNi
	ahhq7zqUcH0jtFNPvqhwlyeK+CUuZ3fyRJO0q
X-Gm-Gg: ASbGncsU460jvjomDJDdbKJ8ER8oT7XBggBlmd3qMICTRc04Xd0gB+8C0YeFXR0cjni
	ps221FQkVFuGYoGnDB2LUV7hHR1OCa8HRgXQsgSd+zMjPcSVp9IBAtm/id5WtSTE53mOlsomwRo
	4QG0liMDo67jW6NKKwo703H0JtE1T6/dsALiCdcZXqCWSb6ymgnUOt0hzfkaHtqcI7Uk85L0vZV
	ERMbsI=
X-Google-Smtp-Source: AGHT+IG3NjoxS4N+/8s+HwHVnJhM3vNeK2vTfpnjOaNDjDb/msh9GMNsjMpvTYtSJ18uIHRtzU0N/10Sj4wbkTMUbkU=
X-Received: by 2002:a05:622a:11c7:b0:4b2:8ac4:f095 with SMTP id
 d75a77b69052e-4b2aab41d87mr19461941cf.83.1755840812854; Thu, 21 Aug 2025
 22:33:32 -0700 (PDT)
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
 <20250822031102.GA331509@chenghao-pc> <CAK3+h2y6fgzG8MfFU+bwUNa7N+PJeAYwXnr+4kC-DF+yGezgPQ@mail.gmail.com>
 <CAK3+h2zascHxT3A+9CBkWPetCXx-Cgg0XSbcQoo2tNMDvuHmVg@mail.gmail.com>
In-Reply-To: <CAK3+h2zascHxT3A+9CBkWPetCXx-Cgg0XSbcQoo2tNMDvuHmVg@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 21 Aug 2025 22:33:21 -0700
X-Gm-Features: Ac12FXzHGsQnDjAbFaQZ88b_vkhNaSkdz3uNVzI9tcDXWIy-ag13PcxEg36AYhw
Message-ID: <CAK3+h2yH0YrShfiiuJCO20-Kq44VCu6m596=6cHdfDFgvVpvpw@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 10:22=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
>
> On Thu, Aug 21, 2025 at 10:10=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.=
com> wrote:
> >
> > On Thu, Aug 21, 2025 at 8:11=E2=80=AFPM Chenghao Duan <duanchenghao@kyl=
inos.cn> wrote:
> > >
> > > On Thu, Aug 21, 2025 at 08:04:07AM -0700, Vincent Li wrote:
> > > > On Thu, Aug 14, 2025 at 5:00=E2=80=AFAM Chenghao Duan <duanchenghao=
@kylinos.cn> wrote:
> > > > >
> > > > > On Tue, Aug 12, 2025 at 06:42:08AM -0700, Vincent Li wrote:
> > > > > > On Tue, Aug 12, 2025 at 1:34=E2=80=AFAM Chenghao Duan <duanchen=
ghao@kylinos.cn> wrote:
> > > > > > >
> > > > > > > On Sun, Aug 10, 2025 at 10:39:24AM -0700, Vincent Li wrote:
> > > > > > > > Hi Chenghao,
> > > > > > > >
> > > > > > > > On Sat, Aug 9, 2025 at 12:11=E2=80=AFPM Vincent Li <vincent=
.mc.li@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Aug 8, 2025 at 11:03=E2=80=AFPM Huacai Chen <chen=
huacai@kernel.org> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi, Chenghao,
> > > > > > > > > >
> > > > > > > > > > Please take a look.
> > > > > > > > > >
> > > > > > > > > > Huacai
> > > > > > > > > >
> > > > > > > > > I reverted loongson-next branch  tailcall count fix patch=
es, struct
> > > > > > > > > ops trampoline patch, keep the rest of trampoline patches=
,
> > > > > > > > > module_attach test experienced the same issue, so definit=
ely
> > > > > > > > > trampoline patches issue.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I attempted to isolate which test in module_attach triggers=
 the
> > > > > > > > "Unable to handle kernel paging request..." error, it appea=
rs to be
> > > > > > > > this one in "prog_tests/module_attach.c"
> > > > > > > >
> > > > > > > > ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read"=
);
> > > > > > > >
> > > > > > > > you can try to comment out other tests in "prog_tests/modul=
e_attach.c"
> > > > > > > > and perform the test, it might help isolate the issue.
> > > > > > > >
> > > > > > >
> > > > > > > Hi Vincent,
> > > > > > >
> > > > > > > The results I tested are different from yours. Could there be=
 other
> > > > > > > differences between us? I am using the latest code of the loo=
ngarch-next
> > > > > > > branch.
> > > > > > >
> > > > > > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > > > > > bpf_testmod.ko is already unloaded.
> > > > > > > Loading bpf_testmod.ko...
> > > > > > > Successfully loaded bpf_testmod.ko.
> > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > > > WATCHDOG: test case module_attach executes for 10 seconds...
> > > > > > > libbpf: prog 'handle_fmod_ret': BPF program load failed: -EIN=
VAL
> > > > > > > libbpf: prog 'handle_fmod_ret': -- BEGIN PROG LOAD LOG --
> > > > > > > bpf_testmod_test_read() is not modifiable
> > > > > > > processed 0 insns (limit 1000000) max_states_per_insn 0 total=
_states 0 peak_states 0 mark_read 0
> > > > > > > -- END PROG LOAD LOG --
> > > > > > > libbpf: prog 'handle_fmod_ret': failed to load: -EINVAL
> > > > > > > libbpf: failed to load object 'test_module_attach'
> > > > > > > libbpf: failed to load BPF skeleton 'test_module_attach': -EI=
NVAL
> > > > > > > test_module_attach:FAIL:skel_load failed to load skeleton
> > > > > > > #205     module_attach:FAIL
> > > > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > > > Successfully unloaded bpf_testmod.ko.
> > > > > > >
> > > > > >
> > > > > > I build and run the most recent loongarch-next kernel too, can =
you try
> > > > > > my config https://www.bpfire.net/download/loongfire/config.txt?=
 I am
> > > > > > on fedora, here are the steps I build, run the kernel, and run =
the
> > > > > > test
> > > > > >
> > > > > > 1, check branch
> > > > > > [root@fedora linux-loongson]# git branch
> > > > > > * loongarch-next
> > > > > >   master
> > > > > >   no-tailcall
> > > > > >   no-trampoline
> > > > > >
> > > > > > 2, build kernel and reboot
> > > > > > cp config.txt .config; make clean; make -j6; make modules_insta=
ll;
> > > > > > make install; grub2-mkconfig -o /boot/grub2/grub.cfg; reboot
> > > > > >
> > > > > > 3, after reboot and login, build bpf selftests, run module_atta=
ch
> > > > > > test, dmesg to check kernel log
> > > > > > cd tools/testing/selftests/bpf; make -j6; ./test_progs -t modul=
e_attach
> > > > > >
> > > > >
> > > > > Hi Vincent,
> > > > >
> > > > > I tried to refer to the config you provided, but the test results=
 I
> > > > > obtained are as follows. I also specifically tested "modify" to v=
erify
> > > > > the effectiveness of the patch, and the test of module_attach ret=
urns -EOPNOTSUPP.
> > > > >
> > > > > [root@localhost bpf]# ./test_progs -v -t modify_return
> > > > > bpf_testmod.ko is already unloaded.
> > > > > Loading bpf_testmod.ko...
> > > > > Successfully loaded bpf_testmod.ko.
> > > > > run_test:PASS:skel_load 0 nsec
> > > > > run_test:PASS:modify_return__attach failed 0 nsec
> > > > > run_test:PASS:test_run 0 nsec
> > > > > run_test:PASS:test_run ret 0 nsec
> > > > > run_test:PASS:modify_return side_effect 0 nsec
> > > > > run_test:PASS:modify_return fentry_result 0 nsec
> > > > > run_test:PASS:modify_return fexit_result 0 nsec
> > > > > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > > > > run_test:PASS:modify_return fentry_result2 0 nsec
> > > > > run_test:PASS:modify_return fexit_result2 0 nsec
> > > > > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > > > > run_test:PASS:skel_load 0 nsec
> > > > > run_test:PASS:modify_return__attach failed 0 nsec
> > > > > run_test:PASS:test_run 0 nsec
> > > > > run_test:PASS:test_run ret 0 nsec
> > > > > run_test:PASS:modify_return side_effect 0 nsec
> > > > > run_test:PASS:modify_return fentry_result 0 nsec
> > > > > run_test:PASS:modify_return fexit_result 0 nsec
> > > > > run_test:PASS:modify_return fmod_ret_result 0 nsec
> > > > > run_test:PASS:modify_return fentry_result2 0 nsec
> > > > > run_test:PASS:modify_return fexit_result2 0 nsec
> > > > > run_test:PASS:modify_return fmod_ret_result2 0 nsec
> > > > > #200     modify_return:OK
> > > > > Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> > > > > Successfully unloaded bpf_testmod.ko.
> > > > > [root@localhost bpf]# ./test_progs -v -t module_attach
> > > > > bpf_testmod.ko is already unloaded.
> > > > > Loading bpf_testmod.ko...
> > > > > Successfully loaded bpf_testmod.ko.
> > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > libbpf: prog 'kprobe_multi': failed to attach: -EOPNOTSUPP
> > > > > libbpf: prog 'kprobe_multi': failed to auto-attach: -EOPNOTSUPP
> > > >
> > > > the -EOPNOTSUPP comes from libbpf, but I am not sure if it is error=
 in
> > > > kernel leads to libbpf error or libbpf itself, you can do strace -f
> > > > -s1024 -o /tmp/module_attatch.txt  ./test_progs -v -t module_attach=
.
> > > > The strace should have bpf syscall and I think it can tell you if t=
he
> > > > -EOPNOTSUPP is the result of kernel error or libbpf, you can share =
the
> > > > strace if you want.
> > > >
> > > 2037  read(16, "", 8192)                =3D 0
> > > 2037  close(16)                         =3D 0
> > > 2037  bpf(BPF_LINK_CREATE, {link_create=3D{prog_fd=3D61, target_fd=3D=
0, attach_type=3DBPF_TRACE_KPROBE_MULTI, flags=3D0, kprobe_multi=3D{flags=
=3D0, cnt=3D1, syms=3DNULL, addrs=3D[0xffff8000035717d0], cookies=3DNULL}}}=
, 64) =3D -1 EOPNOTSUPP (=E4=B8=8D=E6=94=AF=E6=8C=81=E7=9A=84=E6=93=8D=E4=
=BD=9C)
> >
> > so bpf syscall cmd BPF_LINK_CREATE returns  '-1 EOPNOTSUPP' exactly? I
> > could not tell because I thought the return value is '-1'
> >
> > > 2037  write(1, "libbpf: prog 'kprobe_multi': failed to attach: -EOPNO=
TSUPP\n", 59) =3D 59
> > > 2037  write(1, "libbpf: prog 'kprobe_multi': failed to auto-attach: -=
EOPNOTSUPP\n", 64) =3D 64
> > > 2037  write(1, "test_module_attach:FAIL:skel_attach skeleton attach f=
ailed: -95\n", 64) =3D 64
> > >
> > > not support attach_type BPF_TRACE_KPROBE_MULTI
> > >
> >
> > Could you share your kernel config (.config used for kernel compiling
> > or running kernel /boot/config-*)  ? I wonder if you have the FPROBE
> > really configured, since include/linux/fprobe.h has:
> >
> > #ifdef CONFIG_FPROBE
> > int register_fprobe(struct fprobe *fp, const char *filter, const char
> > *notfilter);
> > int register_fprobe_ips(struct fprobe *fp, unsigned long *addrs, int nu=
m);
> > int register_fprobe_syms(struct fprobe *fp, const char **syms, int num)=
;
> > int unregister_fprobe(struct fprobe *fp);
> > bool fprobe_is_registered(struct fprobe *fp);
> > int fprobe_count_ips_from_filter(const char *filter, const char *notfil=
ter);
> > #else
> > static inline int register_fprobe(struct fprobe *fp, const char
> > *filter, const char *notfilter)
> > {
> >         return -EOPNOTSUPP;
> > }
> > static inline int register_fprobe_ips(struct fprobe *fp, unsigned long
> > *addrs, int num)
> > {
> >         return -EOPNOTSUPP;
> > }
> > static inline int register_fprobe_syms(struct fprobe *fp, const char
> > **syms, int num)
> > {
> >         return -EOPNOTSUPP;
> > }
> > static inline int unregister_fprobe(struct fprobe *fp)
> > {
> >         return -EOPNOTSUPP;
> > }
> > static inline bool fprobe_is_registered(struct fprobe *fp)
> > {
> >         return false;
> > }
> > static inline int fprobe_count_ips_from_filter(const char *filter,
> > const char *notfilter)
> > {
> >         return -EOPNOTSUPP;
> > }
> > #endif
> >
>
> and check CONFIG_BPF_EVENTS since linux/trace_events.h has:
>
> #ifdef CONFIG_BPF_EVENTS
> unsigned int trace_call_bpf(struct trace_event_call *call, void *ctx);
> int perf_event_attach_bpf_prog(struct perf_event *event, struct
> bpf_prog *prog, u64 bpf_cookie);
> void perf_event_detach_bpf_prog(struct perf_event *event);
> int perf_event_query_prog_array(struct perf_event *event, void __user *in=
fo);
>
> struct bpf_raw_tp_link;
> int bpf_probe_register(struct bpf_raw_event_map *btp, struct
> bpf_raw_tp_link *link);
> int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct
> bpf_raw_tp_link *link);
>
> struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name);
> void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp);
> int bpf_get_perf_event_info(const struct perf_event *event, u32 *prog_id,
>                             u32 *fd_type, const char **buf,
>                             u64 *probe_offset, u64 *probe_addr,
>                             unsigned long *missed);
> int bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct
> bpf_prog *prog);
> int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct
> bpf_prog *prog);
> #else
> static inline unsigned int trace_call_bpf(struct trace_event_call
> *call, void *ctx)
> {
>         return 1;
> }
>
> static inline int
> perf_event_attach_bpf_prog(struct perf_event *event, struct bpf_prog
> *prog, u64 bpf_cookie)
> {
>         return -EOPNOTSUPP;
> }
>
> static inline void perf_event_detach_bpf_prog(struct perf_event *event) {=
 }
>
> static inline int
> perf_event_query_prog_array(struct perf_event *event, void __user *info)
> {
>         return -EOPNOTSUPP;
> }
> struct bpf_raw_tp_link;
> static inline int bpf_probe_register(struct bpf_raw_event_map *btp,
> struct bpf_raw_tp_link *link)
> {
>         return -EOPNOTSUPP;
> }
> static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp,
> struct bpf_raw_tp_link *link)
> {
>         return -EOPNOTSUPP;
> }
> static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char=
 *name)
> {
>         return NULL;
> }
> static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
> {
> }
> static inline int bpf_get_perf_event_info(const struct perf_event *event,
>                                           u32 *prog_id, u32 *fd_type,
>                                           const char **buf, u64 *probe_of=
fset,
>                                           u64 *probe_addr, unsigned
> long *missed)
> {
>         return -EOPNOTSUPP;
> }
> static inline int
> bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog =
*prog)
> {
>         return -EOPNOTSUPP;
> }
> static inline int
> bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog =
*prog)
> {
>         return -EOPNOTSUPP;
> }
> #endif
>

FYI, here are the places for bpf_kprobe_multi_link_attach(),  if
CONFIG_FPROBE and CONFIG_BPF_EVENTS not defined,
bpf_kprobe_multi_link_attach() returns -EOPNOTSUPP

Cscope tag: bpf_kprobe_multi_link_attach
   #   line  filename / context / line
   1    781  include/linux/trace_events.h <<GLOBAL>>
             int bpf_kprobe_multi_link_attach(const union bpf_attr
*attr, struct bpf_prog *prog);
   2    826  include/linux/trace_events.h <<bpf_kprobe_multi_link_attach>>
             bpf_kprobe_multi_link_attach(const union bpf_attr *attr,
struct bpf_prog *prog)
   3   5606  kernel/bpf/syscall.c <<link_create>>
             ret =3D bpf_kprobe_multi_link_attach(attr, prog);
   4   2894  kernel/trace/bpf_trace.c <<bpf_kprobe_multi_link_attach>>
             int bpf_kprobe_multi_link_attach(const union bpf_attr
*attr, struct bpf_prog *prog)
   5   3042  kernel/trace/bpf_trace.c <<bpf_kprobe_multi_link_attach>>
             int bpf_kprobe_multi_link_attach(const union bpf_attr
*attr, struct bpf_prog *prog)

> > > Chenghao
> > >
> > >
> > > >
> > > > > test_module_attach:FAIL:skel_attach skeleton attach failed: -95
> > > > > #201     module_attach:FAIL
> > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > Successfully unloaded bpf_testmod.ko.
> > > > >
> > > > >
> > > > > Chenghao
> > > > >
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Chenghao
> > > > > > >
> > > > > > > >
> > > > > > > > > > On Sat, Aug 9, 2025 at 1:03=E2=80=AFPM Vincent Li <vinc=
ent.mc.li@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Aug 8, 2025 at 8:48=E2=80=AFPM Vincent Li <vi=
ncent.mc.li@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen =
<chenhuacai@kernel.org> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi, Vincent,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent L=
i <vincent.mc.li@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Folks,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hengqi mentioned offline that the loongarch ker=
nel locked up when
> > > > > > > > > > > > > > running full bpf selftests, so I went ahead and=
 ran make run_tests to
> > > > > > > > > > > > > > perform full bpf selftest, I observed lockup to=
o. It appears the
> > > > > > > > > > > > > > lockup happens when running module_attach test =
which includes testing
> > > > > > > > > > > > > > on fentry so this could be related to the tramp=
oline patch series. for
> > > > > > > > > > > > > > example, if I just run ./test_progs -t module_a=
ttach, the kernel
> > > > > > > > > > > > > > lockup immediately.
> > > > > > > > > > > > > Is this a regression caused by the latest trampol=
ine patches? Or in
> > > > > > > > > > > > > another word, Does vanilla 6.16 has this problem?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > I suspect this is caused by the latest trampoline p=
atches because the
> > > > > > > > > > > > module_attach is to test the fentry feature for ker=
nel module
> > > > > > > > > > > > functions, I believe Changhao and I only tested the=
 fentry feature for
> > > > > > > > > > > > non-module kernel functions. I can try kernel witho=
ut the trampoline
> > > > > > > > > > > > patches and will let you know the result.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I reverted  trampoline patches from loongarch-next br=
anch and run
> > > > > > > > > > > ./test_progs -t module_attach simply just errors out =
with the fentry
> > > > > > > > > > > feature not supported
> > > > > > > > > > >
> > > > > > > > > > > [root@fedora bpf]# ./test_progs -t module_attach
> > > > > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 =
nsec
> > > > > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOT=
SUPP
> > > > > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: =
-ENOTSUPP
> > > > > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach f=
ailed: -524
> > > > > > > > > > > #205     module_attach:FAIL
> > > > > > > > > > >
> > > > > > > > > > > All error logs:
> > > > > > > > > > > test_module_attach:PASS:skel_open 0 nsec
> > > > > > > > > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > > > > > > > > test_module_attach:PASS:set_attach_target_explicit 0 =
nsec
> > > > > > > > > > > test_module_attach:PASS:skel_load 0 nsec
> > > > > > > > > > > libbpf: prog 'handle_fentry': failed to attach: -ENOT=
SUPP
> > > > > > > > > > > libbpf: prog 'handle_fentry': failed to auto-attach: =
-ENOTSUPP
> > > > > > > > > > > test_module_attach:FAIL:skel_attach skeleton attach f=
ailed: -524
> > > > > > > > > > > #205     module_attach:FAIL
> > > > > > > > > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > > > > > > > > >
> > > > > > > > > > > I also tested loongarch-next branch with the trampoli=
ne patch series
> > > > > > > > > > > with no lockup kernel config so I can run dmesg to ch=
eck kernel error
> > > > > > > > > > > log,  ./test_progs -t module_attach result in below k=
ernel log:
> > > > > > > > > > >
> > > > > > > > > > > [  417.429954] bpf_testmod: loading out-of-tree modul=
e taints kernel.
> > > > > > > > > > > [  419.728620] CPU 70475748 Unable to handle kernel p=
aging request at
> > > > > > > > > > > virtual address 0000000800000024, era =3D=3D 90000000=
041d5854, ra =3D=3D
> > > > > > > > > > > 90000000041d5848
> > > > > > > > > > > [  419.728629] Oops[#1]:
> > > > > > > > > > > [  419.728632] CPU 70475748 Unable to handle kernel p=
aging request at
> > > > > > > > > > > virtual address 0000000000000018, era =3D=3D 90000000=
05750268, ra =3D=3D
> > > > > > > > > > > 9000000004163938
> > > > > > > > > > > [  441.305370] rcu: INFO: rcu_preempt detected stalls=
 on CPUs/tasks:
> > > > > > > > > > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > > > > > > > > > idle=3Deb74/1/0x4000000000000000 softirq=3D72377/7237=
9 fqs=3D2599
> > > > > > > > > > > [  441.305386] rcu:     (detected by 4, t=3D5252 jiff=
ies, g=3D60333, q=3D186 ncpus=3D8)
> > > > > > > > > > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > > > > > > > > > [  451.305494] rcu: rcu_preempt kthread starved for 2=
499 jiffies!
> > > > > > > > > > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=
=3D1
> > > > > > > > > > > [  451.305500] rcu:     Unless rcu_preempt kthread ge=
ts sufficient CPU
> > > > > > > > > > > time, OOM is now expected behavior.
> > > > > > > > > > > [  451.305502] rcu: RCU grace-period kthread stack du=
mp:
> > > > > > > > > > > [  451.305504] task:rcu_preempt     state:R stack:0  =
   pid:15
> > > > > > > > > > > tgid:15    ppid:2      task_flags:0x208040 flags:0x00=
000800
> > > > > > > > > > > [  451.305510] Stack : 9000000100467e80 0000000000000=
402
> > > > > > > > > > > 0000000000000010 90000001003b0680
> > > > > > > > > > > [  451.305519]         90000000058e0000 0000000000000=
000
> > > > > > > > > > > 0000000000000040 9000000006c2dfd0
> > > > > > > > > > > [  451.305526]         900000000578c9b0 0000000000000=
001
> > > > > > > > > > > 9000000006b21000 0000000000000005
> > > > > > > > > > > [  451.305533]         00000001000093a8 0000000100009=
3a8
> > > > > > > > > > > 0000000000000000 0000000000000004
> > > > > > > > > > > [  451.305540]         90000000058f04e0 0000000000000=
000
> > > > > > > > > > > 0000000000000002 b793724be1dfb2b8
> > > > > > > > > > > [  451.305547]         00000001000093a9 b793724be1dfb=
2b8
> > > > > > > > > > > 000000000000003f 9000000006c2dfd0
> > > > > > > > > > > [  451.305554]         9000000006c30c18 0000000000000=
005
> > > > > > > > > > > 9000000006b0e000 9000000006b21000
> > > > > > > > > > > [  451.305560]         9000000100453c98 90000001003af=
f80
> > > > > > > > > > > 9000000006c31140 900000000578c9b0
> > > > > > > > > > > [  451.305567]         00000001000093a8 9000000005794=
d3c
> > > > > > > > > > > 00000000000000b4 0000000000000000
> > > > > > > > > > > [  451.305574]         90000000024021b8 0000000100009=
3a8
> > > > > > > > > > > 9000000004284f20 000000000a400001
> > > > > > > > > > > [  451.305581]         ...
> > > > > > > > > > > [  451.305584] Call Trace:
> > > > > > > > > > > [  451.305586] [<900000000578b868>] __schedule+0x410/=
0x1520
> > > > > > > > > > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x1=
90
> > > > > > > > > > > [  451.305599] [<9000000005794d38>] schedule_timeout+=
0x98/0x140
> > > > > > > > > > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0=
x5f8/0x868
> > > > > > > > > > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x=
260/0x2e0
> > > > > > > > > > > [  451.305614] [<90000000041be704>] kthread+0x144/0x2=
38
> > > > > > > > > > > [  451.305619] [<9000000005787b60>] ret_from_kernel_t=
hread+0x28/0xc8
> > > > > > > > > > > [  451.305624] [<90000000041620e4>] ret_from_kernel_t=
hread_asm+0xc/0x88
> > > > > > > > > > >
> > > > > > > > > > > [  451.305630] rcu: Stack dump where RCU GP kthread l=
ast ran:
> > > > > > > > > > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > > > > > > > > > [  451.305636] NMI backtrace for cpu 1 skipped: idlin=
g at idle_exit+0x0/0x4
> > > > > > > > > > > [  451.306655] rcu: INFO: rcu_preempt detected expedi=
ted stalls on
> > > > > > > > > > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20=
/.
> > > > > > > > > > > [  451.306665] rcu: blocking rcu_node structures (int=
ernal RCU debug):
> > > > > > > > > > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > > > > > > > > > [  451.306672] Unable to send backtrace IPI to CPU5 -=
 perhaps it hung?
> > > > > > > > > > >
> > > > > > > > > > > So related to trampoline patches for sure unless I am=
 missing something.
> > > > > > > > > > >
> > > > > > > > > > > > > Huacai
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > A side note, if I put the module_attach test in
> > > > > > > > > > > > > > tools/testing/selftests/bpf/DENYLIST to skip th=
e module_attach test,
> > > > > > > > > > > > > > the module_attach test is not skipped.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Vincent
