Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21BD2E5
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCEDC433D9
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693064856;
	bh=prnLNT3I+k4oP/QefVNsJFO9u+zW4R6P92NhyR9liDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p8rjRPFlZ68joURB328Ee5k51+wdstvOzqh/Rnpj/rHUqwljHBfvC9xl1CvrtdjzZ
	 w4xBZ1eal6tikCU3repiTA+w2+e7zw4U6AJSRV95yj5ggWY84UVfKnJqdSOmS8Nyvv
	 tYuHpLvzcxQCWcddmnaNec87s/fbhin0nRikAWU4nLkB1jN1kzUr4jYfGfxwMNX6Xw
	 tXyf1vqvv5maN040JeWFI6brkWyL+Ck2qKlKYHe+9DpiM4oXH0XamUbLQk3f2FrKNi
	 9fYVbli8LXW/7hNzIKEADXQw/zgXR+LswkORmvi6KYdEm2Om5WRvRCejGdciL2Mm/1
	 rFkEqb82cuEVA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso27393921fa.0
        for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 08:47:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaKn/Ym6dVCqw4/QB+KHRiP9G5AvVbYxcS0tvCe1TovTTw4bSV
	6JXRcSnKD7Lv3Kbe/Jfb/4QvalOeTR0R2lUU3Ws=
X-Google-Smtp-Source: AGHT+IEvH4loVJkDWB0dZHlXqnIGXJwJ7wqKksCJ9FB3Onm4RJzNRqzk7a2z6nwLobAU7GzgGZZ++yvDQ8UTspKSptg=
X-Received: by 2002:a05:651c:237:b0:2bc:f39b:d1a8 with SMTP id
 z23-20020a05651c023700b002bcf39bd1a8mr3607693ljn.46.1693064854861; Sat, 26
 Aug 2023 08:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230826142341.4107728-1-chenhuacai@loongson.cn>
 <2023082618-mocha-reactor-1dbe@gregkh> <CAAhV-H4aKT=O1Ly7Zw+oSuVDP73kcXf+boAJK5W=6n76Ftz=WA@mail.gmail.com>
 <2023082609-coerce-capricorn-a69f@gregkh>
In-Reply-To: <2023082609-coerce-capricorn-a69f@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Aug 2023 23:47:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H532djpsYDPGZxG9g8eiaq2UMGYX_+ADb4kaPpQmgTXYg@mail.gmail.com>
Message-ID: <CAAhV-H532djpsYDPGZxG9g8eiaq2UMGYX_+ADb4kaPpQmgTXYg@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Ensure FP/SIMD registers in the core dump
 file is up to date
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 11:43=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sat, Aug 26, 2023 at 11:35:31PM +0800, Huacai Chen wrote:
> > On Sat, Aug 26, 2023 at 11:22=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Sat, Aug 26, 2023 at 10:23:41PM +0800, Huacai Chen wrote:
> > > > This is a port of commit 379eb01c21795edb4c ("riscv: Ensure the val=
ue
> > > > of FP registers in the core dump file is up to date").
> > > >
> > > > The values of FP/SIMD registers in the core dump file come from the
> > > > thread.fpu. However, kernel saves the FP/SIMD registers only before
> > > > scheduling out the process. If no process switch happens during the
> > > > exception handling, kernel will not have a chance to save the lates=
t
> > > > values of FP/SIMD registers. So it may cause their values in the co=
re
> > > > dump file incorrect. To solve this problem, force fpr_get()/simd_ge=
t()
> > > > to save the FP/SIMD registers into the thread.fpu if the target tas=
k
> > > > equals the current task.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > > V2: Rename get_fpu_regs() to save_fpu_regs().
> > >
> > > What stable tree(s) is this for?
> > For 5.19+, but before 6.4 we should remove the call site in simd_get()
> > because that function doesn't exist.
>
> But this commit is already in the following released kernels:
>         5.10.62 5.13.14 5.14
Do you means commit 379eb01c21795edb4c ("riscv: Ensure the value of FP
registers in the core dump file is up to date")? That is a reference
commit, not a Fixes tag. This patch is for LoongArch and LoongArch
only exists after 5.19.

> so how can it be backported?
>
> totally confused,
>
> greg k-h
