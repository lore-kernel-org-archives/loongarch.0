Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B4210B
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThCBkhLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A22C433CB
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 02:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700103016;
	bh=el9qUyLvNgMrjxL1FD9aYdkmO4QTjO2ht03NK0ZAD+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ThCBkhLKtmT1QDaTzAnEy9gUrGCituZ3SeotGg6TxeTK1OYY9RIBzWfSwZmBBdQ6T
	 tq6t0inYR84wbgz67lX9eGx7Vu3ogl+/T/bGI+5C5grDBExqvYmR7Dc7IcHHFaeMGi
	 dZtO/KGqYY66dEN9jKe5NZKnsCgKPhRTJ9hUo0sOKhixZHftwG8eLBOC20e1skpFOe
	 z4q+JFsSxAGDr+mXBB6GvqbMMGuUKErJd+oDQ8EVNNlPZn0bjvIW+t2I0VuLv+cD9i
	 rGmFdiu1MEiKwsDxnTmfettC9R+ONVj13Guiy4APjT4VPAKTq90bkSa++nHI4UOQf/
	 tnc1qb0flnv+w==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so475082a12.1
        for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 18:50:16 -0800 (PST)
X-Gm-Message-State: AOJu0Ywv4jjEBH9zX+MuKJv/KTb8x0L2CkNndNOxGDw/RCATvklT1pSb
	PRX6eZoDzj0Fdj3GFQOw+JP6zB/XhqQCWlp3NOw=
X-Google-Smtp-Source: AGHT+IE0L0nkdubfrY3a5/CyCpKh6zLSuuUdt3LDC0Frc4Djc704aGkEGiqFpXcExvs4JcwLxznC/KWQMiJUngsC3dk=
X-Received: by 2002:aa7:d413:0:b0:53d:b1ca:293c with SMTP id
 z19-20020aa7d413000000b0053db1ca293cmr9136824edq.22.1700103014506; Wed, 15
 Nov 2023 18:50:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231114114656.1003841-1-maobibo@loongson.cn>
In-Reply-To: <20231114114656.1003841-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 16 Nov 2023 10:50:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H46vueDp0ffTuD6sO=xWVsbcwVDBzFU7QirE9JwOWd4dg@mail.gmail.com>
Message-ID: <CAAhV-H46vueDp0ffTuD6sO=xWVsbcwVDBzFU7QirE9JwOWd4dg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Implement stable timer shutdown interface
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

"stable timer" is Chinglish, use "constant timer" here.

On Tue, Nov 14, 2023 at 7:49=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> When cpu is hotplug out, cpu is in idle state and function
> arch_cpu_idle_dead is called. Timer interrupt for this processor should
> be disabled, else there will be timer interrupt for the dead cpu. Also
> this prevents vcpu to schedule out during halt-polling flow when system
> is running in vm mode, since there is pending timer interrupt.
>
> This patch adds detailed implementation for timer shutdown interface, so
> that timer will be disabled when cpu is plug-out.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kernel/time.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 3064af94db9c..2920770e30a9 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -58,7 +58,7 @@ static int constant_set_state_oneshot(struct clock_even=
t_device *evt)
>         return 0;
>  }
>
> -static int constant_set_state_oneshot_stopped(struct clock_event_device =
*evt)
> +static int constant_set_state_shutdown(struct clock_event_device *evt)
>  {
>         unsigned long timer_config;
>
Please remove the whole constant_set_state_oneshot_stopped() and move
its logic to the below constant_set_state_shutdown().

And it is very strange that this "bug" hasn't caused any problems until now=
.

Huacai

> @@ -90,11 +90,6 @@ static int constant_set_state_periodic(struct clock_ev=
ent_device *evt)
>         return 0;
>  }
>
> -static int constant_set_state_shutdown(struct clock_event_device *evt)
> -{
> -       return 0;
> -}
> -
>  static int constant_timer_next_event(unsigned long delta, struct clock_e=
vent_device *evt)
>  {
>         unsigned long timer_config;
> @@ -161,7 +156,7 @@ int constant_clockevent_init(void)
>         cd->rating =3D 320;
>         cd->cpumask =3D cpumask_of(cpu);
>         cd->set_state_oneshot =3D constant_set_state_oneshot;
> -       cd->set_state_oneshot_stopped =3D constant_set_state_oneshot_stop=
ped;
> +       cd->set_state_oneshot_stopped =3D constant_set_state_shutdown;
>         cd->set_state_periodic =3D constant_set_state_periodic;
>         cd->set_state_shutdown =3D constant_set_state_shutdown;
>         cd->set_next_event =3D constant_timer_next_event;
>
> base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0
> --
> 2.39.3
>
