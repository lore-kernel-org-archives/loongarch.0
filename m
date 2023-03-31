Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E523015A8
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 02:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93959C433D2
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 02:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680229092;
	bh=gZ7Ts/So+oDkgyvm4wnKBreiCz0uFV5d7xOVDMq7s10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZjKx0k+JK+834X1vC+f9O9VJPi9DrDxFqUuRVz1x2+0Sh5csS/TlBIHEEgAXEmd2H
	 178KmQRPeQYd/m7sC9haTVz6VT3D+obMMeUYN//tM57v1iItmgltcjWIcI3g5gFb0X
	 pVMtP67NAELqSzs9gCDS8PaHyiz5mmUJ1dpcJseaJ/Sx/xym5AtdJLenxmMDtAXImr
	 Jq6A99PE/Zn9YSN7qBdhuA5jYGDjzlMP6k2aRrv0ZQEitvNQcawVg1asVA8HX/Bs7t
	 kAhyvwVkQm8pr7WsxDh60ONDGke652FkXRYRDa/I4cj5esLl6iMzSs1ITTiZ6UdGB6
	 lGw9qwYT9wzyg==
Received: by mail-ed1-f41.google.com with SMTP id ek18so84171855edb.6
        for <loongarch@lists.linux.dev>; Thu, 30 Mar 2023 19:18:12 -0700 (PDT)
X-Gm-Message-State: AAQBX9daCXqf/YxxCwaN9IBLHEStQgGEXOd5T3c/WZeO8qetYo83kZ9q
	IiHVVIZ+8Oebny0nJ1auIkTEKOVUgY71dXSD4vk=
X-Google-Smtp-Source: AKy350a99Ugd/9y5MhNGcGhdDp8/M3Y34A6ATvhjxsVA58gnjz+ZoHKEm9y0cin4bNGDnUgDxuDUg5utg1dogRwDQkU=
X-Received: by 2002:a50:cdda:0:b0:4fb:dc5e:6501 with SMTP id
 h26-20020a50cdda000000b004fbdc5e6501mr12410452edj.1.1680229090834; Thu, 30
 Mar 2023 19:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <11215033-fa3c-ecb1-2fc0-e9aeba47be9b@infradead.org> <af6281f5-9c6c-d2d7-5978-b637b8d18473@loongson.cn>
In-Reply-To: <af6281f5-9c6c-d2d7-5978-b637b8d18473@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 31 Mar 2023 10:17:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5+GCi76aC=Mk3aoHqP5qEWhjQvBtwLGGtuBLXL1ardjA@mail.gmail.com>
Message-ID: <CAAhV-H5+GCi76aC=Mk3aoHqP5qEWhjQvBtwLGGtuBLXL1ardjA@mail.gmail.com>
Subject: Re: loongarch wakeup build error
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Thu, Mar 30, 2023 at 11:33=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
>
>
> On 03/30/2023 06:55 AM, Randy Dunlap wrote:
> > Hi,
> >
> > I don't know if this has been reported previously, so here goes.
> >
> > When CONFIG_SUSPEND is not set:
> >
> > loongarch64-linux-ld: drivers/acpi/sleep.o: in function `acpi_pm_prepar=
e':
> > sleep.c:(.text+0x278): undefined reference to `loongarch_wakeup_start'
> > loongarch64-linux-ld: sleep.c:(.text+0x27c): undefined reference to `lo=
ongarch_wakeup_start'
> > loongarch64-linux-ld: sleep.c:(.text+0x27c): undefined reference to `lo=
ongarch_wakeup_start'
> >
> > A complete randconfig file is attached.
> >
>
> I can reproduce this build error on LoongArch.
>
> Here is the call trace:
>
> acpi_pm_prepare()
>    __acpi_pm_prepare()
>      acpi_sleep_prepare()
>        acpi_get_wakeup_address()
>          loongarch_wakeup_start()
>
>
> loongarch_wakeup_start() is defined in arch/loongarch/power/suspend_asm.S
> which is built under CONFIG_SUSPEND. In order to fix the build error, jus=
t
> define a empty loongarch_wakeup_start() if CONFIG_SUSPEND is not set.
>
> diff --git a/arch/loongarch/include/asm/acpi.h
> b/arch/loongarch/include/asm/acpi.h
> index 4198753aa1d0..7b812a836a5a 100644
> --- a/arch/loongarch/include/asm/acpi.h
> +++ b/arch/loongarch/include/asm/acpi.h
> @@ -39,9 +39,14 @@ extern int loongarch_acpi_suspend(void);
>   extern int (*acpi_suspend_lowlevel)(void);
>   extern void loongarch_suspend_enter(void);
>
> +#ifdef CONFIG_SUSPEND
> +extern void loongarch_wakeup_start(void);
> +#else
> +static inline void loongarch_wakeup_start(void) {}
> +#endif
> +
>   static inline unsigned long acpi_get_wakeup_address(void)
>   {
> -       extern void loongarch_wakeup_start(void);
>         return (unsigned long)loongarch_wakeup_start;
>   }
>
> If the above change makes sense, I will send a formal patch later.
No, we should make sure acpi_get_wakeup_address() return 0, not a
random address [1]. But my version reuse your commit messages, thank
you all the same.

[1] https://github.com/loongson/linux/commit/49d888dce72e2dc094c9ac39702bbe=
058b89ed79

Huacai
>
> Thanks,
> Tiezhu
>
>
