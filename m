Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F167268FEE
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741884077; cv=none; b=WgAsZu2wHo25dYiCRA72t19HkAW4q1Ygn0IN/TFiS5cF2EQkib/CpKfep0/loBql3tdFOgvCwgNlTY8ksnhBlZ0c4/B2AcL4pmS4Z5ZazquNkTq31Q8r7dhXiyfBphwFWSHyiDVivPreS+tI0srHcicdOO3PIZsGVX4QNfBhuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741884077; c=relaxed/simple;
	bh=NBDdDxNGDvQP5bA9D+gvZA4DOkX78hxDa702jREZMkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0VC/+0+H5wTnyn2f7FzMHJjhaB9GmfLRxJYib7FYUmbGEr6yTdsqY3SjO4wL7qaAK0DmBG4cTkHC79P29X8L8prrzDS64IU62qydiT7ssaLQC1nv5s/GDrfH5plhcb24TBKDkKdOlgdsA4zoaWSqmvO4oOJNwKDEWkT9JDsBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bUuYYmkE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUuYYmkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741884074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
	b=bUuYYmkEnhynfcGaETgfVn+JbJ8QVPcucDFPgcjGa2/nDPQ4UlI409RsyIGyRLQcVXaZhE
	TS6gRQpHwPPGvJqixHXTGPGeZ9Bor2wt94wWcKxi2xSh8WAfWDYH8TEwZcEsRwcphka30u
	0H5QGhN5AoyCkJRfqM7E8PXEQ2UBNuY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-EvVtPEvGNuafI16Wkd2YFg-1; Thu, 13 Mar 2025 12:41:12 -0400
X-MC-Unique: EvVtPEvGNuafI16Wkd2YFg-1
X-Mimecast-MFC-AGG-ID: EvVtPEvGNuafI16Wkd2YFg_1741884072
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so2128253a91.0
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884072; x=1742488872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
        b=t/5iJS8/EEQSF4GFsWx4eIpYF6RB+X2FB8vnW3vRtEfqTQwkZJ838dkCpCyMCibYlB
         sYIHXAp4DxYuX+LGvNlRxVftDQ8uXg+CstijU3xT9IvuS/vBNOwXz/ajOjKOrTwIBV8f
         vvadoEHCTgjUM32m94f2t+m2a0Ri09tQ3HvASHxOey29/wr0d38h/GRJDRvaMlHKN/X7
         7WUB3lo5wVfBsblOUDym6D0e0scKqOoNuLZPnY/nUBhctXyWhI+RGy65n/CAWKJwqPtr
         09/X95+JppN0p602RM1yOgrThqwdaUQ90DrZFmEib2JVfdRsrYVxsFCly+peblLaAche
         0RJg==
X-Forwarded-Encrypted: i=1; AJvYcCXevQu5CGugDDZj7SGUbrbZ8Ms6hR2FIt4QPG+pzS+EssKVArh7Cnk7nBXs72Ra6xz5wPaNRP+8k0E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyI6FhDACuLdpdtEOqs+zK9OWLtZvzoClod3ln6fpd3d7iUlIZz
	ofAfE5XG++SkWyUJWuFrCAGGW7fbeYhou4bexe78L/dgvGr7NH/TfFuzHX1frCXY3U9m7aJzL4s
	FY8hHCPMbnfVuTwTq2SyBk4kTXxHzsEVBLEMiHVx8SckWhoVCnS6A63rCymj5x5P5Emj7PIQlN0
	kFJ/YJbRPeryhnZBvlzvBsv25WEen6FDhi
X-Gm-Gg: ASbGncteTLMUiJL8+BZf0XDYaud3L0oWdExB1nW3S69fuLYs6FadvfRQ/LFe0ww7D8L
	12aBkh2HtSY10WwtaHJRlzB3lDsvcLpSmCGXRqiL4qhX24T9gnCIsaR7B4uTQcrEnUjs3NXI=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id 98e67ed59e1d1-3014e814787mr282594a91.7.1741884071600;
        Thu, 13 Mar 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZSR0GKOgpT9qIwRRXIxVMEVNcO4hzEa3HpTc2cVefBnUNShY5U2qKEnTkHJXaXXzQjc2Wb29JilB9GlX1pNU=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-3014e814787mr282561a91.7.1741884071208; Thu, 13 Mar 2025
 09:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313114329.284104-1-acarmina@redhat.com> <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
In-Reply-To: <20250313122503.GA7438@willie-the-truck>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 13 Mar 2025 17:40:59 +0100
X-Gm-Features: AQ5f1JoRjBn0wYL3TNCgo2Be9gEw3kQ3UV-S3_DQ-XzPf4lVXAvFHPCcZEOjQyQ
Message-ID: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning backtraces
To: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jp6ZjwTeWeg5CsMvpE-WB_wMmINoop2KvDXNUe-snTU_1741884072
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Will,

On Thu, Mar 13, 2025 at 1:25=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> > diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.=
h
> > index 28be048db3f6..044c5e24a17d 100644
> > --- a/arch/arm64/include/asm/bug.h
> > +++ b/arch/arm64/include/asm/bug.h
> > @@ -11,8 +11,14 @@
> >
> >  #include <asm/asm-bug.h>
> >
> > +#ifdef HAVE_BUG_FUNCTION
> > +# define __BUG_FUNC  __func__
> > +#else
> > +# define __BUG_FUNC  NULL
> > +#endif
> > +
> >  #define __BUG_FLAGS(flags)                           \
> > -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> > +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__B=
UG_FUNC));
>
> Why is 'i' the right asm constraint to use here? It seems a bit odd to
> use that for a pointer.

I received this code as legacy from a previous version.
In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
Here, __BUG_FUNC is defined as __func__, which is the name of the
current function as a string literal.
Using the constraint "i" seems appropriate to me in this case.

However, when HAVE_BUG_FUNCTION is not defined:
__BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
but after investigating your concern, I found:

```
$ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
{\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
#define NULL ((void *)0)
```

I realized that NULL is actually a pointer that is not a link time
symbol, and using the "i" constraint with NULL may result in undefined
behavior.

Would the following alternative definition for __BUG_FUNC be more convincin=
g?

```
#ifdef HAVE_BUG_FUNCTION
    #define __BUG_FUNC __func__
#else
    #define __BUG_FUNC (uintptr_t)0
#endif
```
Let me know your thoughts.

>
> Will
>



--
---
172

