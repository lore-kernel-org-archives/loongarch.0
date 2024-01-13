Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11319134C2
	for <loongarch@lists.linux.dev>; Sat, 13 Jan 2024 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfkhNCg3"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7bf0f3bf331so71797339f.3
        for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 16:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705106322; x=1705711122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8+5Wu3yFVyh8RZpVSuMO/tabpv/LOlHIY8VjuUoGF4=;
        b=RfkhNCg3OIg1SGNnfbsgFdyXZVFgUz9RrO85tbpu6dNWlfU+0aH/hBJNtqzO+uuH2R
         f+PO6swt39D+9B9Pfs6QbAg0O5dzjQY8B97OV9d/Hh/c4s+yG1p3hVQNb4nY6eY5UDVT
         26D3cInK5IyVkkmO3OyB3dA+OOlr6qmX5qWgXLFLxkS36+5H6dG6UMOVBqbVM2JN7KYz
         Yfa4NgL7c+hzgMWr6wXUhNjTD3D6SjJZTDEOVQqEdI4vm05nRvvmGUpLfmaScVphp4sE
         jwQrO/65muxYyX5AeUSckzHycM7ExCYiuVlDA3ZfxQpQEw4UEhG8d7cWMYWvTgJCpqlP
         zDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705106322; x=1705711122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8+5Wu3yFVyh8RZpVSuMO/tabpv/LOlHIY8VjuUoGF4=;
        b=aD7rT1gjQqXGEcLYTKNi+g1j9XApNcBmCgiRlbW9cxraz29Fc1ZxjqO0OaSZJhj7LG
         yDRwUU2FoI3CY1nfrMV7DBBFjkisSBuFlnsC48E0E0VwhQCvahcJg2BeCmxnHG8nXP4F
         E7vUZ5pV5qhXzfg4hvySawE3LDwfrnOBUwnfXO294p/0RHD1xKqEhD+e4dSgY2tfINcI
         RLRONPa2DxNj0l6k2qY/scZJO7p9IayO+BYg87NLButbzhLYwTh7Vpxbm7fdXej4s9sc
         hy6ShONmVwMMCO8KCUMXMjH5xSKlIkQIvYygZ0xb8iSJWoxRxw5VnKr4J6kfbctNR6b6
         DBoQ==
X-Gm-Message-State: AOJu0YxEZXTmvikBWQITepJUrWdg8ZIFIEsyc4EoCU2NASpcLXbCStUH
	ogZTSFtB/Zh4WthJFbcWnTxBjN+EiBxvKckfEjM=
X-Google-Smtp-Source: AGHT+IGPLvyZ3kdlus0znWz/e0967hWAWD55LSsq42/n5tdRk22r3nVsQZbJiOxY4+nTTgUC6BDEaomdDCNfHWM/QSc=
X-Received: by 2002:a5e:8c05:0:b0:7bf:31bc:66b2 with SMTP id
 n5-20020a5e8c05000000b007bf31bc66b2mr87040ioj.6.1705106321993; Fri, 12 Jan
 2024 16:38:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com> <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
In-Reply-To: <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 12 Jan 2024 16:38:30 -0800
Message-ID: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
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

On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google=
.com> wrote:
> > >
> > > The z3fold compressed pages allocator is not widely used, most users =
use
> > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > dependency on MMU, and zbud is a more common option for !MMU as it wa=
s
> > > the default zswap allocator for a long time.
> >
> > Johannes and I were chatting about this the other day. We might be
> > able to disable certain zsmalloc behavior in the case of !MMU, making
> > it available there too. Once that's happened, we can outright remove
> > z3fold and zbud, and have one allocator to rule them all? :)
>
> (Adding Sergey and Minchan for visibility)
>
> I didn't want to bring up the zsmalloc MMU dependency in this thread
> to reduce noise, but that's also what I had in mind. Sergey and I were
> also chatting about this the other day :)
>
> I thought deprecating z3fold is the low hanging fruit. Then, once we
> can sort out the MMU dependency in zsmalloc, we can go after zbud as
> well.

Makes sense to me. Should we do the same thing to zbud? We probably
have even less of a case for it, no?
