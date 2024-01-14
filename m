Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942A2C680
	for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 23:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+Wfnel0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2cad931c50so255208166b.1
        for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705274088; x=1705878888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k76bVz3l5qhz2PG/FN1fCGCB8QPQrnTnxXAo7lmPrQ=;
        b=B+Wfnel0jJ1BWhncKFV2kpSM73uY5ewjU3rNpjc4VO6MzFcsUdubUSmM+wIfbLeBLJ
         SqSfZhpLkGE/+woMy87oGBrXjAtw6i7SJSPYX3zxLPKw6IXktLizqHzHqtwPsx0e6O1e
         GqbToDvXdR2ydY8GErmEwej8VqcMmWpvR1qujlJvo/02S2rWWb4F99A8QapoMa+GRutr
         23ZZqCNMmEb3b3+3Bs/6CW0RDi69waSzJaorOHzcKwny7o3t4rtjll3jggGW7RPYYnGt
         Pex16sNNqrN3lq0l3nNsURzqy1VCNhpUuV3V0YFFU4ArPCe4AwC90QOvmx1BEIiNfxbw
         TkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705274088; x=1705878888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k76bVz3l5qhz2PG/FN1fCGCB8QPQrnTnxXAo7lmPrQ=;
        b=OhZMMCzd2aVkU83sChK6aPoHJMFjh23tEogDubJtBnC8HOufJKk4mjmfeTN2PHF711
         Of6AFh+O0M7QbNaYdasByqCi/ZKDq6NnH4ZfE7+0MiOWKL4k4AStkT8xLx8Y9eHXtK1T
         TnA2PMTwqiyl1Y371mbwqlzVbHdNVUM1rcv6Mszx01igsET7TXO01ABxMIKOmCUroUb6
         sbIPmO9EWdCCK9ArnzQz/gcEFhVDWkgv8gIbcxSuwEx6Wg+fgPkyvdStAUVakwCkv3TX
         aQv1iESeG24EVyNyNFHXCXNPsMr56PQkv4WC1i++oXj4jlOFM9trt01o/pld4+vbO2F/
         mebQ==
X-Gm-Message-State: AOJu0Yw3pfiTaflhoeenvKjWnxMScEyZp9usj0ov4S4kPuljfInnwz5V
	QdoWy8cAxOw6fAnPBOiyBcJM3Gsutfba8rKTxbZ07IF2Wb4V9ytNdajxBoSQtG5w
X-Google-Smtp-Source: AGHT+IGmzBUdoziLE2Tv88J9U2uChvlAVAX8Vas/pQSY8zMLgWkqGHOPaM3jX3KpJU3blLIwZXnH5YlhC/wo0MwjzgQ=
X-Received: by 2002:a17:906:da8d:b0:a28:fab0:a88c with SMTP id
 xh13-20020a170906da8d00b00a28fab0a88cmr2519935ejb.78.1705274087622; Sun, 14
 Jan 2024 15:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com> <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
In-Reply-To: <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Sun, 14 Jan 2024 15:14:09 -0800
Message-ID: <CAJD7tkZt_cX=wm9Sp7MuLBxYQ=Hvidz3p9bA1gKhHN+wVVCiOA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Nhat Pham <nphamcs@gmail.com>
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

On Sun, Jan 14, 2024 at 2:42=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Sun, Jan 14, 2024 at 10:49=E2=80=AFAM Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> >
> > On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@googl=
e.com> wrote:
> > > >
> > > > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.c=
om> wrote:
> > > > >
> > > > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@=
google.com> wrote:
> > > > > >
> > > > > > The z3fold compressed pages allocator is not widely used, most =
users use
> > > > > > zsmalloc. The only disadvantage of zsmalloc in comparison is th=
e
> > > > > > dependency on MMU, and zbud is a more common option for !MMU as=
 it was
> > > > > > the default zswap allocator for a long time.
> > > > >
> > > > > Johannes and I were chatting about this the other day. We might b=
e
> > > > > able to disable certain zsmalloc behavior in the case of !MMU, ma=
king
> > > > > it available there too. Once that's happened, we can outright rem=
ove
> > > > > z3fold and zbud, and have one allocator to rule them all? :)
> > > >
> > > > (Adding Sergey and Minchan for visibility)
> > > >
> > > > I didn't want to bring up the zsmalloc MMU dependency in this threa=
d
> > > > to reduce noise, but that's also what I had in mind. Sergey and I w=
ere
> > > > also chatting about this the other day :)
> > > >
> > > > I thought deprecating z3fold is the low hanging fruit. Then, once w=
e
> > > > can sort out the MMU dependency in zsmalloc, we can go after zbud a=
s
> > > > well.
> > >
> > > Makes sense to me. Should we do the same thing to zbud? We probably
> > > have even less of a case for it, no?
> >
> > Do you mean declare it as deprecated now? I initially thought that
> > would only be appropriate to do after zsmalloc has no dependency on
> > MMU, so that we can confidently say zbud has no practical use case.
>
> Ah, I misread your email. My bad. Personally, I'd like to declare both
> (zbud and z3fold) as deprecated. That said, no strong feelings here -
> as long as (eventually) we move towards retiring both of them. So my
> original ACK still holds.
>
> Not entirely sure which should we remove first between zbud and z3fold
> though. I was under the assumption that z3fold is slightly better, but
> that could be my bias for shiny new things showing :)

My rationale is that zbud was the default zswap allocator for a long
time, so it's the one we should keep for now as it is more likely to
have users. That said, I don't know of any users of either zbud or
z3fold, and I am fine starting with deprecating either.
