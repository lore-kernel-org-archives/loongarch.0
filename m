Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192CD7B
	for <loongarch@lists.linux.dev>; Sun, 19 Jun 2022 04:28:19 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id h5so3296006ili.3
        for <loongarch@lists.linux.dev>; Sat, 18 Jun 2022 21:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=40/WI875nuyCI9z3V/fsTibM7HMNns0n2ceN1/6cSE8=;
        b=Y4csF/qMNgR8GImvH1LrZLE491Jdlz9yO6Afk3BwI2psEIZyKcaNGBE1xl+/NuLZs6
         AJpPEKMiyz7jjsG8p5QoKr2u7wyHzjog9ae+MaK7H1DfLax8okjHvAaVZmtqznncmTXZ
         PidK0t5GYpmtAOycLaOCaG7xbq2RwIGc1yH6C6jcSY1qeoq2BqB8ToHgDbFmUg05cgzB
         q8jNEP6ts7JTRmeJ1LgYt2hKuXsTDMBQQQeT9jp6H5rX/xg1r2E1zCA7bHhctUfDqN+G
         FgjBWT7GgLCRw01MfgwXo3T2JcQ/oMw4LTUwh2yguhqPaACOaItQEMmkuhq1usvIyAPf
         euUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=40/WI875nuyCI9z3V/fsTibM7HMNns0n2ceN1/6cSE8=;
        b=n/glvR9dqPMNF9pLHYfzdRn8oQcXIwVHGnu9zQEOv4uuuXfyQ2ZORtZpmeEpyJoQda
         vyV+ny3ONbBMQ1QFVD1IAYzRufy3ncCXPVvVRcxKuV8+0Z1+Deb8t+M77d4nIhBZCDGH
         +TD+zO0ELc8gBOrbZtpbT7ieADCECgxnu2gEudrlrJQuQOY09xnl8L185DBNWAtgGw34
         e4cB/vRGmi7m9k+/7nTBxMigPIoJ9xF9mtqzV3Ur83fT8byS7qXaZDrfIXasM00ImwIZ
         8X6yHCH8ncQcLTzh8QQfWAJgQUpV4VjhJrRN8t2yVtmqrDlDqQ7aNKuiubu39UHSeu6s
         gmwA==
X-Gm-Message-State: AJIora9uwkm40T1RXiMiTfagub/ISO7qGtCgFCYYpvy+cetlDPygt4cL
	JsvtQccuiinQcpBvu9DYFqjvaJTON9e2wbfl6FO3Sw==
X-Google-Smtp-Source: AGRyM1sr2Yr7XchAcGFeWgt5Lyh+6Nfa0k2CQiJom6AlN4aDw6Cmjqu8x9HNvbbJVuzVDsp8QN4PRFsL2Dd4mYZDjPo=
X-Received: by 2002:a92:d90c:0:b0:2d9:54f:85f7 with SMTP id
 s12-20020a92d90c000000b002d9054f85f7mr977875iln.157.1655612899119; Sat, 18
 Jun 2022 21:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
 <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
 <CAJF2gTT_etFg7-N4f=A4LMOYvd3+H505e0xt8NyxK4uPtkuEXg@mail.gmail.com> <bcc38a55-30dc-98a8-cbfc-5a51924b9373@xen0n.name>
In-Reply-To: <bcc38a55-30dc-98a8-cbfc-5a51924b9373@xen0n.name>
From: hev <r@hev.cc>
Date: Sun, 19 Jun 2022 12:28:08 +0800
Message-ID: <CAHirt9goPWs-_EpSpUOY4DWpK1nbaJxM2rSM3oLUqnCh5fVi4Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

On Sat, Jun 18, 2022 at 8:59 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 6/18/22 01:45, Guo Ren wrote:
> >
> >> I see that the qspinlock() code actually calls a 'relaxed' version of xchg16(),
> >> but you only implement the one with the full barrier. Is it possible to
> >> directly provide a relaxed version that has something less than the
> >> __WEAK_LLSC_MB?
> > I am also curious that __WEAK_LLSC_MB is very magic. How does it
> > prevent preceded accesses from happening after sc for a strong
> > cmpxchg?
> >
> > #define __cmpxchg_asm(ld, st, m, old, new)                              \
> > ({                                                                      \
> >          __typeof(old) __ret;                                            \
> >                                                                          \
> >          __asm__ __volatile__(                                           \
> >          "1:     " ld "  %0, %2          # __cmpxchg_asm \n"             \
> >          "       bne     %0, %z3, 2f                     \n"             \
> >          "       or      $t0, %z4, $zero                 \n"             \
> >          "       " st "  $t0, %1                         \n"             \
> >          "       beq     $zero, $t0, 1b                  \n"             \
> >          "2:                                             \n"             \
> >          __WEAK_LLSC_MB                                                  \
> >
> > And its __smp_mb__xxx are just defined as a compiler barrier()?
> > #define __smp_mb__before_atomic()       barrier()
> > #define __smp_mb__after_atomic()        barrier()
> I know this one. There is only one type of barrier defined in the v1.00
> of LoongArch, that is the full barrier, but this is going to change.
> Huacai hinted in the bringup patchset that 3A6000 and later models would
> have finer-grained barriers. So these indeed could be relaxed in the
> future, just that Huacai has to wait for their embargo to expire.
>

IIRC, The Loongson LL/SC behaves differently than others:

Loongson:
LL: Full barrier + Load exclusive
SC: Store conditional + Full barrier

Others:
LL: Load exclusive + Acquire barrier
SC: Release barrier + Store conditional

So we just need to prevent compiler reorder before/after atomic.
And this is why we need __WEAK_LLSC_MB to prevent runtime reorder for
loads after LL.

hev
