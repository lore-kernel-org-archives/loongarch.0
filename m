Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45622280325
	for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 05:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765344028; cv=none; b=IYbZKtFi1APBLsCxnqDzQO/DDUFfDmsTDxVY0BCTzFUwkIZjLC4QpAywW3atZbp4hRw/VQOatmYHhfx6ZVEbCRRXS+ejmeiaJ+5AyiAaA3QXeelLXYdNe95454v1fyBceQ9SW7FJOalT6cMQ9SqLu+v5ckFR/0YRWYwmXPVK6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765344028; c=relaxed/simple;
	bh=36JAm4JT2uwBM+bb3O6Q9SIhA21ce2+gIQYNjKTV3ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bv0dSuxuV0/dA5GgSvpRKbb1QzJOOodUCG9Fek1MaVFxPZY2zCbmLrAUN4MmdpF2OJ4jOF+0sB9GQ1orY83NpuMcckPedsDvmit4bicS5wRfQoVd/ky3qAO1repdR0UHjf3DP/jmy+vY5f8WTMlTOhgJ8BEQDrKB1ZeFOqyOr3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4OQd00a; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4OQd00a"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso5211792fac.1
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 21:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765344024; x=1765948824; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MI57r/4C01JUyGYeR4BSsNymItfnMrs+OYwPSvLtYs=;
        b=e4OQd00aykhjgBPXQoKAzg93oDXkS1fvly7M2Ph5JNTUCQfdqfZnYIqnuVyBOqxF47
         AQtNi4M61ZjKqclDE73zJ/On16NniKsnxKD+GZVtivt37Ao2dZUgeMdCMLxKo/IUEpI8
         vkMHP4aofxlKAAD2AadPAaOh+wjTmDuq7+jvta3l4fhCubFATNLabzu4jX3oMUIfYBDs
         h9+d5j/PVlC6s/uAOIObjJ86MpyrVc+d1UtOxKrxHo+k/GmRPhYEv6ypBhwni+Qa952f
         nzio4sVKM5/vU+n5trpT59wRMGv2VKavlZ1u4XDeFUpxpwIjnpIUo6hEF0RgdvMz80Mt
         LR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344024; x=1765948824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MI57r/4C01JUyGYeR4BSsNymItfnMrs+OYwPSvLtYs=;
        b=SPqT/hXsjIqOc8njYMaWrYE1Ag97FyvBIY0PbQh3EySdWcbbksEo7ThUjAMivepNSn
         RHnA+dOiDKDqfy1Wf0Lw8Uo29J1oBzu9hTyWhurZJ9vhKxLr9sOWEbOapWSREngQpPxs
         Fvj5UrauRmn4c+ThG7KZiYz1FRdlLC9EBnTM83cKhQ1p9x2Mo9bG1Sshy79ZJ4THcIkS
         KSD5hMLcLCShEANvoKCgslWFuRBTylFuOXyjoxDVuxFxLW6itxHI4Y8NS9qZOXe9fLGD
         GgMmWB3R+KMfuPEbb8TxsBHsPrA9LUjSv1gNQVWH0IsesJKu78u3ICAsJMda/cHu8g3c
         QKdg==
X-Forwarded-Encrypted: i=1; AJvYcCWGkzbRkZXttpp1g9C55QrS52xkjUt5YxpaFU3SDX5/wH/0vMn2qeUlB9aB2Ir3HHgi08JiJudRgIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOPqcNUyS+E9jsnBWQBOnrk3HvH1y3KiS5RRLqwc67zs1bE2eJ
	S8KTt/NIDXmu76PGjVNsFT1Vqv9bq6RsF9mENLCfrpm7nQyRxPCHMhr+bMzOi7McAsIjMb2Qwmt
	XtmWNKFhiGs1+RnjYEUPGbH4yDt8nhWs=
X-Gm-Gg: AY/fxX4NMSiG2V/CnukO+yqF1VFT7wyfsJlk8QwjCDsD5ygk/oH6NY0LaUAQ4SQF8YT
	YuwVzRGqsWp2o/weUklRDapaMDKu0b21pTjw7fcdxP3kdC2Rtd5cA1IUJphKV4l4IJe4JjvmCvx
	Tyk4R3NQSej/Z63eGGSBul82gaMq22RP1NQRrOILp+LjMbPmJKPQMrZCUPNABZpkgVRZtkZAY1S
	uIYpQyKPfgdNDCJXeAlX6ejoFUAxPzhj7K+cpUbolk6Yq3J37j9KmEt4j3Si9UlFJ25kgs=
X-Google-Smtp-Source: AGHT+IHhKhJmFdS8xyCy6z3Pkylyl7fWGqizcviH0fzd0aI4tvxpR8T/c7m8hrtKlyhMuKPzpw1y2E2oRE3Z7worROM=
X-Received: by 2002:a05:6870:1b13:b0:3ec:3c21:9301 with SMTP id
 586e51a60fabf-3f5bd978f9bmr1020661fac.9.1765344024262; Tue, 09 Dec 2025
 21:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209093405.1309253-1-duanchenghao@kylinos.cn> <20251209093405.1309253-3-duanchenghao@kylinos.cn>
In-Reply-To: <20251209093405.1309253-3-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 10 Dec 2025 13:20:12 +0800
X-Gm-Features: AQt7F2qWYB7VvJgjzUwsobmq_rC5o9JSMEkf2SA8b1drgVcmKcM81PVXKQ8gQ_k
Message-ID: <CAEyhmHTtEE6cnm18_WC+d+o4RnLUw+BUUNL54R6d9W2b868+LA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Enable BPF exception fixup for specific
 ADE subcode
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name, 
	zhangtianyang@loongson.cn, masahiroy@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, vincent.mc.li@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 5:34=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> This patch allows the LoongArch BPF JIT to handle recoverable memory
> access errors generated by BPF_PROBE_MEM* instructions.
>
> When a BPF program performs memory access operations, the instructions
> it executes may trigger ADEM exceptions. The kernel=E2=80=99s built-in BP=
F
> exception table mechanism (EX_TYPE_BPF) will generate corresponding
> exception fixup entries in the JIT compilation phase; however, the
> architecture-specific trap handling function needs to proactively call
> the common fixup routine to achieve exception recovery.
>
> do_ade(): fix EX_TYPE_BPF memory access exceptions for BPF programs,
> ensure safe execution.
>

Which bpf prog triggers this code path ? Why didn't we trigger it before ?

> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/kernel/traps.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index da5926fead4a..9ca8aacc82b8 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -534,8 +534,13 @@ asmlinkage void noinstr do_fpe(struct pt_regs *regs,=
 unsigned long fcsr)
>
>  asmlinkage void noinstr do_ade(struct pt_regs *regs)
>  {
> -       irqentry_state_t state =3D irqentry_enter(regs);
> +       irqentry_state_t state;
> +       unsigned int esubcode =3D FIELD_GET(CSR_ESTAT_ESUBCODE, regs->csr=
_estat);
> +
> +       if ((esubcode =3D=3D 1) && fixup_exception(regs))
> +               return;
>
> +       state =3D irqentry_enter(regs);
>         die_if_kernel("Kernel ade access", regs);
>         force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)regs->csr_badv=
addr);
>
> --
> 2.25.1
>
