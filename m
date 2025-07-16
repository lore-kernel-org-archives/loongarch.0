Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3512673A5
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677529; cv=none; b=iV2vwz4OL5qP+vuZ9wS+f0lWgNCEVHZgqmoVSSfNN2T5DXlQaDtStFoPmY95EU3SKLyISnSbQY2RoTnHI4ea5XIcYWjrS2jGwbMVTNzdc5zsDLN/iP1QORQIDGjaATjXbGkrDs3Z6vUY6ocBCErofcKyVmRzA8Af9LJaM7g0q4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677529; c=relaxed/simple;
	bh=Yp7MMgUTKayMZ87d34db3hPMUqiiP0G1eE97NA85oS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6mcz7c1QIYBEQoVRIDz/Qj5wad1LgTLDKG1DwdAjywen8zsDyalv46E/j6ubz1yGM+OxcdYZaEG4fDa+4FE8/W098yOgX8NhLZnCiWEBzwHzOp8yqN3ysy+E9A/arZszpXwqOCSsPw27xzWW6zoCghGEMV6ZZbq2Y+AG5Oh0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OD6RueBZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD6RueBZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ab9ba884c6so15331cf.0
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677525; x=1753282325; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4CLFbWE8CylEXj1QGQFQstyJMMBWaQF8Oa97vURNq4=;
        b=OD6RueBZ7Ayr59N7S55H7FB22XupP/yzRAoduRPvmhC3ldYIka+1BLV+X2yh9XxNxs
         BDftlfW0WRYXzO5nGJTCwM5o069VPDqKFuwshUP3DQPdlycd3PYpJSQ/50cFMlLxWH4n
         dB3ZPBygVnl2Fr30ekPmf0tFwMRDQXTwK5EoiQuTUba+0BnmimS6CbEwhH9zYg0EE9/A
         UwdEFsHYrJqcpg/42wQWK8tgovNbT3NVeSv/Y1LvvXHG5t7yV++g64kX1xUTUQYaAKLi
         j4fb3HuYT3FsVkTT3Ae9jX0tfdELpnlLYGmQgChbfjFe8gPbuLe3dBF2a7IY1QCOwp/T
         hyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677525; x=1753282325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4CLFbWE8CylEXj1QGQFQstyJMMBWaQF8Oa97vURNq4=;
        b=dkpKH952pt4C8c5podvgdTyo/Cmm3Ey86RcT8VZEsEpr9XBumKoqm2M9w0r6YiENtz
         iL1I9Ot0s2+gor0br6Rp++frhxgLquzvKjiTW//ZHKdq4O8QTvc38TQ9NG/VeIgWchvx
         1clRdJKmRJM2lJroRlxQpWGR3tYhHg+AzZsiqcZvH7ufVivfI8AwzD/tOJadVq9OIaNm
         91rPvPwoS2s1/xntKuaNINyFCs/HGQwDknyU5X6gwDHvhuKBlnQplr6Nh4ONzbV1kzhP
         ad8irxMudvBSvCL2gEOlhI4CS1nPZkyK2RhOIX3GoRboPpeXMAoGfOjsW30814H51i2k
         bv6w==
X-Forwarded-Encrypted: i=1; AJvYcCWFO3VCeKv0vPtczI6W90F8nc7U2cv+FB74MJF9O0GpnJBMVEXTEBpPRv+eu0RQ68YNwzVr+O0TdrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKEYoubqeg2CWBJcloKsIJpB41pzqY71Qu758lzKa7lL7EBEfK
	c/cvv5RNJpku+41TazfLni1R57sQC0OJfubxxwM3jqlJPVdsJhh1gDiU5x5dCLkmuOpFRTpUUua
	E7To+J4+hYLTm3EVn5nW9wLgDxpWTK64=
X-Gm-Gg: ASbGnct67VFyL/S+XWJePWnryzIJE08lQtv7lzWhjrteDdyQZeyviIFrbrhMPFwudzN
	5ybdbfwcX7+UmkHG9jNy2xseD2xGAXRHf8Nm/Ln9swDP7ODOiJ4o9PR86RLndabvxXw4qvZ3QV8
	ngOnDpqPfyLOUIXMXhpfwKXyDr0oTfJoF+OU6nnX+mwczQESUF4S6ZSiL8V4aiWagCuVLxoJ5Zy
	pO8GZ/UXQ5xQl7c4VA7SpET1zUXuyyc/5nTmQoL
X-Google-Smtp-Source: AGHT+IFE+yxGE0Bqw1CQ2FUTEX3hTzUz5tc0yvQwDzSMxsSfZ+vJFVI1PfcxAwg3bnNYNgKm69cZ4WjIiu08uA3ivRU=
X-Received: by 2002:a05:622a:1113:b0:4ab:557b:5d2d with SMTP id
 d75a77b69052e-4ab921c0f7bmr57168361cf.2.1752677525180; Wed, 16 Jul 2025
 07:52:05 -0700 (PDT)
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
 <CAK3+h2xZ6yh7N0abu5DP_ftaiE1gQEy8qVi-VvrePssc5+m=eQ@mail.gmail.com> <CAK3+h2zPQ+tcFzWzZt8g3TPhaK+7kDnfJQYiDOFMq-K0FqsbTA@mail.gmail.com>
In-Reply-To: <CAK3+h2zPQ+tcFzWzZt8g3TPhaK+7kDnfJQYiDOFMq-K0FqsbTA@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 16 Jul 2025 07:51:53 -0700
X-Gm-Features: Ac12FXxhun_oc3D-OZVhEh_K15wiVr9mHWVzo76wHhJHcgdP-uLyfTCC7W47E-M
Message-ID: <CAK3+h2z1iM9m5yyMBNBOO9WcgidW1FKQ+EPVsrM5BRzh5myEPA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for Loongarch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 8:11=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Tue, Jul 15, 2025 at 2:54=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Tue, Jul 15, 2025 at 2:19=E2=80=AFPM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> > >
> > > On Thu, Jul 10, 2025 at 8:03=E2=80=AFAM Vincent Li <vincent.mc.li@gma=
il.com> wrote:
> > > >
> > > > On Thu, Jul 10, 2025 at 1:05=E2=80=AFAM Chenghao Duan <duanchenghao=
@kylinos.cn> wrote:
> > > > >
> > > > > On Wed, Jul 09, 2025 at 12:08:27PM -0700, Vincent Li wrote:
> > > > > > Hi Chenghao,
> > > > > >
> > > > > > I removed many email recipients for my question because I don't=
 want
> > > > > > to bother others, so you could  reply to this and not CC others=
 who
> > > > > > may not want to be bothered.  Thanks for working on this BPF
> > > > > > trampoline feature for loongarch, I have been waiting for the b=
pf
> > > > > > trampoline feature for loongarch for a long time.
> > > > > >
> > > > > >
> > > > > > On Tue, Jul 8, 2025 at 10:52=E2=80=AFPM Chenghao Duan <duanchen=
ghao@kylinos.cn> wrote:
> > > > > > >
> > > > > > > BPF trampoline is the critical infrastructure of the BPF subs=
ystem, acting
> > > > > > > as a mediator between kernel functions and BPF programs. Nume=
rous important
> > > > > > > features, such as using BPF program for zero overhead kernel =
introspection,
> > > > > > > rely on this key component.
> > > > > > >
> > > > > > > The related tests have passed, Including the following techni=
cal points:
> > > > > > > 1. fentry
> > > > > > > 2. fmod_ret
> > > > > > > 3. fexit
> > > > > > >
> > > > > >
> > > > > > My firewall project https://github.com/vincentmli/loongfire rel=
ies on
> > > > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp w=
hich
> > > > > > relies on "BPF program extension" to attach multiple XDP progra=
m to
> > > > > > one single network interface. Now I can't attach multiple XDP p=
rograms
> > > > > > to one network interface through libxdp so I use bpf tail call =
as a
> > > > > > workaround.  I am not a kernel developer and not  familiar with=
 the
> > > > > > kernel code so I am not sure if the "BPF program extension" is
> > > > > > automatically supported after bpf trampoline is supported for
> > > > > > loongarch, could you shed some light on this? thanks!
> > > > > >
> > > > >
> > > > > Hi Vincent,
> > > > >
> > > > > I sincerely apologize, but I'm not quite sure about the specific
> > > > > scenarios where the "BPF Program Extension" you mentioned is appl=
ied.
> > > > > The trampoline feature allows multiple BPF programs to be attache=
d to
> > > > > the fentry/fexit points of kernel functions at runtime. I'm not s=
ure if
> > > > > this aligns with your technical approach.
> > > > >
> > > > > Chenghao
> > > > >
> > > >
> > > > Thanks for the feedback, the
> > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp has
> > > > section
> > > > Kernel and BPF program feature compatibility.
> > > >
> > > > "The ability to attach multiple BPF programs to a single interface
> > > > relies on the kernel =E2=80=9CBPF program extension=E2=80=9D featur=
e which was
> > > > introduced by commit be8704ff07d2 (=E2=80=9Cbpf: Introduce dynamic =
program
> > > > extensions=E2=80=9D) in the upstream kernel and first appeared in k=
ernel
> > > > release 5.6. To incrementally attach multiple programs, a further
> > > > refinement added by commit 4a1e7c0c63e0 (=E2=80=9Cbpf: Support atta=
ching
> > > > freplace programs to multiple attach points=E2=80=9D) is needed; th=
is first
> > > > appeared in the upstream kernel version 5.10. The functionality rel=
ies
> > > > on the =E2=80=9CBPF trampolines=E2=80=9D feature which is unfortuna=
tely only available
> > > > on the x86_64 architecture. In other words, kernels before 5.6 can
> > > > only attach a single XDP program to each interface, kernels 5.6+ ca=
n
> > > > attach multiple programs if they are all attached at the same time,
> > > > and kernels 5.10 have full support for XDP multiprog on x86_64. On
> > > > other architectures, only a single program can be attached to each
> > > > interface."
> > > >
> > > > According to the above mentioned commit and  paragraph, I think =E2=
=80=9CBPF
> > > > program extension=E2=80=9D should be  supported if the architecture=
 supports
> > > > trampoline, when libxdp author wrote the above paragraph, probably
> > > > only X86_64 architecture supported BPF trampolines at that time. I
> > > > will be glad to help testing that when loongarch BPF trampoline
> > > > feature is supported :)
> > > >
> > >
> > > I applied the patches on top of 6.16.0-rc6 on my local loongarch
> > > machine, then tried to run xdp-filter program from xdp-tools project,
> > > it looks not working with xdp-tools libxdp, got "Bad address" error:
> > >
> > > ./xdp-filter/xdp-filter load -m skb -vvv lo
> > >
> > >  libxdp: Loaded XDP program xdp_pass, got fd 22
> > >  libxdp: Duplicated fd 22 to 23 for prog xdp_pass
> > >  libxdp: Failed to attach test program to dispatcher: Bad address <=
=3D=3D=3D=3D
> > >  libxdp: Compatibility check for dispatcher program failed: Bad addre=
ss
> > >  libxdp: Falling back to loading single prog without dispatcher
> > >  libxdp: Checking for kernel frags support
> > >  libxdp: Loading XDP program 'xdp-dispatcher.o' from embedded object =
file
> > >
> > > the error is from xdp-tools lib/libxdp/libxdp.c
> > >
> > >         bpf_program__set_type(test_prog->bpf_prog, BPF_PROG_TYPE_EXT)=
;
> > >         bpf_program__set_expected_attach_type(test_prog->bpf_prog, 0)=
;
> > >         err =3D xdp_program__load(test_prog);
> > >         if (err) {
> > >                 char buf[100] =3D {};
> > >                 libxdp_strerror(err, buf, sizeof(buf));
> > >                 pr_debug("Failed to load program %s: %s\n",
> > >                         xdp_program__name(test_prog), buf);
> > >                 goto out;
> > >         }
> > >
> > >         test_prog->link_fd =3D bpf_raw_tracepoint_open(NULL, test_pro=
g->prog_fd);
> > >         if (test_prog->link_fd < 0) {
> > >                 err =3D -errno;
> > >                 pr_debug("Failed to attach test program to dispatcher=
:
> > > %s\n",  <=3D=3D=3D=3D=3D=3Derror Bad address
> > >                          strerror(-err));
> > >                 goto out;
> > >         }
> > >
> >
> > here is strace:
> >
> > 2754  write(2, "libxdp: Duplicated fd 22 to 23 for prog xdp_pass\n", 49=
) =3D 49
> > 2754  bpf(BPF_RAW_TRACEPOINT_OPEN, {raw_tracepoint=3D{name=3DNULL,
> > prog_fd=3D23}}, 24) =3D -1 EFAULT (Bad address)
> > 2754  write(2, " ", 1)                  =3D 1
> > 2754  write(2, "libxdp: Failed to attach test program to dispatcher:
> > Bad address\n", 65) =3D 65
> >
>
> Sorry to make more noise, if I understand the code right, bpf syscall
> of BPF_RAW_TRACEPOINT_OPEN code path looks like below, and it
> eventually may call bpf_arch_text_poke() which would invoke the
> loongarch bpf_arch_text_poke().  raw tracepoint could rely on the bpf
> trampoline. I wonder if there is a way to print out the kernel stack
> trace when executing xdp-filter command.
>
>
> static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size)
> {
>         union bpf_attr attr;
>         int err;
> ...
>         case BPF_RAW_TRACEPOINT_OPEN:
>                 err =3D bpf_raw_tracepoint_open(&attr); <=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>                 break;
> ...
> }
>
> static int bpf_raw_tracepoint_open(const union bpf_attr *attr)
> {
>         struct bpf_prog *prog;
>         void __user *tp_name;
>         __u64 cookie;
> ...
>         fd =3D bpf_raw_tp_link_attach(prog, tp_name, cookie); <=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>                 bpf_prog_put(prog);
> ...
> }
>
> static int bpf_raw_tp_link_attach(struct bpf_prog *prog,
>                                   const char __user *user_tp_name, u64 co=
okie)
> {
>         struct bpf_link_primer link_primer;
>         struct bpf_raw_tp_link *link;
>         struct bpf_raw_event_map *btp;
>         const char *tp_name;
>         char buf[128];
>         int err;
>
>         switch (prog->type) {
>         case BPF_PROG_TYPE_TRACING:
>         case BPF_PROG_TYPE_EXT: <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         case BPF_PROG_TYPE_LSM:
>                 if (user_tp_name)
>                         /* The attach point for this category of programs
>                          * should be specified via btf_id during program =
load.
>                          */
>                         return -EINVAL;
>                 if (prog->type =3D=3D BPF_PROG_TYPE_TRACING &&
>                     prog->expected_attach_type =3D=3D BPF_TRACE_RAW_TP) {
>                         tp_name =3D prog->aux->attach_func_name;
>                         break;
>                 }
>                 return bpf_tracing_prog_attach(prog, 0, 0, 0);
> <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ...
> }
>
>
> static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>                                    int tgt_prog_fd,
>                                    u32 btf_id,
>                                    u64 bpf_cookie)
> {
>
>
>        err =3D bpf_trampoline_link_prog(&link->link, tr, tgt_prog);
>
> }
>
> int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>                              struct bpf_trampoline *tr,
>                              struct bpf_prog *tgt_prog)
> {
>         int err;
>
>         mutex_lock(&tr->mutex);
>         err =3D __bpf_trampoline_link_prog(link, tr, tgt_prog);
>         mutex_unlock(&tr->mutex);
>         return err;
> }
>
> static int __bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>                                       struct bpf_trampoline *tr,
>                                       struct bpf_prog *tgt_prog)
> {
>         enum bpf_tramp_prog_type kind;
>         struct bpf_tramp_link *link_exiting;
>         int err =3D 0;
>         int cnt =3D 0, i;
>
>         kind =3D bpf_attach_type_to_tramp(link->link.prog);
>         if (tr->extension_prog)
>                 /* cannot attach fentry/fexit if extension prog is attach=
ed.
>                  * cannot overwrite extension prog either.
>                  */
>                 return -EBUSY;
>
>         for (i =3D 0; i < BPF_TRAMP_MAX; i++)
>                 cnt +=3D tr->progs_cnt[i];
>
>         if (kind =3D=3D BPF_TRAMP_REPLACE) { <=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>                 /* Cannot attach extension if fentry/fexit are in use. */
>                 if (cnt)
>                         return -EBUSY;
>                 err =3D bpf_freplace_check_tgt_prog(tgt_prog);
>                 if (err)
>                         return err;
>                 tr->extension_prog =3D link->link.prog;
>                 return bpf_arch_text_poke(tr->func.addr, BPF_MOD_JUMP, NU=
LL,
>                                           link->link.prog->bpf_func);
> <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         }
>
> ...
> }
>

To continue the fun of hacking :), to find a good use of this patch
series to test out fentry, DeepSeek helped me  come up with the
following method to fentry the bpf_trampoline_link_prog().

SEC("fentry/bpf_trampoline_link_prog")
int BPF_PROG(trace_trampoline_link,
            struct bpf_tramp_link *link,
            struct bpf_trampoline *tr,
            struct bpf_prog *tgt_prog)
{
    enum bpf_tramp_prog_type kind =3D BPF_TRAMP_MAX;
    const char *kind_str =3D "UNKNOWN";
    char prog_name[16] =3D {0};
    bool has_prog_name =3D false;

    if (link && link->link.prog) {
        // Get program name if available
        if (link->link.prog->aux) {
            bpf_probe_read_kernel_str(prog_name, sizeof(prog_name),
                                    link->link.prog->aux->name);
            has_prog_name =3D true;
        }

        // Determine kind
        switch (link->link.prog->expected_attach_type) {
            case BPF_TRACE_FENTRY:
                kind =3D BPF_TRAMP_FENTRY;
                kind_str =3D "FENTRY";
                break;
            case BPF_TRACE_FEXIT:
                kind =3D BPF_TRAMP_FEXIT;
                kind_str =3D "FEXIT";
                break;
            case BPF_MODIFY_RETURN:
                kind =3D BPF_TRAMP_MODIFY_RETURN;
                kind_str =3D "MODIFY_RETURN";
                break;
            default:
                if (link->link.prog->type =3D=3D BPF_PROG_TYPE_EXT) {
                    kind =3D BPF_TRAMP_REPLACE;
                    kind_str =3D "REPLACE";
                }
                break;
        }
    }

    bpf_printk("__bpf_trampoline_link_prog: kind=3D%d (%s) prog=3D%s",
               kind,
               kind_str,
               has_prog_name ? prog_name : "N/A");

    return 0;
}

It confirms the xdp_pass program is set to  BPF_PROG_TYPE_EXT as
expected and kind is BPF_TRAMP_REPLACE and bpf_arch_text_poke() would
be invoked when I run 'xdp-filter load -m skb lo'

[root@fedora c]# cat /sys/kernel/debug/tracing/trace_pipe
           <...>-10081   [003] ...11 64926.801233: bpf_trace_printk:
__bpf_trampoline_link_prog: kind=3D4 (REPLACE) prog=3Dxdp_pass


>
>
> > deepseek says the  bpf syscall raw tracepoint name should not be NULL,
> > something related to raw tracepoint?
> >
> >
> > > xdp-tools/libxdp is a popular project to attach multiple XDP programs
> > > to a single network interface, packaged in mainstream Linux
> > > distributions, so it would be nice to get the loongarch kernel bpf
> > > trampoline working with xdp-tools/libxdp :).
> > >
> > > > > > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > > > ---
> > > > > > >  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++++=
++++++++++
> > > > > > >  arch/loongarch/net/bpf_jit.h |   6 +
> > > > > > >  2 files changed, 397 insertions(+)
> > > > > > >
> > > > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/ne=
t/bpf_jit.c
> > > > > > > index 9cb01f0b0..6820558af 100644
> > > > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > > > @@ -7,6 +7,10 @@
> > > > > > >  #include <linux/memory.h>
> > > > > > >  #include "bpf_jit.h"
> > > > > > >
> > > > > > > +#define LOONGARCH_MAX_REG_ARGS 8
> > > > > > > +#define LOONGARCH_FENTRY_NINSNS 2
> > > > > > > +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS * 4=
)
> > > > > > > +
> > > > > > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > > > > >  #define TCC_SAVED      LOONGARCH_GPR_S5
> > > > > > >
> > > > > > > @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *targ=
et, void *ip, u32 *insns, bool is_call)
> > > > > > >                                   (unsigned long)ip, (unsigne=
d long)target);
> > > > > > >  }
> > > > > > >
> > > > > > > +static int emit_call(struct jit_ctx *ctx, u64 addr)
> > > > > > > +{
> > > > > > > +       u64 ip;
> > > > > > > +
> > > > > > > +       if (addr && ctx->image && ctx->ro_image)
> > > > > > > +               ip =3D (u64)(ctx->image + ctx->idx);
> > > > > > > +
> > > > > > > +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip, =
addr);
> > > > > > > +}
> > > > > > > +
> > > > > > >  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type pok=
e_type,
> > > > > > >                        void *old_addr, void *new_addr)
> > > > > > >  {
> > > > > > > @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst, v=
oid *src, size_t len)
> > > > > > >
> > > > > > >         return dst;
> > > > > > >  }
> > > > > > > +
> > > > > > > +static void store_args(struct jit_ctx *ctx, int nargs, int a=
rgs_off)
> > > > > > > +{
> > > > > > > +       int i;
> > > > > > > +
> > > > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOO=
NGARCH_GPR_FP, -args_off);
> > > > > > > +               args_off -=3D 8;
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void restore_args(struct jit_ctx *ctx, int nargs, int=
 args_off)
> > > > > > > +{
> > > > > > > +       int i;
> > > > > > > +
> > > > > > > +       for (i =3D 0; i < nargs; i++) {
> > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, LOO=
NGARCH_GPR_FP, -args_off);
> > > > > > > +               args_off -=3D 8;
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_t=
ramp_link *l,
> > > > > > > +                          int args_off, int retval_off,
> > > > > > > +                          int run_ctx_off, bool save_ret)
> > > > > > > +{
> > > > > > > +       int ret;
> > > > > > > +       u32 *branch;
> > > > > > > +       struct bpf_prog *p =3D l->link.prog;
> > > > > > > +       int cookie_off =3D offsetof(struct bpf_tramp_run_ctx,=
 bpf_cookie);
> > > > > > > +
> > > > > > > +       if (l->cookie) {
> > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, fa=
lse);
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGAR=
CH_GPR_FP, -run_ctx_off + cookie_off);
> > > > > > > +       } else {
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONG=
ARCH_GPR_FP,
> > > > > > > +                         -run_ctx_off + cookie_off);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* arg1: prog */
> > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > > > +       /* arg2: &run_ctx */
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR=
_FP, -run_ctx_off);
> > > > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_ente=
r(p));
> > > > > > > +       if (ret)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       /* store prog start time */
> > > > > > > +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> > > > > > > +
> > > > > > > +       /* if (__bpf_prog_enter(prog) =3D=3D 0)
> > > > > > > +        *      goto skip_exec_of_prog;
> > > > > > > +        *
> > > > > > > +        */
> > > > > > > +       branch =3D (u32 *)ctx->image + ctx->idx;
> > > > > > > +       /* nop reserved for conditional jump */
> > > > > > > +       emit_insn(ctx, nop);
> > > > > > > +
> > > > > > > +       /* arg1: &args_off */
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR=
_FP, -args_off);
> > > > > > > +       if (!p->jited)
> > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p-=
>insnsi, false);
> > > > > > > +       ret =3D emit_call(ctx, (const u64)p->bpf_func);
> > > > > > > +       if (ret)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       if (save_ret) {
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGAR=
CH_GPR_FP, -retval_off);
> > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGA=
RCH_GPR_FP, -(retval_off - 8));
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* update branch with beqz */
> > > > > > > +       if (ctx->image) {
> > > > > > > +               int offset =3D (void *)(&ctx->image[ctx->idx]=
) - (void *)branch;
> > > > > > > +               *branch =3D larch_insn_gen_beq(LOONGARCH_GPR_=
A0, LOONGARCH_GPR_ZERO, offset);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* arg1: prog */
> > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > > > +       /* arg2: prog start time */
> > > > > > > +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> > > > > > > +       /* arg3: &run_ctx */
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR=
_FP, -run_ctx_off);
> > > > > > > +       ret =3D emit_call(ctx, (const u64)bpf_trampoline_exit=
(p));
> > > > > > > +
> > > > > > > +       return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct b=
pf_tramp_links *tl,
> > > > > > > +                              int args_off, int retval_off, =
int run_ctx_off, u32 **branches)
> > > > > > > +{
> > > > > > > +       int i;
> > > > > > > +
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR=
_FP, -retval_off);
> > > > > > > +       for (i =3D 0; i < tl->nr_links; i++) {
> > > > > > > +               invoke_bpf_prog(ctx, tl->links[i], args_off, =
retval_off,
> > > > > > > +                               run_ctx_off, true);
> > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGAR=
CH_GPR_FP, -retval_off);
> > > > > > > +               branches[i] =3D (u32 *)ctx->image + ctx->idx;
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > > +u64 bpf_jit_alloc_exec_limit(void)
> > > > > > > +{
> > > > > > > +       return VMALLOC_END - VMALLOC_START;
> > > > > > > +}
> > > > > > > +
> > > > > > > +void *arch_alloc_bpf_trampoline(unsigned int size)
> > > > > > > +{
> > > > > > > +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> > > > > > > +}
> > > > > > > +
> > > > > > > +void arch_free_bpf_trampoline(void *image, unsigned int size=
)
> > > > > > > +{
> > > > > > > +       bpf_prog_pack_free(image, size);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx=
, struct bpf_tramp_image *im,
> > > > > > > +                                        const struct btf_fun=
c_model *m,
> > > > > > > +                                        struct bpf_tramp_lin=
ks *tlinks,
> > > > > > > +                                        void *func_addr, u32=
 flags)
> > > > > > > +{
> > > > > > > +       int i;
> > > > > > > +       int stack_size =3D 0, nargs =3D 0;
> > > > > > > +       int retval_off, args_off, nargs_off, ip_off, run_ctx_=
off, sreg_off;
> > > > > > > +       struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_=
FENTRY];
> > > > > > > +       struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_F=
EXIT];
> > > > > > > +       struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAM=
P_MODIFY_RETURN];
> > > > > > > +       int ret, save_ret;
> > > > > > > +       void *orig_call =3D func_addr;
> > > > > > > +       u32 **branches =3D NULL;
> > > > > > > +
> > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHA=
RE_IPMODIFY))
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +
> > > > > > > +       /*
> > > > > > > +        * FP + 8       [ RA to parent func ] return address =
to parent
> > > > > > > +        *                    function
> > > > > > > +        * FP + 0       [ FP of parent func ] frame pointer o=
f parent
> > > > > > > +        *                    function
> > > > > > > +        * FP - 8       [ T0 to traced func ] return address =
of traced
> > > > > > > +        *                    function
> > > > > > > +        * FP - 16      [ FP of traced func ] frame pointer o=
f traced
> > > > > > > +        *                    function
> > > > > > > +        *
> > > > > > > +        * FP - retval_off  [ return value      ] BPF_TRAMP_F=
_CALL_ORIG or
> > > > > > > +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> > > > > > > +        *                  [ argN              ]
> > > > > > > +        *                  [ ...               ]
> > > > > > > +        * FP - args_off    [ arg1              ]
> > > > > > > +        *
> > > > > > > +        * FP - nargs_off   [ regs count        ]
> > > > > > > +        *
> > > > > > > +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_=
ARG
> > > > > > > +        *
> > > > > > > +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> > > > > > > +        *
> > > > > > > +        * FP - sreg_off    [ callee saved reg  ]
> > > > > > > +        *
> > > > > > > +        */
> > > > > > > +
> > > > > > > +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +
> > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHA=
RE_IPMODIFY))
> > > > > > > +               return -ENOTSUPP;
> > > > > > > +
> > > > > > > +       stack_size =3D 0;
> > > > > > > +
> > > > > > > +       /* room of trampoline frame to store return address a=
nd frame pointer */
> > > > > > > +       stack_size +=3D 16;
> > > > > > > +
> > > > > > > +       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRA=
MP_F_RET_FENTRY_RET);
> > > > > > > +       if (save_ret) {
> > > > > > > +               /* Save BPF R0 and A0 */
> > > > > > > +               stack_size +=3D 16;
> > > > > > > +               retval_off =3D stack_size;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* room of trampoline frame to store args */
> > > > > > > +       nargs =3D m->nr_args;
> > > > > > > +       stack_size +=3D nargs * 8;
> > > > > > > +       args_off =3D stack_size;
> > > > > > > +
> > > > > > > +       /* room of trampoline frame to store args number */
> > > > > > > +       stack_size +=3D 8;
> > > > > > > +       nargs_off =3D stack_size;
> > > > > > > +
> > > > > > > +       /* room of trampoline frame to store ip address */
> > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > +               stack_size +=3D 8;
> > > > > > > +               ip_off =3D stack_size;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* room of trampoline frame to store struct bpf_tramp=
_run_ctx */
> > > > > > > +       stack_size +=3D round_up(sizeof(struct bpf_tramp_run_=
ctx), 8);
> > > > > > > +       run_ctx_off =3D stack_size;
> > > > > > > +
> > > > > > > +       stack_size +=3D 8;
> > > > > > > +       sreg_off =3D stack_size;
> > > > > > > +
> > > > > > > +       stack_size =3D round_up(stack_size, 16);
> > > > > > > +
> > > > > > > +       /* For the trampoline called from function entry */
> > > > > > > +       /* RA and FP for parent function*/
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR=
_SP, -16);
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_S=
P, 8);
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_S=
P, 0);
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, 16);
> > > > > > > +
> > > > > > > +       /* RA and FP for traced function*/
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR=
_SP, -stack_size);
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_S=
P, stack_size - 8);
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_S=
P, stack_size - 16);
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR=
_SP, stack_size);
> > > > > > > +
> > > > > > > +       /* callee saved register S1 to pass start time */
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_F=
P, -sreg_off);
> > > > > > > +
> > > > > > > +       /* store ip address of the traced function */
> > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)fu=
nc_addr, false);
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGAR=
CH_GPR_FP, -ip_off);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       /* store nargs number*/
> > > > > > > +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_F=
P, -nargs_off);
> > > > > > > +
> > > > > > > +       store_args(ctx, nargs, args_off);
> > > > > > > +
> > > > > > > +       /* To traced function */
> > > > > > > +       orig_call +=3D LOONGARCH_FENTRY_NBYTES;
> > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im=
, false);
> > > > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp=
_enter);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       for (i =3D 0; i < fentry->nr_links; i++) {
> > > > > > > +               ret =3D invoke_bpf_prog(ctx, fentry->links[i]=
, args_off, retval_off,
> > > > > > > +                                     run_ctx_off, flags & BP=
F_TRAMP_F_RET_FENTRY_RET);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > > > +       }
> > > > > > > +       if (fmod_ret->nr_links) {
> > > > > > > +               branches  =3D kcalloc(fmod_ret->nr_links, siz=
eof(u32 *), GFP_KERNEL);
> > > > > > > +               if (!branches)
> > > > > > > +                       return -ENOMEM;
> > > > > > > +
> > > > > > > +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off, r=
etval_off,
> > > > > > > +                                  run_ctx_off, branches);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > +               ret =3D emit_call(ctx, (const u64)orig_call);
> > > > > > > +               if (ret)
> > > > > > > +                       goto out;
> > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGAR=
CH_GPR_FP, -retval_off);
> > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGA=
RCH_GPR_FP, -(retval_off - 8));
> > > > > > > +               im->ip_after_call =3D ctx->ro_image + ctx->id=
x;
> > > > > > > +               /* Reserve space for the move_imm + jirl inst=
ruction */
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +               emit_insn(ctx, nop);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       for (i =3D 0; ctx->image && i < fmod_ret->nr_links; i=
++) {
> > > > > > > +               int offset =3D (void *)(&ctx->image[ctx->idx]=
) - (void *)branches[i];
> > > > > > > +               *branches[i] =3D larch_insn_gen_bne(LOONGARCH=
_GPR_T1, LOONGARCH_GPR_ZERO, offset);
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       for (i =3D 0; i < fexit->nr_links; i++) {
> > > > > > > +               ret =3D invoke_bpf_prog(ctx, fexit->links[i],=
 args_off, retval_off,
> > > > > > > +                                     run_ctx_off, false);
> > > > > > > +               if (ret)
> > > > > > > +                       goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > +               im->ip_epilogue =3D ctx->ro_image + ctx->idx;
> > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im=
, false);
> > > > > > > +               ret =3D emit_call(ctx, (const u64)__bpf_tramp=
_exit);
> > > > > > > +               if (ret)
> > > > > > > +                       goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > +
> > > > > > > +       if (save_ret) {
> > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGAR=
CH_GPR_FP, -retval_off);
> > > > > > > +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGA=
RCH_GPR_FP, -(retval_off - 8));
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_F=
P, -sreg_off);
> > > > > > > +
> > > > > > > +       /* trampoline called from function entry */
> > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_S=
P, stack_size - 8);
> > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_S=
P, stack_size - 16);
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR=
_SP, stack_size);
> > > > > > > +
> > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_S=
P, 8);
> > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_S=
P, 0);
> > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR=
_SP, 16);
> > > > > > > +
> > > > > > > +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> > > > > > > +               /* return to parent function */
> > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOON=
GARCH_GPR_RA, 0);
> > > > > > > +       else
> > > > > > > +               /* return to traced function */
> > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOON=
GARCH_GPR_T0, 0);
> > > > > > > +
> > > > > > > +       ret =3D ctx->idx;
> > > > > > > +out:
> > > > > > > +       kfree(branches);
> > > > > > > +
> > > > > > > +       return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > > +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, =
void *ro_image,
> > > > > > > +                               void *ro_image_end, const str=
uct btf_func_model *m,
> > > > > > > +                               u32 flags, struct bpf_tramp_l=
inks *tlinks,
> > > > > > > +                               void *func_addr)
> > > > > > > +{
> > > > > > > +       int ret;
> > > > > > > +       void *image, *tmp;
> > > > > > > +       u32 size =3D ro_image_end - ro_image;
> > > > > > > +
> > > > > > > +       image =3D kvmalloc(size, GFP_KERNEL);
> > > > > > > +       if (!image)
> > > > > > > +               return -ENOMEM;
> > > > > > > +
> > > > > > > +       struct jit_ctx ctx =3D {
> > > > > > > +               .image =3D (union loongarch_instruction *)ima=
ge,
> > > > > > > +               .ro_image =3D (union loongarch_instruction *)=
ro_image,
> > > > > > > +               .idx =3D 0,
> > > > > > > +       };
> > > > > > > +
> > > > > > > +       jit_fill_hole(image, (unsigned int)(ro_image_end - ro=
_image));
> > > > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, im, m, tl=
inks, func_addr, flags);
> > > > > > > +       if (ret > 0 && validate_code(&ctx) < 0) {
> > > > > > > +               ret =3D -EINVAL;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       tmp =3D bpf_arch_text_copy(ro_image, image, size);
> > > > > > > +       if (IS_ERR(tmp)) {
> > > > > > > +               ret =3D PTR_ERR(tmp);
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       bpf_flush_icache(ro_image, ro_image_end);
> > > > > > > +out:
> > > > > > > +       kvfree(image);
> > > > > > > +       return ret < 0 ? ret : size;
> > > > > > > +}
> > > > > > > +
> > > > > > > +int arch_bpf_trampoline_size(const struct btf_func_model *m,=
 u32 flags,
> > > > > > > +                            struct bpf_tramp_links *tlinks, =
void *func_addr)
> > > > > > > +{
> > > > > > > +       struct bpf_tramp_image im;
> > > > > > > +       struct jit_ctx ctx;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       ctx.image =3D NULL;
> > > > > > > +       ctx.idx =3D 0;
> > > > > > > +
> > > > > > > +       ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, t=
links, func_addr, flags);
> > > > > > > +
> > > > > > > +       /* Page align */
> > > > > > > +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_=
SIZE, PAGE_SIZE);
> > > > > > > +}
> > > > > > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/ne=
t/bpf_jit.h
> > > > > > > index f9c569f53..5697158fd 100644
> > > > > > > --- a/arch/loongarch/net/bpf_jit.h
> > > > > > > +++ b/arch/loongarch/net/bpf_jit.h
> > > > > > > @@ -18,6 +18,7 @@ struct jit_ctx {
> > > > > > >         u32 *offset;
> > > > > > >         int num_exentries;
> > > > > > >         union loongarch_instruction *image;
> > > > > > > +       union loongarch_instruction *ro_image;
> > > > > > >         u32 stack_size;
> > > > > > >  };
> > > > > > >
> > > > > > > @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(struc=
t jit_ctx *ctx, u8 cond, enum loongarch
> > > > > > >
> > > > > > >         return -EINVAL;
> > > > > > >  }
> > > > > > > +
> > > > > > > +static inline void bpf_flush_icache(void *start, void *end)
> > > > > > > +{
> > > > > > > +       flush_icache_range((unsigned long)start, (unsigned lo=
ng)end);
> > > > > > > +}
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >
> > > > > > >
