Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663C7B
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 15:38:27 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id c189so8943572iof.3
        for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tM8O+xkuaCIyuZXLINVOSy+TYLUrRj5V+dI6D9B0EI=;
        b=JKWzm9GaEyXFJ5CP8b9pr/tNfyo0L6CtnOYtwyPeiMJcCtG2jLofIDUCFvYlIxjd+Q
         V4QfrLXtQqXuDWXdTufDECD6pO1MYSEc9rXabsTR1zjl0z0BqBPCHH9jGtgK2yJksx0w
         eBiK6JCWHF8ATM7dLQLheO4VGpkQGeIP7Y0C8a0ktiJ/k5ugJFnb3gkfMz3ZcJ55xQ4A
         oZVoJivg3hSVTIMMnWoc7DrtfxL/uVOaXz7sTLcZRsWWtPV4TQKq8A3pd8eD91gE4HDN
         xUJuPnlSMJMQmOeZmxNXUK20OQ7XDWJ1k9lfGT2c9oPXDz4TKZzAq5dZZzBn9/+XY9iE
         GQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tM8O+xkuaCIyuZXLINVOSy+TYLUrRj5V+dI6D9B0EI=;
        b=QewZOH94cI2UdE2Z/7+LiEkZkDM3RSOZoLR01yhftK5T2Wtt+P168gUf3wkr2Qky1m
         9gjRt7eafLhiX7FMzlW3yAvrFAIePKIHshfIEcvQKWtJ60j9LOLp8eOHk6NoIicEoFWL
         i3HMVjRxBploaFdt9tBzNolz27vCpPlgRrtpoXrYAXXhfEx/7G4VQiV9gOupnmkf8aiv
         ifpDGPwyMWmbk1dEYJ1LYrF2Yr9l4QGuHnGqqd6r7fIku0zKEcys3+OQ9JcRa24vZn9L
         cGmLUCudPEo8VK65gwiwXp/ebh96AEG1gcW5pHCtMJEKEG9W14S2MQlaTlk9wEg9iuzj
         MN5A==
X-Gm-Message-State: AJIora/9ghAiLZc79YSEXHmnNogEQxdHLNuIi+4gOgGtuoyuG17MLNXK
	GJdWMw6YhxAOdQ7Ev9si6Hj1PcbAx6mDLBxc65vNYg==
X-Google-Smtp-Source: AGRyM1sSstpRHPKLkSjZ24IwBRJKywWh28xqzFAmxMukDjmYUY342goiYySEJKHCHp/aDaomOBbxLied3A8JISuA26c=
X-Received: by 2002:a05:6602:1212:b0:669:d627:acf4 with SMTP id
 y18-20020a056602121200b00669d627acf4mr9637501iot.82.1655653107109; Sun, 19
 Jun 2022 08:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
 <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com>
 <bcc38a55-30dc-98a8-cbfc-5a51924b9373@xen0n.name> <CAHirt9goPWs-_EpSpUOY4DWpK1nbaJxM2rSM3oLUqnCh5fVi4Q@mail.gmail.com>
 <CAJF2gTQbb_RmF6Hn5E91waamecRZ+B7FRxo_GT23wkc0ydN4ug@mail.gmail.com>
In-Reply-To: <CAJF2gTQbb_RmF6Hn5E91waamecRZ+B7FRxo_GT23wkc0ydN4ug@mail.gmail.com>
From: hev <r@hev.cc>
Date: Sun, 19 Jun 2022 23:38:16 +0800
Message-ID: <CAHirt9jJpX0N=z1mLJtvsdsv7hPqAX+t+Eg1nr-_QQRLrt5wuw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>, 
	Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 19, 2022 at 11:06 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Jun 19, 2022 at 12:28 PM hev <r@hev.cc> wrote:
> >
> > Hello,
> >
> > On Sat, Jun 18, 2022 at 8:59 PM WANG Xuerui <kernel@xen0n.name> wrote:
> > >
> > > On 6/18/22 01:45, Guo Ren wrote:
> > > >
> > > >> I see that the qspinlock() code actually calls a 'relaxed' version of xchg16(),
> > > >> but you only implement the one with the full barrier. Is it possible to
> > > >> directly provide a relaxed version that has something less than the
> > > >> __WEAK_LLSC_MB?
> > > > I am also curious that __WEAK_LLSC_MB is very magic. How does it
> > > > prevent preceded accesses from happening after sc for a strong
> > > > cmpxchg?
> > > >
> > > > #define __cmpxchg_asm(ld, st, m, old, new)                              \
> > > > ({                                                                      \
> > > >          __typeof(old) __ret;                                            \
> > > >                                                                          \
> > > >          __asm__ __volatile__(                                           \
> > > >          "1:     " ld "  %0, %2          # __cmpxchg_asm \n"             \
> > > >          "       bne     %0, %z3, 2f                     \n"             \
> > > >          "       or      $t0, %z4, $zero                 \n"             \
> > > >          "       " st "  $t0, %1                         \n"             \
> > > >          "       beq     $zero, $t0, 1b                  \n"             \
> > > >          "2:                                             \n"             \
> > > >          __WEAK_LLSC_MB                                                  \
> > > >
> > > > And its __smp_mb__xxx are just defined as a compiler barrier()?
> > > > #define __smp_mb__before_atomic()       barrier()
> > > > #define __smp_mb__after_atomic()        barrier()
> > > I know this one. There is only one type of barrier defined in the v1.00
> > > of LoongArch, that is the full barrier, but this is going to change.
> > > Huacai hinted in the bringup patchset that 3A6000 and later models would
> > > have finer-grained barriers. So these indeed could be relaxed in the
> > > future, just that Huacai has to wait for their embargo to expire.
> > >
> >
> > IIRC, The Loongson LL/SC behaves differently than others:
> >
> > Loongson:
> > LL: Full barrier + Load exclusive
> > SC: Store conditional + Full barrier
> How about your "am"#asm_op"_db."?
>
> Full barrier + AMO + Full barrier ?

Yes. AMO without '_db' is relaxed.

hev
