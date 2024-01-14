Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9341078B
	for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OeDqU03V"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd84600920so45363151fa.1
        for <loongarch@lists.linux.dev>; Sun, 14 Jan 2024 10:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705258192; x=1705862992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhMTxPmt0/flYm2bklU2LyKEn+DRcXTdo6lmYP/96pY=;
        b=OeDqU03Viieip6u8jX6syYcrsHCMx7HGd1aiUFmoqTpE+H7KYKzrLvNTt1ZW4jUwwN
         LkzB01SVzTAnsGtSUxlwz13Nq+k+6806/9LyyahbPp8LwyzdUJ6m8nxkgJ9/j/PaGbgx
         JdSiOGf8+LQzpMUmCZaPJ7Rmnc5i8X3A/+C1ezyJ+m+UgK69WDpVTXTIsaVHDpsGqWMh
         MFgIOjruAh2bFOKVWWYwYMJArhI2/bnIlzDkRulBgO83G+j6Mb24vB9hSA4bGtnreEGF
         VzFneIqrcxUl0OOsdPX+93lDLnz7U+onkVyKwfJwvzo/79Zs4N+c9P8Fx3wuFLDm/hxw
         bd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705258192; x=1705862992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhMTxPmt0/flYm2bklU2LyKEn+DRcXTdo6lmYP/96pY=;
        b=LtX4LV1T6JJ10NyvDW7IAo2SF3tZmV8jADlZjif+UBFWhyAiHJBCjf8aPUmAN2KFnu
         HEQnpVd1okXiUopZE7mXyHMBst/J1aX2IJtvBwh4Qbbpq/wPVzg0DiEnVKZhpyQKt4Wh
         bqWqMA7lcneYwPHFyLOrcfm5sGPEI3boMuuZ0FNnGJy3Mzet3rhjVAoUfT48NrJSqFd4
         v//gEhVrDI/0/hSphVhfEP3fSALMO6NB2GYkfjFIHXKxBFWSy4/ZSeQcyvZYUP78VNPn
         kshxrQI8BNCgndJWERd4qurnzmfTts1ML8xTOjkitXs+3JGTCEM3GGqr2YQhQOXvq7Zn
         SJIw==
X-Gm-Message-State: AOJu0Yw4f2s0JKnhb+natZj1+3BifROjIG9qpEeLhpvWtaaPoVjlm59R
	YlpCgn5rbNJOikwTtQ4MivyuGGawH71XNPbwrSdnxQiWY0qd
X-Google-Smtp-Source: AGHT+IE/ZJhQ+UJe7SuwAe0k40YNaGinhlOrjQPNpsEA5fIP8FVoDZruH+nhmxgiR0kdZREz4OcNJrLV9g6Q4YXwnlg=
X-Received: by 2002:a05:6512:1186:b0:50e:cc3e:2f30 with SMTP id
 g6-20020a056512118600b0050ecc3e2f30mr1496009lfr.109.1705258192392; Sun, 14
 Jan 2024 10:49:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com> <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
In-Reply-To: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Sun, 14 Jan 2024 10:49:15 -0800
Message-ID: <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
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

On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > >
> > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@goog=
le.com> wrote:
> > > >
> > > > The z3fold compressed pages allocator is not widely used, most user=
s use
> > > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > > dependency on MMU, and zbud is a more common option for !MMU as it =
was
> > > > the default zswap allocator for a long time.
> > >
> > > Johannes and I were chatting about this the other day. We might be
> > > able to disable certain zsmalloc behavior in the case of !MMU, making
> > > it available there too. Once that's happened, we can outright remove
> > > z3fold and zbud, and have one allocator to rule them all? :)
> >
> > (Adding Sergey and Minchan for visibility)
> >
> > I didn't want to bring up the zsmalloc MMU dependency in this thread
> > to reduce noise, but that's also what I had in mind. Sergey and I were
> > also chatting about this the other day :)
> >
> > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > well.
>
> Makes sense to me. Should we do the same thing to zbud? We probably
> have even less of a case for it, no?

Do you mean declare it as deprecated now? I initially thought that
would only be appropriate to do after zsmalloc has no dependency on
MMU, so that we can confidently say zbud has no practical use case.
