Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC714010
	for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVWu92Qs"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3606de7f4bdso38958365ab.0
        for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 14:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705272151; x=1705876951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoLJM1YCWGjUlR9N5C5AV+mH39ndl7FYD4RDzU57JFY=;
        b=XVWu92QsysQ5ePINbqbBTlXpI96dKK5fKulemMGIawj0u99MFjgdauRiMk4OH6TL+J
         yeBfinU6NfW8GQ+eaECbIYYIV/8OiF9ZtG+88AXb0DxX1FgLLz+rAvdZwvWuN7eh7Ejz
         mLt6VJG1fNLtBZYhkuVQA+kBigTh6O6TQg9P1Fm0h0dobtrpf/b1hWXXChYFAEubTZR5
         NCyk6dEU8dOQZwpymTLOZfl47gsjs/Kd+uohDptytRN4xgSkhgdXL2RovjlwZd1jsvi+
         uaPsvNVBUd/pg/ipMkJNaL92GUDmtgntinprtO43fDL7SiIQHXNkJ1T9DExd/xpcAg/x
         uvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705272151; x=1705876951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoLJM1YCWGjUlR9N5C5AV+mH39ndl7FYD4RDzU57JFY=;
        b=oYqYKkrejKrZXuB8vMVo3g3OdQMIz4RXjtCvneElHWsIgou6IDO3AFpNHeBda9AjkI
         FeTAHbQbw7ecn4sOb0X7qjsQWsSGHCfeaPiobWWw0kP6mAvUqlWi5M28stSyU84MDnWC
         +AFb3/vc8OltH2kC6AlKCXs/4+bQ0SSJKN6oLKvsBZjnjqJUXoYYlbq6EC+d27cxIltd
         6/4EP5q8DqoyHhfphaUK4P6s2vgPFQSQrT4/D2cSXn0NBP7+dq+L4Gmtw2Wt2exOjHla
         gZfXpEH2jioAF4QXbvJ736RQbzASx0ejZjiHeauxCyWzDnipdpolWuHJZW7jUt/sgBg9
         Ae/Q==
X-Gm-Message-State: AOJu0YxDZYGQS2y981nxQxO4iJa0jrkWwvIimpCt+MiSmsQly6lxtCnQ
	2/KkSWO5WBNvDvhotwWakmXidoMJvM2sKbOPOi8=
X-Google-Smtp-Source: AGHT+IFc4YnzZDRRq3UdDjmWjnvvkoOaNnHCSsjrca54VMY2DX6cokwWeZGlhFAWBtidREnmbk5yja+calb/V2yb6xI=
X-Received: by 2002:a05:6e02:188a:b0:360:7244:6089 with SMTP id
 o10-20020a056e02188a00b0036072446089mr7334277ilu.43.1705272151280; Sun, 14
 Jan 2024 14:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com> <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
In-Reply-To: <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jan 2024 14:42:20 -0800
Message-ID: <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 14, 2024 at 10:49=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.=
com> wrote:
> > >
> > > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com=
> wrote:
> > > >
> > > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@go=
ogle.com> wrote:
> > > > >
> > > > > The z3fold compressed pages allocator is not widely used, most us=
ers use
> > > > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > > > dependency on MMU, and zbud is a more common option for !MMU as i=
t was
> > > > > the default zswap allocator for a long time.
> > > >
> > > > Johannes and I were chatting about this the other day. We might be
> > > > able to disable certain zsmalloc behavior in the case of !MMU, maki=
ng
> > > > it available there too. Once that's happened, we can outright remov=
e
> > > > z3fold and zbud, and have one allocator to rule them all? :)
> > >
> > > (Adding Sergey and Minchan for visibility)
> > >
> > > I didn't want to bring up the zsmalloc MMU dependency in this thread
> > > to reduce noise, but that's also what I had in mind. Sergey and I wer=
e
> > > also chatting about this the other day :)
> > >
> > > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > > well.
> >
> > Makes sense to me. Should we do the same thing to zbud? We probably
> > have even less of a case for it, no?
>
> Do you mean declare it as deprecated now? I initially thought that
> would only be appropriate to do after zsmalloc has no dependency on
> MMU, so that we can confidently say zbud has no practical use case.

Ah, I misread your email. My bad. Personally, I'd like to declare both
(zbud and z3fold) as deprecated. That said, no strong feelings here -
as long as (eventually) we move towards retiring both of them. So my
original ACK still holds.

Not entirely sure which should we remove first between zbud and z3fold
though. I was under the assumption that z3fold is slightly better, but
that could be my bias for shiny new things showing :)
