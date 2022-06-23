Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FE1FA6
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 14:09:44 +0000 (UTC)
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1nSpu40xiB-00hyC7 for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022
 16:04:31 +0200
Received: by mail-yb1-f178.google.com with SMTP id i7so18329275ybe.11
        for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 07:04:30 -0700 (PDT)
X-Gm-Message-State: AJIora/maAdBjeBP/hmRevgynt6F5vvkIXx2N8Ob/nJKUQOD5c7FNEKG
	nOaYNC8le8zDPeKF6Li9STEY5MXCpEE4I7W4BjA=
X-Google-Smtp-Source: AGRyM1tw/ZrdY5RwWUm1pztJEAHWQ1L6KKYYxboRYaYgMVmltY4YiYheBN1gwVLXj/BpJFxHyTJ+EjL3M88UtE0HXJA=
X-Received: by 2002:a25:e808:0:b0:669:7fcf:5f82 with SMTP id
 k8-20020a25e808000000b006697fcf5f82mr9236133ybd.550.1655993069914; Thu, 23
 Jun 2022 07:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623044752.2074066-1-chenhuacai@loongson.cn>
 <20220623044752.2074066-2-chenhuacai@loongson.cn> <CAJF2gTR1ksvWWT1tec1QnOt6rzDucx5qzWO44nA_vHFhqMtG_g@mail.gmail.com>
 <CAAhV-H7p=zr7vjzENLgByqRUsH1mNQb8fFxNBkQu2YsWp1gMWA@mail.gmail.com>
 <CAK8P3a0pKc7=iLcFY028HqJXmGupacm=tV7Wqgx0+bYSqczoog@mail.gmail.com> <CAAhV-H6MDm_jDFhcT-QBzJ-fLRc6VKoNbsoJC_BGN66sozdqfA@mail.gmail.com>
In-Reply-To: <CAAhV-H6MDm_jDFhcT-QBzJ-fLRc6VKoNbsoJC_BGN66sozdqfA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jun 2022 16:04:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pyLgFXq5Wrwi9BBgNnZkEdLYXm9dOaOci2ouTnEAqGQ@mail.gmail.com>
Message-ID: <CAK8P3a0pyLgFXq5Wrwi9BBgNnZkEdLYXm9dOaOci2ouTnEAqGQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kUTaCv1XcYCOhzHdm7FprIRhY6AI34GOO0DPuWNqYtypU7k6yYT
 /uH5vqYLQ1s1c8yyu/pnRR7CNHd5M8zYCJgtc15M2/hvvB4VtpDS9fa9lvVeUEu6odzSWEc
 Y63qil/jr7ECx3nLmx/L7PIujCdZwa4czi3/1mjQrjhYbtIQHcsel8nuZ9PNi6ScPmP8aoa
 gvzG91CJTJBo2v+wQFh/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BHGAZ7LyvpE=:PUdvd6dEUcmUL1sBCLOrqm
 mXBcv7B8Wvgy3wTLsDIDlfPICXCNkNXvwCzWHUHZ4VnhH8a6J3mzEkI1EQ7PQAg0L2Ki/GpCi
 vFC/WpilZzoIg3MrtvSydXywCXJLzsjNBqzCR20dW72Fcmth6nrS4/nCkwNTDkPfon71Zkj7m
 IRvpt4mSBQZki12D0yqLCGEJAgcKFk8ML523XwQVdoT7HkNbIqAmtrIf38oRQLaj6QdLiDc+R
 R5uMmrl5OxxHil980tIIBH+bEbpVlWubQmr+AV96FevAikjIbV5aKVwMA93RH5jGyPNGV6/6J
 K+clfblc5C8Tb7qyGwM0b13r5wHg7pNNT9dP2JDZmfg3NbEXdSmURUQendoVT7//KWKJ51v7p
 DpMfVLaYr2E0cRsErI67zI2Wg/8Ks8PuP9qz32ew6Gcf/y/WdC9bCwqfhWyl+9H5xvEWe5ueE
 Wk2jwGzpw34ABQ+UfWkG2Ka/w4bGIIckqiIitvzgDrZFaU1XJtLVrN3sfyE/C/g/1NvyR3eRX
 mIJTyJdDtFvib3kqhIH2l8Naz2wHaC90c/GRD6xHUHQ61FUY4HNw0MwO262dSIl6E/kR6qBR6
 AiFiHziz+5RG5u7XeaDg5dmnIiQvVBhBohCn1rEMcQZxMGbMcqor/hOuy5XNGl4bHaYyk7kf0
 Ux1qZIZWrRn5eCaZFrd1ucs4y7K9F73X/hFXDqp7EazuKxd8gJNblxae7ri3RKThJrID05AK6
 Hp+hCyXGdn2e7jKq04wnPy5L6lmIRd6ObD9gWg==

On Thu, Jun 23, 2022 at 3:05 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Thu, Jun 23, 2022 at 4:26 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, Jun 23, 2022 at 9:56 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > On Thu, Jun 23, 2022 at 1:45 PM Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Thu, Jun 23, 2022 at 12:46 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > >
> > > > > On NUMA system, the performance of qspinlock is better than generic
> > > > > spinlock. Below is the UnixBench test results on a 8 nodes (4 cores
> > > > > per node, 32 cores in total) machine.
> >
> > You are still missing an explanation here about why this is safe to
> > do. Is there are
> > architectural guarantee for forward progress, or do you rely on
> > specific microarchitectural
> > behavior?
> In my understanding, "guarantee for forward progress" means to avoid
> many ll/sc happening at the same time and no one succeeds.
> LoongArch uses "exclusive access (with timeout) of ll" to avoid
> simultaneous ll (it also blocks other memory load/store on the same
> address), and uses "random delay of sc" to avoid simultaneous sc
> (introduced in CPUCFG3, bit 3 and bit 4 [1]). This mechanism can
> guarantee forward progress in practice.
>
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#_cpucfg

If there is an architected feature bit for the delay, does that mean that there
is a chance of CPUs getting released that set this to zero?

In that case, you probably need a boot-time check for this feature bit
to refuse booting a kernel with qspinlock enabled when it has more than
one active CPU but does not support the random backoff, and you need
to make the choice user-visible, so users are able to configure their
kernels using the ticket spinlock. The ticket lock may also be the best
choice for smaller configurations such as a single-socket 3A5000 with
four cores and no NUMA.

       Arnd
