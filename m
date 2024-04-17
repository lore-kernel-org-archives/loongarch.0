Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16E1851
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 03:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713323695; cv=none; b=MFOQa6V6KSQupErHC1qnBiJWRp/2fHwPK5D4qga1aOMj/Em25Pm47uc59Y2jhAQsrxm8cACuKzwb+syHNGVekiSwbgAxojCI64XAHE39N9RygMq/hc5mTgB7r8rtEUHrg2Q3Kb+OImO1AtrPc/FWM5TlZqpobrbrktnD5MTl4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713323695; c=relaxed/simple;
	bh=GTVTtdoMrTHwBS2kkGpeq8wvd0niAoFCDltH1ZaIvEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqpPewS7NxX4Qx7eJaMMWOP+Yyi91yW/QPYL/8EUAtqxKXTiN7oQzTGEvXaqK8l/E5ezPPV8pLyRYR7QDxgMUlR73Ee8L75tgF21odwpR8yfKMC4+nQQ9Pba1t/yCT3QEvde+TBKxwVyEanr7i6D+QBcpPYGiTZs4ZKKc3+2Dw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlKMHV6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlKMHV6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFBFC32786
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 03:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713323695;
	bh=GTVTtdoMrTHwBS2kkGpeq8wvd0niAoFCDltH1ZaIvEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZlKMHV6od03z3f1c2F1qeIGNVXfvqZFktcOPZct8A+h5P238qor4RGV+7DJybV4JX
	 5mzDf9umhNNsvvRtm+0BpgIlKrubbUcr72tZqK5AzmzrtzqvKN+Dob1++lMj8P0fZ5
	 0QTRPcyg3369sva3G5CvB9uBeK5qtPa/QDNi1RvI/X0HjBuhwALneHEKFQfyLMM2IE
	 6/Gi9R+fixpK0oAFfpEnGKJ9Lpbq8V7omMTB3NWl9GqGy6ESp79yEAhV5wLLPpTKVa
	 D5DQgCl8U27jdeblIQdgMTcM77MxTP2aGBV8b6Q97qduE+z+UD+TmAHv7XUy7WpesE
	 WQZqxTg+pGm/w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51addddbd4so592863466b.0
        for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 20:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtX3As6KyXw8ip26xPpXXKQczSkgE5evP02d4WVEaK+bECd2aVm3168jantrP65JteRfS3qdyNWQ4wVTCGMFL03vAojcaczX8G
X-Gm-Message-State: AOJu0YzRz4Y/bn7r4QoKQgHSQEjeGETsEoahITc7hsxbDTx7Wf/fDpp2
	5RgrHc6kGui9pY84LmL+36KQAdIc9f6R852sLOgXlmoekmztzEk8crFLdOJr5+hWCzn1WEloaBS
	mTuK075HZN1YDMfiB7U3TzrALbQ0=
X-Google-Smtp-Source: AGHT+IF1jmsN2RBuY213tAWuSeHyonGmujLDyM8+rcOOXVKi4mc1ctOe5On9JsCQolROZAGoBMzrUUNRDBeRlqaIlk4=
X-Received: by 2002:a17:906:29cb:b0:a52:61b9:be48 with SMTP id
 y11-20020a17090629cb00b00a5261b9be48mr5129879eje.35.1713323693797; Tue, 16
 Apr 2024 20:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329132825.1102459-1-bhe@redhat.com> <20240329132825.1102459-2-bhe@redhat.com>
 <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com> <ZgggcyeJ1bnkfGOp@MiWiFi-R3L-srv>
In-Reply-To: <ZgggcyeJ1bnkfGOp@MiWiFi-R3L-srv>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Apr 2024 11:14:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5xGDAkF2kjdveKoGd+GwYrmix8_E=YB0i=c98qOGvffw@mail.gmail.com>
Message-ID: <CAAhV-H5xGDAkF2kjdveKoGd+GwYrmix8_E=YB0i=c98qOGvffw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch/loongarch: clean up the left code and Kconfig
 item related to CRASH_CORE
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, akpm@linux-foundation.org, geert@linux-m68k.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,

On Sat, Mar 30, 2024 at 10:24=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> On 03/30/24 at 09:59pm, Huacai Chen wrote:
> > Queued, thanks.
>
> Thanks, Huacai. While I noticed Andrew has queued this patchset in his
> mm-unstable branch.
If I'm not mistaken, mm-unstable is target for the next 6.10, not for
the current 6.9. But I think this patch should be a fix for 6.9, so I
think it is more suitable in the loongarch-fixes branch. What's your
opinion?

The same question for this patch which fix a build warning:
https://lore.kernel.org/loongarch/CANiq72kACt+FfeYXJxfQpmGH=3DuPqkDA0oprfne=
bw52VSKyn7kQ@mail.gmail.com/T/#t


Huacai

>
> >
> > Huacai
> >
> > On Fri, Mar 29, 2024 at 9:28=E2=80=AFPM Baoquan He <bhe@redhat.com> wro=
te:
> > >
> > > In commit 85fcde402db1 ("kexec: split crashkernel reservation code
> > > out from crash_core.c"), crashkernel reservation code is split out fr=
om
> > > crash_core.c, and add CRASH_RESERVE to control it. And also rename ea=
ch
> > > ARCH's <asm/crash_core.h> to <asm/crash_reserve.h> accordingly.
> > >
> > > But the relevant part in loongarch is missed. Do it now.
> > >
> > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > Cc: Huacai Chen <chenhuacai@kernel.org>
> > > Cc: WANG Xuerui <kernel@xen0n.name>
> > > Cc: loongarch@lists.linux.dev
> > > ---
> > >  arch/loongarch/Kconfig                                       | 2 +-
> > >  arch/loongarch/include/asm/{crash_core.h =3D> crash_reserve.h} | 4 +=
+--
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >  rename arch/loongarch/include/asm/{crash_core.h =3D> crash_reserve.h=
} (75%)
> > >
> > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > index a5f300ec6f28..54ad04dacdee 100644
> > > --- a/arch/loongarch/Kconfig
> > > +++ b/arch/loongarch/Kconfig
> > > @@ -595,7 +595,7 @@ config ARCH_SELECTS_CRASH_DUMP
> > >         select RELOCATABLE
> > >
> > >  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > > -       def_bool CRASH_CORE
> > > +       def_bool CRASH_RESERVE
> > >
> > >  config RELOCATABLE
> > >         bool "Relocatable kernel"
> > > diff --git a/arch/loongarch/include/asm/crash_core.h b/arch/loongarch=
/include/asm/crash_reserve.h
> > > similarity index 75%
> > > rename from arch/loongarch/include/asm/crash_core.h
> > > rename to arch/loongarch/include/asm/crash_reserve.h
> > > index 218bdbfa527b..a1d9b84b1c7d 100644
> > > --- a/arch/loongarch/include/asm/crash_core.h
> > > +++ b/arch/loongarch/include/asm/crash_reserve.h
> > > @@ -1,6 +1,6 @@
> > >  /* SPDX-License-Identifier: GPL-2.0-only */
> > > -#ifndef _LOONGARCH_CRASH_CORE_H
> > > -#define _LOONGARCH_CRASH_CORE_H
> > > +#ifndef _LOONGARCH_CRASH_RESERVE_H
> > > +#define _LOONGARCH_CRASH_RESERVE_H
> > >
> > >  #define CRASH_ALIGN                    SZ_2M
> > >
> > > --
> > > 2.41.0
> > >
> >
>
