Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE97C
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C2FC385A2
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656167123;
	bh=C8VTfeEAVq/fh303MH15dtFUwzmu6iw7dZ4gJaylHM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nHh6LBpC/IhzfFY/YrCArWl6KO6wGxaUI3i6R+L7e2USDvO3auhbUKuLpMVCL/CMF
	 5cWMc364TufvV8LI+cdZ6lvErDZtFA5I26L3pwy614D75BpbBJaPGrrlq8vaPHBf4e
	 W8pz1LEx70k9D8yblOt1stvCN1YQQYR8nihswr7LHvehro/07h10PhB1rdty+DUjN7
	 ltyE7Fyr49b6uil3ztAu5ZzldGWd8MH5zfBeJ4cpayeTrgapLKa7ydx3i+5qIm/5vi
	 5o2UWEbyVUgvH1+h+ER+KV+InPnMYS/M2fL8LZFCFPwY/VEUiv5pKvllySzXTAzfv4
	 e9c+m5/xDOjzQ==
Received: by mail-vs1-f52.google.com with SMTP id e7so4861457vsp.13
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 07:25:23 -0700 (PDT)
X-Gm-Message-State: AJIora8K2/1kFtto1/wGWJnXWNDZGrqDyDNkr7tiLANGsJfrXAErff6k
	czNAGeygSDxUuwfsYvb/O0RsCsAudp5Mtw3EYGA=
X-Google-Smtp-Source: AGRyM1tsC8pMNvFIXuSN7USWEZDNCga3fqRbGNI21iB6lhpUQJVrfQIH3xykLCq76+6bHfITmsgY6a0Xpthe3NbmcHY=
X-Received: by 2002:a67:6fc3:0:b0:356:18:32ba with SMTP id k186-20020a676fc3000000b00356001832bamr1485707vsc.43.1656167122741;
 Sat, 25 Jun 2022 07:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623044752.2074066-1-chenhuacai@loongson.cn>
 <20220623044752.2074066-2-chenhuacai@loongson.cn> <CAJF2gTR1ksvWWT1tec1QnOt6rzDucx5qzWO44nA_vHFhqMtG_g@mail.gmail.com>
 <CAAhV-H7p=zr7vjzENLgByqRUsH1mNQb8fFxNBkQu2YsWp1gMWA@mail.gmail.com>
 <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com>
 <CAAhV-H6MDm_jDFhcT-QBzJ-fLRc6VKoNbsoJC_BGN66sozdqfA@mail.gmail.com>
 <CAK8P3a0pyLgFXq5Wrwi9BBgNnZkEdLYXm9dOaOci2ouTnEAqGQ@mail.gmail.com>
 <CAAhV-H7nLJ4q_raDbWH+EP+TFRbkrXOzB8bUkUiDnNBa2ai_+A@mail.gmail.com> <CAK8P3a0YT_gWNk1v99KgYPf3KhmAOeLyMBeLxsr_th9C59Deyg@mail.gmail.com>
In-Reply-To: <CAK8P3a0YT_gWNk1v99KgYPf3KhmAOeLyMBeLxsr_th9C59Deyg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 25 Jun 2022 22:25:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q9XBX6ueSKRTQEHYw3moxvKVyPOOondMe5NHkxdhdZw@mail.gmail.com>
Message-ID: <CAAhV-H6Q9XBX6ueSKRTQEHYw3moxvKVyPOOondMe5NHkxdhdZw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

On Sat, Jun 25, 2022 at 7:49 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jun 25, 2022 at 8:54 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > On Thu, Jun 23, 2022 at 10:04 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Jun 23, 2022 at 3:05 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > If there is an architected feature bit for the delay, does that mean that there
> > > is a chance of CPUs getting released that set this to zero?
> > I had an offline discussion with hardware engineers, they told me that
> > it is a mandatory requirement for LoongArch to implement "exclusive
> > access of ll" and "random delay of sc" for multi-core chips. Only
> > single-core and dual-core processors (and not support multi-chip
> > interconnection) are allowed to have no such features.
>
> Ok, I see. I suppose the reason is that the dual-core version is safe
> without the random backoff because all uses cases for qspinlock only
> involve one CPU waiting for a lock, right?
Right.

>
> Please put the explanation into the changelog text for the next version. It
> might be helpful to also document this in the source code itself, maybe
> with a boot-time assertion that checks for this guarantee to be held up,
> and an explanation that this is required for using qspinlock.
OK, this will be added to the commit message.

>
> Regardless of this, I think it still makes sense to use the same compile-time
> logic that Guo Ren suggested for the risc-v version, offering a choice between
> ticket spinlock and qspinlock when both make sense, possibly depending
> on CONFIG_NR_CPUS and CONFIG_NUMA.
OK, the dependency seems to make sense.

Huacai
>
>            Arnd
>
