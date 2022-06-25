Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0287C
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 06:22:55 +0000 (UTC)
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MYvLi-1o9RAy3pFQ-00UuWI for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022
 08:22:53 +0200
Received: by mail-yb1-f171.google.com with SMTP id p136so1776545ybg.4
        for <loongarch@lists.linux.dev>; Fri, 24 Jun 2022 23:22:52 -0700 (PDT)
X-Gm-Message-State: AJIora8kY5YtkGWiGbS5mxE320iNcMq30R6ZToS88RALsTiW9LgfxR00
	DwDBhbEmQHZGeEkiQTxuDmFxZ+ILj7qdXf1V9Vs=
X-Google-Smtp-Source: AGRyM1vbzJYOdOsmqnsi8jykRo4y3nH6Th1YFXHipTu1WFlK5Hdx1931kSjYlfy/GPrkUdKdpm5h+l9MaGGvwAn8xmU=
X-Received: by 2002:a25:e808:0:b0:669:7fcf:5f82 with SMTP id
 k8-20020a25e808000000b006697fcf5f82mr2879493ybd.550.1656138171567; Fri, 24
 Jun 2022 23:22:51 -0700 (PDT)
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
 <CAK8P3a0pyLgFXq5Wrwi9BBgNnZkEdLYXm9dOaOci2ouTnEAqGQ@mail.gmail.com> <CAJF2gTSzUu5-C76LQs7KzV+U+qC5D1D-RVk4fHexHTJXLK6dqQ@mail.gmail.com>
In-Reply-To: <CAJF2gTSzUu5-C76LQs7KzV+U+qC5D1D-RVk4fHexHTJXLK6dqQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Jun 2022 08:22:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0s3PkeV350puaJ3kPkUQjV3k0c5c3E1m1skUq7n86QMA@mail.gmail.com>
Message-ID: <CAK8P3a0s3PkeV350puaJ3kPkUQjV3k0c5c3E1m1skUq7n86QMA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:X9Ino/Wi5YHfUQzf6fWEiXnxoFjxEpEmjFoftHbBzO2+4xUM8zl
 WJuDEImsP98dHmvN7SDrMTD1fClpBlzXPr2WEEXuWPJx/begtaHmPo6lkUiQIvk4vZkUMuC
 L8v0dxOtTMFG5sKOP2Qbeh9vqAJG/VU68swQKx5tcED9mR9LUdBS0tz92n+bi53cwhy/06H
 tgnXGSSVGzZQ0L/lLIfMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:20MlaT3iUG4=:PA2a6HlizcmjFS9QedAHak
 AOczLFXExJn6J9A8UTiUvsv/Z/bdvYV3/MS4CAGheKgPAUaN8hpecE4ENcMhwrWjC/KUEPdr4
 KOiMk89xF52PqI20mGJY5VHaFuprNrj79UQF08FNGp7AxxY/S+XUwXd8rZJIKetyp/pGZvG6w
 CDRaFM/TZWEEtS6V2nDJtwWos7AA6DmLx5Zg4mew7/n8TKKiFoLrKM8TDukmRJVTnyjilQZR9
 D8+6XdlmkDSkGHXR0UrcSbXJO82N191m09/IYi4N8f1JHqxKf8zzZU1r7/Rk11m/fwLTiTntR
 K0G27sjBmkTunMPjIh9Ab6NbrF8zYRlulAaqXjd9lDoTYU29JobgxZI3BLTtd4tzdWzEmofcI
 UgeIHnVql/EsWB/Fi6x7FJm3QIXSHYKM9GP7hjnPARQUlZHQDieGd215mP/tYar73n58FWDZk
 +Nzrpduq3uvROCuQQBNxOYoKmsMzg2Mrqv2PHKd5jZaOO1ZXYO7nNDg3Dsl7lqNJBeLHMTCjK
 i9hJhGT0IzbIgFEhU2GHW7Hfu6YYKDLqk3c4j1nELTat5ii7oC9kDDjNOBUMn3TQH8IkPVw1N
 OtsCBdMmZoYl6ISmg6eJlqVUzqV7Hb4/non+PaEkIDtqIcD74DriCoYmeLy4QVz/aglYLR/UG
 s1dOCvQVQfsrw+3A6mX+2Xeo7VnpljWJ3VNWammon6389sig/2BZZkKtIh0uyf+OEp1Y0Mb8l
 hPXicuzKLOA+WzTZdu5wC/ktkfAFI6glugRCVizXj9OhNNl/Fs/1daSHSsBgQO1GxraJ4nlAl
 ug0459KUNVeq4agWhKv4BRYfIiyW05YxtPz4Wg7ibsbNNRzWX6wMqhADyc9wqqJtnHEMw1Tl1
 rPyCmMjg0jx2tNk2VIcw==

On Sat, Jun 25, 2022 at 4:42 AM Guo Ren <guoren@kernel.org> wrote:
> > In that case, you probably need a boot-time check for this feature bit
> > to refuse booting a kernel with qspinlock enabled when it has more than
> > one active CPU but does not support the random backoff,
> Do you mean we should combine ticket-lock into qspinlock, and let the
> machine choose during boot-time?

That is not what I meant here. It would be great if it could be done, but
I doubt this is possible without adding excessive complexity.

> From Peter's comment, seems the arch is broken without a strong fwd guarantee.
> https://lore.kernel.org/linux-riscv/YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net/
>
> I'm not sure qspinlock guys would welcome ticket-lock getting into the
> qspinlock data structure (Although ticket-lock is also made by peter).

What I meant is that a kernel that is not safe to run on hardware
without the necessary guarantees should just refuse to boot, the
same way that we tend to warn when the CPU instruction set
version is too old for what the kernel was built against.


         Arnd
