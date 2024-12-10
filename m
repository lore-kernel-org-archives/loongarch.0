Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB019D070
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801240; cv=none; b=jcpZJohH5FlAqjakFiUTKL7cVHMGOEv7TF3ooDMw6msrnNpc5QD2zNTTwrQkSApcZnuIGUmRAaoMIfam4BwFAh9FUhffO+RLxDnO7yRs37aFsBGw2Njj4gq5KtMa8qEXeaH+YKSJLHJ+KZ3Y++d105Tx0H+oXSQd6o5GbBIVXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801240; c=relaxed/simple;
	bh=LlXvsVxs1ZBGsstwIB3bDPbexaTDwqyvZf6awYEUQxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5xdrS1cpyW55qoY60XSRU7nWagzAJTH19BR4FhpFILx7Hs4YPZ0/ZcyxG3siBcYcTHFrxR9/833Ul07YEIPMdeGQvogvH1ZcNjCwq/JX7gcV22bbAKTDrcrMhHNW1MchRb4QAC8LwpxJbgdJo3OWaUZuNYr0dMDR/9I36j6SHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5mYxDrW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5mYxDrW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d74363cbso4918684a12.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801236; x=1734406036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=V5mYxDrWh3EwJ1tJJMbWFbIRBHz9AXjNcJ+XwWgCOJYzv7DYnS01+jxXbWr3NvPlqq
         f4JeIMnwflgF+7hHEAZqsorTQIvjI5CgfQ6+65s5zZb9B++bAlpJLFOo07TeSYoewTk3
         +5MV1lqblMtVQFJ/jsITapzaueveLvKAfAzusV2Jkf2yqch40txilMQi1cjPh+OuI5f4
         LTuNtFBtNkRYT8DpHr7hAme1XvpvXM64yTL6/CzOk+aRSO+PDDCE7kmLYyrSDsRkDrj2
         bjXwEPQ4N0zozJ0guWoCCBEdakhKlh9V2yP58SMSYsiSqRx0iKRudkuxxlsjcYERkyfk
         Q3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801236; x=1734406036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=dE4RzsNkfkZoL6JVCVn/wiBG0hIwdy66bIGcngXB29pz9F6whapV8OkAjwr8RvED++
         y/6G37NbcupzAFCnl1NuxF7sN5Q6XIDD9E7hUdP1dNjrMTXxiqIiYAr+WgPdNEaCETw5
         2kXWakA7ODl5IxxHPET4/t9MeXQsVR8SJw8069vL5MDLWY9WKE0bO4AgpTm99Lv2XF00
         kp6dIwWhsBrRYOgN2csEtLhXHogkpesA5NAS7+F/LIxQ1EjpQTl8rUfalY/R3U9/OUHX
         m432NLfeUuFw+BDBcP5CafyHmuqiXpnGeg3VsT52Lahgq8YDzFlRDo38XSAJmnf1Kxyl
         DnpA==
X-Forwarded-Encrypted: i=1; AJvYcCXjPEpLONJvY+/IOB8rr5rSivBTBC/+IzZpdFyRWmOZ9bLo1g7jSkaX+Mi38b+1QT3dunIW29aEpF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxerEykbue9z/3ZEGlKm4AMjdFoeP4TydemnSApaAXQ4A7u9yyv
	DXaLatfK7c47hyWP5qOWItJqECnjgMHfvGPZKOa/mbMT2WoQ7QEI5TRue7oUtFZF6Y4ZM30SVOh
	g+a/fCJlxXsqlGz+rEBNrpOE4gEU=
X-Gm-Gg: ASbGncssySqCkcw+Y2MvTlR7s0MfRi1Rz62bZFaTaIIKcyOmWMmElArT5KYGCpUIG4m
	PTobEjecllZQN1pgovA40oyIApXl+Uk5TQwczJw==
X-Google-Smtp-Source: AGHT+IHf2Fi/42HQsEiQo6WzNdGmDcvEV4I1TbpQP4oAJiq1u3pQn+R3NnSbM/I4gmKvXuY9eOlF5eGp3h/ZPgrcEvo=
X-Received: by 2002:a05:6402:278f:b0:5d0:fc80:c4d1 with SMTP id
 4fb4d7f45d1cf-5d41852f140mr3377986a12.14.1733801235781; Mon, 09 Dec 2024
 19:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-2-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:27:04 -0800
Message-ID: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 6:41=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Consolidate the hint searches from both direcitons (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  include/linux/sched/mm.h |  4 ++++
>  mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
>  2 files changed, 31 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..edeec19d1708 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm=
_struct *mm,
>                                            unsigned long flags,
>                                            vm_flags_t vm_flags);
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags);
> +
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>                           unsigned long len, unsigned long pgoff,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index df9154b15ef9..e97eb8bf4889 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       if (!addr)
> +               return 0;
> +
> +       addr =3D PAGE_ALIGN(addr);
> +       vma =3D find_vma_prev(mm, addr, &prev);
> +       if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &&
> +           (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +           (!prev || addr >=3D vm_end_gap(prev)))
> +               return addr;
> +
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> @@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>         if (flags & MAP_FIXED)
>                 return addr;

It seems you also can move the MAP_FIXED case into generic_mmap_hint(), rig=
ht?

>
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                   (!vma || addr + len <=3D vm_start_gap(vma)) &&
> -                   (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
> @@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> @@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp,=
 unsigned long addr,
>                 return addr;
>
>         /* requesting a specific address */
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                               (!vma || addr + len <=3D vm_start_gap(vma=
)) &&
> -                               (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
>         info.length =3D len;
> --
> 2.47.0.338.g60cca15819-goog
>
>
