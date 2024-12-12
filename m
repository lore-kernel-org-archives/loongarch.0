Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC9189F2F
	for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734034327; cv=none; b=J3C41lWtIzqvHDC7YZPbeoHUZ5Aohih9Cz1Be6MnTK+Qlm38SyY+ekw/kHU+25/6TZtQIeCAInBEFgWyIzRMHWKFvrveHORrF4zuHBHDfK6djsRPqfcAr2Fcre3QkrCKdFA1EG+gF6i2vm22RF0E1CrYrNAEudqmrS3Sg5Mbvlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734034327; c=relaxed/simple;
	bh=ifgXMXPeJaw+0iXfb3YVtq+uFZZPMVRdg7oRM0gxOwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3fkonEgYlW2bkToHIYsiED2k1yOsHlNwCm5DjNiUpM5xuu1Hc4e85TtG8EM7fYuZRmy1plVk1+sgKI30t7QYYIYTgEPL5TLJg1uWSBwAGOHQrHs/Z5t1dnkacGQUY4tP7byFWmdDgZGR3rDvmrTBlck8dwqXDTJXHcGY3Ba5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCidKd6N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCidKd6N"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9ec267b879so86242866b.2
        for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 12:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034324; x=1734639124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=dCidKd6NOq5jl2Ys36zWvp3gOj27pSj2qvSOROR30ZC/HIb80tZleklonuIqkp8VuW
         PS9BaHQlMlUnAvbHCXVmPZOmTLdOVTBbg5QRp/z+HrX/966yhH2i0ooOnuW8x9Z0IlFQ
         hCBtOjM8DOaOyYXN2IMGRSHSQWJpqxWv96ovndFs9uUa+ksdfVVgJ6UQ2FYPZqjV3DQ0
         +djLEIKJJ4pePL9MKAtjLhFiR1cxHdRZd7FVcpvYH0bcWKb6+ANgyojCEYlalYpLyObI
         n2Goj7YZ4phYWQUxsxsoJntuKvfZqwq3izNGm2da5QXHJhJqmfHNsm4o+CnYy91JzBOh
         FgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034324; x=1734639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=LQBpJxEQKwq4hqdJZlCDRfXk6YFn8qBpjUQvNcbjAEETDkJw2YglV0dV2f6t8z4aEV
         BO7xaHA5DoFunK8uLqTFHbMamflOgf65Bxz0MtOaE20ZW6U6qT1Jvk3kDY8btTfdpGEZ
         aAuXgsvyXO9mSneSjX+Z+CzPX1OvefwraX1cqdDY1Qc/CRfKFer/drcorlHAjp+CYVCH
         FrGpigcvqm8M2aBtpWnWOsLTdySCyi3ltGWkqNS6HbdAg2HrxUnUzKSc8QnFzRDMOFKu
         IOT4R7VjbTYglg96qOcBuLCxCGdcbvpir3Iqx7+Wn3lraoExX3i2kKxoGCrpEdGvcgLn
         FOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIDf5gWdtEzkN7Fp7rtllmDsgJDLRWwOBkznRGlZiTnJAWPXY8OEu+UF5pxfbrps6osInwoQi6gEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmXnpWZmAkgslrgtETqNn+j5J12+JAbo749FLQuSPyj74SKx34
	78zISgM26sQEuQzhsnAlPMNmmWbkq5f/bNeU7TwUhsq/xJCTfsTyVNaxywtQMXAGL4ELfLiWHnm
	rFiwcf5dldElhQbGFmtouJmz8IfM=
X-Gm-Gg: ASbGncvf2yHnXQlvpxUPjeywJ2N7VtRbwiBaBxM32J1caARw4vY1UQSBym1sHvZ2AEm
	DEB40pfT36unl61h351DrwDzjT+AQVtrQIHVD7ruZ
X-Google-Smtp-Source: AGHT+IF7qx5Z1/fQb+D9Nv/8CkFXoKyEEzLktdUfd+sTUwFi+n5jfhaKRcSctFjQDfGrQzxwJV8DWyyLGWYjEOqOZ4M=
X-Received: by 2002:a17:906:7304:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aab778c1eaemr4266066b.1.1734034323514; Thu, 12 Dec 2024
 12:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-17-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-17-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:11:51 -0800
Message-ID: <CAHbLzko2Z0-QReXo54H=sd1asXsPKEHf9N4Nmv0=Ry7SM=XX+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
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

On Wed, Dec 11, 2024 at 3:31=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if there isn't sufficient VA space
> to satisfy the allocation at the hint address.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Yang Shi <shy828301@gmail.com>

> ---
>  mm/huge_memory.c | 17 ++++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2da5520bfe24..426761a30aff 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary;
> +        *
> +        * Or if an the requested extent is invalid return the error imme=
diately.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +
>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 76dd6acdf051..3286fdff26f2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>
