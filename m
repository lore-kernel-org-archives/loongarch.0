Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C34657E3
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751721; cv=pass; b=RJJvVz6J1/YAhUz4C1fhmWs8WduoOl34LZ7vtdzlK78Y+l9rGd4r4WRMzBanihgfafPVWcLKme8oQ1ltf9LjX3wh4IU+ETDHI54u+kG8cZbKhtgrvRNE/j618gm9rg1L9s1GxG/sq24HOUiE1odRrZSufiqJBkYxShG6yuhnauA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751721; c=relaxed/simple;
	bh=EuAiuVmlCqTEy5Hkkw0uXrTGdiZ3bKlr3/IgmKi3PxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8osE9bVkoFa1km/bEwjC+oCjm3T/foXq6WQLS/FTpmmxhXdIxrvBTBvxnnS8mJ3+pr0jQxYvdPfrcbs1VWi4A+ynjMAKMUkDdof05P2whtaWKB+LaCdx4QgnzN6l7hkDCewnUDogkzYZ2l/YZThYjHfbA3Td9xSIjWwPOQhpKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/dZUouV; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/dZUouV"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664dd23829eso1076066d50.3
        for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 09:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782751719; cv=none;
        d=google.com; s=arc-20260327;
        b=LVgScsmyK9NfQxlSNkYtrjnbEynlF0N/jLTCCIOffUITD94/nybusrQ9gzkDp6F+a1
         jdQUGRP39mFa34EWw0Ivr1Z9uM12sUlJEq1WHRYDg+wVlnrdw5H2z6YHu1be0tkP9uR1
         oA40CT4/lqc4ZuDANXOT01D7TXOzQDD7+sVSp7n7wfe3MZG3gjvaarjS0Oknzc5oC+9S
         CFAj7UXPJ34jXxdcOoSdu05mSRCRHy3etiCFo+3B/sWAk0OmXQH8v//vILZGgZlWq/ur
         /inEX6Eh3D9feOpI4buQ8tE2okzMlx71Q03LasIPS7N82Bg0sg2OnLgCDJxnlAEmeWkc
         aqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        fh=ibF43IYishmMKqYF9QilfPcOXTKxS5OZYkHRyLtqWxg=;
        b=N7yH5BBEmmDyF5TbvljjVWgRCWu0sJPCrb+0cOi93Yf18hwfqCkl7btN0JJwHPRa95
         G1GGKNgS/QVkkJteDsKGS9vfR0KuVvlFu60l3hirqrfLK2CrEGDwBx5TKsesegjESgHV
         Sl5lticpotS0i26YuIkOkeLkxkq+PsYzVoRQ0Y9U8AyYhk3MaQpidTf0XCZCq8jujDGj
         O10ymVLJx+bwVgNDSJbEtRdEYEY0tf7kPsHQXR+ablC3MIPp1cO+rONptBgMSWFOffrY
         4sRy2EAJgxmujbbLRpaAf4YJH2YXq4DJgaRjRcLMzX3FoqkG852k1i+ce4DYWFHO6V88
         AVZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751719; x=1783356519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=n/dZUouVJ+ojEqbPYTv1G3LDSbWz0SoEHzVTXzTMwwkUXFrCRw2QTvhtnq3F8u81Nx
         TZ7PGogPrL8iybw2ydCm0kWHoAm+AB4PzQ6Ni/TInAUHvqI9pTmFJt/2wKI/z2l+pii4
         bMuMMl2BczcNBiGfNqKwqzCtrYegmwfG0uXfKQub6uu5YC1vWmkPLst+eJqJpTMj3Ic8
         9s/x9T5TwqUJFNZojHYG24ol14P2sd5z5dYc+jw9+jhyTwsrlE5p0Hi8sL06hhJoZy4z
         tCiHqS75DCe3gHGLh0zASulYK3DVAOZXVm/JiNU5TzD9L8wucLDlVFw+KEfnG7Z+fbFq
         HLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751719; x=1783356519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=Y8oIskexfQostwx6zPo9FCbc00yAormOHRENKDK7Evb9Pie69B83QBvv5RDogtASNA
         +0TadAXXZk3IaN3S1JvXR5p8hPYOS0X91xu06GHM/zVO7EvxkI+NoLj2QmfsetNXk4MM
         UgWX9AlBs++VIg5IkDBlBFICAXpyXYMQ5uPWSvq/5yqMs1eorwJzKWnon+sDVmU6zXAY
         Sw322Isr1D0uTqzCF5axm1Hxsr13RYqueR3mQqpIektXIPs2TRX0zpcZOVhzdsqewZPu
         GnivOpP3iuOW7dJRmXJiKJHzJd/GskAPEWQjFZhCN9DpCU/PVlfaXjujJSdXjbsz0F4T
         iLWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq320L84gQ/ml2jkx5Es+bfiHE+f2yPS4CARZ0XkwL0HdpF42BT7eVOkvIvVAk43hqQFnEbgDFo5Co=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRY9bz6BT2/SBxz0kWMU4UCNtJpYS+jjlrOo4N0h0Gft0Ehd7S
	K/BN5VPaC65w+sLRjSiZVD8iNE1o7YrjJdihVWoLerRg3aqLAhmlUNgj6MYbqQmiR04dia2dKBV
	tJs3ME127FWkz9/BVn8xsNBoo64Or4cJIII1izF4=
X-Gm-Gg: AfdE7ckbnIpYc3OdFI+xVVf4Y09fnEXoDMwzsKLrvjb6ljTzIQPfx197JdTP0VFyuS1
	QUsU7HP1estNQYz8+y+oEhgEahpWO14UQUYZ+Qsd7A6PRWnMoyLUh20IIYitVbuZHrfRCDnf0c4
	KR52Nmqy0os72d/HR6NpggOMMI8wyMpWe/CB+Zj47jxZe0uUXLSMzvR+tb5DYb1UQAVU5W5cbqs
	Z9mA79y+ygeIgHrhVjh5fMBH5VieZsEJXT4zKI0mnUf6vCShDuyuHgUAnJV9M7GVs5/Og==
X-Received: by 2002:a53:a7cd:0:b0:664:c1a2:36ed with SMTP id
 956f58d0204a3-664f9a828b9mr336123d50.63.1782751719282; Mon, 29 Jun 2026
 09:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com> <akJafRKJJBd5Jrv0@kernel.org>
In-Reply-To: <akJafRKJJBd5Jrv0@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 30 Jun 2026 01:48:27 +0900
X-Gm-Features: AVVi8Ce7e8tTlZ7wLMJcBpYQ1j4KVXqbB4X7R45vGUUSJRnYUp1U99vuoyq3ILs
Message-ID: <CABFDxMFTfFO_jePBnM_uZXcmLBHJM3db-=VzFE+bxSYgm1G-1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
To: Mike Rapoport <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 8:44=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Jun 26, 2026 at 07:59:22PM +0900, Sang-Heon Jeon wrote:
> > On Fri, Jun 26, 2026 at 5:23=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > > > The memblock API guarantees that for_each_mem_range() and
> > > > for_each_mem_pfn_range() never return an invalid range, meaning sta=
rt is
> > > > always less than end.
> > > >
> > > > Several memblock callers still have unnecessary invalid range check=
s in
> > > > their loop bodies, so remove them.
> > > >
> > > > Sang-Heon Jeon (6):
> > > >   arm64: mm: remove unreachable invalid range check in
> > > >     kasan_init_shadow()
> > > >   LoongArch: remove unreachable invalid range check in kasan_init()
> > > >   riscv: remove unreachable invalid range check in
> > > >     create_linear_mapping_page_table()
> > > >   riscv: remove unreachable invalid range check in kasan_init()
> > > >   mm: remove unnecessary empty range check in
> > > >     early_calculate_totalpages()
> > > >   mm/hugetlb: remove unnecessary empty range check in
> > > >     hugetlb_bootmem_set_nodes()
> > >
> > > I queued this for inclusion into memblock tree.
> >
> > Thank you, Mike.
> >
> > Could you please review and queue this patch [1] as well? It does the
> > same kind of clean up, I just missed it at the time.
>
> Can you please resend them all as a single set?

Thanks for considering, Mike.
I've sent v2 patch series [1] that includes the missing patches.

[1] https://lore.kernel.org/all/20260629163736.1606688-1-ekffu200098@gmail.=
com/#t

> > [1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gma=
il.com/
> >
> > > >  arch/arm64/mm/kasan_init.c     | 3 ---
> > > >  arch/loongarch/mm/kasan_init.c | 3 ---
> > > >  arch/riscv/mm/init.c           | 2 --
> > > >  arch/riscv/mm/kasan_init.c     | 3 ---
> > > >  mm/hugetlb.c                   | 3 +--
> > > >  mm/mm_init.c                   | 3 +--
> > > >  6 files changed, 2 insertions(+), 15 deletions(-)
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
> >
> > Best Regards,
> > Sang-Heon Jeon
>
> --
> Sincerely yours,
> Mike.

Best Regards,
Sang-Heon Jeon
