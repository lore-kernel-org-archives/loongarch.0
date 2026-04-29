Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B05396B8C
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448484; cv=none; b=dqd8AHxCL/eGcvr5xN8VuFDzMol2FKiv/jxcn4nJ3nvzRuk6WLqcqHA7aeSwvjf37h6GhvX1or+X81ir2qM6gW1e/MuQXnZqL37Z/qFwx/AOV6Zhy0Vx8C55eM0IyXkEheNXqz0umBEHRVK0YSo5owshG89eE7to2uEGW1d5+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448484; c=relaxed/simple;
	bh=tfgltojnPARN6P2pY2wDnIJyy7vczKs8oP43rS2BJ5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEZKmgNPc9jPhhVa0mTfFTMHGevUL9LGwi+d1oJXim5hrGvB7L9mONTG+54WpksBYM0RqN4jpo+BjH0Por+rZzJTOGwMQuQyQGFoqlgIdccEXG8bHmqzSqKPtG9VTcX2uLASealzy78g8oi0eCI/9g91ZLJIGoutL9fuROP7X80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyJEEuZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyJEEuZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19340C2BCC6
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448484;
	bh=tfgltojnPARN6P2pY2wDnIJyy7vczKs8oP43rS2BJ5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uyJEEuZKjxH4ZN2DxKHt2uYNlk9wW/z1JpdRIFsGPqYBN4LcSoLrLWWan8VWN7QYm
	 S8RvyqqViRP4sbouAaOeMIoCYyKUC+zJ35U8v/99sbIBzTSzpPx1rwV7xQ+CaptWbG
	 G9yYMaPLogtu94iMiMpAZQJ30s2teORQUeXWG9ierXLstzssuXK7DE5X4sz96bEzQB
	 y3aHnJdK30Mwd+St+yqBhO2Fe5pyj3I42he7zudCDPEoUhINbKzoMCxxBzkIYNC+NI
	 HBs9PB8zuJimeQ1845lj8Y6TAEWFa64bNGNyU1nfSVuWurWpsPQu0/VYPKsC5QoNAO
	 YObq9jamcfrzA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so8175535a12.3
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Ui6HZiThJaj/Cnj6NfjJj2Keag/5usFiYYg7cfK/jDLf8nG7RLQwvlsM1+k4IntQ/IURx8TGfaKI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrs4WYEfq6CyhcC8V3sBxvqPdlTrEAkXFZNHADjFLey+UBluYK
	PKM/HMSzpeIFXFztDSfp1jZcvsYAoxpTeGgPDwll0Bu5+3nVG2Fk0us2Ywlx7YMey27OKn3KEqj
	NbGGd1WVErVp+Tj3lbk8VcBbAI3hzzu0=
X-Received: by 2002:a17:907:6d19:b0:bab:14bc:165c with SMTP id
 a640c23a62f3a-bb80472760dmr372932866b.29.1777448482612; Wed, 29 Apr 2026
 00:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428131138.409698-1-cuitao@kylinos.cn> <be0a5d0c-b2c9-67f5-7497-977acc6fa1f9@loongson.cn>
In-Reply-To: <be0a5d0c-b2c9-67f5-7497-977acc6fa1f9@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 Apr 2026 15:41:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Hat1rJywzw2CoLZYf=+hXea35zsvT+xyBOxPVk0z0ZA@mail.gmail.com>
X-Gm-Features: AVHnY4Il1GlXcRvABafIK1RFhH35GTOWvNzS9_44Kofd646fhU6We0zY17F8xNc
Message-ID: <CAAhV-H5Hat1rJywzw2CoLZYf=+hXea35zsvT+xyBOxPVk0z0ZA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch/KVM: Simplify _kvm_pte_init with memset64
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 3:34=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2026/4/28 =E4=B8=8B=E5=8D=889:11, Tao Cui wrote:
> > Replace the manual 8x loop unrolling in _kvm_pte_init() with a single
> > memset64() call.
> >
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> > ---
> >   arch/loongarch/kvm/mmu.c | 16 +---------------
> >   1 file changed, 1 insertion(+), 15 deletions(-)
> >
> > diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> > index e104897aa532..5a56dd5dcd4a 100644
> > --- a/arch/loongarch/kvm/mmu.c
> > +++ b/arch/loongarch/kvm/mmu.c
> > @@ -122,21 +122,7 @@ kvm_pte_t *kvm_pgd_alloc(void)
> >
> >   static void _kvm_pte_init(void *addr, unsigned long val)
> >   {
> > -     unsigned long *p, *end;
> > -
> > -     p =3D (unsigned long *)addr;
> > -     end =3D p + PTRS_PER_PTE;
> > -     do {
> > -             p[0] =3D val;
> > -             p[1] =3D val;
> > -             p[2] =3D val;
> > -             p[3] =3D val;
> > -             p[4] =3D val;
> > -             p +=3D 8;
> > -             p[-3] =3D val;
> > -             p[-2] =3D val;
> > -             p[-1] =3D val;
> > -     } while (p !=3D end);
> > +     memset64(addr, val, PTRS_PER_PTE);
> >   }
> >
> >   /*
> >
> what is the benefit of memset64() here? I think that 8x loop unrolling
> is better from performance side. The page size is 16K or 4K and buffer
> is large enough, unrolling seems to be better.
I agree.

Huacai
>
> Regards
> Bibo Mao
>
