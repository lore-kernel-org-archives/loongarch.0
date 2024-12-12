Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18A189F2F
	for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734034130; cv=none; b=mkP9UbF/BguGJmgnzoL9W6y5bKTkq9F6D1FryDOvKoCfYqzRxSDyD4voWehkW5RZbhOoKXwafnCRrJCvJtEUcNO2AgrPZn+wYHJm6t/mcGON1c2PTQkah+PJyGnOx1TOgF7W1gdErXvnQRjxBV4wKU8Nh2LccumKYq0al2xqH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734034130; c=relaxed/simple;
	bh=rGlNM0MTKO9H5+NJ7e+yXuofUkMksUw402gZcNo+JtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWZ7Zyvf/M8ffvqh1gPKz4ILEaYKm4C/1IadlXsmrkUCx3BsTDzk5O+R4XouMaVuMZRvStEE3Vu8xVVbxlouX47wATaZLEkFvukwrb+Gkb4iIqE3E1JcFmEyPc5cXPw/8n8yXPdOMJF3gSZ831XKWxnS/vkg78ApeF7teUXCz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG59cZUf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG59cZUf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa66ead88b3so185780766b.0
        for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034127; x=1734638927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=YG59cZUfmiE6ae1KbBRp2fSKpq75hLVWOtQVHwXNke1261vMvtYYQ0AHAV+STtTaUM
         ovAQHVaq75rtHHmUQWhNGV2nYFcOnSFcc2Us6bgLOYz4f9d44WSE2kubCVhLaz16whgO
         774oHXbd5LpR0v+idvvLQQvvpcSBX/cSvgGZg3ZGTk/UYBpvOmoDHrJhtmOXLrGmjLsg
         P/ExlmUKEQuH8DTkkdsR4XgaNNmgp53mYXAmnHAc+9/DIBFAHlWr28nKUiSSUPOxkYn6
         ESZMFS1HtdSdq2WRQRyAhPspgrTvCk2JtNr6Xcq/raWClH0Hkl6EXQgSXToZnREsmBLk
         J1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034127; x=1734638927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=rbU58pvHsviozo7JrK0mC/C6OGI4PW5L4irvdZNXpOcCLS0BohcLVKq/naBmUz5Ma+
         QqYg/Fj6cxL0sKve45aZRc0DJ2ZDfwMnzGRJ+O4/Cpfejfd8FUlcHmjC3BBoSuWRfw6+
         hPNVFepk8+oOx7oRkvIbiEIYQJnmadZFKIUzkfHWnJ32Au3v23tOQDw6J67DLknk3GRa
         L8hKU5zcpB3ff+m3fgmBXbXcA5dckcxmwheojDpcU7FDE07+Rzgy2NdSJvqzGeJn5kGF
         /QGCbo5xgrDKFYmL5z/TqNymuN22/49QeFwQCHHpNgQgpJktmfGH0f92fsfWVb6fUSLT
         VD2w==
X-Forwarded-Encrypted: i=1; AJvYcCWwE9wZ81opaCp+effMFJOGGoCDCVl/ENHw9CKQ+qgYcel3TiNYRfc+G9sNOyIXxgKKNLY5bqgux6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPUQMgOCZt7PZeuUn2TOYRHsQUYi1M3nkw5kFayy52XSZKq9JA
	Z4n7cywpJr8FT9bH/39JDZvX17PVWfeRKDIFFZq/bxeXRU3tM9YkyKMHzRq3Gsk8R70AsENuk0g
	/0jBP0pljhGZ2HUewCUcrNxCsCeY=
X-Gm-Gg: ASbGnctA8hjYE+fjeRVpq8zGW21b5m3JPY9OP+b0eyTpRZ7Pm+tFoL2gmbQKQ0lRViQ
	h+MF4lifPeBqaxgPx3aE3xtCLczmcZ4skvTRK3L0E
X-Google-Smtp-Source: AGHT+IFBjZrg88OqeWBDO1jTyqFkrRhdvj/sM97FkFYUxtUn8pc+yCVr/hdiAj5KO+SOUnoKUqWUM88SK7LqY4tEHG8=
X-Received: by 2002:a17:907:3e9f:b0:aa6:64be:ff2d with SMTP id
 a640c23a62f3a-aab778c168emr3388966b.4.1734034126714; Thu, 12 Dec 2024
 12:08:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-2-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:08:35 -0800
Message-ID: <CAHbLzkovqMsjti1g_G4dFj2mb4hneBPtR2eGTxTZmC717455-A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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

On Wed, Dec 11, 2024 at 3:28=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Consolidate the hint searches from both directions (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just=
 a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().

Reviewed-by: Yang Shi <shy828301@gmail.com>

>
>  include/linux/sched/mm.h |  4 +++
>  mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
>  2 files changed, 50 insertions(+), 30 deletions(-)
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
> index df9154b15ef9..382b4eac5406 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +/*
> + * Look up unmapped area at the requested hint addr
> + *
> + * NOTE: MAP_FIXED is also handled here since it's a special case of
> + * enforcing the hint address.
> + *
> + * Returns:
> + *    ERR_VALUE: If the requested mapping is not valid
> + *    0: If there isn't a sufficiently large hole at the hint addr.
> + *    addr: If sufficient VA space is available at the hint address;
> + *          or MAP_FIXED was specified.
> + */
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       /* requested length too big for entire address space */
> +       if (len > mmap_end - mmap_min_addr)
> +               return -ENOMEM;
> +
> +       if (flags & MAP_FIXED)
> +               return addr;
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
> +       /* Fallback to VA space search */
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsign=
ed long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
>                 return addr;
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
> -
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
>         info.high_limit =3D mmap_end;
> @@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       /* requested length too big for entire address space */
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> -               return addr;
> -
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
