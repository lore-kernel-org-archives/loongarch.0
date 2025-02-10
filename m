Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD01BC064
	for <loongarch@lists.linux.dev>; Mon, 10 Feb 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176068; cv=none; b=qnhHbJ0lUNCYYE/W1ZrjoqQlO9uJiRpUTlhPyzO39/qfQkyp0Rde471TRe9sU7haRjzxTzOsr8tDhAbXq5U1f0X4HTLWfi+QMoyP5WXh5ozZ3Hyna7/M+rtOq+K1b9Uv1ICP5FN/8yNXB6VOBraO5ur8iJYuJNib334Qvw7sOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176068; c=relaxed/simple;
	bh=IaOr5bedYQgMNNlZUOXvoRUmYoPlluOQtv5G15Pp0wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCT1YTK6J5SmPhfFygMjadgTINPt10FhpDQwc4nD1joyGFU1loDWyz8iplh4fCflHePj+JlCYfc0P2TxHm1jcSZHr/4ni+Zd1l1Fvskz1bXNFByyxu9JSTX32qb9JtTRPKjikOt/+5k7sHD0VJ0OtiHfO9WchYWWMJM+1ynJNf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MMikTKj3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MMikTKj3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5450cf0cb07so502567e87.0
        for <loongarch@lists.linux.dev>; Mon, 10 Feb 2025 00:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739176064; x=1739780864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb4BM+tSx2c+eJTEN+p0pQDTmd6yZJ90PbqP4rasAIM=;
        b=MMikTKj3NCgw7oDhLDUx37ypoZxhJuxCjVRqqxjxr84fJDy4850+AeHMSMkG+47+03
         trnKsel8FHmq8zfbd847RTzUFnZQjLHgl7pjBNAuP4CdzZrlrQdZ6ibXXCP75ieTDiV/
         961T/TrIFo1SZdpvXDgzN591HSel8golhLsAXhqxSffJQnQqn1fOKSs1LMOKMuhXyQUr
         GnYFET2v0XBlduSo2Ah5V0Zoj9IzC5FJmpuNRN2oz/ozhmAODvgd848D3oSZqVMhneRe
         tXMgzAmt4WKWyb97aWoyTUV31wA1UGU1SfWJtii3fRzQYelrZOV0swmb88wJkc+S8uwT
         4nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176064; x=1739780864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hb4BM+tSx2c+eJTEN+p0pQDTmd6yZJ90PbqP4rasAIM=;
        b=tsfmbf26zrYxBp5NB+Nqu0AQv8tgSs7U/K/luE8LiYIEDlBRQF37fiIH5opPZSudaT
         LLwlZ8In7isYPM2ayAjImpAWHRHAtaJVS4jUMkj31Iewzn8DUrVEam19uPPQYgjMa7ND
         urXWWAgV7dE4gJAU6pgNHVpSRh2xn9YePNFqZ+eRWvxDpBID0fam/V4K2TJwgFfTlr1L
         k5mgrh0xVV6PgkDV0Vt8ZwffNFolB2ZOIBBpaLDKjgai6Ciqo5cEsxxxD7DKyBSWiDAe
         vbvdYHdk7zVsFUUv+hXc7pvrzyNUwv6a9uIn4tlYnu/aa8hwcn+dGLQVFoSGqT2mrRJB
         E1FQ==
X-Gm-Message-State: AOJu0Yw8m6vft4qf9NlY0vgweOH3tL1yxKvPG3dd1+TZdv4kHMUAd7TG
	5Fu2wFel/775uKdczlkpVYHR5TbtvIPun5/dLBAWZ29UV9C0kZX5N0n18eWpZcUnW9ZqR94bOn7
	f6H85/q2kPwLgrteB5I80yyMLBaXmaa1nLCLoqYxdUADmtyxU
X-Gm-Gg: ASbGncs07qAYLRJbGw2CK3W4v8GZHEE/kynKTJsXpXL8UnTErdONERbkerqnrRiAAhE
	bP89Fsdc+a18gKXwzhQlUI9iGw+okyYV+3vGyCnSz3cNRNIDco9kHNH6yl2sUStEgDaYuxenvIL
	FIughXGxPGi5kNuoUampDBZkI6+a/X6g==
X-Google-Smtp-Source: AGHT+IE8cYL2zF0A4KCFzug6oMHNBtPUSgAUflqnO5DT1coWJLi/G9/5eREaaEeI+Eg0IYHuX9b1F1IP76VMNyledfo=
X-Received: by 2002:ac2:4ec9:0:b0:540:3561:969d with SMTP id
 2adb3069b0e04-54414b0bd9fmr3257716e87.49.1739176064443; Mon, 10 Feb 2025
 00:27:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208101924.20743-1-marco.crivellari@suse.com>
 <20250208101924.20743-2-marco.crivellari@suse.com> <CAAhV-H4hdCXwZ=x2_8d1dMZmO8c7XBnzovuVDhrSQ_cW0abmEg@mail.gmail.com>
In-Reply-To: <CAAhV-H4hdCXwZ=x2_8d1dMZmO8c7XBnzovuVDhrSQ_cW0abmEg@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 10 Feb 2025 09:27:33 +0100
X-Gm-Features: AWEUYZkvEnCTRjjaYK4yhff_In76zvIldvAJe2W4qEQQ6TT8dRVnGaqe_bVe7j4
Message-ID: <CAAofZF5J2H8Qn2Axky0dXVJe4oQtkZOGBm_j8Kgk5Cvz6jibHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] [PATCH] loongson: Fix idle VS timer enqueue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Frederic Weisbecker <frederic@kernel.org>, 
	Jinyang He <hejinyang@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Bibo Mao <maobibo@loongson.cn>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

Thanks a lot, I will keep that in mind!
That's very kind of you, sorry for the trouble.

Marco


On Mon, Feb 10, 2025 at 3:19=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Marco,
>
> Don't care about the lkp robot, I have queued this patch with some
> small modifications.
> https://github.com/chenhuacai/linux/commit/a8aa673ea46c03b3f62992ffa4ffe8=
10ac84f6e3
>
> Huacai
>
> On Sat, Feb 8, 2025 at 6:19=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > Loongson re-enables interrupts on its idle routine and performs a
> > TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> >
> > The IRQs firing between the check and the idling instruction may set th=
e
> > TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
> > interrupting __arch_cpu_idle() rollback their return address to the
> > beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
> > again before going back to sleep.
> >
> > However idle IRQs can also queue timers that may require a tick
> > reprogramming through a new generic idle loop iteration but those timer=
s
> > would go unnoticed here because __arch_cpu_idle() only checks
> > TIF_NEED_RESCHED. It doesn't check for pending timers.
> >
> > Fix this with fast-forwarding idle IRQs return value to the end of the
> > idle routine instead of the beginning, so that the generic idle loop
> > handles both TIF_NEED_RESCHED and pending timers.
> >
> > Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/loongarch/kernel/genex.S | 31 +++++++++++++++++--------------
> >  arch/loongarch/kernel/idle.c  |  3 +--
> >  arch/loongarch/kernel/reset.c | 18 +++++++++---------
> >  3 files changed, 27 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/gene=
x.S
> > index 86d5d90ebefe..9623298a5cf1 100644
> > --- a/arch/loongarch/kernel/genex.S
> > +++ b/arch/loongarch/kernel/genex.S
> > @@ -18,28 +18,31 @@
> >
> >         .align  5
> >  SYM_FUNC_START(__arch_cpu_idle)
> > -       /* start of rollback region */
> > -       LONG_L  t0, tp, TI_FLAGS
> > -       nop
> > -       andi    t0, t0, _TIF_NEED_RESCHED
> > -       bnez    t0, 1f
> > -       nop
> > -       nop
> > -       nop
> > +       /* start of idle interrupt region */
> > +       ori             t0, zero, CSR_CRMD_IE
> > +       /* idle instruction needs irq enabled */
> > +       csrxchg t0, t0, LOONGARCH_CSR_CRMD
> > +       /*
> > +        * If an interrupt lands here; between enabling interrupts abov=
e and
> > +        * going idle on the next instruction, we must *NOT* go idle si=
nce the
> > +        * interrupt could have set TIF_NEED_RESCHED or caused an timer=
 to need
> > +        * reprogramming. Fall through -- see handle_vint() below -- an=
d have
> > +        * the idle loop take care of things.
> > +        */
> >         idle    0
> > -       /* end of rollback region */
> > -1:     jr      ra
> > +       /* end of idle interrupt region */
> > +SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
> > +       jr      ra
> >  SYM_FUNC_END(__arch_cpu_idle)
> >
> >  SYM_CODE_START(handle_vint)
> >         UNWIND_HINT_UNDEFINED
> >         BACKUP_T0T1
> >         SAVE_ALL
> > -       la_abs  t1, __arch_cpu_idle
> > +       la_abs  t1, __arch_cpu_idle_exit
> >         LONG_L  t0, sp, PT_ERA
> > -       /* 32 byte rollback region */
> > -       ori     t0, t0, 0x1f
> > -       xori    t0, t0, 0x1f
> > +       /* 3 instructions idle interrupt region */
> > +       ori     t0, t0, 0x0c
> >         bne     t0, t1, 1f
> >         LONG_S  t0, sp, PT_ERA
> >  1:     move    a0, sp
> > diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.=
c
> > index 0b5dd2faeb90..54b247d8cdb6 100644
> > --- a/arch/loongarch/kernel/idle.c
> > +++ b/arch/loongarch/kernel/idle.c
> > @@ -11,7 +11,6 @@
> >
> >  void __cpuidle arch_cpu_idle(void)
> >  {
> > -       raw_local_irq_enable();
> > -       __arch_cpu_idle(); /* idle instruction needs irq enabled */
> > +       __arch_cpu_idle();
> >         raw_local_irq_disable();
> >  }
> > diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/rese=
t.c
> > index 1ef8c6383535..8fd8c44b02cb 100644
> > --- a/arch/loongarch/kernel/reset.c
> > +++ b/arch/loongarch/kernel/reset.c
> > @@ -32,9 +32,9 @@ void machine_halt(void)
> >         pr_notice("\n\n** You can safely turn off the power now **\n\n"=
);
> >         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               asm volatile("idle 0" : : : "memory");
> > +       };
> >  }
> >
> >  void machine_power_off(void)
> > @@ -52,9 +52,9 @@ void machine_power_off(void)
> >         efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
> >  #endif
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               asm volatile("idle 0" : : : "memory");
> > +       };
> >  }
> >
> >  void machine_restart(char *command)
> > @@ -73,7 +73,7 @@ void machine_restart(char *command)
> >         if (!acpi_disabled)
> >                 acpi_reboot();
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               asm volatile("idle 0" : : : "memory");
> > +       };
> >  }
> > --
> > 2.48.1
> >



--=20

Marco Crivellari

L3 Support Engineer
