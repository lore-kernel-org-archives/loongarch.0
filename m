Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B5221FCD
	for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 06:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183093; cv=none; b=dPQCptIPOINksVe/KOrMRbf6KRelJigkyLhqRJdXaikT7p+c6/jMucJ+f9tstQbqKhoN1eaby2ZQdWZG1SjxgkF1P6WQVLEBluxC4M/t/26Lfsd9lqDRlCcA2uoEyOQS2DQRI5Y803iguGzL5jNzkF5l2q7ZT9j6mFzghQs+o+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183093; c=relaxed/simple;
	bh=7g4Anx48u2oAsiwoMSGD1TqVTzSxrPKqyS5GYqtUVZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYCgECVlZkVXCJ88s92SOuoenZaJJPmcCtY26r1GGwkl35S2eHPi8wsGei+H/55+dQWozBhanK1X8sQqM4/hWN4ky/aZaE2ZH9PNITLlehylohIUjR58oM9nwLwShfajRgJNSSicn5smthpbNPb/paBnHmUd4Z0s9K37NKyk+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hORm8ixD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hORm8ixD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17AB1F00A3A
	for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 06:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784183092;
	bh=I+EqZs4c0DZDp2sCunJCGOZUITLCdAvjGQ98pLS1R8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hORm8ixD1h5TKdI/HHP8d/WqAXfqIKc5NndQ3pxAYtgTTO4lQhSLSgVWHN57QnXne
	 lqZx8p1dIiv75nYtmV96k192OrwXCliJI7vjsU5MKgtN/NsHFp2rUx4l0wjsBuDdBN
	 k+MRWQP8zntUhrPYHIfaVdQyQ9teUmZoukJm4N/kyjkXelK7mB6KY+hHjNSTYLOC/E
	 tabqXGjnCfi8EcJWbFyY8ZcpV9Te25WGyGH2cug/rOtx/O7PIMckWPY1kQdtz8Qa1P
	 g0r/vap9pTq1t2AzGtLLHIOny55DBzmNOwQRnGa/gMY7Rp/VxUtgyNsCDSvhCI0H64
	 7AMNa+DHnlwJw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so1927722a12.2
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 23:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpF48NHwfHWcse+Pc80h5fpTHNaLHB+Fpa9tTcH0xa0Lf/BI6Hb0ks3SjTHVclNX7nX+X7pXWFnJJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHKf4uqgXIqJIr4BOpuvZEPtdz6e33uwB9BtS6jBKYhff2Xg0a
	ocFiqShjcUVSvqSeTIJb6+/YWEmEzsLqnqP/X9fbV8zXHoG7uJkSUNHORS5k/BiPU51SyXzTbJy
	4D2b0k++MC7RJfbx+x6eHDX5tAOOUWp0=
X-Received: by 2002:a05:6402:43cf:b0:698:aa8c:c162 with SMTP id
 4fb4d7f45d1cf-69e19ee8323mr3129286a12.23.1784183091152; Wed, 15 Jul 2026
 23:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716030224.1696408-1-husong@kylinos.cn>
In-Reply-To: <20260716030224.1696408-1-husong@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 16 Jul 2026 14:24:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41ZG=yh7jOmsHGTrh2RBy9PeiqckQsW9bdhRfYkYkQzw@mail.gmail.com>
X-Gm-Features: AUfX_mwSsIUOpwxW0fJASaapQeNqmjo64mZt78OkBeuRj0dxJ9Af7RksONf678E
Message-ID: <CAAhV-H41ZG=yh7jOmsHGTrh2RBy9PeiqckQsW9bdhRfYkYkQzw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: fix silent hang on kernel exec into an NX page
To: Song Hu <husong@kylinos.cn>
Cc: kernel@xen0n.name, guanwentao@uniontech.com, jiaxun.yang@flygoat.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Song,

On Thu, Jul 16, 2026 at 11:02=E2=80=AFAM Song Hu <husong@kylinos.cn> wrote:
>
> spurious_fault() returns 1 for any non-write fault on a present page
> without checking the access permission, so a kernel instruction fetch int=
o
> a present NX page (TLBNX) is treated as spurious and the faulting
> instruction re-executes forever -- a silent hang that bypasses
> fixup_exception() and the oops path.
Can you give a method to reproduce this hang?

>
> Recover the access type from the exception code: an exec fault (TLBNX) is
> spurious only if the page is executable, a read fault only if it is
> readable.  Fold the pmd/pte check together and add pud_leaf/p4d_leaf.
>
> Fixes: 09cfefb7fa70c ("LoongArch: Add memory management")
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  arch/loongarch/mm/fault.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index 2c93d33356e5..591a9c7060f2 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -38,6 +38,7 @@ static int __kprobes spurious_fault(unsigned long write=
, unsigned long address)
>         pud_t *pud;
>         pmd_t *pmd;
>         pte_t *pte;
> +       unsigned long prot;
>
>         if (!(address & __UA_LIMIT))
>                 return 0;
> @@ -58,15 +59,30 @@ static int __kprobes spurious_fault(unsigned long wri=
te, unsigned long address)
>         if (!pmd_present(pmdp_get(pmd)))
>                 return 0;
>
> -       if (pmd_leaf(*pmd)) {
> -               return write ? pmd_write(pmdp_get(pmd)) : 1;
> +       if (p4d_leaf(p4dp_get(p4d))) {
> +               prot =3D p4d_val(p4dp_get(p4d));
> +       } else if (pud_leaf(pudp_get(pud))) {
> +               prot =3D pud_val(pudp_get(pud));
> +       } else if (pmd_leaf(*pmd)) {
> +               prot =3D pmd_val(pmdp_get(pmd));
P4D doesn't exist on LoongArch, PUD huge page isn't supported on
LoongArch, so what are you doing?

Huacai

>         } else {
>                 pte =3D pte_offset_kernel(pmd, address);
>                 if (!pte_present(ptep_get(pte)))
>                         return 0;
> -
> -               return write ? pte_write(ptep_get(pte)) : 1;
> +               prot =3D pte_val(ptep_get(pte));
>         }
> +
> +       /*
> +        * The TLB-protect handler passes write=3D0 for read (TLBNR), exe=
c (TLBNX)
> +        * and privilege (TLBPE) faults alike, so recover the real cause =
from the
> +        * exception code; otherwise an exec into a present NX page (or a=
 read of
> +        * a NO_READ page) is wrongly treated as spurious and loops forev=
er.
> +        */
> +       if (write)
> +               return prot & _PAGE_WRITE;
> +       if (read_csr_excode() =3D=3D EXCCODE_TLBNX)
> +               return !(prot & _PAGE_NO_EXEC);
> +       return !(prot & _PAGE_NO_READ);
>  }
>
>  static void __kprobes no_context(struct pt_regs *regs,
> --
> 2.43.0
>
