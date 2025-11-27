Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ACA2D3EDF
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764217352; cv=none; b=GvvLrbdEqi8cYvZvNt7Iz2uvv25UQ7JAKC8Tbl+1mkSq5NEjBEz8sU/NjQJUw0L4H3PxCOKNkGkeLKF8lqEsSfY9SmdzNIO6CTg4I44MgGKggFFxYFU0Q4NNfdgnIgbIB7fCseubF4NiNPeobknsu+KSs++OBGkTwcTSX6zR57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764217352; c=relaxed/simple;
	bh=2mT8NkA8n4pI7iGhBuPOIC9L/ZbQrFHsOpjeHsUJ+lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM2htURF+aozzQjatZyCAW/GhuI2cFHtQPLYmNpTApXOOl41Q4PPKMdg8YeRO3RWSM6j+G3KVr77ZP7O1sMf+ciV3NCLThkJ01saYFMTSKEhvaaXKMt/bQfBf6nsfgxD6NYRvYDrwa1odGlPTlINdn/3qrpBIxuPQij0sd0CD8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7yQyXt7; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7yQyXt7"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2148ca40eso56144785a.1
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 20:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764217349; x=1764822149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=N7yQyXt7MJCwyZC+EOBidc0Ngp53O5fj1FeeY4mozOx0B9EUbnMyN0jA8rnUEvHNvX
         55TmAoN0CLo7iNDwBB59aUu9YqyFOIX1xMLJOsBbbxU9YTVCryHrBz4hBqKPZTTuobTt
         70Yft36mQ9Fg3Snv3JK/Xt7ZsxeiZLlxjcG8CmYQPoBdsB5/WFGYW9AStnTzIF6wW1mT
         s2bTT6K4MaIEAYWi2cPCoTdvPHpVWvlSAOoKmpyXy+p0Y9uNepcqmUtzh4CfYftRJwrF
         3XPWHbMLfrMeIzvgPtsCNEXLeB9V+LWCszV6+ejlE2MZCDDCSM5Ih/tbIkCz/w8EwQ7b
         iBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764217349; x=1764822149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=DmUeqZGm426bSMt3n3Xbk7yuOIamKpLlu0QJ0THcOhdAldeFDTE/sZZLFbU/LfLf/e
         VQP6wdFcD9zT48uciGk8ynfiFRhm+ma+Pkoiq6ymLbApWfCw2FnSms5r3mfjkc6SQNNb
         Ziqiu6qgK1PJa6UU8XchMIrn2SuHMcFCiqIk/E7h5QmNtMeloO6j9wORKOF2s8YXuK3X
         FOTf6gXzng8+sg8k6HUqy3OlOS1SG92qBLlerI4xUFz7yrdlvxx1pi0n1eI8027pynwc
         dK1MxuRZmtkMpC2zMKia080CShsJJ7Ta7+xWUBuPL3s1D+4pB70b0gsd+Ia1PNw6VtW/
         GZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwTCNLiCUN8HKZDgNxlhFcImEY8qKtkXZoJOFznXAKXxOfS0nCWCquGI7CpYJ//sJOF+GVfADqw8c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk2YwDEMibe3kvGcBvAtW15L+eQRz/fYmC5DKn7dY8naelwdyH
	q7GIOn7Ih16VbRo7o34H+wMKVkZV3K7buA6ogB6AunNwfWURErpaSlrktIvW4r6JcwaBRaEnrho
	ZxSp9FXKi+0PaUI1yHFWrk5BqiWGINWU=
X-Gm-Gg: ASbGnctbgblIWUkdsXIAZ6jySkw127dXlC9ukQK0532YmNXsf05Pxupppq1bcluVGd4
	NobEU0omHvw6lzX+O/hIIpfyTQtW71ATPl9iUNl5kpwx7jCezPfC575Ay0Tvme2J5dH+pqnMRNV
	LvxZ2Ek4kFqRnpyXxkzhmwqq8ajtRK12Ac2guGMmgB55yyG6fmr7Lr7tWGnjjiwIUilDcmX4ed1
	b2ZliXoh4Hz+cm1ZqAheEMn2pbDjWK3JGXP+AQCSgnJgKym2Fdv40b5iqiXymppveNbj8yWfWov
	w220
X-Google-Smtp-Source: AGHT+IF/2OHEG3LUgPMXOJw4DDaFf/N1kDbkxj4PlQ+jOCs1AfpUOxHzVBEY8oHxETzeiPPKmtGSMi/k9qIz1abldeY=
X-Received: by 2002:a05:620a:44d4:b0:8b2:f9ac:a893 with SMTP id
 af79cd13be357-8b33d49a4c6mr3106281485a.66.1764217348492; Wed, 26 Nov 2025
 20:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
In-Reply-To: <aSfO7fA-04SBtTug@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 12:22:16 +0800
X-Gm-Features: AWmQ_bnJyCR-GwS1_fTaB2mJ8nbB2MiVvoC0dBi_6l0nwDIR-Nl2i2LJsMX4LWo
Message-ID: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Barry Song <v-songbaohua@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Oven Liyang <liyangouwen1@oppo.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > There is no need to always fall back to mmap_lock if the per-VMA
> > lock was released only to wait for pagecache or swapcache to
> > become ready.
>
> Something I've been wondering about is removing all the "drop the MM
> locks while we wait for I/O" gunk.  It's a nice amount of code removed:

I think the point is that page fault handlers should avoid holding the VMA
lock or mmap_lock for too long while waiting for I/O. Otherwise, those
writers and readers will be stuck for a while.

>
>  include/linux/pagemap.h |  8 +---
>  mm/filemap.c            | 98 ++++++++++++-------------------------------=
------
>  mm/internal.h           | 21 -----------
>  mm/memory.c             | 13 +------
>  mm/shmem.c              |  6 ---
>  5 files changed, 27 insertions(+), 119 deletions(-)
>
> and I'm not sure we still need to do it with per-VMA locks.  What I
> have here doesn't boot and I ran out of time to debug it.

I agree there=E2=80=99s room for improvement, but merely removing the "drop=
 the MM
locks while waiting for I/O" code is unlikely to improve performance.

For example, we could change the flow to:
1. Release the VMA lock or mmap_lock
2. Lock the folio
3. Re-acquire the VMA lock or mmap_lock
4. Re-check whether we can still map the PTE
5. Map the PTE

Currently, the flow is always:

1. Release the VMA lock or mmap_lock
2. Lock the folio
3. Unlock the folio
4. Re-enter the page fault handling from the beginning

The change would be much more complex, so I=E2=80=99d prefer to land the cu=
rrent
patchset first. At least this way, we avoid falling back to mmap_lock and
causing contention or priority inversion, with minimal changes.

Thanks
Barry
