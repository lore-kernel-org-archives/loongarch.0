Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463B198E93
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538603; cv=none; b=aWRtElsvLaYQSrZv6vE6o/1Sr3ojHXMY1F3YjGUqpXnvvvrGWQ4WJRKKgZ7ZqTyoXUFwm788Zzm8yPzyPdPGCF8l/FyzgXC8OMzlndtxHUxE5+jdEKzIKnk8wnqhE5IiPufQhekNlX+nOGXjr0lACf51oyntUIxS4dSwKWF3SmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538603; c=relaxed/simple;
	bh=KD8p4UhTHUqwQtVUz3/tFmO44HYAqdvhbKFkBoyuz64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JB/Q6g4isdyDcFfhBNnqFzbp5iqA5ITFJ29PGwWjxJTmGkUl5fQqfq049hQ3Lt7nPhAI3HWk+gWezZc6YPumgnuH+4Du+1h5DYc8k7oHpBmYU/ZK1Uccmd025/J12c/qNR+kthWGTDLMLREQRvqh9KauUWqplcxzud2kWLZ5QlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0y35mJO; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0y35mJO"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f406034874so8504011fa.1
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538600; x=1726143400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UivlO5wUcpBoNAynGGCP4zi8/QvQcG9yj0l4MCKkP24=;
        b=d0y35mJOlvtObZFkd+ypFX8Zus/2ylLtINyduv3fQ68D5mGlTrp8etq4Uk08igYpZU
         FPuLED3oBtQm9KlX1pwhJDkKfBvr+Lei2pNJsrjFcp1o/gdGotEgpgIR8/jkz9czHQBX
         nhu70KXaPWqHWsrfNeYeUDqcpraFB+EwL6K81HWbCWXxS0LlbI2DOXfhDTJSZbrKpfky
         55ogecu/qwAcECiMqNl3+QcnGlZ2cyOVt4M/DnOf6SvBSrBCx6d4TzZ1+6iE9UqxdB/F
         cNgTGmNLR+S/BJzK9no/V7MJUJ986KBUEltVQUcGqCO1ahVhwMk6vOookmnMyby4L3+5
         lHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538600; x=1726143400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UivlO5wUcpBoNAynGGCP4zi8/QvQcG9yj0l4MCKkP24=;
        b=fulEFDFD6pYKGRImUy2ZQf7yw4Odo6toGEp96OCEeTM8dzSnn5ijK9a+9WX45wUO5O
         iyeA7jIjbg37BwRaN0I6SjudTGmGSXg0iFmycpMOFw4U0aqY6BYGnHZWa/AHUP2ch3dM
         BXTGud4nGCH5ToIFqBgL6kq1YMtwAWrgkG0hnwDfTVW++xVzWF3SuPel6f9ODoRPqHFs
         IIwUybyAU7ciZuj6PhAdVZFiuaXQYDzwruzwHB06ZsjBnoPT3DyjQ8Wni7IF9hz8sKjg
         vFHJDP9VK36oYOboV6lYQPp/b5UqEP49l6yHrUEE9XlEcBE0pU5XIK5risP1UE3l3qoO
         PakA==
X-Forwarded-Encrypted: i=1; AJvYcCVeCMoymzuLR6MPBbOMMg4cF1EOK7rYIbe5C09cP/Zcq1Cii+U6qNbLUYyYYapM6oxfn9zgpcg91hE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ezuSyzGntQg2MWfOlKQqLWUs14jqO+EwIkLQvvHUVXbq5tvQ
	PzWJOrbAcszcD7yNnz3+8tyY9o+HxxI8FLFXHBY3y5DuOZF/uJVLS7BfAeMChEKDfNMHphLRDaz
	7L4+XosqBSZL9wSFpkdjnh6X0Pxc=
X-Google-Smtp-Source: AGHT+IGqaLiRNSXFrvzb03GvKWEeiTccQCMt9QDXdoVUjj6YXV2fNmfC2Xep1qIcAudNF+zKdsrdA8Y1wNtOs5zjxHM=
X-Received: by 2002:a2e:5149:0:b0:2f6:5f7b:e5cf with SMTP id
 38308e7fff4ca-2f65f7be62emr26204141fa.14.1725538599354; Thu, 05 Sep 2024
 05:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905065438.802898-1-ubizjak@gmail.com> <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
 <CAFULd4Z4QzS0J_BztD7jDSNwoXM2vF9PWNX5eJBrQZsUbu-gJQ@mail.gmail.com> <361bf35ccf308d2fbce14f69f156cb42eef0f095.camel@xry111.site>
In-Reply-To: <361bf35ccf308d2fbce14f69f156cb42eef0f095.camel@xry111.site>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 14:16:28 +0200
Message-ID: <CAFULd4ZqD2L=B5YfKjGR4s0mOM-fABb5+83Z5KfmX0YRaxWw-A@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:09=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Thu, 2024-09-05 at 14:02 +0200, Uros Bizjak wrote:
> > > If the input value is less than 0xff, then "& 0xff" is meaningless, i=
f
> > > the input value is more than 0xff, this conversion still cannot give =
a
> > > correct result for the caller. So I think for all sizes it is enough
> > > to just use "((unsigned long) val)".
> >
> > This part is used to force unsigned extension, otherwise the compiler
> > will use sign-extension of the possibly signed variable.
>
> It's not relevant.  For example when size is 2 __pcpu_op_##size("stx")
> is expanded to stx.h, and stx.h only stores the lower 16 bits of a
> register into MEM[r21 + ptr], the high bits are ignored anyway.
>
> Thus we can just have
>
> +#define _percpu_write(size, _pcp, _val)                                 =
       \
> +do {                                                                   \
> +       if (0) {                                                        \
> +               typeof(_pcp) pto_tmp__;                                 \
> +               pto_tmp__ =3D (_val);                                    =
 \
> +               (void)pto_tmp__;                                        \
> +       }                                                               \
> +       __asm__ __volatile__(                                           \
> +               __pcpu_op_##size("stx") "%[val], $r21, %[ptr]   \n"     \
> +               :                                                       \
> +               : [val] "r"(_val), [ptr] "r"(&(_pcp))           \
> +               : "memory");                                            \
> +} while (0)

Nice, the less code, the better. If it works for loongson target, then
we don't need this paranoia.

I just played safe and took the approach that x86 took.

Uros.
