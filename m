Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451D4A18
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 11:49:08 +0000 (UTC)
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8yoa-1nyzjw20bm-0066hp for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022
 13:49:06 +0200
Received: by mail-yb1-f176.google.com with SMTP id x38so8792700ybd.9
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 04:49:06 -0700 (PDT)
X-Gm-Message-State: AJIora87A3y8nkREhR4N53GYXtAPHBPu4xinskjKQPvyuWeQnXyFciE3
	+/XqTpNJR/4lZR/r6TdryvPVBTKutLWTGeKZP9s=
X-Google-Smtp-Source: AGRyM1sq3xoiQgqkY5WineUzVfA54tp5SawyuzEtHHo8lJfL4JIZ800JdhSAtmcUnMOMvSs/DTwf6CTFQAaV2JX0QQc=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr3817339ybq.472.1656157745315; Sat, 25
 Jun 2022 04:49:05 -0700 (PDT)
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
 <CAK8P3a0pyLgFXq5Wrwi9BBgNnZkEdLYXm9dOaOci2ouTnEAqGQ@mail.gmail.com> <CAAhV-H7nLJ4q_raDbWH+EP+TFRbkrXOzB8bUkUiDnNBa2ai_+A@mail.gmail.com>
In-Reply-To: <CAAhV-H7nLJ4q_raDbWH+EP+TFRbkrXOzB8bUkUiDnNBa2ai_+A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Jun 2022 13:48:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YT_gWNk1v99KgYPf3KhmAOeLyMBeLxsr_th9C59Deyg@mail.gmail.com>
Message-ID: <CAK8P3a0YT_gWNk1v99KgYPf3KhmAOeLyMBeLxsr_th9C59Deyg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] LoongArch: Add qspinlock support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IzxwI8L4CBj3ABzkasTkFmskn5v3Pw75Elc4HmjR+4IMFU210bG
 0fSMjJVw4VySgWYFZ5M8dd0n4xrAg8ir1Ar3lPn03dn4JgdGUhzvnDxpPEEs2jHXhpvLHup
 NU3JMKbUQbEOh5x5SfXFtQOLbtX4VNcJwnqnwBLWu8LxwJz/cQGHz56fzmtD+LoZCBdlW6F
 P/osENKgZviaeia0jsnBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qk67JC+s/40=:AGeMlbwI2Mnd3QI2KDuZ6V
 95MMLoym6AGbIOl2H4cvcEFUbYwdj66Riz9iAXHjckWPQHmcag0bOdmOzoy8Vs/OsZuUE0Iii
 vY0/33onGJArV1QKcEyR9ZW2ZLVYB2bDlItqolb7Wef8FDVi/biNypoJtwQUphexvXSoIhFai
 vW8lmD90fht6GI6HsW+exS0rGDOUiG9h3n2UT/0unfV6w8ANS2gWIiemmNYVDEIq2JtkxQrPd
 aeqlDzrUjDwSiKpPdhIxmHPDMJbDDpEo/Xc0gaBTmN9pFOHkKdFkQsb0ryhlqqBmFdGxk1dgG
 mu+KTf9gDpTCOnjuhtxmSciNFRuUUJSzq005KxV7377i5VVcBihTSfKEga7a1CPzg7zCZ/2OB
 2q7KoHeQiCWtuq1nr3cJlx9HdkWFC9yL2DilpGiDEmrvvMkGbPCusUfyJZ6Gz69oMfn38/231
 +VP7C1BcmN/4fZ0hNFXrKQPq2RWsDgyhm7qbVI5TmkMtTSWvuU/MqLBOkFDvLWiOOfBUC/8/I
 jO5oGmdFOhJGmN8TYslS7mqclHpcabRj16c/cuUm2/8b0daMJfiS/NDhd6jUuJrzB4b0Vfevc
 kVsW6ybDAMJx1SWTdHwdIvhcMXYZmjjQwCx+2fcEP49lzHhJ/MH8fYMjwfqmWFTHdbLg43B3P
 wyhbfEpbzNo26WbhFOxEhjlOs6CnahW2VUillYZRm+3LVTyfdav2914fnNUTusrHZrNA24fyH
 7NNM5CvoYJp3n0cUKmQAzGlRKxUm1FlKXHOMtQ==

On Sat, Jun 25, 2022 at 8:54 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Thu, Jun 23, 2022 at 10:04 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Jun 23, 2022 at 3:05 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > If there is an architected feature bit for the delay, does that mean that there
> > is a chance of CPUs getting released that set this to zero?
> I had an offline discussion with hardware engineers, they told me that
> it is a mandatory requirement for LoongArch to implement "exclusive
> access of ll" and "random delay of sc" for multi-core chips. Only
> single-core and dual-core processors (and not support multi-chip
> interconnection) are allowed to have no such features.

Ok, I see. I suppose the reason is that the dual-core version is safe
without the random backoff because all uses cases for qspinlock only
involve one CPU waiting for a lock, right?

Please put the explanation into the changelog text for the next version. It
might be helpful to also document this in the source code itself, maybe
with a boot-time assertion that checks for this guarantee to be held up,
and an explanation that this is required for using qspinlock.

Regardless of this, I think it still makes sense to use the same compile-time
logic that Guo Ren suggested for the risc-v version, offering a choice between
ticket spinlock and qspinlock when both make sense, possibly depending
on CONFIG_NR_CPUS and CONFIG_NUMA.

           Arnd
