Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CDF12AACC
	for <loongarch@lists.linux.dev>; Wed, 24 Jan 2024 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706132464; cv=none; b=M9Pb1C8Gb1ag6xkkyd/upr0bOJSLEPP2kuL0eB178a6uYEvc77vg/orc//wgy/WBAtSct6I2XlzTOnZGlGiJvs/kvkxdrmPDBz5fCRq0EYlhczCWLLpJiKUON83ThhUNAuIv+brZv/3oXe0FKPL/LcMzlH4Q6nm1U/Uz2enD3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706132464; c=relaxed/simple;
	bh=h2pMHNUPDN5L9NC6BjA+/uSmMRdFqfJVI5fk0u+98ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjaX5enayJST+VEZV6pIOPNiFlsNPamKTgGaE3P003n/GFPUcR16wdfjTAWkbHK4lwdyBz/XicrPd3VSRm517JbDzm8mHfBNNtEXXQon3qGAKNnwUZvUvTCqT6Vk1rpwsLIvukpsoLBvekE7dTEiF9juZm/cDzbMlduGyHIa6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtpQXHvx; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtpQXHvx"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2c179aa5c4so638206266b.0
        for <loongarch@lists.linux.dev>; Wed, 24 Jan 2024 13:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706132461; x=1706737261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gdx+IUjeaUFcylNxhLz8scMMaJ9E79xhrBh38+G7OAE=;
        b=jtpQXHvxiF+YfHB2P0YBuaAQRxCfWat2twqWyj+Kb0lMnZKKM1outtRUEBlKG5HjGx
         peQOaQJa+oZZzV+jqUYLitmAmhvpOi6fd/28IcKT/z0HmElrR6PgRIWX0FWYvJxgq6bz
         DCArvMC1TxwHPLLUlMZ2lQFctmplNVRvYcDL0u7fuPBkxhese4mR2C2p1s6iEkxkC/Tu
         uZIivYsFXpnw6aFS3MHQEAY/U+j21ynjOwGoC8JUt9M73wCfrODd3b2+uneNVzdfVw/j
         fJTq5Vl/b0nxd06hEibL9Sfl9o9xGdTC8Z77YhOv9+13GsMbRSl8uQyR3gKcQ5ISAQYJ
         zH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706132461; x=1706737261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdx+IUjeaUFcylNxhLz8scMMaJ9E79xhrBh38+G7OAE=;
        b=IwD/2Q+lBc6/JqOEEhL13PSsTAvtFgTeJ/Lqx5xL626/YqJNjuxfz089rG8E8zHZZc
         l429JqQT7mA5Eo625p0mg52VCN6ekSfagXZFdu1KHiHXiPkPgdxRdgCF2RgZFte00gVE
         UxBV95R1z40vWPIKCw1weTtaitVHjqW+WAuG85LEnZrhzaTbkP/szmbHbe5LpAYvTvcT
         rWHmG77pFrurFpolFgjVs7z5HOxQXnbUV/VlcbLWmdnu9fTXnmxilQ8aj4vf8pyaM7ch
         A1AKCCj36JPXwnz1HcGtrQ+8tk1tDMGBkVvQ/15xmHELouKh1ygu7BSl17A0QupeCo4l
         EOmw==
X-Gm-Message-State: AOJu0Yyt+52W4BBBSSNcIhersoiwqPx8pUZiNlEJG6e7m//Omg+RWoCf
	dYmOrYOFcmNkv/p5z5dSV505Ln8R4fOjrafrkRUk8oKKlvnOpm5cLmA5a8MxYhY4FllLTg2D+lK
	ukzWbfAQIJlgNwvBX3oEbEAoczO41ucWQi3yn
X-Google-Smtp-Source: AGHT+IFjEoF4u+IMowFOiDBleDGBDyR1EL8Is/Z+o4fzErE2dFPJZE576v7LzN33Rzm2e5yXyrn0pa07Li0HkM6mKxw=
X-Received: by 2002:a17:906:cd04:b0:a30:f55a:b54c with SMTP id
 oz4-20020a170906cd0400b00a30f55ab54cmr1114691ejb.132.1706132461253; Wed, 24
 Jan 2024 13:41:01 -0800 (PST)
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
 <ZaajDheNtqKkCoeD@infradead.org> <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
 <Za4cT3tATxVlMki3@infradead.org> <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
In-Reply-To: <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 24 Jan 2024 13:40:22 -0800
Message-ID: <CAJD7tkbOv9BtJHoCmqxFig6_+oU07yVchV5G0jye3B_XTSRWrA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Nhat Pham <nphamcs@gmail.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Minchan Kim <minchan@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Chris Li <chrisl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:49=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Sun, Jan 21, 2024 at 11:42=E2=80=AFPM Christoph Hellwig <hch@infradead=
.org> wrote:
> >
> > On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> > > Well, better compression ratios for one :)
> > >
> > > I think a long time ago there were complaints that zsmalloc had highe=
r
> > > latency than zbud/z3fold, but since then a lot of things have changed
> > > (including nice compaction optimization from Sergey, and compaction
> > > was one of the main factors AFAICT). Also, recent experiments that
> > > Chris Li conducted showed that (at least in our setup), the
> > > decompression is only a small part of the fault latency with zswap
> > > (i.e. not the main factor) -- so I am not sure if it actually matters
> > > in practice.
> > >
> > > That said, I have not conducted any experiments personally with z3fol=
d
> > > or zbud, which is why I proposed the conservative approach of marking
> > > as deprecated first. However, if others believe this is unnecessary I
> > > am fine with removal as well. Whatever we agree on is fine by me.
> >
> > In general deprecated is for code that has active (intentional) users
> > and/or would break setups.  I does sound to me like that is not the
> > case here, but others might understand this better.
>
> I generally agree. So far we have no knowledge of active users, and if
> there are some, I expect most of them to be able to switch to zsmalloc
> with no problems. That being said, I was trying to take the
> conservative approach. If others agree I can send a removal patch
> instead.

Andrew, do you have an opinion here?

We are not sure that there are active users for z3fold. It seems like
we have all sorts of opinions here from "don't deprecate" to "remove
directly, no need to deprecate first".
