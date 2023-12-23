Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648AD50F
	for <loongarch@lists.linux.dev>; Sat, 23 Dec 2023 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBXvlP9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DF8C433C8
	for <loongarch@lists.linux.dev>; Sat, 23 Dec 2023 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703327291;
	bh=ctHEpimfxLcuXX95GH24/nPgVGOHcffPObfL4O6j4Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QBXvlP9ONJuhdxfj613kDrwQ7eZQSUFPMMfpO4yBZ9dvVqgV0f5Z8jeLMsT+q/dvZ
	 xWbPTQ0gOoEcgO0agDiK8BW28AQiuR1SEM1orIPXdzdgGrIybm06BT1iWB90eUeZoC
	 FPncM3BTMxb8NHOJaJY87v9enzQKqL7JKgl/nQ07xH+Qh3VPL3dOgXkgtzR1uFs6pG
	 sO/jo6QhlGoc9QgZUgyGwuoxuhiL//HaDJYytul0cqd0u23sjsPzSMvGOAPA+CJMji
	 1IhZtuQHmPjHRxvp5OT+fuBg3b7nUFA3vP9O7BZD5J22C7/tv3Gfe0NiJ3b6beYxKI
	 qYj0d4i4YrMbg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5548a911cf9so333971a12.2
        for <loongarch@lists.linux.dev>; Sat, 23 Dec 2023 02:28:11 -0800 (PST)
X-Gm-Message-State: AOJu0YxzKYADElmbe86kWCTMXheW9OexOaJhuuaIVEpDNbg0cCBxvTFS
	/GUTYJSum+fwQBC0DMqxei2VWDUqS7Hdw26BSKw=
X-Google-Smtp-Source: AGHT+IGikFYtOPP9NxAnNs3zACvl2eKEEFeZBVB6ky6IGaswsA0Jdl93XbH7wdb838n8a80UOI3S0ndhMvUdUED3wgE=
X-Received: by 2002:a05:6402:1643:b0:553:53da:b3d8 with SMTP id
 s3-20020a056402164300b0055353dab3d8mr808932edx.94.1703327289568; Sat, 23 Dec
 2023 02:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231222044554.25656-1-rdunlap@infradead.org> <CAAhV-H6pXSuj+bpf=skMYLQh8znboT6YxAA4UXokwm60-aXa8Q@mail.gmail.com>
In-Reply-To: <CAAhV-H6pXSuj+bpf=skMYLQh8znboT6YxAA4UXokwm60-aXa8Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 23 Dec 2023 18:27:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5-ORE2zGT2oZu+dusfzoXfn6mpSDsyE4wo+3XYVUpovg@mail.gmail.com>
Message-ID: <CAAhV-H5-ORE2zGT2oZu+dusfzoXfn6mpSDsyE4wo+3XYVUpovg@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: signal.c: add header file to fix build error
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Kent Overstreet <kent.overstreet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:59=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Randy,
>
> I cannot reproduce it with the default config file.
Oh, I know, this error only occurs in linux-next, but I think this
patch should be squashed into "rseq: Split out rseq.h from sched.h".
Or as a fix applied to the bcachefs tree rather than the loongarch
tree.

Huacai

>
> Huacai
>
> On Fri, Dec 22, 2023 at 12:46=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> > loongarch's signal.c uses rseq_signal_deliver() so it should
> > pull in the appropriate header to prevent a build error:
> >
> > ../arch/loongarch/kernel/signal.c: In function 'handle_signal':
> > ../arch/loongarch/kernel/signal.c:1034:9: error: implicit declaration o=
f function 'rseq_signal_deliver' [-Werror=3Dimplicit-function-declaration]
> >  1034 |         rseq_signal_deliver(ksig, regs);
> >       |         ^~~~~~~~~~~~~~~~~~~
> >
> > Fixes: b74baf4ad05b ("LoongArch: Add signal handling support")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Cc: loongarch@lists.linux.dev
> > Cc: Kent Overstreet <kent.overstreet@gmail.com>
> > ---
> > v2: repair Cc: list
> >
> >  arch/loongarch/kernel/signal.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff -- a/arch/loongarch/kernel/signal.c b/arch/loongarch/kernel/signal=
.c
> > --- a/arch/loongarch/kernel/signal.c
> > +++ b/arch/loongarch/kernel/signal.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/context_tracking.h>
> >  #include <linux/entry-common.h>
> >  #include <linux/irqflags.h>
> > +#include <linux/rseq.h>
> >  #include <linux/sched.h>
> >  #include <linux/mm.h>
> >  #include <linux/personality.h>
