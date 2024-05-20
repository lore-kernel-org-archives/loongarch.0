Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3BBBE5E
	for <loongarch@lists.linux.dev>; Mon, 20 May 2024 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216317; cv=none; b=lexGg4v/kYbYicNJa+oExUrtdiiFXsnyu9TMWhF9iLYc2XGKBEbT6sMjt8FdD1EY0jEQnjiJpqSmD9Xg3xRxYno6imdRdaC0UGeXIRNkbgaBEai+Rw1bol4WoaDYKyUnlH1vR4Y74bjcgpwO3IC1qp5fTUJmOzuQohmFGB+DltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216317; c=relaxed/simple;
	bh=eBqFY/TIoMgxP29NOdWtsaUl5FItN7otD1voKRBdwJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uv4RFCo+Kpsphkt239xVMbx2+5SRHf/t+GuE6HHlBTOvYd2utZzaS6Nq3Aryz5KOWud9GWgmbtCiosxAbCQIj50ay7HyAmcWY7UHku1m/Fe5oS3W4ED6qzf30NLV6XoaNuOsHK4Ad6JROKIfqedFqHShyWl4a0lqb683WIS7I1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq+8eKKI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq+8eKKI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso10532043a12.1
        for <loongarch@lists.linux.dev>; Mon, 20 May 2024 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716216314; x=1716821114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeSLRL0OKsRhD4qQFOfBvy1JJv4XgJp3PPoxz2ixx5E=;
        b=eq+8eKKIuUP/ahfiH/qX7net97yxYypm6n9CZoDj/yQILwtB9myTLqgri6dmNBhPpp
         u/FmQit6dgKqBTqQJ8k7LnxegGpLe8JTVgVi2Ccx+jcWeIGLbX8F8SJonl5bgxUiV9Lw
         XP21GArxdrrJ6PIqYQ24VLi9oMTZI5rbfQ7Q7/AQbP02HWAe0zcsULTbjFrVGSL1lssp
         AMuJUoj8jbrvZbR2tfSB6wy7Dw4azvjdOxeJyUJZ8ZV+HAwzns1/jw47d0Rp14TMSUj3
         eCkyYJ61D9wXd0nkklu8NFAchzS51zHAn4O2sxvbPjeTe8GvXfikzDCtVXr9rlcYIpLn
         YpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716216314; x=1716821114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeSLRL0OKsRhD4qQFOfBvy1JJv4XgJp3PPoxz2ixx5E=;
        b=Y1wkWjHAQ6HFe0Y9OnANPCZXoouWxRfkMxLRGzWGkAi0n75FRJqUxis/BgEHwiEVL7
         jxgwu6NOnn3+jv//hXCqXG/bnwbzIlX9B/kkWodxD5COueTulOqXnS5wIrxutlk2J/bG
         CcbeQl9nGIQASSKRRvKSQo/lovvfzmpOa+0AekxIoVqi6iZIsxyBrpTfLHgcL+tXMI3g
         ypzVmfM0CCVhnrxsE1UR1xm5DH5d6PvM6SegK5uaPaOR0FMfHHGYQ2rT56dFuR+sqGiR
         /SRyjI78p75PTsEaOa5o+ZFfnuoUOQF+sdFaiMTJ6ShPy/15PPvsd9fAp177XYyF3lQP
         FaGg==
X-Forwarded-Encrypted: i=1; AJvYcCUsuYmXR+2yQkx5LV+0a93UKF3izytyruwYI3GQzB6lf9I1/kVH2MpC+bY5xUwOgBvROe9/7rohuVDEuZbc2LUiHiwnEpwl+zjR
X-Gm-Message-State: AOJu0YzhsIaq3HZff3qcwkbVe3v0JCJZcjOZr085LiA92gLtjRsffVKj
	FVdlKLPTf/81Ypx/U2q75fl0EgioW/6NgufpjcNlIEWj0Eb8a2x+LXD2YNySYMtunf6WXPlwosu
	JJPPpo8HdhQNeMJlIpBoscvhXHoo=
X-Google-Smtp-Source: AGHT+IGDDoObxx9h/znodmfXEVY75Zni6ttTKrQE+oaBai6EzaOM4y8AFd/boO5geigu1S0BoUNrW/+Xk2EHVDvwPRI=
X-Received: by 2002:a05:6402:3486:b0:574:ea61:3b01 with SMTP id
 4fb4d7f45d1cf-574ea613b99mr13223033a12.16.1716216314505; Mon, 20 May 2024
 07:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240518074914.52170-1-libang.li@antgroup.com> <20240518074914.52170-4-libang.li@antgroup.com>
In-Reply-To: <20240518074914.52170-4-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 20 May 2024 22:45:02 +0800
Message-ID: <CAK1f24=Cm--tn4MsxBQEoBV048OsrGGyVVsy0B2MT1VMn+YoBg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mm: Use update_mmu_tlb_range() to simplify code
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 3:51=E2=80=AFPM Bang Li <libang.li@antgroup.com> wr=
ote:
>
> Let us simplify the code by update_mmu_tlb_range().
>

LGTM.
Reviewed-by: Lance Yang <ioworker0@gmail.com>

> Signed-off-by: Bang Li <libang.li@antgroup.com>
> ---
>  mm/memory.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index eea6e4984eae..2d53e29cf76e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
 *vmf)
>         vm_fault_t ret =3D 0;
>         int nr_pages =3D 1;
>         pte_t entry;
> -       int i;
>
>         /* File mapping without ->vm_ops ? */
>         if (vma->vm_flags & VM_SHARED)
> @@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault=
 *vmf)
>                 update_mmu_tlb(vma, addr, vmf->pte);
>                 goto release;
>         } else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
> -               for (i =3D 0; i < nr_pages; i++)
> -                       update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pt=
e + i);
> +               update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
>                 goto release;
>         }
>
> --
> 2.19.1.6.gb485710b
>
