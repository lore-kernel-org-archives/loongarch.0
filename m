Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17633D3A7
	for <loongarch@lists.linux.dev>; Mon, 22 Jan 2024 20:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705956585; cv=none; b=H6W0bL+Bun9GLudemJwZqyN+ry9GLmgfRTxbIVYOrzgAPi7YsnamqAae6L/PASvGa4frgifbc3Tu5EOXzi7K/5XTHzjbz6le7JvojYbum7FLv5dgJGCSdguNPTPcP7jjUOP42rglQIrAReNGks9I5pRQYl8Yqky38GNBd+0L9pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705956585; c=relaxed/simple;
	bh=SdXY8CiXrmjedskznqjXh3EpR/m7I7Z86jZgumNYW7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ+EY9UbUrapRZH0S1Vp6xYAtOGXV5u4wylSa+h2BHjPLf8uk0BUw/JTVkYqp0Ob2w3KSMT3tijdwvylKNygnnou0RqTf6pBnyM/ZMfWYJRtgVgdFH9eldUH17bRvaRauoWmhESv+/P37KQ8qdxfCYNHD+UbbW9BCbDDNmAEf/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cisa7cZp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cisa7cZp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28a6cef709so357829266b.1
        for <loongarch@lists.linux.dev>; Mon, 22 Jan 2024 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705956582; x=1706561382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3IFgXkLl95HUfhHT8xvYlvUcRJv9Sps5HuKi7yJyr0=;
        b=Cisa7cZpMv3ke18/hcVdeFkMmQUXg3kJDjQQqP9kNjOVFlD0tZtb5MltdqwwGlU+Or
         XNaMQzhCTWiE7bd1Hxo4uYcam2i5MR5n4ywDeOZUdzEh2bQVJTyZTVIaFiwJCv+SlHJO
         wLwk4U9vX2I0ItpJtP4ugYKuFcJREWhWMzFohMdNK3l7IUk9K/Ef3YSEiUnL0O42u8Fj
         /hliCroztEpDZmGGEL9Fh99aSIBlTnBqWPUzkqNuQNtiUSVgDo2x+KbvOKTjVT5mIHBo
         wfL7SA5A8Ax1aElsciSACWvqSHXmUBamaz2/oQgd0MnM2xmIQwijmf9jmneC+v+XVXLR
         cFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705956582; x=1706561382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3IFgXkLl95HUfhHT8xvYlvUcRJv9Sps5HuKi7yJyr0=;
        b=xPnx0cwDEunuDVvsR/hQst8GIbtLN6Ymn1pc1BuZ5AWoySmMjXOTf5hZUIgW2272lZ
         cAOCQIX8fJ+gskZCMcbzWlq45MLZv4PVVQKXvrdpLzGUZ7iYw+XzYTv+F7Dip9wiYGcq
         JWgJx9rBFDT3wSjJY8oOdDeRyiuz1C4jAwtBKuSQ9juFCBFkHxRBrJiSpgNjv8aGmGNL
         OC4nFpVMPpBsqy69P1+OUBZEtt+FHrEEzHeJlzt2qWWDr0SLVeRUJtuEBuoori16imho
         LfTDmPCSmY8joX4CQqcghXmM3z2uHD8XAKGPhOceYyN5G2sH2q6oY6UtITKhymzy18Op
         /zdQ==
X-Gm-Message-State: AOJu0YyazHpDlv4MnWQkxlL28QAvk2OKUid1M6mLSaAGW8dy3bGt3rGk
	MgOGKbKi/w5c4s3YfNx6f6vPmLR3+1Zc8s9JQQACgWp5+skFo9t5ACglIqx8bPgkoCeBA7mqzrS
	ft2WMGBpnIjl4/9Zy36fafNngcSr/mln1yDXY
X-Google-Smtp-Source: AGHT+IHmoA2jzTQf7fFoYCB9p19IElaggUb5JNtVRvLZRR2GWNFR0iDWTD7SCEap+uVo0WQVp+gXFBeD6HpBvfznDFE=
X-Received: by 2002:a17:906:3a8f:b0:a28:b574:8551 with SMTP id
 y15-20020a1709063a8f00b00a28b5748551mr2420412ejd.147.1705956581807; Mon, 22
 Jan 2024 12:49:41 -0800 (PST)
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
 <Za4cT3tATxVlMki3@infradead.org>
In-Reply-To: <Za4cT3tATxVlMki3@infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 22 Jan 2024 12:49:05 -0800
Message-ID: <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Christoph Hellwig <hch@infradead.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
	WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Chris Li <chrisl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 11:42=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> > Well, better compression ratios for one :)
> >
> > I think a long time ago there were complaints that zsmalloc had higher
> > latency than zbud/z3fold, but since then a lot of things have changed
> > (including nice compaction optimization from Sergey, and compaction
> > was one of the main factors AFAICT). Also, recent experiments that
> > Chris Li conducted showed that (at least in our setup), the
> > decompression is only a small part of the fault latency with zswap
> > (i.e. not the main factor) -- so I am not sure if it actually matters
> > in practice.
> >
> > That said, I have not conducted any experiments personally with z3fold
> > or zbud, which is why I proposed the conservative approach of marking
> > as deprecated first. However, if others believe this is unnecessary I
> > am fine with removal as well. Whatever we agree on is fine by me.
>
> In general deprecated is for code that has active (intentional) users
> and/or would break setups.  I does sound to me like that is not the
> case here, but others might understand this better.

I generally agree. So far we have no knowledge of active users, and if
there are some, I expect most of them to be able to switch to zsmalloc
with no problems. That being said, I was trying to take the
conservative approach. If others agree I can send a removal patch
instead.
