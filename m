Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B4175A7E
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780739649; cv=none; b=YjkmEWTHC+7LYonYA1fHhNrXFMJ/8DK/ZG4ue6mrsVemng0Fuh5rV5LwmZdvlAcugOOrfrM72OSMqg2kalqvi1sAuUiRtTCPTbgaLkw1vaBl50GGY2TJ/544g0CyNw8yYuJLHDXSzr/5WvzI5PFfKyXSJMbSHsXQN3nj96iizR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780739649; c=relaxed/simple;
	bh=OnuoKldbl6pPTlgnWrSwoJrlKDnzInysIn5Ah+Wdm00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1BY1Ke40EUNZecTf7yF7IOdE9DxCjo5XFcoGdSfl9DaZrBCA3rnW87EXo5rRzmvaqE6dFmY1ffTS35E4cGKuTSJ8bBrMvBN9DYb7tEC3waRZMycOOI3mPCAj3Lwr7AEJ63+cxuXSf0LcTYTI3rjok7J5WIKVujM5DPi9HrvVD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVUck2Xs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVUck2Xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59481F00898
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780739647;
	bh=vgAbjJEl/Q29qjPBbciattzY/7cgeBFYQXG5g1d2DYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kVUck2XseE6Xnx2KXSVjaWslYzxEVNOUFhlPuvVQAUDKHHDpKSfVVgrLzYDcMREoM
	 JChqH6/dclwO5sVPJltugyOVbw20a56t6l8KV0yfTI9Vpb/NTP59+6YBya77zLP84S
	 PCzxQ3mx7ZEVrj6HDw2OI7YK19xRJqeqRQYttYvUIQ+Uz/IK/B2+RL7uU0pwTsyMw/
	 SUdj3+LKw7Z0MOAEnbSrOwVPCP+uZPy+d/BePYfZV4yzI9nHsCQdO0S9D6dViGwOjS
	 of3X/fzwucPG85XuX74L8A9n6a2jWSRg2A9tu4NLg0gZslxboXxTa+Sn3cyLQj7y5S
	 0jxNrhMZvOn/A==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bebbc325000so325871966b.0
        for <loongarch@lists.linux.dev>; Sat, 06 Jun 2026 02:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LxD0dqVVuHDxMQacdbBCDcPv0U1oe2gpyhYS054xLpTExmcbvpJADGWMkXZisih2PKCzr3d7qeW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyKTrnwSR+6OAgOY7JTOgpKqpIgKRb2k7uVevwyCkcznIazn/z
	mEJYFcrd7dr4DjiQp1+GeZ0tnP/WgyDvFb8Uvo5OF7b8EDwFzcDqVfoTW2SocsPeCkogp7uJCSB
	jNjkohKSB2ZwzDse3+UjPVSKjmZtmOhs=
X-Received: by 2002:a17:907:c247:b0:be2:9cf5:4e61 with SMTP id
 a640c23a62f3a-bf3743ea6abmr395521966b.40.1780739646522; Sat, 06 Jun 2026
 02:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526125256.2511876-1-maobibo@loongson.cn> <20260526125256.2511876-3-maobibo@loongson.cn>
In-Reply-To: <20260526125256.2511876-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Jun 2026 17:54:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7RUdVJXOdjktn6vox3crhcXV0cEB1kUgu_zUVV5qpihA@mail.gmail.com>
X-Gm-Features: AVVi8Cfzf5hioHDOAqB-jCAFTQGZ8mR0MBhE03dOGiKHcX4n_LcXdMCEPYSuz20
Message-ID: <CAAhV-H7RUdVJXOdjktn6vox3crhcXV0cEB1kUgu_zUVV5qpihA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] LoongArch: KVM: Check msgint feature in interrupt post
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Tue, May 26, 2026 at 8:53=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Interrupt AVEC is valid only if VM has msgint feature, and this feature
> is checked in interrupt handling. Since interrupt handling is executing
> in VM context switch, and it is hot path, here move the feature checking
> in interrupt post rather than interrupt handling.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/interrupt.c |  5 -----
>  arch/loongarch/kvm/vcpu.c      | 14 +++++++++-----
>  2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrup=
t.c
> index a18c60dffbba..48dd56aa4dc5 100644
> --- a/arch/loongarch/kvm/interrupt.c
> +++ b/arch/loongarch/kvm/interrupt.c
> @@ -36,8 +36,6 @@ static int kvm_irq_deliver(struct kvm_vcpu *vcpu, unsig=
ned int priority)
>
>         switch (priority) {
>         case INT_AVEC:
> -               if (!kvm_guest_has_msgint(&vcpu->arch))
> -                       break;
>                 dmsintc_inject_irq(vcpu);
>                 fallthrough;
>         case INT_TI:
> @@ -75,9 +73,6 @@ static int kvm_irq_clear(struct kvm_vcpu *vcpu, unsigne=
d int priority)
>
>         switch (priority) {
>         case INT_AVEC:
> -               if (!kvm_guest_has_msgint(&vcpu->arch))
> -                       break;
> -               fallthrough;
>         case INT_TI:
>         case INT_IPI:
>         case INT_SWI0:
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index df5be9b265e8..ebd432da3ca4 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -1493,14 +1493,18 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcp=
u, struct kvm_interrupt *irq)
>         if (vector >=3D EXCCODE_INT_NUM)
>                 return -EINVAL;
>
> -       if (intr > 0)
> +       if (!kvm_guest_has_msgint(&vcpu->arch) && (vector =3D=3D INT_AVEC=
))
> +               return -EINVAL;
> +
> +       /*
> +        * Clear irq with INT_SWI0 (which is 0) is missing from SW side
> +        * INT_SWI0 is cleared by guest kernel with the similar instructi=
on
> +        * clear_csr_estat(1 << INT_SWI0)
> +        */
> +       if (intr >=3D 0)
>                 kvm_queue_irq(vcpu, intr);
>         else if (intr < 0)
I think "else if (intr < 0)" can be simplified as "else".


Huacai

>                 kvm_dequeue_irq(vcpu, -intr);
> -       else {
> -               kvm_err("%s: invalid interrupt ioctl %d\n", __func__, irq=
->irq);
> -               return -EINVAL;
> -       }
>
>         kvm_vcpu_kick(vcpu);
>
> --
> 2.39.3
>
>
