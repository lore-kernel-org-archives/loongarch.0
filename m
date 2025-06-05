Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F71A256E
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151183; cv=none; b=h2G/ut0jbZfo1a6vSoGIjLwhbGC4/85k1nL0AalA6f6f0Pcj6lqL2Tn+0UiTNwlatPozP7qIAh1wujUaGcZFI+Us/HtPMxXePH+ioyCLgo+qMat/hkPrqQHKeY96p4ekMUFgtMUHfsbfgqn+Y7GDRUrflirPZSasekprwdGFHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151183; c=relaxed/simple;
	bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av7kvO5VfW8ENl6SMaUXTGtztZyZflI5OQtRR2s0WilA8kgcPY1JWwM8YebJ3udn2mG/uJW2rbRu9vacbFKUBOqeQ82XKTsx+KBFFG+TjWbzsmG5fcDsDlkMcSQ+wVyZfGlN1XWnrdUCLnbHcEZsN9I70FeeHSZVOYJf/uLZ/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNZcW2H5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNZcW2H5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso2664a12.0
        for <loongarch@lists.linux.dev>; Thu, 05 Jun 2025 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749151179; x=1749755979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=WNZcW2H5vV7NbGUUxoOaezKSmsthU6GO/E49RhweY32dpcsf/76rSrYNknI8uUuf9A
         ozDocZkIrEOdr9RuwZltztGS4TUuJitpUK/gjpQLpsu8AXEXDqL89x5p8cxsszbVwKse
         dW3KmEJ1YZIVYXEd58LSKKwFeX03TpiRtMPtvaRIWAEzFk/W0JEFpd4CGwkvlnKyP6MT
         MnM4GYWdCiuVf9H+2jqEw1ye/PIOvp97KVzmGroF3GstLVVbIGa+1dg/9Wfd5+pdYzd5
         tG5Z2Xr0OyPNCHVAGskwGXadPGfG8iCVgFa1utO0EYuTDwkynbWUlUzCH6Qo8O/3n9ce
         dcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151179; x=1749755979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=xHsvhonGcYfcCpnUknSZxsGoyduCTv/WB13KubZj0F09vxYI6CzkAsiaWpNim/1Pf5
         z83ychfUz2+EAz/3lOuw+qm0HfHN2QbcPerrq2ZEXVSmVLspZ79cxKLctCsy7aCDgCkl
         nzfNWLnZGwRUiIJBXjYjx6gZaqpU1DKC+/jQaz2uvulYE9b6t0DgsBRbRJ30BQ/oHUVr
         +94S5i7d+DS6TmiZbi6Iiz30L7priTPYqUr/ueuWtnTps2G+YXFjhuMDraG/RmcMWpOZ
         P6DH7ckXGNxn7I24UUgyvfpLdXE5XJreKqpu0fqJMdRsNGIXHUtNyzWvZuSL1v3Jp0Bo
         1erQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+I7i17bRJo7NiWSmvvyMzSvP5HMbxxAonDJTeKNPQTedYw6xgmmedkEYgWk36uUBJdlT8AP80sSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwitGHD3UttslWsQbhH/1ZCeSgjbmjRP+1vXg78EmW9Y+rNZMBg
	ruz/ZgJAvLw/AnbbUHabLUK67BS3Is4uvsl3UuMu5guPTjLXf4SzD6gWsrzSWxFbUz1z9qpdQHe
	y5fClOCoyJrcnHO62UsEVm0YwJJ+ATUFabi/kceWc
X-Gm-Gg: ASbGncvZl6n++jOOH1HKid+yllbPV44Ot489ATwAPjq2D2zbuPkLdla6GqqlIy3XLmu
	hRxtjqR16e7G+guLCdINEJwd5BwwuVDWRfbYjDkA70rQiikZoo9KLHNkBhH8kXcrRIAGKdiod9m
	sQW2AXRD5gEBwJitQ6kqpIVgGcDEXQ3QX+ySwJ4zCHV7zkS7YbD9QIZSO5m3hafRsOwKP/HiM=
X-Google-Smtp-Source: AGHT+IE6xDvvoQteJJ/eDt9iDCFywxEWUs1nTALJvRPrcfNFm/URqn6kru8JdI2hpKXp5O/+usizGPrxFzABOYx39mY=
X-Received: by 2002:a50:aa88:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-60774f7ea9dmr10567a12.1.1749151178729; Thu, 05 Jun 2025
 12:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Jun 2025 21:19:02 +0200
X-Gm-Features: AX0GCFsuwLolzPDsrZ1E3v9TrRqv1LcU4kqKEWMPeICbN8OYkLkFBNdY22dpC_A
Message-ID: <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
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

On Wed, Jun 4, 2025 at 4:21=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> The walk_page_range_novma() function is rather confusing - it supports tw=
o
> modes, one used often, the other used only for debugging.
>
> The first mode is the common case of traversal of kernel page tables, whi=
ch
> is what nearly all callers use this for.
>
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memo=
ry
> which is not described by a VMA.
>
> It is far from certain that such page tables should even exist, but perha=
ps
> this is precisely why it is useful as a debugging mechanism.
>
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolve=
d
> to use the kernel page table walking here.

Just for the record, copy-pasting my comment on v1 that was
accidentally sent off-list:
```
Sort of a tangential comment: I wonder if it would make sense to give
ptdump a different page table walker that uses roughly the same safety
contract as gup_fast() - turn off IRQs and then walk the page tables
locklessly. We'd need basically no locking and no special cases
(regarding userspace mappings at least), at the cost of having to
write the walker code such that we periodically restart the walk from
scratch and not being able to inspect referenced pages. (That might
also be nicer for debugging, since it wouldn't block on locks...)
```
