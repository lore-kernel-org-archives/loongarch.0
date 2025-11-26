Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147A31A55A
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149230; cv=none; b=CCoMAmTsmM4RY8PUBIkWhfxjGzPhEK4KhZXxkYv7mAMaLHW3fmPQKvMMdVjmnV/81B7P37cM40ziGDNygjTVxlDKPEt8z8M0dUhvmt+OYpfBcHr87B5/khqwtILNgNhUa4tJMgGBzgX9BZBJuiQGh//hptrcy5wnEKzE+w0qbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149230; c=relaxed/simple;
	bh=DVZkXCilnB72UVUI4k+ym6WIxcHG/7+PJiTQWd3pdoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqSkorc0s6a++lrnOU9rNzj7iCwIGBPwek3XMw4u3XoCEgdPuOMkiTw/M5rGN3jzAxO20y8GZutMbKkmKQnT9Km8bB7gvdh9RT1z/CAjXVQdWEsrpqrxuKaE69TDHqnUjTCsTWmhNAIyYOgh1cnX0psBfVmyh9fzrCj745lAnrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3ZqunHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3ZqunHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C18C19422
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149229;
	bh=DVZkXCilnB72UVUI4k+ym6WIxcHG/7+PJiTQWd3pdoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3ZqunHmRt4kx4xEQ4C2Fm2Y4lmw1x1tEd9T/dwmVySccctCEcSkaqh0p4Bj+rkFL
	 zrpEAcJFAkde1g//uLsWSoE/buB6GdU7s7z1Lm0xVKEyt1ZgW3gu9ZYjYJeI56iZv4
	 uJWqpM28VslRU+aZagpQozj1C34FaUh/72NT53zg+E7Feb0N3le7Eiv5xhxb6JxQno
	 PYpGiTQBKGTUs7+2FecgSvfvUWtO9F8ueIsnnu2ZqGv8eAifwoCyX5M5R/q31IOkEA
	 msUL4exbwj6PXazF4rWy1oR4FOhU9ulIXjDNPFFDvoR2dFfDYQzs32VpuqPePRMHXH
	 e6cVi20shg+xw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b72b495aa81so820654266b.2
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 01:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp1GJtxRqt/RuN1kVIt35i37YMoqe1A6LQPB9uk8oZcDywSmyINtZs98oyia/R62xpsFkaV925SyA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsyRhJKnuof5gBAG7/fpNBVgztqteE7dK5DgQr6fvUFyncMG0Q
	InuqoDamMXSaIF6rbsRnr07IYo42bFcvuCzBXGs8gVkDfgjMyjwsJeJ1I0fqZFv9E5LLxhtG4Xw
	ghLTgVXBN4Xjzy4shBpoQzW9BXYvM7Ss=
X-Google-Smtp-Source: AGHT+IF8iH2BP4XilvQgcafwQVg30qZ7dW8rPJEST5KmFx8TOh7IP1fodJZu45wS/GAgPZXXCeE75Cw3RC+nrb7olxQ=
X-Received: by 2002:a17:907:3f89:b0:b73:52c7:faba with SMTP id
 a640c23a62f3a-b76c5349b1amr707178766b.4.1764149228470; Wed, 26 Nov 2025
 01:27:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn> <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn> <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
In-Reply-To: <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Nov 2025 17:27:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6pQytDg_fKE7rpC2OogWYGEsHUxUMKLqsvtfSPWMWvaA@mail.gmail.com>
X-Gm-Features: AWmQ_bnxP_R5JoZlp4KludRrEG44B1cBediioo4YQCmI5dBqfWcpnVIXRz3aVBc
Message-ID: <CAAhV-H6pQytDg_fKE7rpC2OogWYGEsHUxUMKLqsvtfSPWMWvaA@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Jinyang He <hejinyang@loongson.cn>, Xi Zhang <zhangxi@kylinos.cn>, 
	Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 5:09=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Cc: Bibo Mao <maobibo@loongson.cn>
>
> On 2025/11/26 =E4=B8=8B=E5=8D=882:28, Tiezhu Yang wrote:
> > On 2025/11/26 =E4=B8=8B=E5=8D=882:08, Tiezhu Yang wrote:
> >> On 2025/11/25 =E4=B8=8B=E5=8D=886:52, Jinyang He wrote:
> >>> On 2025-11-25 14:33, Tiezhu Yang wrote:
> >>>
> >>>> When running virtual machine before testing the kernel live patching
> >>>> with
> >>>> "modprobe livepatch-sample", there is a timeout over 15 seconds, the
> >>>> dmesg
> >>>> command shows "unreliable stack" for user tasks in debug mode.
> >>>>
> >>>> The "unreliable stack" is because it can not unwind from
> >>>> kvm_handle_exit()
> >>>> to its previous frame kvm_exc_entry() due to the PC is not a valid
> >>>> kernel
> >>>> address, the root cause is that the code of kvm_exc_entry() was
> >>>> copied to
> >>>> the DMW area in kvm_loongarch_env_init(), so it should check the PC
> >>>> range
> >>>> and then finish unwinding for this special case.
> >>>
> >>> Hi, Tiezhu,
> >>>
> >>> Since kvm_loongarch_env_init copies kvm_exc_entry which similar to ho=
w
> >>> trap_init copies the exception handler. We should apply the same
> >>> offset-based adjustment to compute the shadow PC address:
> >>> shadow_pc =3D kvm_exc_entry + (cur_pc =E2=88=92 copied_base_address)
> >>> This allows the ORC unwinder to correctly locate the corresponding
> >>> unwind info.
> >>
> >> Thank you. I did some tests, it can unwind from kvm_handle_exit()
> >> to its previous frame kvm_exc_entry() only when CONFIG_KVM=3Dy,
> >> but it can not unwind from kvm_handle_exit() to its previous frame
> >> kvm_exc_entry() when CONFIG_KVM=3Dm because we can not get the two
> >> kvm address (unsigned long)kvm_exc_entry and
> >> (unsigned long)kvm_loongarch_ops->exc_entry
> >> in arch/loongarch/kernel/unwind_orc.c.
> >
> > Use function pointer can get get the two kvm address
> > (unsigned long)kvm_exc_entry and
> > (unsigned long)kvm_loongarch_ops->exc_entry
> > in arch/loongarch/kernel/unwind_orc.c.
> >
> > I will do more test and send v2 later.
>
> Here are the draft changes:
>
> ----->8-----
> diff --git a/arch/loongarch/kernel/unwind_guess.c
> b/arch/loongarch/kernel/unwind_guess.c
> index 08d7951b2f60..64c50c483cbb 100644
> --- a/arch/loongarch/kernel/unwind_guess.c
> +++ b/arch/loongarch/kernel/unwind_guess.c
> @@ -5,6 +5,11 @@
>   #include <asm/unwind.h>
>   #include <linux/export.h>
>
> +#if IS_ENABLED(CONFIG_KVM)
> +void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new,
> unsigned long *size);
> +EXPORT_SYMBOL_GPL(get_kvm_entry_info);
> +#endif
Define in unwind.c then you don't need to duplicate it.

> +
>   unsigned long unwind_get_return_address(struct unwind_state *state)
>   {
>          return __unwind_get_return_address(state);
> diff --git a/arch/loongarch/kernel/unwind_orc.c
> b/arch/loongarch/kernel/unwind_orc.c
> index 1d60a593479a..ef8bb6cd7af8 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -356,6 +356,11 @@ static bool is_entry_func(unsigned long addr)
>          return addr >=3D (unsigned long)&kernel_entry && addr < (unsigne=
d
> long)&kernel_entry_end;
>   }
>
> +#if IS_ENABLED(CONFIG_KVM)
> +void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new,
> unsigned long *size);
> +EXPORT_SYMBOL_GPL(get_kvm_entry_info);
> +#endif
> +
>   static inline unsigned long bt_address(unsigned long ra)
>   {
>          extern unsigned long eentry;
> @@ -386,6 +391,16 @@ static inline unsigned long bt_address(unsigned
> long ra)
>                  return func + offset;
>          }
>
> +#if IS_ENABLED(CONFIG_KVM)
> +       unsigned long old, new, size;
Define them in the if block, and you can consider removing all "#if
IS_ENABLED(CONFIG_KVM)".


Huacai

> +
> +       if (get_kvm_entry_info) {
> +               get_kvm_entry_info(&old, &new, &size);
> +               if (ra >=3D new && ra < new + size)
> +                       return old + (ra - new);
> +       }
> +#endif
> +
>          return ra;
>   }
>
> diff --git a/arch/loongarch/kernel/unwind_prologue.c
> b/arch/loongarch/kernel/unwind_prologue.c
> index 729e775bd40d..42c210b0a378 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -28,6 +28,11 @@ extern unsigned long eentry;
>   extern unsigned long pcpu_handlers[NR_CPUS];
>   #endif
>
> +#if IS_ENABLED(CONFIG_KVM)
> +void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new,
> unsigned long *size);
> +EXPORT_SYMBOL_GPL(get_kvm_entry_info);
> +#endif
> +
>   static inline bool scan_handlers(unsigned long entry_offset)
>   {
>          int idx, offset;
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index 80ea63d465b8..3606554e43e0 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -338,6 +338,13 @@ void kvm_arch_disable_virtualization_cpu(void)
>          kvm_flush_tlb_all();
>   }
>
> +static void kvm_entry_info(unsigned long *old, unsigned long *new,
> unsigned long *size)
> +{
> +       *old =3D (unsigned long)kvm_exc_entry;
> +       *new =3D (unsigned long)kvm_loongarch_ops->exc_entry;
> +       *size =3D kvm_exception_size;
> +}
> +
>   static int kvm_loongarch_env_init(void)
>   {
>          int cpu, order, ret;
> @@ -430,6 +437,7 @@ static void kvm_loongarch_env_exit(void)
>          kvm_unregister_perf_callbacks();
>   }
>
> +extern void (*get_kvm_entry_info)(unsigned long *old, unsigned long
> *new, unsigned long *size);
>   static int kvm_loongarch_init(void)
>   {
>          int r;
> @@ -442,6 +450,8 @@ static int kvm_loongarch_init(void)
>          if (r)
>                  return r;
>
> +       get_kvm_entry_info =3D kvm_entry_info;
> +
>          return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>   }
>
> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
> index f1768b7a6194..9eaad5dbed91 100644
> --- a/arch/loongarch/kvm/switch.S
> +++ b/arch/loongarch/kvm/switch.S
> @@ -104,7 +104,7 @@
>          .text
>          .cfi_sections   .debug_frame
>   SYM_CODE_START(kvm_exc_entry)
> -       UNWIND_HINT_UNDEFINED
> +       UNWIND_HINT_END_OF_STACK
>          csrwr   a2,   KVM_TEMP_KS
>          csrrd   a2,   KVM_VCPU_KS
>          addi.d  a2,   a2, KVM_VCPU_ARCH
> ----->8-----
>
> I tested with config UNWINDER_ORC, it can unwind from kvm_handle_exit()
> to its previous frame kvm_exc_entry() which is the end of stack, there
> is no "unreliable stack" in debug mode and also no timeout for kernel
> livepatching.
>
> I also tested with config UNWINDER_PROLOGUE and config UNWINDER_GUESS,
> no build errors and the virtual machine can boot normally.
>
> I would like to receive comments for the draft changes first and then
> send the formal v2, the function and variable name may be not proper,
> so any comments are welcome.
>
> Since the merge window is coming soon and I am busy with the other
> higher priority stuff, so maybe I will send v2 after the merge window.
>
> Thanks,
> Tiezhu
>
