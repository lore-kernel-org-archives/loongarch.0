Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E39286428
	for <loongarch@lists.linux.dev>; Fri,  6 Jun 2025 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207600; cv=none; b=hECYB2kDkZhFsbblVl4vQkojeAsT8Z2D62d8TUrBqu534pBjgA2HgpGii+wd9oXpuXz8RjnKAKqmbwEvVqrX5xiqWFBqLvFYTffOW6rbHk4ZlhvFJOOi5MZvxqtbRD9kGUPmE4FOZd+5uzDM+iweYdyamfDbaWkKdVVCmApIt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207600; c=relaxed/simple;
	bh=Ij6p51RBSpIfTcDNnVZuFN0QIs5BBfAMlgmDV1oy1ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHkUD1nRAspr0xZnUNc7eN9DeutMBDTDSYQqcQQP+7N7S09OX/R+O2wlX8orC79StdABkB/PBeGoAMTKg6ZQZ4t59Pz439vpWSvxW+UVHuYebmWI7q0YnYPOtHgla6t++E9IBXoFaAKHvj0ovmK03VSpOs3k4gVXHkcQwqnhQnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Grg4QiLm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Grg4QiLm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so9719a12.0
        for <loongarch@lists.linux.dev>; Fri, 06 Jun 2025 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749207597; x=1749812397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij6p51RBSpIfTcDNnVZuFN0QIs5BBfAMlgmDV1oy1ao=;
        b=Grg4QiLmM7oWWvVD52+V0OJi+RgqttEdsdUj31ZSMTe5J3cSss+OTZKdXvkO3YcVdv
         bzYidz7iuydlVVV8TqjFu5HUx5eWNZx1ftZ6GXof51uf9G/wIGl6kHSXShGS82yLOirp
         E+Nb2VqgxdiGsMS5NDPziIkgx4uF6IlR8AkgnQkSDLPadnb62bIus8B982NWvqEd4N9x
         O6UK7go7jZTlZKrTHBhkl695cquyi5rgQ/Il+vflEb+7jCqBlIgfJrU+Fm1Hcp0c8Y5U
         NZSVcMdKQY/v+m4CqDainT1vpKA1kzJgvvrCNGCgAKvfXFRmsKv9C9v5gXsSBFo58DEP
         2skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207597; x=1749812397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij6p51RBSpIfTcDNnVZuFN0QIs5BBfAMlgmDV1oy1ao=;
        b=oHROxFUrOb1V2Q1zOBEpaWZjzj65dDobtM4DmHzV3GPJA0nKw/k3zICafmWO8LJYgW
         OadCwEe+xWLwC47wEGPFgJE9OooOXeOjE/QP7VKoEth0Is/Vys2PMcZq0K0HkcE0GDZj
         SwtVtKBLH4oti3vRn1ZSCfuERW2eVaXmBrdBhE7iNla4sC3MLTsHxHSKKgyG+nm+Nl38
         G3aUBQIfKI3/RHYBH0eVgH9PnQseupCnUr8ZttmKu04TmmrGzxfygsKP24PnXoet6tOW
         8GODx18BNkQ3vtdYNaFhrzQnq8QTwp98p57/e/3ZVVpmtC6y5dnUr6i70w11mEtqoUD2
         QiGw==
X-Forwarded-Encrypted: i=1; AJvYcCVRwiMKAZQK3DO5JGomXpQ8WwFU4e9hjvJ1e4LtmnZFIZ6/30CxPRiQ1N5ieaA06dCPTWuDzzPglN8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Mtiu5HTpdnsH/Fb6qImKEPu1Kvt4ZJ92VBjtBu4Ry13ErJdb
	UaMIYpmoVRqkm8okYmTXGMQUhHkLYI/4hr936m8i0z131bdLm4XBJjTej+sb3foHzz9T5vgZ/zZ
	eeW1FSyKdW0FiMpeGPM0HCNsE0xx2R1jZhJuNUJqJ
X-Gm-Gg: ASbGncupG4gy1wpRYQ/2vvhs21kNCCfm/JwD5lGsfBb/M2xb+nGBnoG/yypzbl05IcA
	PgoBVY8gjwMLaE7JkPWMkjnxOgMZ4Pnbydts8caq4v42w0ia0m1DsFBNWNfl5pB7upp0ITmyvgb
	H8IkjhhnanoTqjANWA38CDY/BKZHV9GunsKn7IIIiekGD3iUXUN5K7Nna9vcE+0LMV04PODSNBn
	A0lIBKs
X-Google-Smtp-Source: AGHT+IHxO2eadHOlfPVxuGh+iyeVA+X2FQXWYvnzf8QlbhCwgU3Fgf6hl8bb87wyCATPpiU1tP4xwP8RO2klSRm0ODw=
X-Received: by 2002:aa7:d98f:0:b0:601:7b94:b80e with SMTP id
 4fb4d7f45d1cf-607793d441bmr49798a12.3.1749207596298; Fri, 06 Jun 2025
 03:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com> <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
In-Reply-To: <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 12:59:20 +0200
X-Gm-Features: AX0GCFuSeBKSZUd4LEoLg2wIZ296FSomM3Hd1AfilUwfRktV5EvXRfsEyT3g3G0
Message-ID: <CAG48ez3-QiaT1hSFz64xiucR4azQsrcj+6rQrLoz+d0zd-BUuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 10:23=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
> On 05.06.25 21:19, Jann Horn wrote:
> > On Wed, Jun 4, 2025 at 4:21=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> >> The walk_page_range_novma() function is rather confusing - it supports=
 two
> >> modes, one used often, the other used only for debugging.
> >>
> >> The first mode is the common case of traversal of kernel page tables, =
which
> >> is what nearly all callers use this for.
> >>
> >> Secondly it provides an unusual debugging interface that allows for th=
e
> >> traversal of page tables in a userland range of memory even for that m=
emory
> >> which is not described by a VMA.
> >>
> >> It is far from certain that such page tables should even exist, but pe=
rhaps
> >> this is precisely why it is useful as a debugging mechanism.
> >>
> >> As a result, this is utilised by ptdump only. Historically, things wer=
e
> >> reversed - ptdump was the only user, and other parts of the kernel evo=
lved
> >> to use the kernel page table walking here.
> >
> > Just for the record, copy-pasting my comment on v1 that was
> > accidentally sent off-list:
> > ```
> > Sort of a tangential comment: I wonder if it would make sense to give
> > ptdump a different page table walker that uses roughly the same safety
> > contract as gup_fast() - turn off IRQs and then walk the page tables
> > locklessly. We'd need basically no locking and no special cases
> > (regarding userspace mappings at least), at the cost of having to
> > write the walker code such that we periodically restart the walk from
> > scratch and not being able to inspect referenced pages. (That might
> > also be nicer for debugging, since it wouldn't block on locks...)
> > ```
>
> I assume we don't have to dump more than pte values etc? So
> pte_special() and friends are not relevant to get it right.
>
> GUP-fast depend on CONFIG_HAVE_GUP_FAST, not sure if that would be a
> concern for now.

Ah, good point, that's annoying... maaaybe we should just gate this
entire feature on CONFIG_HAVE_GUP_FAST to make sure the userspace
mappings are designed to be walkable in this way? It's in debugfs,
which _theoretically_
(https://docs.kernel.org/filesystems/debugfs.html) means there are no
stability guarantees, and I think it is normally used on architectures
that define CONFIG_HAVE_GUP_FAST...
