Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7217BBB
	for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2OhKu+G9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26f73732c5so1032863066b.3
        for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705337297; x=1705942097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceLGL0enl6PfAsopv7AJI+nA+EII0JrlzYSMhyq0em8=;
        b=2OhKu+G9cEf+V/YcVmox2Ua+qxLprCAZ22irVbDyMjA+S7L4fXhIgqwdSRH6cS8YXg
         REkbN+527/JAEx4uz2GWQRtTrSgXF+oIjROm62SFO4GKyHvOgnjxkl7y7dPxAamiGv3B
         S8prGCuLId7wVDrkkAYUqzSJSYl7qWiQZ5S0tkFSikiaebpa7cZETBOU3eg9orFr3nN7
         HyPX8LfavoGJLQkbEqqdx7uCFfLkv2bDBZAxCxopiRR6d9RIdAo0szTK/RbX+iqV3f/+
         DQ8IbhwbseeA2ix38sZWs3lspJJ3EtIGg1tAcPo+Hy0can3Ieb6fuRD1LMQPJaf0KgiI
         6Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337297; x=1705942097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceLGL0enl6PfAsopv7AJI+nA+EII0JrlzYSMhyq0em8=;
        b=Utg+WpcnCECNWrlDDGscNaMQ4I6KTvwj2EjK2QKZYrzMJXU0hrHci46mF8lABy3HF/
         yY/LmQygjELRUlkRwXAga+bZ1jTtIrGBXslA6P89IQeqJvRm/k+7ivj3tvxSFJ4BPC2u
         3+BiTArAS9mU+UrwlrnGf0IY5AddVduEJG2ceIGQYP2DkSngafF310/u2V5XnxAGgVxg
         bm5miVx6K7Jk1hj+kycLT22BiS6ZLrhQf97pctJ2eo7RsKIMx98I2nRZnxdhRDapX1vS
         so6DQA4EicrLa5Qob3cn11rZdEGpnOHP3v+FKZI7vQ00A1rF0NZJZ6A9I9IowSr5mchC
         n30A==
X-Gm-Message-State: AOJu0Yxyg3bQ7LOnvDmM4BK+D5Z/0cRq9V1P6b53uCHNo1m/ZEF+6YiO
	WToyc1/llfDMgtbYngNHF8yDSFGMJaCuXKb/m0HONTqmddgYsLjOBiMh60tZUJkk
X-Google-Smtp-Source: AGHT+IHNV4MCloqcrGH6S7WU4i7/ZBSuL75kLy09XQg3jP02TmtwtjBL5T0bywpvmu4Eca6GWIIogf7mqkbyC37kOnA=
X-Received: by 2002:a17:907:a08f:b0:a2c:b0a6:8ab with SMTP id
 hu15-20020a170907a08f00b00a2cb0a608abmr3275465ejc.7.1705337297039; Mon, 15
 Jan 2024 08:48:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 15 Jan 2024 08:47:39 -0800
Message-ID: <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 4:27=E2=80=AFAM Vitaly Wool <vitaly.wool@konsulko.c=
om> wrote:
>
> On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
> >
> > In hopes of having a single compressed pages allocator at some point,
> > and following in the footsteps of SLAB, deprecate z3fold. Rename the
> > user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prom=
pt
> > with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> > defconfigs.
>
> I believe that having a single compressed pages allocator is a false goal=
.

It's not a goal in itself for sure, but when most users use one
allocator that is mostly superior, it makes sense to try to deprecate
others.

>
> > Existing users, if any, should voice their objections. Otherwise, we ca=
n
> > remove z3fold in a few releases.
>
> At this point I NACK this patch. We're about to submit an allocator
> which is clearly better that z3fold and is faster that zsmalloc in
> most cases and that submission will mark z3fold as deprecated. But for
> now this move is premature.

I think unless there are current users of z3fold that cannot use
zsmalloc, the introduction of a new allocator should be irrelevant to
deprecating z3fold. Do you know of such users? Can you explain why
zsmalloc is not usable for them?
