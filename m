Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307B3C4141
	for <loongarch@lists.linux.dev>; Thu, 14 May 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764833; cv=pass; b=OM8YQmqwScEh3F3WN7L/pM71nESIiqywxMYM6asgthYYO60UEVtgIbXgHEhiSSqUP1fueuUJ/ZzdM9S6gnvGZQ9qq426nvSBEecCzNpYG1fd/f2Ia0T29GthN11Oss+tv64UuzbH7mj6WFIr/3zcEyKbA5TV7g6Jf30FKFtgi+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764833; c=relaxed/simple;
	bh=Arl/jWZuZSZnAg9uuUY9Y268z7j3ifi6li/e7krwN50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXLf82dsLAyj82jsMOlAactgpGnI7GLg8cYh0ojvmE0y22+5JjiL5ewNEJrjQNf41mpyKzrJaAm8nqy+Ln9BFOI4I8FpnLGHuzT3zwgNXBvq1uS+ispBRll9qSGTtt0rw9KutEwbDx4Mb3pMzuGDG0aXDpZGQaHSrfz/IjIx/w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=Vtd178p4; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="Vtd178p4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so552885566b.0
        for <loongarch@lists.linux.dev>; Thu, 14 May 2026 06:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778764830; cv=none;
        d=google.com; s=arc-20240605;
        b=ITK/gBjdsExmhCXwp8NvQWeNQG3YAUg+KncAimSNmew8bQNL0yPIZRHKW46Qfz8Bsj
         /w8KViw+89mxywvJPvmVDycf58UY+epitKm0kfxEpLSJwmUjYyUchXkEaSeXfJKUQ9nb
         2GFQ4FO4GbNPO3je5Q0QGxh7zvlLQCjC1pNYbJzY4/8rhc7+OjlD+cwFJP9Ld3sFEQEk
         ndYILzwGySI0rCRnDyTGccd+eN8TFdvnbhxW61jy2jaioOYhHyIZDx7n1WMnpwy9ozoB
         EkXzrOTpecfMVZqxMbE5MTncsSqxd9ay2AbOcldrdCTU+i8Qp25jbV97tRhGM/G6RJTD
         F6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRJvZtNml0K+a4VrXGALqvYpQx2pyWt1y0/5FckKuYg=;
        fh=fhSVE6rzMqz5Otqg9aqNF3ZlbBC5zosjVr1ijByX75I=;
        b=bZDQdc5my04lMPyI5HNQrM3JiVQVFO9FdP9iahO3GZjPgY/EbgjEsK8VCKhYYGdE9c
         HehpCfQjedC6X4B2fXJQy29lH7/YunDom8xbT3YF3BWVgUYoW+Es43ME+BP0iSsndsgK
         kLCK/5oDANDMMrrYwdO32TXMKujqmCd1P5nEi6DPw0Cc2F5D5V2o8s6yMNbYXKN9wdzv
         gRNQYMm8OofYOPKNDeNQIVPnM97YcL1o1zXgzFBEM7T8c/Vnh0r6Qir4i6g6LcQoX4a+
         LsemlA/gJ241S6YEw6feYksj9rhvs5PDU1Py4gXSySZt1wBixjY/UNPkqNxd2dYhMiGc
         6Ndw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1778764830; x=1779369630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRJvZtNml0K+a4VrXGALqvYpQx2pyWt1y0/5FckKuYg=;
        b=Vtd178p4kx1ef2kLQZeHUvk7t/Fvvn8l8M+HoYgiEkUmk2BvwI0aemhfWB5/zYOji3
         MBvkSZRnEmTnabYmwg7jGtZXwYFHSD7QZbPbKPzp4mofP0iyJxT25JLfLznyGU8mQKZI
         WsRrNKWxu7VlVyJWgpbvhN3pT5DsNwzvdf8lEV8JR3YPZGsvfI1byh+0tb3b+FnjWNcC
         tuTJ3+dzepqd/ndp1VODloEmrv73M5kLO7sCalkD5F02G3iMO1ocAUQf61IN3yPh8iXA
         VGmRDkNHMHpPO3FeXYNOKCYxRlQEgDeFPw3ywdR0LA6QYqSPLSpZyZyyJDW6QQzdXQ2v
         fVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764830; x=1779369630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRJvZtNml0K+a4VrXGALqvYpQx2pyWt1y0/5FckKuYg=;
        b=JbFHSZ9mJV5s3nnqdtL1O8Lk2xNvRaWEy1s3Qjz60N3slETADacFsExvgEqHCt8u2L
         G5l8D+SD7YaYXvMR0p0XgRCyBPvfvYJ995IqxOwOqSi70R4TjDAvprce0oen7x/EeveZ
         p4NInaFkbcX6Xyhau5dIM3deGmafxbELfR3LkjYHNBx7Sr1o5Z602VW681gqMfJL4nkj
         s8IBCYWJ5MGLJ8K0qZfD6fKgyRAdnMN8YABFWjAofJihpJ9iVXPfefAhZvXsXkteX7gP
         52fCav8m9M6Zy0hawq8uUOqK7AtD/1kLIVCeUFP5PpXozub5EnMqen7ZIRRr7e5ax8Gf
         RsDg==
X-Forwarded-Encrypted: i=1; AFNElJ+RPjl8McPsqqfG/NywWdjDKM/IcPzif2K8c/Hx1JNNEC98eqWV3PYLqAfeRaPzKgs9mv7/mxlqOs0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXazdjBvCbD+2FGZ8FRp10MKjCvmR+fv9GWh0Wsa/XabpUH3+Q
	NhQDpTSn3vckN+7BbmQtoffBVSJYkcmKmJXdU9SngX22KbBzG9s+fm9e+ryGiVN6dCnyeMCLB1i
	9pZhRwsEXBEY/KxCeuRL8IhoQQmedogmp9X0NWO4gYV03H+JMV8Cd
X-Gm-Gg: Acq92OFGGVHWaXkVmlQ465EYxcmYPmtQr7cmMyEh9JTpioXUuZc4LMED7y8Ut7qgGIN
	8/SQAAbYTCveqsRzhJwzourSk5s1oyZbowj4mPsPAtEH1lwpgZYqqP70SWmRUZM+bMobLQN8Tne
	yTmmMr1hZSUdMcba1D1j8O+f99tP8EkEvwGWH7djqHL18xNJ+dSKnJN/KhcO8grZ9pp5XAc/L9d
	j6gDBONtCSC6uvgBQ82C31WMrG/ykqjFVd5xsD5aqv8BFX2oTO11OvtKEoKCDmPrH54xmiMTgJo
	CjqSiQWnJ+YIVgQ5w17w9y/gyjW08RSs83Q9MzJMQlNNDyDPdXQI
X-Received: by 2002:a17:907:fd17:b0:bd5:7c3:aca0 with SMTP id
 a640c23a62f3a-bd507c3ad02mr100752466b.48.1778764829862; Thu, 14 May 2026
 06:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512082029.2131-1-yangtiezhu@loongson.cn> <20260512082029.2131-4-yangtiezhu@loongson.cn>
In-Reply-To: <20260512082029.2131-4-yangtiezhu@loongson.cn>
From: WANG Rui <r@hev.cc>
Date: Thu, 14 May 2026 21:20:17 +0800
X-Gm-Features: AVHnY4JgfjMb0uPI21Ikz_1Ix1Vg1tIDqASLwmp84Z3yh2dcsOoVcyCkeSOUtzI
Message-ID: <CAHirt9gSXZvw0wTv9zupsVRG0_ekza08efW0hwq_yvnU1WbUng@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] LoongArch: kprobes: Fix single-stepping
 instruction slot preparation
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Tue, May 12, 2026 at 4:26=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> In arch_prepare_ss_slot(), the original code directly assigns instruction=
s
> to the buffer using raw memory stores. This approach has two significant
> drawbacks on LoongArch:
>
> 1. Consistency: It skips the necessary instruction barrier synchronizatio=
n
>    required by the architecture. Without a local barrier, the instruction
>    fetch unit might not observe the newly prepared instructions in the
>    single-step slot, even on the local CPU.
> 2. Atomicity: Raw memory assignments do not guarantee that the instructio=
n
>    unit sees a complete instruction at all times, which is critical for
>    the integrity of single-step execution.

Does this need to be atomic?

Thanks,
Rui

>
> Like RISC-V and ARM64, use larch_insn_patch_text() for slot preparation t=
o
> ensure the atomic instruction writes and proper local instruction barrier
> execution.
>
> Note that global stop_machine synchronization is not required here becaus=
e
> the single-step slot is executed only after a breakpoint exception, which
> inherently provides a context synchronization event for the CPU to observ=
e
> the new instructions.
>
> Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/kprobes.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kpro=
bes.c
> index 04b5b05715cd..8e1b7a87c897 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -12,8 +12,8 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>
>  static void arch_prepare_ss_slot(struct kprobe *p)
>  {
> -       p->ainsn.insn[0] =3D *p->addr;
> -       p->ainsn.insn[1] =3D KPROBE_SSTEPBP_INSN;
> +       larch_insn_patch_text(p->ainsn.insn, *p->addr);
> +       larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);
>         p->ainsn.restore =3D (unsigned long)p->addr + LOONGARCH_INSN_SIZE=
;
>  }
>  NOKPROBE_SYMBOL(arch_prepare_ss_slot);
> --
> 2.42.0
>
>
