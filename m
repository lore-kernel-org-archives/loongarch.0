Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BFF17558
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711678667; cv=none; b=VikqGObEolr2dU0JC6Y09Xk5Od3QE+q0ZWUt57iESXFOX58usLPEc9GxWXeknj5Fzcz2wBBZS+OPk7WpuWgOXbmeuEL9kCJPn+uUppoJMH97cJam82YMbqqbwhWqamdf6/5CSrvQ9XhXYY6A/LT/790OEwMAwf5pbVQVl84xXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711678667; c=relaxed/simple;
	bh=xrCuD+YstyoRqhd48VlTTFtm9tGhlaBX9bc+CRj9pJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgS9l1g8zeKYTeyVbFNLgFscwAlRaEnIyqMpBZgGpgTA9mnnTh2GBiCi/7wZu0c6UwMk8vTMWqyo1w75nRfTmoW2nFzuSIEYHaXqv9nx09ZCjvhMV2j8lGqurqOkxxNd1fUWndNYtg+7He4ecE1LopptQZCQgyg6nY7bCJUDz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ED74/NW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ED74/NW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED77C433A6
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 02:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711678666;
	bh=xrCuD+YstyoRqhd48VlTTFtm9tGhlaBX9bc+CRj9pJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ED74/NW+POTlHq7NAWGm2TOe4WbK8utSfi61/j+Y5rKuyvqJyOQig2xUr7i/3AQ3T
	 onuBsM2xx0kcudMv8cbPt6fO1Z/Z7BxrKwYsSvt341yqldDSFMC1ILDKpHdQ3mDMwY
	 HzGNkHYgXOitFZfOCAcJjBMLxEqVUwivLsnm8GlC/Uqp4L8zaMOk9/QQrVHZaLXJrE
	 dl6g2jM4FTRVEoVJfqlhMaKkzB8M7DgU/j+wDTn6+cP3hkzy20/VlWK3zsTT+xD8a6
	 Psa/Uj6iWKKJ6ao2vY/KEoCHhDlOkFBxnOdrgXgbDgZ8KHi2jAfL+/qIws5K2NyOyW
	 fdK6ughAufu9Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51588f70d2dso1815712e87.3
        for <loongarch@lists.linux.dev>; Thu, 28 Mar 2024 19:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbKam7idZTFSAYbV+2PVIoD8WukM1yCRCwkxEILR2zuNzNo25fnS2L9+dqJkzLOZt7xaJnkJj6zr/yqvNppSGqjpQPzaJKxCIY
X-Gm-Message-State: AOJu0YyO+YkylNnwwjguRyhBlpKmpWdc1Ebls8J/OmXa7e5smsK53Vj6
	iHsjWWUD9U689c3CkAahdeuuczEctesk6/a5u7d/zwrRVaNfSE7UeKYDNCZnVuGr3Rb30raa8Ku
	qjIaz00+8UF0MsMBjaR5HXvGth+s=
X-Google-Smtp-Source: AGHT+IFIt3xKFHz8f3YRErRQ3+Wd4FtZ5zFcF6pJlLtCFXNYokfAsE16Un+jW38siA3PzcTudqOC3qItwnPJhds/970=
X-Received: by 2002:a19:ca5c:0:b0:515:9150:ecc1 with SMTP id
 h28-20020a19ca5c000000b005159150ecc1mr620038lfj.24.1711678664699; Thu, 28 Mar
 2024 19:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
 <4d2373e3f0694fd02137a72181d054ee2ebcca45.camel@xry111.site> <19c0ec82-59ce-4f46-9a38-cdca059e8867@roeck-us.net>
In-Reply-To: <19c0ec82-59ce-4f46-9a38-cdca059e8867@roeck-us.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 29 Mar 2024 10:17:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Po9B5WQMAUfB9jUmGAVit0+NiDbhV4jG5xKJUbWEBOw@mail.gmail.com>
Message-ID: <CAAhV-H7Po9B5WQMAUfB9jUmGAVit0+NiDbhV4jG5xKJUbWEBOw@mail.gmail.com>
Subject: Re: Kernel BUG with loongarch and CONFIG_KFENCE and CONFIG_DEBUG_SG
To: Guenter Roeck <linux@roeck-us.net>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	WANG Xuerui <kernel@xen0n.name>, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Guenter,

Thank you for your report, we find there are several kfence-related
problems, and we have solved part of them.
Link: https://github.com/chenhuacai/linux/commits/loongarch-next

Huacai

On Thu, Mar 28, 2024 at 7:39=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Thu, Mar 28, 2024 at 03:33:03AM +0800, Xi Ruoyao wrote:
> > On Wed, 2024-03-27 at 12:11 -0700, Guenter Roeck wrote:
> > > Hi,
> > >
> > > when enabling both CONFIG_KFENCE and CONFIG_DEBUG_SG, I get the follo=
wing
> > > backtraces when running loongarch images in qemu.
> > >
> > > [    2.496257] kernel BUG at include/linux/scatterlist.h:187!
> > > ...
> > > [    2.501925] Call Trace:
> > > [    2.501950] [<9000000004ad59c4>] sg_init_one+0xac/0xc0
> > > [    2.502204] [<9000000004a438f8>] do_test_kpp+0x278/0x6e4
> > > [    2.502353] [<9000000004a43dd4>] alg_test_kpp+0x70/0xf4
> > > [    2.502494] [<9000000004a41b48>] alg_test+0x128/0x690
> > > [    2.502631] [<9000000004a3d898>] cryptomgr_test+0x20/0x40
> > > [    2.502775] [<90000000041b4508>] kthread+0x138/0x158
> > > [    2.502912] [<9000000004161c48>] ret_from_kernel_thread+0xc/0xa4
> > >
> > > The backtrace is always similar but not exactly the same. It is alway=
s
> > > triggered from cryptomgr_test, but not always from the same test.
> > >
> > > Analysis shows that with CONFIG_KFENCE active, the address returned f=
rom
> > > kmalloc() and friends is not always below vm_map_base. It is allocate=
d by
> > > kfence_alloc() which at least sometimes seems to get its memory from =
an
> > > address space above vm_map_base. This causes virt_addr_valid() to ret=
urn
> > > false for the affected objects.
> >
> > Oops, Xuerui has been haunted by some "random" kernel crashes only
> > occurring with CONFIG_KFENCE=3Dy for months but we weren't able to tria=
ge
> > the issue:
> >
> > https://github.com/loongson-community/discussions/issues/34
> >
> > Maybe the same issue or not.
> >
>
> Good question. I suspect it might at least be related.
>
> Maybe people can try the patch below. It seems to fix the probem for me.
> It might well be, though, that there are other instances in the code
> where the same or a similar check is needed.
>
> Thanks,
> Guenter
>
> ---
> diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
> index a9630a81b38a..89af7c12e8c0 100644
> --- a/arch/loongarch/mm/mmap.c
> +++ b/arch/loongarch/mm/mmap.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/export.h>
>  #include <linux/io.h>
> +#include <linux/kfence.h>
>  #include <linux/memblock.h>
>  #include <linux/mm.h>
>  #include <linux/mman.h>
> @@ -111,6 +112,9 @@ int __virt_addr_valid(volatile void *kaddr)
>  {
>         unsigned long vaddr =3D (unsigned long)kaddr;
>
> +       if (is_kfence_address((void *)kaddr))
> +               return 1;
> +
>         if ((vaddr < PAGE_OFFSET) || (vaddr >=3D vm_map_base))
>                 return 0;
>
>
