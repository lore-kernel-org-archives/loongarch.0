Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52684A27
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041657; cv=none; b=qMhuTuFYrpM+ZcHqHgxX4jHuv57B+OGgp0K8pBpcaj9CZ3T5lO35c8RVGVIWhuAovwIkXXkXgacPXkXeVNqNlnQzHMABUZHXneIZCPnJuvfuaRfRUxKDjeg6v1owuzI3MttDIPt5nHAdKiVBqGsLOJ/Q4GRUuYUSmctUPfn8AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041657; c=relaxed/simple;
	bh=0sQ9CcuwNmnt4bKftEBHMaRCYgOPu5Lyc31KuvZDi60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiNbThfad6vEGhigTPgjN6LaGnImuED25xBFR58UB9lVX8kaRFtZ7xzSwBxrjzHD68yfOGVKUfeKTsnniJM6h3zyK3CqbZoYHNq2+CS3vv6+44tFjX0pIsu+53qCRDWfGGsNfKKOdSJM8iXyJMiFAuLdu5P+eEILhWrlPXCk4LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=NZHikQwT; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="NZHikQwT"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db2315d7ceso890069b6e.1
        for <loongarch@lists.linux.dev>; Wed, 07 Aug 2024 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1723041655; x=1723646455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=NZHikQwTjuFgHC8lGf7YhYRao+IErMXZ2BTAtJq+/Hj7M4AL8s3X2VhhVJBXDqyEAn
         o4CybENspxY3rMneTuPnnu+limdc3Gps1/+f1Lr3ZB738CtkW2BOG+GutezePG/XxXmy
         vtaiZPStsFkYhydORB6aPuwajYWvcAOX8UnEwX6rcCRkKe4MFAuKyAdLyF/YU2BBAvSB
         YCzudhH3M1HPBHJjDAalzD+YAgb+hITmjUweqFWeb3uNQYpq56eJYACb9c1BGan7extd
         ghtHtgjXbkfv0cfTQqt9MOKsLvdEGPmS9lZRaswX4iO3Kqx55egbrBIo0mfYdSk+3D5+
         N/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723041655; x=1723646455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=qQ+QkKeNUT9B+hTDek+uhFgX1uJxKqcfQGbPsI4Li4RGJ6ju9XmIZwgxldVVLFfD3c
         BwvgyfsoaAYhaRKPw7qf7LF/+Ne8wy/hl2O8j4/vC/9nBHimoGedcDDhbskOYSDhw6ri
         igxoxOziwLb7xQ4uw/tM2I1/jad2gOVNaiaE53hVzaGuQ/uVNsaG6atl9vQZZCdKNasw
         1LZDAkbuiuw3gMAzKjBIkcJs2NM0CSMMuShTtgQFEENIriwIQ8gQ7oJyAeMmTeBiU7SI
         TCcqtoXw6NZ3RZRxcBFPDryg6uEeiyNoolFnhAMLVsXhDfCrVk1izGDh27WOQu4iHhth
         5T7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNtqrmZt99ZtQaezRSOASEQQ8wRG6JsBJ1sYPbGlSugcKBmvrV35hX2kvI3sCKuOz7KIrBtug3bdZjHz4R8vd7DTStN4bejRyc
X-Gm-Message-State: AOJu0YymeXu6Xm15v9SCmskKNXWh7rTq+QdKZEaNdiCXuyn8XS9ZVfAd
	F8FD2fG80nCWpy9D7ZqtoVVZarmBUe8FDXHdq7au5JxAbbb/HC+BI0uWxRqMAB7EH9nwXhks7Xn
	ZSk4bu0BWdi8L0QufMphC03SYwdT5UXUydzJcyA==
X-Google-Smtp-Source: AGHT+IGOXQAzEiXp6xdPGUMTTnKI09YBOs1Vk6kj0LXvCI51MvBrgaaI5JzS3LcBWq8pGTljqab9RWCOjdJxV6Tr6zo=
X-Received: by 2002:a05:6808:130f:b0:3db:251b:c16 with SMTP id
 5614622812f47-3db558397b9mr20918330b6e.42.1723041654777; Wed, 07 Aug 2024
 07:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
 <20240806221454.1971755-2-pasha.tatashin@soleen.com> <345ba221-e094-47e8-9481-562faf4acd85@redhat.com>
 <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
In-Reply-To: <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 7 Aug 2024 10:40:17 -0400
Message-ID: <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
To: David Hildenbrand <david@redhat.com>
Cc: agordeev@linux.ibm.com, akpm@linux-foundation.org, alexghiti@rivosinc.com, 
	aou@eecs.berkeley.edu, ardb@kernel.org, arnd@arndb.de, bhe@redhat.com, 
	bjorn@rivosinc.com, borntraeger@linux.ibm.com, bp@alien8.de, 
	catalin.marinas@arm.com, chenhuacai@kernel.org, chenjiahao16@huawei.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, 
	dawei.li@shingroup.cn, gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, 
	hca@linux.ibm.com, hpa@zytor.com, kent.overstreet@linux.dev, 
	kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev, luto@kernel.org, 
	maobibo@loongson.cn, mark.rutland@arm.com, mcgrof@kernel.org, 
	mingo@redhat.com, mpe@ellerman.id.au, muchun.song@linux.dev, 
	namcao@linutronix.de, naveen@kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org, 
	philmd@linaro.org, rdunlap@infradead.org, rientjes@google.com, 
	rppt@kernel.org, ryan.roberts@arm.com, souravpanda@google.com, 
	svens@linux.ibm.com, tglx@linutronix.de, tzimmermann@suse.de, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 7:50=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 07.08.24 13:32, David Hildenbrand wrote:
> > On 07.08.24 00:14, Pasha Tatashin wrote:
> >> nid is needed during memory hot-remove in order to account the
> >> information about the memmap overhead that is being removed.
> >>
> >> In addition, we cannot use page_pgdat(pfn_to_page(pfn)) during
> >> hotremove after remove_pfn_range_from_zone().
> >>
> >> We also cannot determine nid from walking through memblocks after
> >> remove_memory_block_devices() is called.
> >>
> >> Therefore, pass nid down from the beginning of hotremove to where
> >> it is used for the accounting purposes.
> >
> > I was happy to finally remove that nid parameter for good in:
> >
> > commit 65a2aa5f482ed0c1b5afb9e6b0b9e0b16bb8b616
> > Author: David Hildenbrand <david@redhat.com>
> > Date:   Tue Sep 7 19:55:04 2021 -0700
> >
> >       mm/memory_hotplug: remove nid parameter from arch_remove_memory()
> >
> > To ask the real question: Do we really need this counter per-nid at all=
?
> >
> > Seems to over-complicate things.
>
> Case in point: I think the handling is wrong?
>
> Just because some memory belongs to a nid doesn't mean that the vmemmap
> was allocated from that nid?

I believe when we hot-add we use nid for the memory that is being
added to account vmemmap, and when we do hot-remove we also use nid of
the memory that is being removed. But, you are correct, this does not
guarantee that the actual vmemmap memory is being allocated or removed
from the given nid.

> Wouldn't we want to look at the actual nid the vmemmap page belongs to
> that we are removing?

I am now looking into converting this counter to be system wide, i.e.
vm_event, it is all done under hotplug lock, so there is no
contention.

Pasha
