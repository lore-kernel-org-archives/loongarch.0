Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777CD2E5
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A850C433CC
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693062977;
	bh=lg99Ln+jiL+l84WPJ8FkQG+sfsE/5LrVsAW7P4iMBe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=prtV+8v+7Zd3FkFrrlVOPYXKS5GDghMejcHIwvE3SF3+gfQ7mHpRXDtbxDYrhREVo
	 fJmjhjxTfU8nUTcTUH2RmuekJRRvUXzGU9FE0YSTo7N5TubM9qr7CcM5crKzhoHfXI
	 bDqqwksK5lbWbBCK6o3mNvyTzejpVHu9zLJ3EhL8PRiei42gVhiLr5ARn1Hjg8FYJ6
	 eKyVlTIJsbDH3H8KvvO89GcjNakMp3eDS8EhWbkR2Op8g/+exIjwZHQwrqvw16CDVV
	 IDi9OjL+U8ZarDKiSj9QTvvQJ6M2wcAPKsftGTMe7EXbGs819C7bCBefTgPEWVdxfs
	 RqP8wAUJsV7cw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso27649061fa.1
        for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 08:16:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YxSQCRGVr/dKMee50OSlWOJj3YZUX8bo2AHdkR8IJmvS7xFRR8d
	B6L5Uydi6ZHyvhcpmt1WAjH8DJusRt46zBBzRIc=
X-Google-Smtp-Source: AGHT+IGPIKsysUpDMCEnjX/8/4Qbrqdo2/TpRFOIReMMxqMxVVBU9Sz5d0482DxrT8nOCs2FMb4flHIpcqvsziHFR6k=
X-Received: by 2002:a2e:b80d:0:b0:2bc:fd7b:8ded with SMTP id
 u13-20020a2eb80d000000b002bcfd7b8dedmr1455984ljo.20.1693062975325; Sat, 26
 Aug 2023 08:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825114224.3886577-1-chenhuacai@loongson.cn> <0b509186-bf01-2151-0954-d669075c1f71@xen0n.name>
In-Reply-To: <0b509186-bf01-2151-0954-d669075c1f71@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Aug 2023 23:16:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ugTh8XmgruyWYoL53hYGtj3035xM=Y_+AMrnK-caM5w@mail.gmail.com>
Message-ID: <CAAhV-H6ugTh8XmgruyWYoL53hYGtj3035xM=Y_+AMrnK-caM5w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Ensure FP/SIMD registers in the core dump file
 is up to date
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 3:52=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 8/25/23 19:42, Huacai Chen wrote:
> > This is a port of commit 379eb01c21795edb4c ("riscv: Ensure the value
> > of FP registers in the core dump file is up to date").
> >
> > The values of FP/SIMD registers in the core dump file come from the
> > thread.fpu. However, kernel saves the FP/SIMD registers only before
> > scheduling out the process. If no process switch happens during the
> > exception handling, kernel will not have a chance to save the latest
> > values of FP/SIMD registers. So it may cause their values in the core
> > dump file incorrect. To solve this problem, force fpr_get()/simd_get()
> > to save the FP/SIMD registers into the thread.fpu if the target task
> > equals the current task.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/include/asm/fpu.h | 22 ++++++++++++++++++----
> >   arch/loongarch/kernel/ptrace.c   |  4 ++++
> >   2 files changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/=
asm/fpu.h
> > index b541f6248837..08a45e9fd15c 100644
> > --- a/arch/loongarch/include/asm/fpu.h
> > +++ b/arch/loongarch/include/asm/fpu.h
> > @@ -173,16 +173,30 @@ static inline void restore_fp(struct task_struct =
*tsk)
> >               _restore_fp(&tsk->thread.fpu);
> >   }
> >
> > -static inline union fpureg *get_fpu_regs(struct task_struct *tsk)
> > +static inline void get_fpu_regs(struct task_struct *tsk)
> Removing the return value from the signature means the function is no
> longer a getter, so maybe the name should get changed as well? Like
> "save_fpu_regs"?
OK, that makes sense and has been done in V2.

> >   {
> > +     unsigned int euen;
> > +
> >       if (tsk =3D=3D current) {
> >               preempt_disable();
> > -             if (is_fpu_owner())
> > +
> > +             euen =3D csr_read32(LOONGARCH_CSR_EUEN);
> > +
> > +#ifdef CONFIG_CPU_HAS_LASX
> > +             if (euen & CSR_EUEN_LASXEN)
> > +                     _save_lasx(&current->thread.fpu);
> > +             else
> > +#endif
> > +#ifdef CONFIG_CPU_HAS_LSX
> > +             if (euen & CSR_EUEN_LSXEN)
> > +                     _save_lsx(&current->thread.fpu);
> > +             else
> > +#endif
> > +             if (euen & CSR_EUEN_FPEN)
> >                       _save_fp(&current->thread.fpu);
> > +
> >               preempt_enable();
> >       }
> > -
> > -     return tsk->thread.fpu.fpr;
> >   }
> >
> >   static inline int is_simd_owner(void)
> > diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptr=
ace.c
> > index 2bb5ec55ae1e..209e3d29e0b2 100644
> > --- a/arch/loongarch/kernel/ptrace.c
> > +++ b/arch/loongarch/kernel/ptrace.c
> > @@ -148,6 +148,8 @@ static int fpr_get(struct task_struct *target,
> >   {
> >       int r;
> >
> > +     get_fpu_regs(target);
> > +
> >       if (sizeof(target->thread.fpu.fpr[0]) =3D=3D sizeof(elf_fpreg_t))
> >               r =3D gfpr_get(target, &to);
> >       else
> > @@ -279,6 +281,8 @@ static int simd_get(struct task_struct *target,
> >   {
> >       const unsigned int wr_size =3D NUM_FPU_REGS * regset->size;
> >
> > +     get_fpu_regs(target);
> > +
> >       if (!tsk_used_math(target)) {
> >               /* The task hasn't used FP or LSX, fill with 0xff */
> >               copy_pad_fprs(target, regset, &to, 0);
>
> Otherwise this should be fine. (I don't know why that helper is
> previously unused though...)
This helper was derived from MIPS but the call sites are missing, so fix it=
 now.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
