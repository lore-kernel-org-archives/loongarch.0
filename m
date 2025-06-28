Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A01A76BB;
	Sat, 28 Jun 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751117141; cv=none; b=eIq7QJ5Ej1Z8+0uKkAoxBjRzYt5F1P0KtVMue2ESQhOrASmV6lmswkCdrTEZ5N3BOa97+sKAdn8LczSXAjiUXgVadUghSM5IjQjd8V76cY6rWj0+Yx0OWptm94ol1pcDo6kb09lTi98lm23UKmAqsUHGK8UzQP1w8bGm7DhfVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751117141; c=relaxed/simple;
	bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fu31DcXjXkeBCEW80dpHVEGaiyjBQS/9osdH/vV7ePQuYxtdijkGE7H4/nt6uDTmHrFLAz2khjldPhyp7ofQimCWMWATHvUEDk+JEe202K7V4zgskahyrGOr0QjkozpFVf84PuH67aiNY1/AjQnMqNjtQCEjDqts5jUGU6r8ydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLdOnmSF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLdOnmSF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-555163cd09aso268433e87.3;
        Sat, 28 Jun 2025 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751117135; x=1751721935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=YLdOnmSFy/M4wvAvLgIEaf+0Ql8dFie5e6av2fbGBeibgUtL3jj5dALwEpuBUMVwNx
         WWFHw3VVdEWmcWwt8UZppFB/2apCiOAfoxDR2Vi53RHU91grVHXN6DiqoafjLZwj6l2N
         dC54/5CgXo2DvyDlF3ry8GrA/135QL0MgCs3wIFhJWiGR4zL/empp0wDNfpROHfwTM77
         j8kmWTD0CswJ5abSI+qgDuguf0m+yBEdOtJNlIP8anNeS4Db9M2Qz53HiZQh/qSNizff
         aphInoMQj2WorgFiwOUAY2RbuAFIkLWGqIHuJuPeELnExbRnxBao2JQDjaWXrRzjactL
         w6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751117135; x=1751721935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9hXJHuBvyYPVmVbLpoMFR4H07JOmA06RF+Wl4Z/7RE=;
        b=rAHYlt6WiHToRg8JcpY8R97v1keaBeH/GY2Jj6IOgDXgQRCiCB3VjMm64mGkm3j+RR
         6uMMVCEWMaEhU8PGGIGcGT9AcpDghaAln3KENpfTpo0nAARkGvYpghoKkOdcQokKQVJk
         10+vTEvIsIIJQyI93/guKF5bPPR3pvcsnNgk0BrwWif4I4vaAgGjvFQUN9ZiU8Wgb3c3
         6xODlNRN08rCoBAartw0Xklc0G8ZuwGx1xM6F74LAkUqZTBLdPNtYLbTi3W6zHtK64ue
         e2cszcGH4PfUbiCxHxEQMI6yJQYsfNGZl7Z/mQDJ6y7w+VKQngXCGplSRBDXAZH42N8c
         UmeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF2LUx/zdg/3UVngIZSJc7cxAwiTxrqvT1LLbrh8KxYqcf64jxTC5nQAKYe0W5uyPjIb+K@lists.linux.dev, AJvYcCXW4UVJzE4SQUwOTSpU3mEP2IOJMI4fcrEsjFdbH+Vz9auTMruwy0g2vsmE0cwsg1oC4iwNPIobmwhg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw83v1s9ypE64bfk69OZchPE7T/eVC0oeCvRQwWFb40Hi+CD9VF
	yDNj/rgkLg8ra0rrVLJaiSnyyhTvsKcPxFlveXZ9/uC3HCJEfF70oUzXIqFcOXEbNSaAdptFemO
	7vjySBxcHoiFWYrO34zRyrzCG0bqWaT4=
X-Gm-Gg: ASbGncuK2PIgPh0rc6+W/jpH9Y2A8qreXNQRqS4Bdgk9zOC+fXGW3Wd5Ef9U1HUG6lz
	xTEZKGbe8saR2XNKiJKB8DF+SQWnh8eFuy4/zANRzPS8g3cYD7GJGlzCySoI+xkjhY9L4nQn7jt
	eRTuhSVdOXdHLo2kffr3/FmA1xbr8mNtnnKk3t7z29JJ6fYqM=
X-Google-Smtp-Source: AGHT+IGcgqdYgD7HxbDyPqcYV3Heu4fL1zBBGlE2pOeLSvkf48pz8fpRePfbVo/DnCDwvNyc5box4+f/veOvw14SJEw=
X-Received: by 2002:a05:6512:401e:b0:553:d1b0:1f1f with SMTP id
 2adb3069b0e04-5550b817bf9mr2031982e87.21.1751117135042; Sat, 28 Jun 2025
 06:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com> <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
In-Reply-To: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 28 Jun 2025 18:25:17 +0500
X-Gm-Features: Ac12FXz_1yZEfUGAygYOxkSS_g1GpWf3Y2t1PdPyYRlgb0h3dTvUyL8mVDVK8Qk
Message-ID: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 3:57=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
> <snovitoll@gmail.com> wrote:
> >
> > This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
> > interfaces by extending the existing kasan_enabled() infrastructure to
> > work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
> >
> > Currently, kasan_enabled() only works for HW_TAGS mode using a static k=
ey,
> > while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
> > constant) or rely on architecture-specific kasan_arch_is_ready()
> > implementations with custom static keys and global variables.
> >
> > This leads to:
> > - Code duplication across architectures
> > - Inconsistent runtime behavior between KASAN modes
> > - Architecture-specific readiness tracking
> >
> > After this series:
> > - All KASAN modes use the same kasan_flag_enabled static key
> > - Consistent runtime enable/disable behavior across modes
> > - Simplified architecture code with unified kasan_init_generic() calls
> > - Elimination of arch specific kasan_arch_is_ready() implementations
> > - Unified vmalloc integration using kasan_enabled() checks
> >
> > This addresses the bugzilla issue [1] about making
> > kasan_flag_enabled and kasan_enabled() work for Generic mode,
> > and extends it to provide true unification across all modes.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
>
> Hi Sabyrzhan,
>
> Thank you for working on this!
>
> One aspect that is missing from the patches is moving the
> kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
> not explicitly mentioned in the issue, but this is what the "adding
> __wrappers" part is about).
>
> Another thing that needs careful consideration is whether it's
> possible to combine kasan_arch_is_ready() and kasan_enabled() into the
> same check logically at all. There's one issue mentioned in [1]:

Hello,
I've removed kasan_arch_is_ready() at all in this series:
[PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled

Is it not what's expected by unification?

>
> > In kasan_cache_create() we unconditionally allocate a metadata buffer,
> > but the kasan_init_slab_obj() call to initialise it is guarded by
> > kasan_enabled(). But later parts of the code only check the presence of
> > the buffer before using it, so bad things happen if kasan_enabled()
> > later turns on (I was getting some error about invalid lock state).
>
> And there might be other callbacks that should be executed even before
> kasan_init_...() completes. But then for the HW_TAGS mode, if
> kasan_enabled() is off, then we don't want to execute any callbacks.
>
> So maybe we do actually need a separate static key for
> kasan_arch_is_ready(). But even if so, it still makes sense to move
> kasan_arch_is_ready() into the __wrappers for the affected callbacks.
>
> Thanks!
>
> [1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0=
EA8RAtyr-KgkHdg@mail.gmail.com/
