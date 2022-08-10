Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F5C29A5
	for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 15:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EDDC433C1
	for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660145909;
	bh=qqqmFcLlUbU+LZpMH9dd3OhpfYNlFzxOGRdFjq4rYYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HwHc2Pid82Y2aqgjwm4jvQq49LeYP/a/K9M8RD8U8yHC/a2MJRJTItByAKgWicle+
	 CPdTVg7wd7+7qOWueZeE683ew0YR+CwNZs2OiUudRbj4Mhny/Rkn0mQsrKDRt47s0D
	 GRDo/qDRbTa8ljBqG2EcqNk7v57o7zpf6dnLWNnOc3qQpuPIrRb3IqFexyOu0cbxkH
	 CSywnFdgssUqubwrx9BKSMoMH18PuUljBQCDpyNE734SH18pw+1zCe+Dz7d4VPUCTS
	 TDG10/KS/7MoEgtJVTH6ZRtArH5FksWx8cGBbYBcnq8Tm9gy+1TIAYPts8yH1Z5+Pd
	 gcMqRk/gdag9A==
Received: by mail-vs1-f46.google.com with SMTP id c3so15514102vsc.6
        for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 08:38:29 -0700 (PDT)
X-Gm-Message-State: ACgBeo3Dwa2xCAQfeMvi2P12f2CQ55wOzJtIG5A0zjjSvOjJT+bDo3tq
	Bdpcg8pnuK+j5e1J6UAD+uLr+J7WJFk1l4gdPyk=
X-Google-Smtp-Source: AA6agR4+TocvVEVMrd087/tbt7MQyh5j8fhKxCRzfxHM/DQSd+kr3p8OddAx4jllFhPw6pUGVPXTWCjR1g9WU6HxExs=
X-Received: by 2002:a67:e288:0:b0:388:b41d:1654 with SMTP id
 g8-20020a67e288000000b00388b41d1654mr6240428vsf.70.1660145908864; Wed, 10 Aug
 2022 08:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810103156.1214996-1-chenhuacai@loongson.cn> <f92fc4f34784217206b53a3709538d5c@kernel.org>
In-Reply-To: <f92fc4f34784217206b53a3709538d5c@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 10 Aug 2022 23:38:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7DbvjEcms9Y81t_=WyDnKu5vuB4x7g7vU3f9CUhZykHQ@mail.gmail.com>
Message-ID: <CAAhV-H7DbvjEcms9Y81t_=WyDnKu5vuB4x7g7vU3f9CUhZykHQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix the !CONFIG_SMP build for irqchip drivers
To: Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Marc,

On Wed, Aug 10, 2022 at 7:01 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-08-10 11:31, Huacai Chen wrote:
> > 1, Guard get_ipi_irq() in CONFIG_SMP;
> > 2, Define cpu_logical_map() for the EIOINTC driver;
> > 3, Make eiointc_set_irq_affinity() return early for !CONFIG_SMP.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Frankly, the real question is why do you even bother? As far as
> I can tell, LoongArch has no UP system.
>
> arm64 crossed that bridge a long time ago, and we never looked
> back, because these systems hardly exist.
>
> I'd rather you simply have a CONFIG_SMP always set to 'y', and
> be done with it forever.
LoongArch also has low-end processors (even LoongArch64). Though we
haven't translate all documents at
https://loongson.github.io/LoongArch-Documentation/ in time, there are
currently 4 LoongArch64 processors: Loongson-2K500 (single-core),
Loongon-2K1000 (dual-core), Loongson-3A5000 (quad-core) and
Loongson-3C5000 (16-core). So we indeed need a UP configuration.
Thanks.

Huacai
>
>          M.
> --
> Jazz is not dead. It just smells funny...
