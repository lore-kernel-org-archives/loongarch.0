Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFF7B
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 15:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161BEC385A2
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655652208;
	bh=lpB2seL78AL9Gppq2ukCw0DYT90jfIlYtTYOGyDJjzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GOY2geNXLr3+pQW+wDUle8NOnDqgtSZBfSrSqUxfAHxmB77+VUgMI+ncjZf/OGmGd
	 GFq0R61E8BNqaxhoJS8lANlt7yZIUNx5ivuzLneu7znv2Uof3FIIafed/KR93e9o3A
	 /EcCMZbfAGBuM3qFWJEv+3msi7u1z2jslO4DqELv0PW7ekfv2eocOlIxQn9XhXSnkZ
	 0IqpimvUYfFCNX2IjvpN0ssPM4tJQSBGScCmje7qr0Y1LLjfXDuzlHarfOkVH7hTbW
	 tVXEW8Ffzewkmw/TFyN8DzxjPYBQye5ar/5YUBQGA75kg2o1KxHUrz6JLA+EAaXsrb
	 31dhlavcAlJVQ==
Received: by mail-vs1-f52.google.com with SMTP id f1so8418623vsv.5
        for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 08:23:27 -0700 (PDT)
X-Gm-Message-State: AJIora8q/EqIKdwgR600JD/dXbWkq2qxE3ag2M+9oIiHLeWjNDegIGsJ
	yc6K3z/P8jfdiGgiJQOqjhm6QHZEldT//txUtvs=
X-Google-Smtp-Source: AGRyM1v04gAnak7EW9stRv263QT2NvfDjsZ2r/sMLXWQW2uRJ7VJ+3lsQPKHKJNlsCR8t9Ge/RNuaLl69CkFejukvcQ=
X-Received: by 2002:a05:6102:22c2:b0:34b:9163:c6ab with SMTP id
 a2-20020a05610222c200b0034b9163c6abmr7997139vsh.8.1655652206996; Sun, 19 Jun
 2022 08:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn> <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
In-Reply-To: <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 19 Jun 2022 23:23:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSkb8qi4SfumpkHeGVPAa7njOJp0dC1OuxE6eSJOWDVLQ@mail.gmail.com>
Message-ID: <CAJF2gTSkb8qi4SfumpkHeGVPAa7njOJp0dC1OuxE6eSJOWDVLQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 18, 2022 at 12:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jun 17, 2022 at 4:57 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > On NUMA system, the performance of qspinlock is better than generic
> > spinlock. Below is the UnixBench test results on a 8 nodes (4 cores
> > per node, 32 cores in total) machine.
> >
>
> The performance increase is nice, but this is only half the story we need here.
>
> I think the more important bit is how you can guarantee that the xchg16()
> implementation is correct and always allows forward progress.
>
> >@@ -123,6 +123,10 @@ static inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
> >                                                int size)
> > {
> >        switch (size) {
> >+       case 1:
> >+       case 2:
> >+               return __xchg_small((volatile void *)ptr, val, size);
> >+
>
> Do you actually need the size 1 as well?
>
> Generally speaking, I would like to rework the xchg()/cmpxchg() logic
> to only cover the 32-bit and word-sized (possibly 64-bit) case, while
> having separate optional 8-bit and 16-bit functions. I had a patch for
> this in the past, and can try to dig that out, this may be the time to
> finally do that.
>
> I see that the qspinlock() code actually calls a 'relaxed' version of xchg16(),
> but you only implement the one with the full barrier. Is it possible to
> directly provide a relaxed version that has something less than the
> __WEAK_LLSC_MB?
There is no __WEAK_LLSC_MB in __xchg_small, and it's Full-fence +
xchg16_relaxed() + Full-fence (by hev explained).

The __cmpxchg_small isn't related to qspinlock, we could drop it from
this patch.

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
