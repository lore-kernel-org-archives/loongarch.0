Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873933D6F0
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620756; cv=none; b=eZ6LMb54aYvhO9VWE6wYKWmgdvepLRb1YIeSv29pCr271B1R/MBeIOky0NqpbSnDGGpRhZgLSWz4Y05GcMyfKBilT60ZleOh7zGAUa+/Qks4u2Coyct6v+KgnBIvZD8D8+EM2YrU1rPEXLRjE+rDe0l2CUsw+7aeaEMF/ibrJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620756; c=relaxed/simple;
	bh=Lwr3u6/44Qkgh6Az4Hfak3Lh2DZGAR5vEe2BduwpAzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4p6eVOII3r98KAxE6VH+pme7CnvhyoVF0vuAruxxjCLwsqO5S2zxa5Jnha8mIKcQZNeDXDfIenoWpSGmkJ3J340qOMKQsaPFjw2qLkxNHBjP6odLMYpRYpE1QZgMjw30Jinlukq8s9EUxEYLwld+uDgFVUYAbLrK+wQ9mqmpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl9s/G13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl9s/G13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901A51F00A3A
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788620755;
	bh=NItOs9gzxBRZ3y2Cb1q01a8oz6LpLsi3W4WWAFVmokc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sl9s/G13NrEGEZ8+y8RwpF7YWVQm1cqQNJSpeJZlLmQmCQyKYVJ0vtA3IEC1i65ge
	 bylVjDEOxYaKduinV2qlSCJsJ0iAQhm9SWYiMZ0OhrrRz5Ui5Y8SqPjpTB5p0KCgfE
	 LCoO+/4v1jgtXwrhiEly8Z3+yEPa/Gb5eEXOKiNe2xib5XSrFB1v/kQ12BAAc0mp4s
	 AOAZ31uIDzOu6aBjQxTAyzG6Ks4wjAl2Uke+5vRSmehq8fyCHK0anJJ+xmds48cSm9
	 Kd87njN8YLGjldTIwbLqWM1RUnnl709GmtzulLxVYqzRXauZ7aRM/ut7M3BpO4dGUt
	 3z/fSUrZSqk5A==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a7f5655823so1298765a12.2
        for <loongarch@lists.linux.dev>; Sat, 05 Sep 2026 08:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGa0SEMpzk6Ls8SORF2/xyn1zqlRhqtWgCgNRi6xIlQolZfDPmIRsnD9qgziPvBYSHlioikaUASac=@lists.linux.dev
X-Gm-Message-State: AFuF++kigM78+rRlFCjN5RBhekDbp6J00fzBaZ2C2IEgV7owkBVYt0qZ
	nB2Pt9vWJxeW38sswLQpOl9lm3kiVaZJg9kDwCjienG9fsV176q+MgggHwD5XiNAwGj0aLerBDu
	+H4r6dpfCzHrJm0PmmsqaPVYv+6uA3G0=
X-Received: by 2002:a05:6402:4614:b0:6a7:f287:4d90 with SMTP id
 4fb4d7f45d1cf-6a7f2874e12mr2630015a12.40.1788620754240; Sat, 05 Sep 2026
 08:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:05:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H77WDZfkZZ700+phmiFxc5mApB4byQEfYFZ-2WKNvDZig@mail.gmail.com>
X-Gm-Features: AcwNN1VzjQhBcon7mRij_BI9cPtTLQT7aVOJ02hRSQIXV4PmYHboj35wdriRapI
Message-ID: <CAAhV-H77WDZfkZZ700+phmiFxc5mApB4byQEfYFZ-2WKNvDZig@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: kprobes: Avoid preempt count underflow without probe
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Mon, Aug 24, 2026 at 5:19=E2=80=AFAM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> LoongArch uses break 11 for the breakpoint placed after an instruction
> that Kprobes executes out of line. Since userspace can issue the same
> break instruction, do_bp() can reach kprobe_singlestep_handler() when
> there is no current probe.
>
> The handler returns false in this case, but first calls
> preempt_enable_no_resched(). The corresponding preempt_disable() is done
> by kprobe_breakpoint_handler() on a real Kprobe hit, so it has not run
> here. As a result, an ordinary userspace breakpoint underflows the
> current task's preempt count.
>
> This also makes in_interrupt() return true until the task schedules. One
> visible consequence is socket cgroup attribution: cgroup_sk_alloc()
> treats the allocation as interrupt context and assigns the socket to the
> root cgroup. A socket opened from the SIGTRAP handler can then avoid a
> BPF_CGROUP_INET_SOCK_CREATE policy attached to the task's own cgroup.
>
> Return as soon as kprobe_running() reports no active probe.
>
> The same check appeared in [PATCH v10 2/4] of the original LoongArch
> Kprobes series, but was dropped before the feature reached mainline.
>
> Link: https://patchew.org/linux/1670575981-14389-1-git-send-email-yangtie=
zhu%40loongson.cn/1670575981-14389-3-git-send-email-yangtiezhu%40loongson.c=
n/
> Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  arch/loongarch/kernel/kprobes.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kpro=
bes.c
> index 1985ed30dd16f..ddfefea174727 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -275,6 +275,9 @@ bool kprobe_singlestep_handler(struct pt_regs *regs)
>         struct kprobe_ctlblk *kcb =3D get_kprobe_ctlblk();
>         unsigned long addr =3D instruction_pointer(regs);
>
> +       if (!cur)
> +               return false;
> +
>         if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)=
) &&
>             ((unsigned long)&cur->ainsn.insn[1] =3D=3D addr)) {
>                 restore_local_irqflag(kcb, regs);
> --
> 2.47.3
>
