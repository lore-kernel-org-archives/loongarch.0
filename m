Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC9421C19E
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680124; cv=none; b=iAQoTSwIeK2RRh9YwQABOdwyicB9dWah/7AqxNBug26/Tcd6hWfRo+MPRRejr0zEdWlpo9H2x8tPbkCxRBUordVU4OzFxSv1/NlIBFQ0umAPytLyoSflC4jXLT8i+/XKlLt/hqAH6iExsFS+IL9jSOvQJBOa8P7MsF/hixFZCEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680124; c=relaxed/simple;
	bh=dussTKVHrZ9Xpvkvo0Cdpe9E5ROL7rNqxarXn0Zz8cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqUGMwfxxWcc+uYxfEubuHVVZQaoj5ErcygLf0tWDEIpjRDEFhx2q3cYwXYScxA1eU4O1+TEaox4tDFk4Xmg/ouDdOe92Pz8p2HvWq0DzPEOdSrTizHi7DreMQdyBNxJHRDYcEXdc9pN0V06w9p6imVil81IaqZKXXQjGpDAQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5m7s6N; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5m7s6N"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab814c4f2dso325711cf.1
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680121; x=1753284921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSZjPVOyaajhgo63XnCIt3S/+PZ3dG9TtA2pusYuets=;
        b=Pr5m7s6NcFbdIgIf5J/iFz3VJ+7sGo4ICj/VUpK+VTBRuyCRkpQnkuZRFX4cf4qoII
         Odxiv9ZKAmNY6wblV4PXpYmsEC5d0qogoARYqlWZHzr75JHDLQWSaKEjv2DCDQpGjgIT
         Vc8SkH1NPGxp6uujG9GEbKAG3VUraiBKwAwxMEq7PjZWcf++pWUGHHLEm9+3swSvSoUY
         IRBsNqrOHodepjajk5aer1OrSddpQROhYgHc9sPR2n/bjARqOCiau/m/9UDWURa1OlfZ
         kSx/1vDunjhpln1Y79WV8mC472LP7lQ8HWGvzdc3Znx7nZK6/N4JOJmxyyDx4rXWGyEm
         nmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680121; x=1753284921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSZjPVOyaajhgo63XnCIt3S/+PZ3dG9TtA2pusYuets=;
        b=O4n5HUu3idXvDFuweXLvm8cr0uJs0H2oGSpypfYTqgZyJFbIw8cfllqxlvPpTFNf58
         B7+Ejl5RRYY4490Rfy7X9wvKCuNfpovHAvjo/VHQlxoMDu1o/6wxzFBd4B4/RR3eTxY7
         kfZPPxNSdoJnJJrAG8ibkCVA9SWmNwh1dHoVxgJjq2eI1EmREGDqI0aeJH+VL+vBIR6o
         Abh/aWBR1IKh/S50P4Rbf1Lx0sTmPCpNlDFGQ9o4YKSWEkGCoZ5P+i23ZLjhra4aZXg+
         tPI/dvEp8JHPy+JkP9dzNySyaN0ZXVEMmks8VW87cUciCz/nkwAgrbEn+vd2mjmQPfIk
         Y1DA==
X-Forwarded-Encrypted: i=1; AJvYcCXz8Ci0K+9PHT6ro3imkWVI8aNJPmplI5mGM/TdlZn+JtmiGo1p/TJ4QeGEFvpA3NLpsIju8hw8WvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7uoAQVIOA8dAiN/dQ8dSLStKYWvesUE9P0je0TDtzIivWM8ff
	Gaj1r+CqFMKaP6BLbs+2Xp1L5pPpuqHBMi6drYWIrQOSHrOMExIH7s0IkB2ekL/IOf1u8dGPSIj
	VJyw7IlcrjmP/Itxmx9CepSWJY4YlsD4y5Fo/
X-Gm-Gg: ASbGnctsiLBQbAxZUm6895tpGFGOjqz0bX9scgxoHkeYqGP5vykmijXYozJdSuA/qT7
	2APJupG49VsvrkSGcbhycdqVLFM+5++SR5BvaUICOSu14ej3+SruoJsxD/4Ng6HcccnGUVQz6Wg
	3h/yeohE36cDFeq6gH6oKfcxCU71gjqDXInA88QIuVI71oF+rx2Rj35PNOB88J1jrb5vBonRHJs
	5LoJ0kDyTjoxGZ46h4mDVmFv1kW6sLC+enO/0DVC5lk8Adw8Vw=
X-Google-Smtp-Source: AGHT+IGenW5useMcG/9EIF8KslrrHZo8BaRZNcB8ArFGsLJdh4RZqaQuSNKqNLweu4OcI6QMNc89n4FlQKV5w1rXN2U=
X-Received: by 2002:a05:622a:190c:b0:4ab:3ff6:f0e9 with SMTP id
 d75a77b69052e-4ab93c430f7mr50591381cf.1.1752680120156; Wed, 16 Jul 2025
 08:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
 <20250709055029.723243-6-duanchenghao@kylinos.cn> <CAK3+h2zyhKYjRNV+25pngfrtPQdKe6gJFbkmanBx_9Fp+C8VYw@mail.gmail.com>
 <20250710080456.GB839477@chenghao-pc> <CAK3+h2yc6m1c-EpwK+Lmrb9eV7ZbU1ibJHVzygqjc6QjQid7cQ@mail.gmail.com>
 <CAK3+h2yhB3_v8m-5Q0ePDfhH-h1=hK9aCqsN7BHk8NEcwaas5Q@mail.gmail.com>
 <CAK3+h2xZ6yh7N0abu5DP_ftaiE1gQEy8qVi-VvrePssc5+m=eQ@mail.gmail.com>
 <CAK3+h2zPQ+tcFzWzZt8g3TPhaK+7kDnfJQYiDOFMq-K0FqsbTA@mail.gmail.com> <CAK3+h2z1iM9m5yyMBNBOO9WcgidW1FKQ+EPVsrM5BRzh5myEPA@mail.gmail.com>
In-Reply-To: <CAK3+h2z1iM9m5yyMBNBOO9WcgidW1FKQ+EPVsrM5BRzh5myEPA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 16 Jul 2025 08:35:09 -0700
X-Gm-Features: Ac12FXwIGAZduNT-fpxpO1W4zUQSVfa5d2GRCf_eax1AovzCSkzMr8feIOvzz0k
Message-ID: <CAK3+h2yNfMLHw4x9xi5QKCMKDkkZCa24r-AmMhTe+gCpfpV=Lg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 7:51=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Tue, Jul 15, 2025 at 8:11=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Tue, Jul 15, 2025 at 2:54=E2=80=AFPM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> > >
> > > On Tue, Jul 15, 2025 at 2:19=E2=80=AFPM Vincent Li <vincent.mc.li@gma=
il.com> wrote:
> > > >
> > > > On Thu, Jul 10, 2025 at 8:03=E2=80=AFAM Vincent Li <vincent.mc.li@g=
mail.com> wrote:
> > > > >
> > > > > On Thu, Jul 10, 2025 at 1:05=E2=80=AFAM Chenghao Duan <duanchengh=
ao@kylinos.cn> wrote:
> > > > > >
> > > > > > On Wed, Jul 09, 2025 at 12:08:27PM -0700, Vincent Li wrote:
> > > > > > > Hi Chenghao,
> > > > > > >
> > > > > > > I removed many email recipients for my question because I don=
't want
> > > > > > > to bother others, so you could  reply to this and not CC othe=
rs who
> > > > > > > may not want to be bothered.  Thanks for working on this BPF
> > > > > > > trampoline feature for loongarch, I have been waiting for the=
 bpf
> > > > > > > trampoline feature for loongarch for a long time.
> > > > > > >
> > > > > > >
> > > > > > > On Tue, Jul 8, 2025 at 10:52=E2=80=AFPM Chenghao Duan <duanch=
enghao@kylinos.cn> wrote:
> > > > > > > >
> > > > > > > > BPF trampoline is the critical infrastructure of the BPF su=
bsystem, acting
> > > > > > > > as a mediator between kernel functions and BPF programs. Nu=
merous important
> > > > > > > > features, such as using BPF program for zero overhead kerne=
l introspection,
> > > > > > > > rely on this key component.
> > > > > > > >
> > > > > > > > The related tests have passed, Including the following tech=
nical points:
> > > > > > > > 1. fentry
> > > > > > > > 2. fmod_ret
> > > > > > > > 3. fexit
> > > > > > > >
> > > > > > >
> > > > > > > My firewall project https://github.com/vincentmli/loongfire r=
elies on
> > > > > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp=
 which
> > > > > > > relies on "BPF program extension" to attach multiple XDP prog=
ram to
> > > > > > > one single network interface. Now I can't attach multiple XDP=
 programs
> > > > > > > to one network interface through libxdp so I use bpf tail cal=
l as a
> > > > > > > workaround.  I am not a kernel developer and not  familiar wi=
th the
> > > > > > > kernel code so I am not sure if the "BPF program extension" i=
s
> > > > > > > automatically supported after bpf trampoline is supported for
> > > > > > > loongarch, could you shed some light on this? thanks!
> > > > > > >
> > > > > >
> > > > > > Hi Vincent,
> > > > > >
> > > > > > I sincerely apologize, but I'm not quite sure about the specifi=
c
> > > > > > scenarios where the "BPF Program Extension" you mentioned is ap=
plied.
> > > > > > The trampoline feature allows multiple BPF programs to be attac=
hed to
> > > > > > the fentry/fexit points of kernel functions at runtime. I'm not=
 sure if
> > > > > > this aligns with your technical approach.
> > > > > >
> > > > > > Chenghao
> > > > > >
> > > > >
> > > > > Thanks for the feedback, the
> > > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp has
> > > > > section
> > > > > Kernel and BPF program feature compatibility.
> > > > >
> > > > > "The ability to attach multiple BPF programs to a single interfac=
e
> > > > > relies on the kernel =E2=80=9CBPF program extension=E2=80=9D feat=
ure which was
> > > > > introduced by commit be8704ff07d2 (=E2=80=9Cbpf: Introduce dynami=
c program
> > > > > extensions=E2=80=9D) in the upstream kernel and first appeared in=
 kernel
> > > > > release 5.6. To incrementally attach multiple programs, a further
> > > > > refinement added by commit 4a1e7c0c63e0 (=E2=80=9Cbpf: Support at=
taching
> > > > > freplace programs to multiple attach points=E2=80=9D) is needed; =
this first
> > > > > appeared in the upstream kernel version 5.10. The functionality r=
elies
> > > > > on the =E2=80=9CBPF trampolines=E2=80=9D feature which is unfortu=
nately only available
> > > > > on the x86_64 architecture. In other words, kernels before 5.6 ca=
n
> > > > > only attach a single XDP program to each interface, kernels 5.6+ =
can
> > > > > attach multiple programs if they are all attached at the same tim=
e,
> > > > > and kernels 5.10 have full support for XDP multiprog on x86_64. O=
n
> > > > > other architectures, only a single program can be attached to eac=
h
> > > > > interface."
> > > > >
> > > > > According to the above mentioned commit and  paragraph, I think =
=E2=80=9CBPF
> > > > > program extension=E2=80=9D should be  supported if the architectu=
re supports
> > > > > trampoline, when libxdp author wrote the above paragraph, probabl=
y
> > > > > only X86_64 architecture supported BPF trampolines at that time. =
I
> > > > > will be glad to help testing that when loongarch BPF trampoline
> > > > > feature is supported :)
> > > > >
> > > >
> > > > I applied the patches on top of 6.16.0-rc6 on my local loongarch
> > > > machine, then tried to run xdp-filter program from xdp-tools projec=
t,
> > > > it looks not working with xdp-tools libxdp, got "Bad address" error=
:
> > > >
> > > > ./xdp-filter/xdp-filter load -m skb -vvv lo
> > > >
> > > >  libxdp: Loaded XDP program xdp_pass, got fd 22
> > > >  libxdp: Duplicated fd 22 to 23 for prog xdp_pass
> > > >  libxdp: Failed to attach test program to dispatcher: Bad address <=
=3D=3D=3D=3D
> > > >  libxdp: Compatibility check for dispatcher program failed: Bad add=
ress
> > > >  libxdp: Falling back to loading single prog without dispatcher
> > > >  libxdp: Checking for kernel frags support
> > > >  libxdp: Loading XDP program 'xdp-dispatcher.o' from embedded objec=
t file
> > > >
> > > > the error is from xdp-tools lib/libxdp/libxdp.c
> > > >
> > > >         bpf_program__set_type(test_prog->bpf_prog, BPF_PROG_TYPE_EX=
T);
> > > >         bpf_program__set_expected_attach_type(test_prog->bpf_prog, =
0);
> > > >         err =3D xdp_program__load(test_prog);
> > > >         if (err) {
> > > >                 char buf[100] =3D {};
> > > >                 libxdp_strerror(err, buf, sizeof(buf));
> > > >                 pr_debug("Failed to load program %s: %s\n",
> > > >                         xdp_program__name(test_prog), buf);
> > > >                 goto out;
> > > >         }
> > > >
> > > >         test_prog->link_fd =3D bpf_raw_tracepoint_open(NULL, test_p=
rog->prog_fd);
> > > >         if (test_prog->link_fd < 0) {
> > > >                 err =3D -errno;
> > > >                 pr_debug("Failed to attach test program to dispatch=
er:
> > > > %s\n",  <=3D=3D=3D=3D=3D=3Derror Bad address
> > > >                          strerror(-err));
> > > >                 goto out;
> > > >         }
> > > >
> > >
> > > here is strace:
> > >
> > > 2754  write(2, "libxdp: Duplicated fd 22 to 23 for prog xdp_pass\n", =
49) =3D 49
> > > 2754  bpf(BPF_RAW_TRACEPOINT_OPEN, {raw_tracepoint=3D{name=3DNULL,
> > > prog_fd=3D23}}, 24) =3D -1 EFAULT (Bad address)
> > > 2754  write(2, " ", 1)                  =3D 1
> > > 2754  write(2, "libxdp: Failed to attach test program to dispatcher:
> > > Bad address\n", 65) =3D 65
> > >
> >
> > Sorry to make more noise, if I understand the code right, bpf syscall
> > of BPF_RAW_TRACEPOINT_OPEN code path looks like below, and it
> > eventually may call bpf_arch_text_poke() which would invoke the
> > loongarch bpf_arch_text_poke().  raw tracepoint could rely on the bpf
> > trampoline. I wonder if there is a way to print out the kernel stack
> > trace when executing xdp-filter command.
> >
> >
> > static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int siz=
e)
> > {
> >         union bpf_attr attr;
> >         int err;
> > ...
> >         case BPF_RAW_TRACEPOINT_OPEN:
> >                 err =3D bpf_raw_tracepoint_open(&attr); <=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >                 break;
> > ...
> > }
> >
> > static int bpf_raw_tracepoint_open(const union bpf_attr *attr)
> > {
> >         struct bpf_prog *prog;
> >         void __user *tp_name;
> >         __u64 cookie;
> > ...
> >         fd =3D bpf_raw_tp_link_attach(prog, tp_name, cookie); <=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >                 bpf_prog_put(prog);
> > ...
> > }
> >
> > static int bpf_raw_tp_link_attach(struct bpf_prog *prog,
> >                                   const char __user *user_tp_name, u64 =
cookie)
> > {
> >         struct bpf_link_primer link_primer;
> >         struct bpf_raw_tp_link *link;
> >         struct bpf_raw_event_map *btp;
> >         const char *tp_name;
> >         char buf[128];
> >         int err;
> >
> >         switch (prog->type) {
> >         case BPF_PROG_TYPE_TRACING:
> >         case BPF_PROG_TYPE_EXT: <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >         case BPF_PROG_TYPE_LSM:
> >                 if (user_tp_name)
> >                         /* The attach point for this category of progra=
ms
> >                          * should be specified via btf_id during progra=
m load.
> >                          */
> >                         return -EINVAL;
> >                 if (prog->type =3D=3D BPF_PROG_TYPE_TRACING &&
> >                     prog->expected_attach_type =3D=3D BPF_TRACE_RAW_TP)=
 {
> >                         tp_name =3D prog->aux->attach_func_name;
> >                         break;
> >                 }
> >                 return bpf_tracing_prog_attach(prog, 0, 0, 0);
> > <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ...
> > }
> >
> >
> > static int bpf_tracing_prog_attach(struct bpf_prog *prog,
> >                                    int tgt_prog_fd,
> >                                    u32 btf_id,
> >                                    u64 bpf_cookie)
> > {
> >
> >
> >        err =3D bpf_trampoline_link_prog(&link->link, tr, tgt_prog);
> >
> > }
> >
> > int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
> >                              struct bpf_trampoline *tr,
> >                              struct bpf_prog *tgt_prog)
> > {
> >         int err;
> >
> >         mutex_lock(&tr->mutex);
> >         err =3D __bpf_trampoline_link_prog(link, tr, tgt_prog);
> >         mutex_unlock(&tr->mutex);
> >         return err;
> > }
> >
> > static int __bpf_trampoline_link_prog(struct bpf_tramp_link *link,
> >                                       struct bpf_trampoline *tr,
> >                                       struct bpf_prog *tgt_prog)
> > {
> >         enum bpf_tramp_prog_type kind;
> >         struct bpf_tramp_link *link_exiting;
> >         int err =3D 0;
> >         int cnt =3D 0, i;
> >
> >         kind =3D bpf_attach_type_to_tramp(link->link.prog);
> >         if (tr->extension_prog)
> >                 /* cannot attach fentry/fexit if extension prog is atta=
ched.
> >                  * cannot overwrite extension prog either.
> >                  */
> >                 return -EBUSY;
> >
> >         for (i =3D 0; i < BPF_TRAMP_MAX; i++)
> >                 cnt +=3D tr->progs_cnt[i];
> >
> >         if (kind =3D=3D BPF_TRAMP_REPLACE) { <=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >                 /* Cannot attach extension if fentry/fexit are in use. =
*/
> >                 if (cnt)
> >                         return -EBUSY;
> >                 err =3D bpf_freplace_check_tgt_prog(tgt_prog);
> >                 if (err)
> >                         return err;
> >                 tr->extension_prog =3D link->link.prog;
> >                 return bpf_arch_text_poke(tr->func.addr, BPF_MOD_JUMP, =
NULL,
> >                                           link->link.prog->bpf_func);
> > <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >         }
> >
> > ...
> > }
> >
>
> To continue the fun of hacking :), to find a good use of this patch
> series to test out fentry, DeepSeek helped me  come up with the
> following method to fentry the bpf_trampoline_link_prog().
>
> SEC("fentry/bpf_trampoline_link_prog")
> int BPF_PROG(trace_trampoline_link,
>             struct bpf_tramp_link *link,
>             struct bpf_trampoline *tr,
>             struct bpf_prog *tgt_prog)
> {
>     enum bpf_tramp_prog_type kind =3D BPF_TRAMP_MAX;
>     const char *kind_str =3D "UNKNOWN";
>     char prog_name[16] =3D {0};
>     bool has_prog_name =3D false;
>
>     if (link && link->link.prog) {
>         // Get program name if available
>         if (link->link.prog->aux) {
>             bpf_probe_read_kernel_str(prog_name, sizeof(prog_name),
>                                     link->link.prog->aux->name);
>             has_prog_name =3D true;
>         }
>
>         // Determine kind
>         switch (link->link.prog->expected_attach_type) {
>             case BPF_TRACE_FENTRY:
>                 kind =3D BPF_TRAMP_FENTRY;
>                 kind_str =3D "FENTRY";
>                 break;
>             case BPF_TRACE_FEXIT:
>                 kind =3D BPF_TRAMP_FEXIT;
>                 kind_str =3D "FEXIT";
>                 break;
>             case BPF_MODIFY_RETURN:
>                 kind =3D BPF_TRAMP_MODIFY_RETURN;
>                 kind_str =3D "MODIFY_RETURN";
>                 break;
>             default:
>                 if (link->link.prog->type =3D=3D BPF_PROG_TYPE_EXT) {
>                     kind =3D BPF_TRAMP_REPLACE;
>                     kind_str =3D "REPLACE";
>                 }
>                 break;
>         }
>     }
>
>     bpf_printk("__bpf_trampoline_link_prog: kind=3D%d (%s) prog=3D%s",
>                kind,
>                kind_str,
>                has_prog_name ? prog_name : "N/A");
>
>     return 0;
> }
>
> It confirms the xdp_pass program is set to  BPF_PROG_TYPE_EXT as
> expected and kind is BPF_TRAMP_REPLACE and bpf_arch_text_poke() would
> be invoked when I run 'xdp-filter load -m skb lo'
>
> [root@fedora c]# cat /sys/kernel/debug/tracing/trace_pipe
>            <...>-10081   [003] ...11 64926.801233: bpf_trace_printk:
> __bpf_trampoline_link_prog: kind=3D4 (REPLACE) prog=3Dxdp_pass
>
>

I think I found where the error coming from, now I used fentry on the
bpf_arch_text_poke()

SEC("fentry/bpf_arch_text_poke")
int BPF_PROG(trace_text_poke_entry, void *ip, enum bpf_text_poke_type t,
             void *old_addr, void *new_addr)
{
    bpf_printk("bpf_arch_text_poke INVOKED: ip=3D%pS, type=3D%d, old=3D%pS,=
 new=3D%pS",
               ip, t, old_addr, new_addr);
    return 0;
}

SEC("fexit/bpf_arch_text_poke")
int BPF_PROG(trace_text_poke_exit,
             void *ip, enum bpf_text_poke_type t,
             void *old_addr, void *new_addr,
             int retval)  // <-- Return value is automatically passed
as last arg
{
    bpf_printk("bpf_arch_text_poke RETURNED: %d (ip=3D%pS)", retval, ip);
    return 0;
}

it prints:
[root@fedora c]# cat /sys/kernel/debug/tracing/trace_pipe
           <...>-10426   [001] ...11 67878.110342: bpf_trace_printk:
bpf_arch_text_poke INVOKED:
ip=3Dbpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60, type=3D1, old=3D0x0,
new=3Dbpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60
           <...>-10426   [001] ...11 67878.110350: bpf_trace_printk:
bpf_arch_text_poke RETURNED: -14
(ip=3Dbpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60)

the error code -14 (-EFAULT) is  likely from line 1434 from this patch
series I applied

1417 int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
1418                        void *old_addr, void *new_addr)
1419 {
1420         u32 old_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
1421         u32 new_insns[5] =3D {[0 ... 4] =3D INSN_NOP};
1422         bool is_call =3D poke_type =3D=3D BPF_MOD_CALL;
1423         int ret;
1424
1425         if (!is_kernel_text((unsigned long)ip) &&
1426                 !is_bpf_text_address((unsigned long)ip))
1427                 return -ENOTSUPP;
1428
1429         ret =3D gen_jump_or_nops(old_addr, ip, old_insns, is_call);
1430         if (ret)
1431                 return ret;
1432
1433         if (memcmp(ip, old_insns, 5 * 4))
1434                 return -EFAULT;
1435
1436         ret =3D gen_jump_or_nops(new_addr, ip, new_insns, is_call);
1437         if (ret)
1438                 return ret;
1439
1440         mutex_lock(&text_mutex);
1441         if (memcmp(ip, new_insns, 5 * 4))
1442                 ret =3D larch_insn_text_copy(ip, new_insns, 5 * 4);
1443         mutex_unlock(&text_mutex);
1444         return ret;
1445 }

> >
> >
> > > deepseek says the  bpf syscall raw tracepoint name should not be NULL=
,
> > > something related to raw tracepoint?
> > >
> > >
> > > > xdp-tools/libxdp is a popular project to attach multiple XDP progra=
ms
> > > > to a single network interface, packaged in mainstream Linux
> > > > distributions, so it would be nice to get the loongarch kernel bpf
> > > > trampoline working with xdp-tools/libxdp :).
> > > >
> > > > > > > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > > > > ---
> > > > > > > >  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++=
++++++++++++
> > > > > > > >  arch/loongarch/net/bpf_jit.h |   6 +
> > > > > > > >  2 files changed, 397 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/=
net/bpf_jit.c
> > > > > > > > index 9cb01f0b0..6820558af 100644
> > > > > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > > > > @@ -7,6 +7,10 @@
> > > > > > > >  #include <linux/memory.h>
> > > > > > > >  #include "bpf_jit.h"
> > > > > > > >
> > > > > > > > +#define LOONGARCH_MAX_REG_ARGS 8
> > > > > > > > +#define LOONGARCH_FENTRY_NINSNS 2
> > > > > > > > +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS *=
 4)
> > > > > > > > +
> > > > > > > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > > > > > >  #define TCC_SAVED      LOONGARCH_GPR_S5
> > > > > > > >
> > > > > > > > @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *ta=
rget, void *ip, u32 *insns, bool is_call)
> > > > > > > >                                   (unsigned long)ip, (unsig=
ned long)target);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int emit_call(struct jit_ctx *ctx, u64 addr)
> > > > > > > > +{
> > > > > > > > +       u64 ip;
> > > > > > > > +
> > > > > > > > +       if (addr && ctx->image && ctx->ro_image)
> > > > > > > > +               ip =3D (u64)(ctx->image + ctx->idx);
> > > > > > > > +
> > > > > > > > +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip=
, addr);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type p=
oke_type,
> > > > > > > >                        void *old_addr, void *new_addr)
> > > > > > > >  {
> > > > > > > > @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst,=
 void *src, size_t len)
> > > > > > > >
> > > > > > > >         return dst;
> > > > > > > >  }
> > > > > > > > +
> > > > > > > > +static void store_args(struct jit_ctx *ctx, int nargs, int=
 args_off)
> > > > > > > > +{
> > > > > > > > +       int i;
> > > > > > > > +
> > > > > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, L=
OONGARCH_GPR_FP, -args_off);
> > > > > > > > +               args_off -=3D 8;
> > > > > > > > +       }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void restore_args(struct jit_ctx *ctx, int nargs, i=
nt args_off)
> > > > > > > > +{
> > > > > > > > +       int i;
> > > > > > > > +
> > > > > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, L=
OONGARCH_GPR_FP, -args_off);
> > > > > > > > +               args_off -=3D 8;
> > > > > > > > +       }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf=
_tramp_link *l,
> > > > > > > > +                          int args_off, int retval_off,
> > > > > > > > +                          int run_ctx_off, bool save_ret)
> > > > > > > > +{
> > > > > > > > +       int ret;
> > > > > > > > +       u32 *branch;
> > > > > > > > +       struct bpf_prog *p =3D l->link.prog;
> > > > > > > > +       int cookie_off =3D offsetof(struct bpf_tramp_run_ct=
x, bpf_cookie);
> > > > > > > > +
> > > > > > > > +       if (l->cookie) {
> > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, =
false);
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONG=
ARCH_GPR_FP, -run_ctx_off + cookie_off);
> > > > > > > > +       } else {
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOO=
NGARCH_GPR_FP,
> > > > > > > > +                         -run_ctx_off + cookie_off);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* arg1: prog */
> > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false=
);
> > > > > > > > +       /* arg2: &run_ctx */
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_G=
PR_FP, -run_ctx_off);
> > > > > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_en=
ter(p));
> > > > > > > > +       if (ret)
> > > > > > > > +               return ret;
> > > > > > > > +
> > > > > > > > +       /* store prog start time */
> > > > > > > > +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> > > > > > > > +
> > > > > > > > +       /* if (__bpf_prog_enter(prog) =3D=3D 0)
> > > > > > > > +        *      goto skip_exec_of_prog;
> > > > > > > > +        *
> > > > > > > > +        */
> > > > > > > > +       branch =3D (u32 *)ctx->image + ctx->idx;
> > > > > > > > +       /* nop reserved for conditional jump */
> > > > > > > > +       emit_insn(ctx, nop);
> > > > > > > > +
> > > > > > > > +       /* arg1: &args_off */
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -args_off);
> > > > > > > > +       if (!p->jited)
> > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)=
p->insnsi, false);
> > > > > > > > +       ret =3D emit_call(ctx, (const u64)p->bpf_func);
> > > > > > > > +       if (ret)
> > > > > > > > +               return ret;
> > > > > > > > +
> > > > > > > > +       if (save_ret) {
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONG=
ARCH_GPR_FP, -retval_off);
> > > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOON=
GARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* update branch with beqz */
> > > > > > > > +       if (ctx->image) {
> > > > > > > > +               int offset =3D (void *)(&ctx->image[ctx->id=
x]) - (void *)branch;
> > > > > > > > +               *branch =3D larch_insn_gen_beq(LOONGARCH_GP=
R_A0, LOONGARCH_GPR_ZERO, offset);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* arg1: prog */
> > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false=
);
> > > > > > > > +       /* arg2: prog start time */
> > > > > > > > +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> > > > > > > > +       /* arg3: &run_ctx */
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_G=
PR_FP, -run_ctx_off);
> > > > > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_ex=
it(p));
> > > > > > > > +
> > > > > > > > +       return ret;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct=
 bpf_tramp_links *tl,
> > > > > > > > +                              int args_off, int retval_off=
, int run_ctx_off, u32 **branches)
> > > > > > > > +{
> > > > > > > > +       int i;
> > > > > > > > +
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_G=
PR_FP, -retval_off);
> > > > > > > > +       for (i =3D 0; i < tl->nr_links; i++) {
> > > > > > > > +               invoke_bpf_prog(ctx, tl->links[i], args_off=
, retval_off,
> > > > > > > > +                               run_ctx_off, true);
> > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONG=
ARCH_GPR_FP, -retval_off);
> > > > > > > > +               branches[i] =3D (u32 *)ctx->image + ctx->id=
x;
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +       }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +u64 bpf_jit_alloc_exec_limit(void)
> > > > > > > > +{
> > > > > > > > +       return VMALLOC_END - VMALLOC_START;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +void *arch_alloc_bpf_trampoline(unsigned int size)
> > > > > > > > +{
> > > > > > > > +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +void arch_free_bpf_trampoline(void *image, unsigned int si=
ze)
> > > > > > > > +{
> > > > > > > > +       bpf_prog_pack_free(image, size);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int __arch_prepare_bpf_trampoline(struct jit_ctx *c=
tx, struct bpf_tramp_image *im,
> > > > > > > > +                                        const struct btf_f=
unc_model *m,
> > > > > > > > +                                        struct bpf_tramp_l=
inks *tlinks,
> > > > > > > > +                                        void *func_addr, u=
32 flags)
> > > > > > > > +{
> > > > > > > > +       int i;
> > > > > > > > +       int stack_size =3D 0, nargs =3D 0;
> > > > > > > > +       int retval_off, args_off, nargs_off, ip_off, run_ct=
x_off, sreg_off;
> > > > > > > > +       struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAM=
P_FENTRY];
> > > > > > > > +       struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP=
_FEXIT];
> > > > > > > > +       struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TR=
AMP_MODIFY_RETURN];
> > > > > > > > +       int ret, save_ret;
> > > > > > > > +       void *orig_call =3D func_addr;
> > > > > > > > +       u32 **branches =3D NULL;
> > > > > > > > +
> > > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_S=
HARE_IPMODIFY))
> > > > > > > > +               return -ENOTSUPP;
> > > > > > > > +
> > > > > > > > +       /*
> > > > > > > > +        * FP + 8       [ RA to parent func ] return addres=
s to parent
> > > > > > > > +        *                    function
> > > > > > > > +        * FP + 0       [ FP of parent func ] frame pointer=
 of parent
> > > > > > > > +        *                    function
> > > > > > > > +        * FP - 8       [ T0 to traced func ] return addres=
s of traced
> > > > > > > > +        *                    function
> > > > > > > > +        * FP - 16      [ FP of traced func ] frame pointer=
 of traced
> > > > > > > > +        *                    function
> > > > > > > > +        *
> > > > > > > > +        * FP - retval_off  [ return value      ] BPF_TRAMP=
_F_CALL_ORIG or
> > > > > > > > +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> > > > > > > > +        *                  [ argN              ]
> > > > > > > > +        *                  [ ...               ]
> > > > > > > > +        * FP - args_off    [ arg1              ]
> > > > > > > > +        *
> > > > > > > > +        * FP - nargs_off   [ regs count        ]
> > > > > > > > +        *
> > > > > > > > +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_I=
P_ARG
> > > > > > > > +        *
> > > > > > > > +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> > > > > > > > +        *
> > > > > > > > +        * FP - sreg_off    [ callee saved reg  ]
> > > > > > > > +        *
> > > > > > > > +        */
> > > > > > > > +
> > > > > > > > +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> > > > > > > > +               return -ENOTSUPP;
> > > > > > > > +
> > > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_S=
HARE_IPMODIFY))
> > > > > > > > +               return -ENOTSUPP;
> > > > > > > > +
> > > > > > > > +       stack_size =3D 0;
> > > > > > > > +
> > > > > > > > +       /* room of trampoline frame to store return address=
 and frame pointer */
> > > > > > > > +       stack_size +=3D 16;
> > > > > > > > +
> > > > > > > > +       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_T=
RAMP_F_RET_FENTRY_RET);
> > > > > > > > +       if (save_ret) {
> > > > > > > > +               /* Save BPF R0 and A0 */
> > > > > > > > +               stack_size +=3D 16;
> > > > > > > > +               retval_off =3D stack_size;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* room of trampoline frame to store args */
> > > > > > > > +       nargs =3D m->nr_args;
> > > > > > > > +       stack_size +=3D nargs * 8;
> > > > > > > > +       args_off =3D stack_size;
> > > > > > > > +
> > > > > > > > +       /* room of trampoline frame to store args number */
> > > > > > > > +       stack_size +=3D 8;
> > > > > > > > +       nargs_off =3D stack_size;
> > > > > > > > +
> > > > > > > > +       /* room of trampoline frame to store ip address */
> > > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > > +               stack_size +=3D 8;
> > > > > > > > +               ip_off =3D stack_size;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* room of trampoline frame to store struct bpf_tra=
mp_run_ctx */
> > > > > > > > +       stack_size +=3D round_up(sizeof(struct bpf_tramp_ru=
n_ctx), 8);
> > > > > > > > +       run_ctx_off =3D stack_size;
> > > > > > > > +
> > > > > > > > +       stack_size +=3D 8;
> > > > > > > > +       sreg_off =3D stack_size;
> > > > > > > > +
> > > > > > > > +       stack_size =3D round_up(stack_size, 16);
> > > > > > > > +
> > > > > > > > +       /* For the trampoline called from function entry */
> > > > > > > > +       /* RA and FP for parent function*/
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_G=
PR_SP, -16);
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR=
_SP, 8);
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, 0);
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_G=
PR_SP, 16);
> > > > > > > > +
> > > > > > > > +       /* RA and FP for traced function*/
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_G=
PR_SP, -stack_size);
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR=
_SP, stack_size - 8);
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, stack_size - 16);
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_G=
PR_SP, stack_size);
> > > > > > > > +
> > > > > > > > +       /* callee saved register S1 to pass start time */
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR=
_FP, -sreg_off);
> > > > > > > > +
> > > > > > > > +       /* store ip address of the traced function */
> > > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)=
func_addr, false);
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONG=
ARCH_GPR_FP, -ip_off);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       /* store nargs number*/
> > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR=
_FP, -nargs_off);
> > > > > > > > +
> > > > > > > > +       store_args(ctx, nargs, args_off);
> > > > > > > > +
> > > > > > > > +       /* To traced function */
> > > > > > > > +       orig_call +=3D LOONGARCH_FENTRY_NBYTES;
> > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)=
im, false);
> > > > > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tra=
mp_enter);
> > > > > > > > +               if (ret)
> > > > > > > > +                       return ret;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       for (i =3D 0; i < fentry->nr_links; i++) {
> > > > > > > > +               ret =3D invoke_bpf_prog(ctx, fentry->links[=
i], args_off, retval_off,
> > > > > > > > +                                     run_ctx_off, flags & =
BPF_TRAMP_F_RET_FENTRY_RET);
> > > > > > > > +               if (ret)
> > > > > > > > +                       return ret;
> > > > > > > > +       }
> > > > > > > > +       if (fmod_ret->nr_links) {
> > > > > > > > +               branches  =3D kcalloc(fmod_ret->nr_links, s=
izeof(u32 *), GFP_KERNEL);
> > > > > > > > +               if (!branches)
> > > > > > > > +                       return -ENOMEM;
> > > > > > > > +
> > > > > > > > +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off,=
 retval_off,
> > > > > > > > +                                  run_ctx_off, branches);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > > +               ret =3D emit_call(ctx, (const u64)orig_call=
);
> > > > > > > > +               if (ret)
> > > > > > > > +                       goto out;
> > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONG=
ARCH_GPR_FP, -retval_off);
> > > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOON=
GARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > +               im->ip_after_call =3D ctx->ro_image + ctx->=
idx;
> > > > > > > > +               /* Reserve space for the move_imm + jirl in=
struction */
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       for (i =3D 0; ctx->image && i < fmod_ret->nr_links;=
 i++) {
> > > > > > > > +               int offset =3D (void *)(&ctx->image[ctx->id=
x]) - (void *)branches[i];
> > > > > > > > +               *branches[i] =3D larch_insn_gen_bne(LOONGAR=
CH_GPR_T1, LOONGARCH_GPR_ZERO, offset);
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       for (i =3D 0; i < fexit->nr_links; i++) {
> > > > > > > > +               ret =3D invoke_bpf_prog(ctx, fexit->links[i=
], args_off, retval_off,
> > > > > > > > +                                     run_ctx_off, false);
> > > > > > > > +               if (ret)
> > > > > > > > +                       goto out;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > +               im->ip_epilogue =3D ctx->ro_image + ctx->id=
x;
> > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)=
im, false);
> > > > > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tra=
mp_exit);
> > > > > > > > +               if (ret)
> > > > > > > > +                       goto out;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> > > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > > +
> > > > > > > > +       if (save_ret) {
> > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONG=
ARCH_GPR_FP, -retval_off);
> > > > > > > > +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOON=
GARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR=
_FP, -sreg_off);
> > > > > > > > +
> > > > > > > > +       /* trampoline called from function entry */
> > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR=
_SP, stack_size - 8);
> > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, stack_size - 16);
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_G=
PR_SP, stack_size);
> > > > > > > > +
> > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR=
_SP, 8);
> > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, 0);
> > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_G=
PR_SP, 16);
> > > > > > > > +
> > > > > > > > +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> > > > > > > > +               /* return to parent function */
> > > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LO=
ONGARCH_GPR_RA, 0);
> > > > > > > > +       else
> > > > > > > > +               /* return to traced function */
> > > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LO=
ONGARCH_GPR_T0, 0);
> > > > > > > > +
> > > > > > > > +       ret =3D ctx->idx;
> > > > > > > > +out:
> > > > > > > > +       kfree(branches);
> > > > > > > > +
> > > > > > > > +       return ret;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im=
, void *ro_image,
> > > > > > > > +                               void *ro_image_end, const s=
truct btf_func_model *m,
> > > > > > > > +                               u32 flags, struct bpf_tramp=
_links *tlinks,
> > > > > > > > +                               void *func_addr)
> > > > > > > > +{
> > > > > > > > +       int ret;
> > > > > > > > +       void *image, *tmp;
> > > > > > > > +       u32 size =3D ro_image_end - ro_image;
> > > > > > > > +
> > > > > > > > +       image =3D kvmalloc(size, GFP_KERNEL);
> > > > > > > > +       if (!image)
> > > > > > > > +               return -ENOMEM;
> > > > > > > > +
> > > > > > > > +       struct jit_ctx ctx =3D {
> > > > > > > > +               .image =3D (union loongarch_instruction *)i=
mage,
> > > > > > > > +               .ro_image =3D (union loongarch_instruction =
*)ro_image,
> > > > > > > > +               .idx =3D 0,
> > > > > > > > +       };
> > > > > > > > +
> > > > > > > > +       jit_fill_hole(image, (unsigned int)(ro_image_end - =
ro_image));
> > > > > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, im, m, =
tlinks, func_addr, flags);
> > > > > > > > +       if (ret > 0 && validate_code(&ctx) < 0) {
> > > > > > > > +               ret =3D -EINVAL;
> > > > > > > > +               goto out;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       tmp =3D bpf_arch_text_copy(ro_image, image, size);
> > > > > > > > +       if (IS_ERR(tmp)) {
> > > > > > > > +               ret =3D PTR_ERR(tmp);
> > > > > > > > +               goto out;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       bpf_flush_icache(ro_image, ro_image_end);
> > > > > > > > +out:
> > > > > > > > +       kvfree(image);
> > > > > > > > +       return ret < 0 ? ret : size;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +int arch_bpf_trampoline_size(const struct btf_func_model *=
m, u32 flags,
> > > > > > > > +                            struct bpf_tramp_links *tlinks=
, void *func_addr)
> > > > > > > > +{
> > > > > > > > +       struct bpf_tramp_image im;
> > > > > > > > +       struct jit_ctx ctx;
> > > > > > > > +       int ret;
> > > > > > > > +
> > > > > > > > +       ctx.image =3D NULL;
> > > > > > > > +       ctx.idx =3D 0;
> > > > > > > > +
> > > > > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m,=
 tlinks, func_addr, flags);
> > > > > > > > +
> > > > > > > > +       /* Page align */
> > > > > > > > +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INS=
N_SIZE, PAGE_SIZE);
> > > > > > > > +}
> > > > > > > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/=
net/bpf_jit.h
> > > > > > > > index f9c569f53..5697158fd 100644
> > > > > > > > --- a/arch/loongarch/net/bpf_jit.h
> > > > > > > > +++ b/arch/loongarch/net/bpf_jit.h
> > > > > > > > @@ -18,6 +18,7 @@ struct jit_ctx {
> > > > > > > >         u32 *offset;
> > > > > > > >         int num_exentries;
> > > > > > > >         union loongarch_instruction *image;
> > > > > > > > +       union loongarch_instruction *ro_image;
> > > > > > > >         u32 stack_size;
> > > > > > > >  };
> > > > > > > >
> > > > > > > > @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(str=
uct jit_ctx *ctx, u8 cond, enum loongarch
> > > > > > > >
> > > > > > > >         return -EINVAL;
> > > > > > > >  }
> > > > > > > > +
> > > > > > > > +static inline void bpf_flush_icache(void *start, void *end=
)
> > > > > > > > +{
> > > > > > > > +       flush_icache_range((unsigned long)start, (unsigned =
long)end);
> > > > > > > > +}
> > > > > > > > --
> > > > > > > > 2.43.0
> > > > > > > >
> > > > > > > >
