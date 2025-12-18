Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2714D345CD0
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053452; cv=none; b=bPVsUcZjtvHJBqMLHUb0Bhycev7xVNYhXf0rEwSqqaxLCm8aHYt4scP7AbUQne4j5V6oJvruWDsHgIJl+2Mv3KfUTgEBSJXr9g7n+rKyOlNGB82+c9CI68NJf5nLvhfPT2gEqHZwf0CvyDeu26156eM+5dyYFicmy53PjdAl7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053452; c=relaxed/simple;
	bh=Y5OGiHLQy2WsQqtovudF6yPGd8K9LfOVDKyFStcVPHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glfSQ+XrN6ZFFQmWPqPjAAVRL6QGlk5/0NW1drkkjzcgySIe3PKo6nQnw3ih61ZzdOZaXWpd2696F48GZtF2cNvKDsrgfsYld+j5/aCJpM1DkrBOogjA3e1ZFS9zMLBrUFS9l+Rv1lOjbyL9mUTRzxV5h9mfBMppKYWK3CmDOiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r8OpKtqo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r8OpKtqo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d6f647e2so7342805ad.1
        for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 02:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766053450; x=1766658250; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WslnZ1panE0zhxGDe3aCJhXLiwIja75afp2ehy4KLwk=;
        b=r8OpKtqoBbsRfUzjNTok4/l3UWd8NDV58TsEdn+jMsp9wsqXjUw0A80XuFdY8OOlKN
         IiVgHSPO0DBWvSMCXF9NwD7Q3pWeJ3bifUUPJ2fS2GlvTttdKLoKlRMSVCmTKIO0LwFp
         aver5taRRMxkeRb+Jg5z/5AAPbDR/RSnUtkrLcmJFuNHEBRhXmGCMaB0bDpYHszCZkAI
         pEvHJri8o7GSr9CVyknCjvr2WueT4eS/8K4xbysmRQGf+7GG2bCzjoK1/S/cGT7fES6N
         IZGrbD6ogG+Lx32Gln//VLWnvlhMKQ8lsEB+FFDZlKzBnWzpRS7Kf62a5yYf1hZ31AAo
         LrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053450; x=1766658250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WslnZ1panE0zhxGDe3aCJhXLiwIja75afp2ehy4KLwk=;
        b=el+Tl9lJ9faf86SJjsAYfL4Fl+7z64LtQBKIryIsz3Pxw87ozxl2K/UyqOB1o5PLU3
         E/9FwNm2nC4OzF+ZDHI1ki2Dsg4as2qtJWJPRz7kiVsedVlEa/Cgp/OovkuWYQFxIc8S
         iInYO8wVyIgNUawTBfCgJTkguc3VTjgdCPMQaOissuWw3ptxuzFOgd83jSl+KMoqh/jI
         pIM80nc/J7YS8m6cI9W0EjvtxbfquMXfC8DXi7ciOR6mLbeK6bRqVPVXxiCZnFxce7Ku
         C54JwuR+MyLgRBX3UVgHC3yMZCAUjlKaGNFjpriGhyWDlZhkZpM/RjZTaENNaJV/E+Ao
         MMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPioiR/kuQP8/GjkkWzojvgo0zx7hPF+v56UickHB70uQL2dBWhro+L5ujMHkBWMLtbGXCdzvYwpY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO5QxFiOHeRPOXRi9MtYG6/TRL25Zo3znQwNATU9gY5T7UOrXN
	kts1CeLNlL5/t/FuUbkADN3HasF7rSXP7MWQQSteHJQU7Po5prfUxt4In73RWAhxPJ5amCv3lvO
	uoKfw/Ql+9c4LZWcXQNbVumgKVvTnsAQ6PPpo6Dfe
X-Gm-Gg: AY/fxX5NyxSS2CFMOalHXXzfPWDItoakRUlXZwyqAQG/EcG6RaKG6aUgRDcMbqHn0U1
	BBBUA+g1rdfqWJ8O/YU6KAHt2QGSGCPInKvFw/KoD8OXmDIud7IWWurplogyS9G8SzVsWxEHEHT
	mUZdUr+QIM1ECd64PCJf9Y1wbDJHqliODNRh5jfUeZQqOPptqyo+E2qxG02tJIvZK1SKUmmm28t
	cwqgnesgonUiFTXIVwRJ267PrIYd4JNqOw8IKmqNNIP0YBB2TBznw8hZhtVu6/+LW1ytAiQzdlR
	UtZ+nlLposCdeYU35raUyXHv12lk4G8HjIeGBw==
X-Google-Smtp-Source: AGHT+IE3XdpIoC/X1A6+tWvYnN30WmVoW6ll1XvyGtof86Vu1FcZWimVqNDhIQGXBSpdKroKdRnMo1bxnzQC1Vs4On8=
X-Received: by 2002:a05:7022:f503:b0:119:e56b:c75b with SMTP id
 a92af1059eb24-11f34c2625amr13304701c88.32.1766053449983; Thu, 18 Dec 2025
 02:24:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218063916.1433615-1-yuanlinyu@honor.com> <20251218063916.1433615-3-yuanlinyu@honor.com>
 <aUPB18Xeh1BhF9GS@elver.google.com> <7334df3287534327a3e4a09c5c8d9432@honor.com>
In-Reply-To: <7334df3287534327a3e4a09c5c8d9432@honor.com>
From: Marco Elver <elver@google.com>
Date: Thu, 18 Dec 2025 11:23:33 +0100
X-Gm-Features: AQt7F2ri_watnVgJFp6cbP7eAfmz1Mi-buK4oLrIxtfdr5TG5N1pjsoHb_vA5KU
Message-ID: <CANpmjNMmiXjifpc9LdCVi5jzzKU3sgb0iJn7P7TMFMNqDH7TbA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kfence: allow change number of object by early parameter
To: yuanlinyu <yuanlinyu@honor.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 11:18, yuanlinyu <yuanlinyu@honor.com> wrote:
>
> > From: Marco Elver <elver@google.com>
> > Sent: Thursday, December 18, 2025 4:57 PM
> > To: yuanlinyu <yuanlinyu@honor.com>
> > Cc: Alexander Potapenko <glider@google.com>; Dmitry Vyukov
> > <dvyukov@google.com>; Andrew Morton <akpm@linux-foundation.org>;
> > Huacai Chen <chenhuacai@kernel.org>; WANG Xuerui <kernel@xen0n.name>;
> > kasan-dev@googlegroups.com; linux-mm@kvack.org; loongarch@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v2 2/2] kfence: allow change number of object by early
> > parameter
> >
> > On Thu, Dec 18, 2025 at 02:39PM +0800, yuan linyu wrote:
> > > when want to change the kfence pool size, currently it is not easy and
> > > need to compile kernel.
> > >
> > > Add an early boot parameter kfence.num_objects to allow change kfence
> > > objects number and allow increate total pool to provide high failure
> > > rate.
> > >
> > > Signed-off-by: yuan linyu <yuanlinyu@honor.com>
> > > ---
> > >  include/linux/kfence.h  |   5 +-
> > >  mm/kfence/core.c        | 122
> > +++++++++++++++++++++++++++++-----------
> > >  mm/kfence/kfence.h      |   4 +-
> > >  mm/kfence/kfence_test.c |   2 +-
> > >  4 files changed, 96 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> > > index 0ad1ddbb8b99..920bcd5649fa 100644
> > > --- a/include/linux/kfence.h
> > > +++ b/include/linux/kfence.h
> > > @@ -24,7 +24,10 @@ extern unsigned long kfence_sample_interval;
> > >   * address to metadata indices; effectively, the very first page serves as an
> > >   * extended guard page, but otherwise has no special purpose.
> > >   */
> > > -#define KFENCE_POOL_SIZE ((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 *
> > PAGE_SIZE)
> > > +extern unsigned int __kfence_pool_size;
> > > +#define KFENCE_POOL_SIZE (__kfence_pool_size)
> > > +extern unsigned int __kfence_num_objects;
> > > +#define KFENCE_NUM_OBJECTS (__kfence_num_objects)
> > >  extern char *__kfence_pool;
> > >
> >
> > You have ignored the comment below in this file:
> >
> >       /**
> >        * is_kfence_address() - check if an address belongs to KFENCE pool
> >        * @addr: address to check
> >        *
> >       [...]
> >        * Note: This function may be used in fast-paths, and is performance
> > critical.
> >        * Future changes should take this into account; for instance, we want to
> > avoid
> >    >>  * introducing another load and therefore need to keep
> > KFENCE_POOL_SIZE a
> >    >>  * constant (until immediate patching support is added to the kernel).
> >        */
> >       static __always_inline bool is_kfence_address(const void *addr)
> >       {
> >               /*
> >                * The __kfence_pool != NULL check is required to deal with the case
> >                * where __kfence_pool == NULL && addr < KFENCE_POOL_SIZE.
> > Keep it in
> >                * the slow-path after the range-check!
> >                */
> >               return unlikely((unsigned long)((char *)addr - __kfence_pool) <
> > KFENCE_POOL_SIZE && __kfence_pool);
> >       }
>
> Do you mean performance critical by access global data ?
> It already access __kfence_pool global data.
> Add one more global data acceptable here ?
>
> Other place may access global data indeed ?

is_kfence_address() is used in the slub fast path, and another load is
one more instruction in the fast path. We have avoided this thus far
for this reason.

> I don't know if all linux release like ubuntu enable kfence or not.
> I only know it turn on default on android device.

This is irrelevant.

> > While I think the change itself would be useful to have eventually, a
> > better design might be needed. It's unclear to me what the perf impact
>
> Could you share the better design idea ?

Hot-patchable constants, similar to static branches/jump labels. This
had been discussed in the past (can't find the link now), but it's not
trivial to implement unfortunately.

> > is these days (a lot has changed since that comment was written). Could
> > you run some benchmarks to analyze if the fast path is affected by the
> > additional load (please do this for whichever arch you care about, but
> > also arm64 and x86)?
> >
> > If performance is affected, all this could be guarded behind another
> > Kconfig option, but it's not great either.
>
> what kind of option ?
> It already have kconfig option to define the number of objects, here just provide
> a parameter for the same option which user can change.

An option that would enable/disable the command-line changeable number
of objects, i.e one version that avoids the load in the fast path and
one version that enables all the bits that you added here. But I'd
rather avoid this if possible.

As such, please do benchmark and analyze the generated code in the
allocator fast path (you should see a load to the new global you
added). llvm-mca [1] might help you with analysis.

[1] https://llvm.org/docs/CommandGuide/llvm-mca.html
