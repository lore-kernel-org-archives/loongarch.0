Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B66450EE
	for <loongarch@lists.linux.dev>; Thu, 31 Oct 2024 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730337221; cv=none; b=XSmDcZ/ooz89/zkm1QcehPh40tWjQHGB33MQi/oEqQ45MJaKsI5GoiVyxocEDCz0mN4JkU9i2JqrUHI9Ck+XhwU4k+N2QuAeZWnDF/fR7QuY7EQiw1fUZmxk47eO1EKQ3EAYrkPHvUz8RNQTVb7wlvpM08A6fKgV45/w8N8atB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730337221; c=relaxed/simple;
	bh=WbRptb7FCqv60HSIIaD84GGUKPtD6/MInRYEUgylKqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRfLYgRqiS8si2HbaglzBGI0AzI/c/UDcIbCPwj+DtadOVnOgu4QfeQdecjiSWVmhWJVjUUEGKgk50mGwm4U4JOhlpacOrwCw03AbsrpAvUSmkU59VbWQwqu77amG0q8JhHa5lZNcBmksJBuIwGwCDnw1EFRSJqC8tossZHbMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQFnaBIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQFnaBIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF29C4CED5
	for <loongarch@lists.linux.dev>; Thu, 31 Oct 2024 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730337221;
	bh=WbRptb7FCqv60HSIIaD84GGUKPtD6/MInRYEUgylKqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CQFnaBIgu2VJo5I+vqPnQnQya2dHbKnwlw4s5esPxZr2KCwiPFuIEHv6DrTdVcG0P
	 rUmRAxH/fJbdU7KBd/Qy4wplwFFJ27zTgER9Agrvdeve1v8zwMqXCZR1Xnr0Bj5HEq
	 j40z/03nX6Rp5wiFyV6rMoYEnTtjU3wDXxoBH4c/JJtDjnMj75M+dhyA0JmJMAZm54
	 dLeFSXOiNPIjFQbimyrT3iQa+E7OFRUt+kvmWcpeAX+EPee1AphnyCYN/E3+genhG3
	 ZPeC44LCSz7ye3ZMnB/3ys4yN0lfAUY7satO3jS9ItjL8U0V0yav/Bm/V4USZgC4pN
	 TTe9z+BWh7wpA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99e3b3a411so237213166b.0
        for <loongarch@lists.linux.dev>; Wed, 30 Oct 2024 18:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRwtjZ8g+44siTlq6lf5YIA1ZmFQhWZ+nespN50dksMiz0w8BPfQ3FR8PtRLw1z2ltlk8oT/Ao4qw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcCuQLIP+tjdK/mdvcMDvfprGAxa45Zszikx0AMH+xMoQu15A0
	t87bLwt+ohcn3CBkHl/KYVl/Dd8XFHJKehdRFn2svUiz2xTll9bnAePtqr8v05tJqy/5vOy7K+H
	A3a5jCtjgpkWwOlzmA2xwA/YmuKw=
X-Google-Smtp-Source: AGHT+IHNI0GAvdwr25dkpNoHJw8i/LubG55Z749FdRTKFrX6ZwKdMY40mOPZLmY7D520K17tiZfHEOM/OqdIomb8BBM=
X-Received: by 2002:a17:907:97d6:b0:a9a:c57f:964b with SMTP id
 a640c23a62f3a-a9e55a29239mr50707566b.8.1730337219900; Wed, 30 Oct 2024
 18:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030063905.2434824-1-maobibo@loongson.cn> <20241030164123.ff63a1c0e7666ad1a4f8944e@linux-foundation.org>
In-Reply-To: <20241030164123.ff63a1c0e7666ad1a4f8944e@linux-foundation.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 31 Oct 2024 09:13:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7AyjyGT=4pW9X-ZrdN3JThs8ukC3dnoZW_dOxZLQsQtQ@mail.gmail.com>
Message-ID: <CAAhV-H7AyjyGT=4pW9X-ZrdN3JThs8ukC3dnoZW_dOxZLQsQtQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: define general function pXd_init()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bibo Mao <maobibo@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,

On Thu, Oct 31, 2024 at 7:41=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 30 Oct 2024 14:39:05 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
>
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -267,8 +267,11 @@ extern void set_pmd_at(struct mm_struct *mm, unsig=
ned long addr, pmd_t *pmdp, pm
> >   * Initialize a new pgd / pud / pmd table with invalid pointers.
> >   */
> >  extern void pgd_init(void *addr);
> > +#define pud_init pud_init
> >  extern void pud_init(void *addr);
> > +#define pmd_init pmd_init
> >  extern void pmd_init(void *addr);
> > +#define kernel_pte_init kernel_pte_init
> >  extern void kernel_pte_init(void *addr);
>
> Nitlet: don't we usually put the #define *after* the definition?
>
> void foo(void);
> #define foo() foo()
Is there any convention or documents about this? In kernel code there
are both before definitions and after definitions.

Huacai

>
> ?
>
>
>
>
