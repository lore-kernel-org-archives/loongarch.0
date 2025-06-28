Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D0F1F17EB;
	Sat, 28 Jun 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751108222; cv=none; b=tHw2JiFi6CB+GcnqmxrfM5zsagTdywyMXn9CfD0eoyk/wviDTXTKMcw6OQqbh9L6HYASil59C9uK8wRIxv1A3OWVC1BF8NmGh5LfnTSJ9jW/6sF+fXbflwJ4A4yqZ52pbF3O/3/TLh6Kc273sPp5ETQlpwQoSlL8rfULDMJDrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751108222; c=relaxed/simple;
	bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHXtBI3WOm4sN+FqHgTW5WPpwwYzA3TjBn6GLbX2LdhJXer4BOttOD3QMXcRZcwLeBCYfGl1NwksrBxsRZJkri4xTHPxt1aAJeERpu+B+60j05nZO59b9F/mI64hHyqbjGDcSm6k+XTP5rOmf6VCseRzO17rOP51So8+pAmdhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2iGa//f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2iGa//f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453643020bdso26032505e9.1;
        Sat, 28 Jun 2025 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751108219; x=1751713019; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=Z2iGa//fH+2CbRvGev+dS+kaUIgvfPIQWcsOjX05PKYW09qu61Y/gqh101yPKuo9os
         tUMnPd7FjphSdSHAl5GrRYLmwUmdqkq+dTEsEqymEbU5/doUnxnuCwkVsTvV3CTOTpF/
         XJUHNRVpHMRrP60IY6fATAB9yre7kfvguW+xlgDdKG9tJ8nvOoA2XvKvsYGxFv1hSKcE
         Cy9MjB3nxZjt29ANhFqP6WzfWZVkiiTRUK4teblj0OFOIk0Kv8EiQUN4+EwaHZgm871z
         nNicEYBDX7j2cmrmGh7AeXZW5J9fARAfq1MwzGH64AkK4azG0jIyXSgy1xf0S8piGzU6
         ktnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751108219; x=1751713019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=AROWtt+HOCyJcd6Fb8HmblC1Ag3mb36vsAcz5e0N9IsRMgtujVhs2adgpriTM3IlDZ
         pmvtVbRPhtRmrF+K4L0sUCqG4N0vjUg60aC4XAU1c9RtHbdHmbw+hBVfuHf8UtgAzUQo
         vw7imtIknRXUVBA86JKsb+GhodRc7OFuhbOkHiVLRTLhpuaAM1UjWa/47jK58TCtPFtJ
         igZGKEXVupILWIR+9uKgp+HB1V2B53arXMGv/yAzUrlchrjxYiKZcN8EsQoN+LQp7pnF
         Nj/JUNgTfxAhXdA7PQgNIYVikL9KuNKQb570fpFkGNI6wz6D74Ir3POWE8fHwoEvIcew
         FmEw==
X-Forwarded-Encrypted: i=1; AJvYcCU56NsvHXMwm1ds3IrpiClW9WbI5wIlfmf/vCo12zYRuwEQtk4BIgfNo2Sjxm1fQpVhoc0mfNQKz13p@lists.linux.dev, AJvYcCWFxPFg6txhsXW75MTus5xPBSvMto/cXggE5AV+Jl8OsZf49MYXohxhj5fPkSGsx26j31t6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+4B502aw/wmdq8WDi/PWfrhmr9qebSyg1A1Th9N4R0gTC1BBN
	e2TjPwb4dzEwisqJZGWmaGuHaJ627/f7GCz7ryFmvyXDbYGpFs204LU8bTVWuaxNc4EvMkAY2kL
	98fbsVQLbE0vtMIA7/UAMWxf9ttJVSrQ=
X-Gm-Gg: ASbGnctUAHJ4WOMEpY3zgKBavVFJ1Ze4tdJYfgnNPEyRqNt4lbX9VJAJMO3hXgY+E33
	ucIvgHAOyke6pUIBuvm/Cx0uRWiGJPOAJVTKjz6lVBF7SMh9Ya6yAVQUPMWNtZIlDq0t4+H4opI
	VPRHBZtYZ4xldbRYTMkQAcl2OjhlI3fgOrLcDqGTWC0BVQNCox2qfOXVU8
X-Google-Smtp-Source: AGHT+IGAGkRhQdbRpH6HhS1J+gxMpfj97HGV7cZaVPURx7gE9Aj/9LEPZdgznOP2vFFz/ZEWLwEewnTNwxfxlbsYcE0=
X-Received: by 2002:adf:a1cb:0:b0:3a5:3b14:1ba3 with SMTP id
 ffacd0b85a97d-3a90b8c99bdmr4338216f8f.49.1751108219175; Sat, 28 Jun 2025
 03:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com>
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 28 Jun 2025 12:56:46 +0200
X-Gm-Features: Ac12FXzas27xdNkixqmlGojlaGpK_Gh1QoVs4xiB8K_jsjOjMmn0UG8i3tUlU1Q
Message-ID: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
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

On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
> interfaces by extending the existing kasan_enabled() infrastructure to
> work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
>
> Currently, kasan_enabled() only works for HW_TAGS mode using a static key=
,
> while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
> constant) or rely on architecture-specific kasan_arch_is_ready()
> implementations with custom static keys and global variables.
>
> This leads to:
> - Code duplication across architectures
> - Inconsistent runtime behavior between KASAN modes
> - Architecture-specific readiness tracking
>
> After this series:
> - All KASAN modes use the same kasan_flag_enabled static key
> - Consistent runtime enable/disable behavior across modes
> - Simplified architecture code with unified kasan_init_generic() calls
> - Elimination of arch specific kasan_arch_is_ready() implementations
> - Unified vmalloc integration using kasan_enabled() checks
>
> This addresses the bugzilla issue [1] about making
> kasan_flag_enabled and kasan_enabled() work for Generic mode,
> and extends it to provide true unification across all modes.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049

Hi Sabyrzhan,

Thank you for working on this!

One aspect that is missing from the patches is moving the
kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
not explicitly mentioned in the issue, but this is what the "adding
__wrappers" part is about).

Another thing that needs careful consideration is whether it's
possible to combine kasan_arch_is_ready() and kasan_enabled() into the
same check logically at all. There's one issue mentioned in [1]:

> In kasan_cache_create() we unconditionally allocate a metadata buffer,
> but the kasan_init_slab_obj() call to initialise it is guarded by
> kasan_enabled(). But later parts of the code only check the presence of
> the buffer before using it, so bad things happen if kasan_enabled()
> later turns on (I was getting some error about invalid lock state).

And there might be other callbacks that should be executed even before
kasan_init_...() completes. But then for the HW_TAGS mode, if
kasan_enabled() is off, then we don't want to execute any callbacks.

So maybe we do actually need a separate static key for
kasan_arch_is_ready(). But even if so, it still makes sense to move
kasan_arch_is_ready() into the __wrappers for the affected callbacks.

Thanks!

[1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0EA=
8RAtyr-KgkHdg@mail.gmail.com/
