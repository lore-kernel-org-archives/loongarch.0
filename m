Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EEA1C5CBA
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801862; cv=none; b=odzdPf3j+ighiZk96hLweV9Ugj/RHJpC9wLSNPcWb+dPna6FbrBjzk/nZl0t1r0bvwfzK5Rx+JVcLE1XcNzCQ+t2udYaGDVvBP4H2j8+UiF3AWdPuMawJBmPb28HDsA6OfbB9ckgCgCVcKXI2LBZa58KYoYgQNlMpLzAjo4yROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801862; c=relaxed/simple;
	bh=yXLwrYkUhhm7e8Jczp/Rq6SgG8Y2ONP7nE+CaYrO6cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4Yp7R6KAKZDdwEOOHqXLNauXwc9R5WG6S6q9KrLcDgq5jhWHQVKnTnUBYT62mOchHP5kqRoFbnkf6iCy1J0hiVhvtwrpMbJ68gE/x/QBbYTBaesx13f7KbtkadYJmu6cdncrD6kOYmC7dmfzAv1FdT48b70AEDGAr+2ePma7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2RDSOG4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2RDSOG4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso4763797a12.1
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801859; x=1734406659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=a2RDSOG4ehtkHSS0+DW+pLzQW3MmZgdUEQetbjZK7Uw0MtNFvFB4ZpaDMpAlYK32fd
         jlwTEAB0ZgaPtNSPacFuc9vVceMSObDm+yy2DwJdeY9Es7r155O+4tYvOKuStssJv85Y
         FAYppTAb7j/JehI0YDDFwPOh838TTL2QooayKnkH9Z9fiGBLrknu8LE/YPh142cMz4vu
         SkRwWCACU/raStp5DVN8RQaAVGaZObzMoDgRPVAtA190qNmjkKspZsCsfm1qQ9Hdupja
         nmvHNtDHLQ7LxAjcA0MWCx9VxFXQnzx5WlXxK/ZzDPep6oSdOoBuedMZqGfoxwRkPFBS
         ah1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801859; x=1734406659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=vQqeF+pwerSIJj6IWvtnAoO/yAn19AzkGBU0imYSdGx7UY4bIKUBYbk+j/67kD6bxP
         INvDpXMziLG2loh5pxvwRDVhoZkZOFkrdIgpqDbRBL0uXgilmuGFLOA146fXYr+ty2vM
         RboAUlzq04ywsGPVQvPULdfmtwq7NjTCcQMw/RsRbOtR2gIAwqoz9tMp5WA2ahQx2WFs
         Nw/HttQ2nB6d8KlzQ1PEb9HzXaEhaYpb9Wm8t+92apf4BBbLEkujfQaYsagmsmqIPOGX
         h1dthLm1IN1jkNff0n17OsxhQcKmfKiM4/zinll/mB3H19vGhthKhnXTDzBUoOl651uG
         iecw==
X-Forwarded-Encrypted: i=1; AJvYcCUWC2e82sl0k5xHUkt85Is3GK3pLaZYrH8dyAA2wmsrr48BGU9l4SL/4t//2cK3o2G2jn3+VhOtSLg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwakuXpP2VfASAkN5380lmRay9n7qCb92akZtjGvSfOqTVuUjDB
	f4ikYelr6OJYJLvcWPH5xx6vg5HnCl3yLEDV3L7GJn8Q/BxzXZv9Q9hUWHlaJF11wRkxwHhUy8j
	/tT4HADC70LeoQdJxf4jvTJ8SNFg=
X-Gm-Gg: ASbGncsNsoKDPrqoERv6b4bbADTdfxam5v5yB3BxKM6akPNcX77crT551mAS8V7jqVu
	P5CzNO4y2cX6jVwgJ24vYjrXl47xItHJiKrDuGw==
X-Google-Smtp-Source: AGHT+IElXjz+7x/lQGuFmHk7BJtRPsIF5Xkbrc+PaOE9soOWoyJSq8aIO8IH6O/j+TzaKqiG91uZtuFho2g8MHXawAQ=
X-Received: by 2002:a05:6402:3229:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d41e2b4c34mr1849541a12.10.1733801858975; Mon, 09 Dec 2024
 19:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-18-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-18-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:37:27 -0800
Message-ID: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
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

On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
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
> address and fallback to THP alignment if that fails.

Thanks for taking time to try to fix this.

>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  mm/huge_memory.c | 15 ++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 137abeda8602..f070c89dafc9 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +

IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
arch_get_unmapped_area_topdown() again. So we will actually look up
maple tree twice. It sounds like the second hint address search is
pointless. You should be able to set addr to 0 before calling
mm_get_unmapped_area_vmflags() in order to skip the second hint
address search.

>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struc=
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
> index 59bf7d127aa1..6bfeec80152a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long =
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
