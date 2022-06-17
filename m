Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67413201
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 16:11:11 +0000 (UTC)
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M5Q6n-1o1P561f1h-001Tz6 for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022
 18:11:09 +0200
Received: by mail-yb1-f177.google.com with SMTP id l66so6575606ybl.10
        for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 09:11:09 -0700 (PDT)
X-Gm-Message-State: AJIora8Xd50io87afMWrMasVDO6P27jOTVLndzgTnr0seM0HVE/GqTOL
	4AZoPKBsceRHXtG4MdFzdqz6w5hnTfVLu7D+qV0=
X-Google-Smtp-Source: AGRyM1sbbvu9586IFsDKfhRXyuh39sqCv/fj6t9J7hwRcICdNbr1TowZgPSHRclPKN99FLzQu3aGwMo5zUy9wxfXsRc=
X-Received: by 2002:a25:ab65:0:b0:668:b6e6:b2e6 with SMTP id
 u92-20020a25ab65000000b00668b6e6b2e6mr3862998ybi.394.1655482268119; Fri, 17
 Jun 2022 09:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145705.581985-1-chenhuacai@loongson.cn>
In-Reply-To: <20220617145705.581985-1-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Jun 2022 18:10:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
Message-ID: <CAK8P3a2nD_Zxv5X_LB7AbO=kxHQyk3vz09fQZ-TTX4PL0b3g1g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add qspinlock support
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+/VgToJ5AQXJnH0YlJ9art9163iDONqP/80sPNFhoEyHeCFm7dO
 wFBJVCkTGS3u8CdKWjt4YbdVWQMH6pT9e2LA4pcIRz+j4LT2Y48V6k5OwuVXdB+gz3AJpLR
 lJYZ9f1fDZTwddUc75AeZ9j2tYTCOgUPstEvshU5QAhFvF3/8KrRHe78wNDosTOMMZwOu6g
 ANJBqzh8jt3KW2TX2uDMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4us+6DdMQ1U=:BokzkAJP504RZXiH6/wkjU
 3dewCRUEWeMEolHLdg82qYuSlBr7zD69d6WJYS33LF2GK/TEv4xC8s6KigJT75/bJ1vTFW0jr
 vs537TIZe1xuBuHb3ftYRmbZxRsT2mFaULr7uHVo5LRfZvfE3dS14iYQ9ozmFlc2G3AG9fix9
 NU2uKEGIVOxscwtVQnCmMZX92XBKKhiWcI2uR1vB2kXhg4ZczW/YcxjU/5m2EfF+CZnO0Y8oO
 nUPvfViRHh/cPufzvvqUBikzyM9hlgQ4X0qCUQRo24X7Xpkj4OXsBW8/NCVmdjRSkM0Nga83n
 CTB+Mm93IuKgpdyQ3HTKh7ZXFpWlsEKf80rlxuPiitjwJt7C/2OrMpZKGfh82DYW9kP03LXai
 ezGzWh9iK803yHX2H1blVWJko3N+J+NqQicigE7QFRxuun1o1FqPIC9qSWTSUr07a5uCXdZHm
 /jEFPAqpdlJqQIxukm6UlTq81edPJyWIY3xKIvHhn7eNo7uI0MA+TT+NjHOD5Mkk28mW7TUWn
 iknwFSWYOWsx9n5YG7WmhTwhWbvDEbda7YiCtt25cwLWCoZIBU5FzBu7lIuZvQpZeCyLSQLW8
 ywm7vrskuerexHUiTwKETb28fwwxNxQSUkudABkeoZOH8qQHEs+51DssUtQrMATpOxVzLJSFE
 DuQsFigus78TdC4UqG3Ct+94omPB/508c7ZO5rV1CTA+Zav9fPTbwHfS5+mY9zw569sYmMQrR
 pANGMXuXMSg+iLY8IqalQAn3qW89O1qKFGbH1HI398rSpu1GR82HYImAbmznfvk/3JUf2p1BU
 FkeLMdZgHf6olB2cZFrZQfFdd+Zure5RXFT+swHhHvmMrfV8zd9vjJ+KVisfp/7r15TvguKTB
 sv9ZDcLB0Txv+67pSt7Cj7K0jnoVl+UFP2gpl94I4=

On Fri, Jun 17, 2022 at 4:57 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> On NUMA system, the performance of qspinlock is better than generic
> spinlock. Below is the UnixBench test results on a 8 nodes (4 cores
> per node, 32 cores in total) machine.
>

The performance increase is nice, but this is only half the story we need here.

I think the more important bit is how you can guarantee that the xchg16()
implementation is correct and always allows forward progress.

>@@ -123,6 +123,10 @@ static inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
>                                                int size)
> {
>        switch (size) {
>+       case 1:
>+       case 2:
>+               return __xchg_small((volatile void *)ptr, val, size);
>+

Do you actually need the size 1 as well?

Generally speaking, I would like to rework the xchg()/cmpxchg() logic
to only cover the 32-bit and word-sized (possibly 64-bit) case, while
having separate optional 8-bit and 16-bit functions. I had a patch for
this in the past, and can try to dig that out, this may be the time to
finally do that.

I see that the qspinlock() code actually calls a 'relaxed' version of xchg16(),
but you only implement the one with the full barrier. Is it possible to
directly provide a relaxed version that has something less than the
__WEAK_LLSC_MB?

       Arnd
