Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5D18C22
	for <loongarch@lists.linux.dev>; Wed,  1 May 2024 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714584950; cv=none; b=tH4BN1s0e3D/EsLVRsrsoyQzi4KXmrJTKC/rZiN3xnnWSu1InycmwP7C3agev9MPV+bEd4jw8TZuKY8BqI3LDrjRceq/SBfsa4dkaAa5gKKYL+JQ8CwzC9lJCR2bmwnkIg04pWF/9DTpPUNlxZgJIZu8UXoLkhA1/gRGIudC7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714584950; c=relaxed/simple;
	bh=i5Yel4re/gpYyg9W0x9D7AVuSGIzMUN9waF0CV8LGiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0YA8SVvMQ8byIaxGmzzdNjwi/pFsjgGjN4h+b3fEAxch+zIL0BDjb6NXUSVm4hzkjEMHGsP2tmvT/mnowBDsUwy/Ig/IthBTTRzrTXxbi2OqHeF3fzkQjGBnAP5PJJydP9EHvmFCSpJI0VdsxYfxfMDSjmileNicNQcjEm5aOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGFHF5Tr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGFHF5Tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92C9C4AF19
	for <loongarch@lists.linux.dev>; Wed,  1 May 2024 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714584949;
	bh=i5Yel4re/gpYyg9W0x9D7AVuSGIzMUN9waF0CV8LGiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IGFHF5Tr2xM7qFtK22OQNY8eppq3ANMk9OOatA+TYEbbbAUNJIIbX1MhE2AkOeUtw
	 xhEomfRSGQaPn4lg4qxTVe9i3Zpqt6xKzx9coFQ/CqNnfxQOvvDyTWkoNyDtY4fH7j
	 LHqr+s6vWJvVg10pkOonH+RP/y6qD0rVUKmnk/ysML7n1PD1F4v5Qio+jBXno+41UJ
	 TVdlsJmu85MUeotQaLLKK+hazp9HXZ6r16VmV9I86bWy01PKwWvUE5YC/6LA7V7sG5
	 CVQFEJlU4ndIZlfDWXC8pPymZbXuQFn1pjJYNPQdlYeV7JmHdAIs77vowhMuxNnene
	 CnI1iffI4u1gA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso39383181fa.2
        for <loongarch@lists.linux.dev>; Wed, 01 May 2024 10:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUm9xNosqYDIXDR2KRtB+1814RhfvE9od0HZHOyJFOH0v4wkJ7QV4i3UCYRzWcxf099NysE0z8y1I+pPiU4lwHfh3AlQmP6dBq
X-Gm-Message-State: AOJu0YyFne1wpaJ2Ro54X3Z3/8iu4C6gntax8Zcz3nlcY0uoxiiN7W3+
	pCnAcfmPVEzFbVGp06j+zbxPASidwTCfAHuvepGJdbvqFY4JiNhK5ycwb/+37sarJd7eick1fAM
	mVQvAp1UczZ0UooHK1/dS1wXRcQQ=
X-Google-Smtp-Source: AGHT+IEhp06z8PCIlVF1hpW4hJBFp2boXUQOEcPvL4fU9iRfZCC258FtGJKDPaIGuDs/Gks4hDv4XD1KMR1DM4Yf91w=
X-Received: by 2002:a05:6402:11c8:b0:572:315a:b2d3 with SMTP id
 j8-20020a05640211c800b00572315ab2d3mr1958514edw.15.1714584927605; Wed, 01 May
 2024 10:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 2 May 2024 01:35:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT8a4PBU3ekZFNTi6EuETT9hhKfhXrPgGGpn92rQMNSvg@mail.gmail.com>
Message-ID: <CAJF2gTT8a4PBU3ekZFNTi6EuETT9hhKfhXrPgGGpn92rQMNSvg@mail.gmail.com>
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 12:30=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.
>
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
>
> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
>
>   sudo perf probe --add commit_creds
>   sudo perf trace -e probe:commit_creds
>   # In another terminal
>   make
>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>   # Back to perf terminal
>   # ctrl-c
>   sudo perf probe --del commit_creds
>
> After a short period, a page fault and panic would occur as the kprobe
> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
> is supposed to be used only in extreme circumstances, it is invoked in
> FTRACE_WARN_ON() and so there are many places where an unexpected bug
> could be triggered, yet the system may continue operating, possibly
> without the administrator noticing. If ftrace_kill() does not panic the
> system, then we should do everything we can to continue operating,
> rather than leave a ticking time bomb.
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> Changes in v3:
>   Don't expose ftrace_is_dead(). Create a "kprobe_ftrace_disabled"
>   variable and check it directly in the kprobe handlers.
> Link to v1/v2 discussion:
>   https://lore.kernel.org/all/20240426225834.993353-1-stephen.s.brennan@o=
racle.com/
>
>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>  arch/parisc/kernel/ftrace.c          | 3 +++
>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>  arch/s390/kernel/ftrace.c            | 3 +++
>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>  include/linux/kprobes.h              | 7 +++++++
>  kernel/kprobes.c                     | 6 ++++++
>  kernel/trace/ftrace.c                | 1 +
>  10 files changed, 35 insertions(+)
>
> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/f=
trace.c
> index 834cffcfbce3..7ba4b98076de 100644
> --- a/arch/csky/kernel/probes/ftrace.c
> +++ b/arch/csky/kernel/probes/ftrace.c
> @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned l=
ong parent_ip,
>         struct kprobe_ctlblk *kcb;
>         struct pt_regs *regs;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
For csky part.
Acked-by: Guo Ren <guoren@kernel.org>

>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/f=
trace_dyn.c
> index 73858c9029cc..bff058317062 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned=
 long parent_ip,
>         struct kprobe *p;
>         struct kprobe_ctlblk *kcb;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 621a4b386ae4..c91f9c2e61ed 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned=
 long parent_ip,
>         struct kprobe *p;
>         int bit;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/k=
probes-ftrace.c
> index 072ebe7f290b..f8208c027148 100644
> --- a/arch/powerpc/kernel/kprobes-ftrace.c
> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned =
long parent_nip,
>         struct pt_regs *regs;
>         int bit;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(nip, parent_nip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes=
/ftrace.c
> index 7142ec42e889..a69dfa610aa8 100644
> --- a/arch/riscv/kernel/probes/ftrace.c
> +++ b/arch/riscv/kernel/probes/ftrace.c
> @@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned l=
ong parent_ip,
>         struct kprobe_ctlblk *kcb;
>         int bit;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index c46381ea04ec..7f6f8c438c26 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned=
 long parent_ip,
>         struct kprobe *p;
>         int bit;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/f=
trace.c
> index dd2ec14adb77..15af7e98e161 100644
> --- a/arch/x86/kernel/kprobes/ftrace.c
> +++ b/arch/x86/kernel/kprobes/ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned l=
ong parent_ip,
>         struct kprobe_ctlblk *kcb;
>         int bit;
>
> +       if (unlikely(kprobe_ftrace_disabled))
> +               return;
> +
>         bit =3D ftrace_test_recursion_trylock(ip, parent_ip);
>         if (bit < 0)
>                 return;
> diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> index 0ff44d6633e3..5fcbc254d186 100644
> --- a/include/linux/kprobes.h
> +++ b/include/linux/kprobes.h
> @@ -378,11 +378,15 @@ static inline void wait_for_kprobe_optimizer(void) =
{ }
>  extern void kprobe_ftrace_handler(unsigned long ip, unsigned long parent=
_ip,
>                                   struct ftrace_ops *ops, struct ftrace_r=
egs *fregs);
>  extern int arch_prepare_kprobe_ftrace(struct kprobe *p);
> +/* Set when ftrace has been killed: kprobes on ftrace must be disabled f=
or safety */
> +extern bool kprobe_ftrace_disabled __read_mostly;
> +extern void kprobe_ftrace_kill(void);
>  #else
>  static inline int arch_prepare_kprobe_ftrace(struct kprobe *p)
>  {
>         return -EINVAL;
>  }
> +static inline void kprobe_ftrace_kill(void) {}
>  #endif /* CONFIG_KPROBES_ON_FTRACE */
>
>  /* Get the kprobe at this addr (if any) - called with preemption disable=
d */
> @@ -495,6 +499,9 @@ static inline void kprobe_flush_task(struct task_stru=
ct *tk)
>  static inline void kprobe_free_init_mem(void)
>  {
>  }
> +static inline void kprobe_ftrace_kill(void)
> +{
> +}
>  static inline int disable_kprobe(struct kprobe *kp)
>  {
>         return -EOPNOTSUPP;
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 65adc815fc6e..166ebf81dc45 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1068,6 +1068,7 @@ static struct ftrace_ops kprobe_ipmodify_ops __read=
_mostly =3D {
>
>  static int kprobe_ipmodify_enabled;
>  static int kprobe_ftrace_enabled;
> +bool kprobe_ftrace_disabled;
>
>  static int __arm_kprobe_ftrace(struct kprobe *p, struct ftrace_ops *ops,
>                                int *cnt)
> @@ -1136,6 +1137,11 @@ static int disarm_kprobe_ftrace(struct kprobe *p)
>                 ipmodify ? &kprobe_ipmodify_ops : &kprobe_ftrace_ops,
>                 ipmodify ? &kprobe_ipmodify_enabled : &kprobe_ftrace_enab=
led);
>  }
> +
> +void kprobe_ftrace_kill()
> +{
> +       kprobe_ftrace_disabled =3D true;
> +}
>  #else  /* !CONFIG_KPROBES_ON_FTRACE */
>  static inline int arm_kprobe_ftrace(struct kprobe *p)
>  {
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index da1710499698..96db99c347b3 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -7895,6 +7895,7 @@ void ftrace_kill(void)
>         ftrace_disabled =3D 1;
>         ftrace_enabled =3D 0;
>         ftrace_trace_function =3D ftrace_stub;
> +       kprobe_ftrace_kill();
>  }
>
>  /**
> --
> 2.39.3
>


--=20
Best Regards
 Guo Ren
