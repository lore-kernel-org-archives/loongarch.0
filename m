Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CAC3AC0EB
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471575; cv=pass; b=hxdy+vQRB3Doytw6aav6VfeVKvkyLO2+PqBwrV3xuyLqG/ff1awOCNajjLKCrV+KbYTTqzwO6oxegxJfFWfL/SdPhillgvhbU/zlQoYol1StCHshnQ3+qJhE3Y3VtyOtvmnfqKx/KYziMDJ1B/y4smzmc4FqxiRvL/SJAaRRdZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471575; c=relaxed/simple;
	bh=4yYDYtXIlIrCfP2jjVqEgzPnko++m01eM6B6JBOeNrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAgjKNq+mT5wa5YCfdIVFMy86xzbXcq17V5zBXkCbOZ1iUpQPnxWyynCrpYTjEO4cBrxnfpKXzbcESAF5mFAOtA98kv0sDsGUwhMSvbGUxW5zYSzulrX6D5zKuqZl4Qx1DvNQxSQfLkn9SFzz3A1prqZOrjoSIaayfASVDiTBSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIvucT8p; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIvucT8p"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662fa4a4470so932209d50.0
        for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782471573; cv=none;
        d=google.com; s=arc-20260327;
        b=lMsX2Cg6mHGzGsWGpl99iXljaWeH2UFS7qoWPCCMLGAXgvOhcuis5m3VNpsXMpQcpd
         AvTorBYRG+vKZdTNnXvADbDtZvp0FJ4Xt3i+1AUJ8FqbbSA+RojByIVEjnJhhGSVOK8p
         WHB6z+kD/WyLjMtU45w/QC2gCxILdJn6k9Iyss3yJuQqhC8eSIKOna35iqOYp5TMEGQW
         TVgAoqI5k9tRnF0ofOc9DNNRCKhnwAzP+RGn1l9DUo7qvZEA03wiuW1FkjqNilY34hOR
         Xun5DcRor7LrltYhzyp4s+pqKXra34rX186fSlr1LKqXV6eAlWQheaIlhWPBGDbpT13w
         npng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        fh=XZ9V7ajcNnXJFyToZv9jDNNOpNx5qzq4GUr1YcAUFmQ=;
        b=IxRBNF78gQ3dh7aUr2c7uti/A6La07AfY1Kam7aA2JlquBMCp63hLYB/ZUKP50N00+
         xaCUqzOuqDZfBECSRyY80BRCKmjBByjwjSmgxq/2tGUwUs48BcSfb4ESMJxMOZ9Q+Kcw
         IkKvZEKGfsAyaqfLO6c78eF2XF5rAolXdcfbpVBSwZRFpg45q0thTQ0TvglSIW/BDlHs
         aqBO6HcF5zX/L6itZPZIHfQ/PfKrgKCIJYHnm7orwUjkj6rk//Yj9KI2KW5CKZHoMbQ0
         7GcNBFRPhmhqRn0M6Zil1Kq4DZyoxCQAV+C8jlXiwaI6/TyPHRYwi1R7o3/DHXT3jX9O
         jm0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782471573; x=1783076373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=eIvucT8pvatisfO6ZDyP+QfP8EhNV0jMJjConjYVzo2AwRsEnyogtsPhCGTcZ5LBYy
         n7IdLgMwRC6uH1yJIVGM6YuhHygJtU0fQ2RH24+gk8QC3RJkpoYhx/DcJefT3S531L/N
         FzpDicU2m/IuSBdrvpRZZVRdneysfXkAzVwb1gAFcwXicNMiJ+R3VtZs9Ar77zBT7OTD
         zwtHV/IBJRafyO06sqXnettxbgPlHztG3ZbNmn0Nus/tbk0cPgkE0ecPghT0Fmoz9iX4
         GKP4sToRBBnSPDhY5uZ6uoTjLnwhjExaSXUtneOJW+4gLwdk6OzRo4yT1o0bonVc3kbQ
         X2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471573; x=1783076373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=mMtOBODEG0rbV3pfH2d1/cQX05ti6qTAILaGmUtZ8mlMmwJ+qBHrE6cy55uJGc0Yuk
         +oe0c3e+dWUE8n96SWdB5YEnRXbvN1hZqs21w3SlVjGPIUTDOjOLnYYPLCuZGzMlAXYI
         k3I3KhpJdySlaYwpIdzEwVLekBIx1RwHLHLofZWT7AEI7Ax+fIOuYwdnAqECrPHTgPtH
         wQYhcr15vjFyiuEz4LXClgU3BfoLE85LYy7XbIF/u4yk0BWRERATVWcQTuNItl5zBswU
         YhJXAOy+4HDIfOgjJp1mVx/M4ZZf+Y+clkMmD4CA5wbh+xZUbcqtUAeMmBZmv+J46yEL
         HtbA==
X-Forwarded-Encrypted: i=1; AHgh+RqnOJGPGxWawKCZkRJkCgaBpzYYuH0gEDeAEQpiNi2Su04uklTOgKVriL/Lg8crIEumq03Y8RU8JRo=@lists.linux.dev
X-Gm-Message-State: AOJu0YySsQkxwfDRQSb0TYi3zRsSC70+iT8mI9yueotesZyDAv5cs6Ou
	A2A2oNVsy909ntl1R9szqnqhoDkhQHkr1XzvbhsAgykQ3HaYm0weZHBUDMuqQB/u+OyFhYfQuUf
	4vSjQGf2jVCTPu/JQ+bI5+jzFCDXa/r4=
X-Gm-Gg: AfdE7cni3duFMhaBv1cLtP5I0V9KrDNzxxgZgMAHszEeVNv+b7+TgmUBOX58zpH7KHS
	lUHWYBuU690r+bxGTvDr3Ki/xpsNeiLHffHGweuFFwSrqeRFrdHJJnA6fSwqFsOaeraso7R5Sp4
	rZ2QqmuFfXYnpkbZyePNvQSak8btmyeox4kYLs371Aauh2MFQA3q7Ug2JTeNNhXAT98ble1Sjjs
	piEaOwEU45mlfI6m/zx2oUnzqpOfO80IuDTH2U6K3Eiugtvft+QAUelE2VUl9gwkpDLwQ==
X-Received: by 2002:a05:690e:1686:b0:660:48b1:50fc with SMTP id
 956f58d0204a3-66487e2f1b4mr5328375d50.29.1782471573329; Fri, 26 Jun 2026
 03:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
In-Reply-To: <aj426bA-YiOKt06m@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 26 Jun 2026 19:59:22 +0900
X-Gm-Features: AVVi8CeTYWPFnSIqmIZ3cUOMnriJoMgLi6dkY_72NuzlW0NxE1cDivKv2fvqfq8
Message-ID: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
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

On Fri, Jun 26, 2026 at 5:23=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > The memblock API guarantees that for_each_mem_range() and
> > for_each_mem_pfn_range() never return an invalid range, meaning start i=
s
> > always less than end.
> >
> > Several memblock callers still have unnecessary invalid range checks in
> > their loop bodies, so remove them.
> >
> > Sang-Heon Jeon (6):
> >   arm64: mm: remove unreachable invalid range check in
> >     kasan_init_shadow()
> >   LoongArch: remove unreachable invalid range check in kasan_init()
> >   riscv: remove unreachable invalid range check in
> >     create_linear_mapping_page_table()
> >   riscv: remove unreachable invalid range check in kasan_init()
> >   mm: remove unnecessary empty range check in
> >     early_calculate_totalpages()
> >   mm/hugetlb: remove unnecessary empty range check in
> >     hugetlb_bootmem_set_nodes()
>
> I queued this for inclusion into memblock tree.

Thank you, Mike.

Could you please review and queue this patch [1] as well? It does the
same kind of clean up, I just missed it at the time.

[1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gmail.c=
om/

> >  arch/arm64/mm/kasan_init.c     | 3 ---
> >  arch/loongarch/mm/kasan_init.c | 3 ---
> >  arch/riscv/mm/init.c           | 2 --
> >  arch/riscv/mm/kasan_init.c     | 3 ---
> >  mm/hugetlb.c                   | 3 +--
> >  mm/mm_init.c                   | 3 +--
> >  6 files changed, 2 insertions(+), 15 deletions(-)
> >
> > --
> > 2.43.0
> >
>
> --
> Sincerely yours,
> Mike.

Best Regards,
Sang-Heon Jeon
