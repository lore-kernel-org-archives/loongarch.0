Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05A1CBEAA;
	Sun, 29 Jun 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751227537; cv=none; b=Oi4Tk/l4xHtQ8YHvRI+Hk/HsprWmv8MCeC7VyDwrs5GTxNdOqLCqHb4cWr1/yBlH0pRYoLN6ytq044c30GE/WFRGi016KSgqbZGxtO17NvCKKL5jx3dx7dIZ3nvRHeT0CchNQK4NxnggAH8805jrTGuTSCXpm4oxGmHTUSa3yb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751227537; c=relaxed/simple;
	bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpT3wigx9p+uMVsFPlzB7ZdlMUkl5s1KF+ZYZiXb/t8Fx7b9AZUlT/zt4GZBT5oR0sSotnl5MUA0+efzRd5QVhBHSuUIbwPr83Qbv9EJNOMPA4Oi0vowZzAI6+geT35Yw7mJHY2HkMeMwQOF+xiIfIP8wzKNzJhuoo1zLHnmhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXNyClkB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXNyClkB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1297292f8f.2;
        Sun, 29 Jun 2025 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751227534; x=1751832334; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=JXNyClkBkyJSZgJeYm3kRA0jQ3kZRyYlN396tR3YzsuLcMPJYj3IPPAEowr0ZqIEns
         +MGqXZWgvhbkYcm8hOWoHFr2JN1VbMICIdTcq5JNTqckb8pMwDij6rcSDPOovm6KmVXc
         9wg9nCmOr4mArZuUkzAF7q4wzFzIaQK/i7/+QiWFF3z9KRUZAwMsOX4gmdt/8/+7u8yd
         xbMglJvyXMR+d1hJ+apAvAxDvy6GHCiKMO95IkhaRdhUfhN18srD77e17xRRiGzgWNLl
         S7N+60ra+5jnVLURApd06BCNP7fGfkf6Fr+0MZ47d0gaJ/mcEGKzh9JZYO/CuHeCBJ1t
         XBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751227534; x=1751832334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpjVZvBcIo5G28UGMNZaBkJZF6ITVDpFyOxvjBVjrQo=;
        b=BxDQZcvaJOMJNYL440gpRpxhZ3Ccukb2iR3VNeSFbGf2ohw/C9i9hn06Su+zFzZwaS
         h8pBlmQ3hvPxZ+ZgHhfnPU3fYnTI+P2p0YQWY6Y6vUdLlpLd1yVWfIdDWa7pwQqskCgM
         ahxnskBJLWmiHG9wJOCEHxSCECF3L/kVZtCpnACY3GjiFZTOxwN4eJGq/1AdDFfIluYO
         roU8xLeKTJqp2yciI3iq+jdJPR0Fu9cIci5HVYK7k2HpJuIAztrBarwwF5Yyb39JXHe/
         0Bql7Hrm8NT2NyJSdOD28uYyCUKhubScNsKDdZrRgoyhsjyQQuqK4BkBoZhUohSYVNvX
         Vg2A==
X-Forwarded-Encrypted: i=1; AJvYcCVBk/wTNtNDotBi2AlqUx7ugWTJcpi4KE6gY3XyCNthmb7iM33bBxe9kjE+qHy47xpHVb/E@lists.linux.dev, AJvYcCWPDdSdDoWq/RipxE6oT/ipIDSUf5YNOYaqlPISJHzfvRLCVBwkED+nF/wR/s0nwD6Ja6ORIdBfc5eq@lists.linux.dev
X-Gm-Message-State: AOJu0YxcYHxlZi7Rm9EjkzlG57LullmMSDZhekSA2r+8Xww69O9VP+jP
	Q92PjtEbQ1vHxglSvGoUiH+JMTgMnKaUi/svm9ShAO3dhuhV/C2uHjY31b+VibhkJz+pkUxgF3g
	4OXNA8yxFSwNIKOVzyMthTvNakFHF4m0=
X-Gm-Gg: ASbGncsC+5H2Pbi3AwTJlaDHHo7BwLptdKL4eTfnFSWkR3zINWqHCG1eNIqW2cpnZ/h
	dnsiWFugl1gRMOv/HkaR9mRFz94AudEm7T9zojRik3Dgktb9DuQpDfrmdJpb4yWDrLvJR2BrQG3
	s3qxxUp11OCwanIPolAp23MnOkVSUMXCkpDUrP1el+gHdb6Pmlv2zrOjQ=
X-Google-Smtp-Source: AGHT+IG9Jnr7utU7Trd4lqTg8GWi9uRNVbru2WXxMPFleBJfH4kInx+LP9kDmy2SL/eaM5dKaQqnO/o2Ok4MjECqA8k=
X-Received: by 2002:a5d:59c7:0:b0:3a4:fc3f:ed28 with SMTP id
 ffacd0b85a97d-3a8fee64fafmr10710844f8f.29.1751227533501; Sun, 29 Jun 2025
 13:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com> <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
In-Reply-To: <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 29 Jun 2025 22:05:22 +0200
X-Gm-Features: Ac12FXwSsH6fvJE1vEp59zDWu481tFenq-ukDXNa3gyvAGzFlMqgNHF8VfcuM6Y
Message-ID: <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
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

On Sat, Jun 28, 2025 at 3:25=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 3:57=E2=80=AFPM Andrey Konovalov <andreyknvl@gmai=
l.com> wrote:
> >
> > On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
> > <snovitoll@gmail.com> wrote:
> > >
> > > This patch series unifies the kasan_arch_is_ready() and kasan_enabled=
()
> > > interfaces by extending the existing kasan_enabled() infrastructure t=
o
> > > work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
> > >
> > > Currently, kasan_enabled() only works for HW_TAGS mode using a static=
 key,
> > > while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-tim=
e
> > > constant) or rely on architecture-specific kasan_arch_is_ready()
> > > implementations with custom static keys and global variables.
> > >
> > > This leads to:
> > > - Code duplication across architectures
> > > - Inconsistent runtime behavior between KASAN modes
> > > - Architecture-specific readiness tracking
> > >
> > > After this series:
> > > - All KASAN modes use the same kasan_flag_enabled static key
> > > - Consistent runtime enable/disable behavior across modes
> > > - Simplified architecture code with unified kasan_init_generic() call=
s
> > > - Elimination of arch specific kasan_arch_is_ready() implementations
> > > - Unified vmalloc integration using kasan_enabled() checks
> > >
> > > This addresses the bugzilla issue [1] about making
> > > kasan_flag_enabled and kasan_enabled() work for Generic mode,
> > > and extends it to provide true unification across all modes.
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> >
> > Hi Sabyrzhan,
> >
> > Thank you for working on this!
> >
> > One aspect that is missing from the patches is moving the
> > kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
> > not explicitly mentioned in the issue, but this is what the "adding
> > __wrappers" part is about).
> >
> > Another thing that needs careful consideration is whether it's
> > possible to combine kasan_arch_is_ready() and kasan_enabled() into the
> > same check logically at all. There's one issue mentioned in [1]:
>
> Hello,
> I've removed kasan_arch_is_ready() at all in this series:
> [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
>
> Is it not what's expected by unification?

I guess the issue description diverged a bit from what needs to be
done, sorry about that.

The core 2 things I wanted to address with the unification are:

1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
implementation and move these checks into include/linux/kasan.h (and
add __wrappers when required).

2. Avoid architectures redefining the same kasan_enabled global
variable/static key.

Initially, I thought that s/kasan_arch_is_ready/kasan_enabled + simply
moving the calls into affected include/linux/kasan.h functions would
be enough. But then, based on [1], turns out it's not that simple.

So now, I think we likely still need two separate checks/flags:
kasan_enabled() that controls whether KASAN is enabled at all and
kasan_arch_is_ready() that gets turned on by kasan_init() when shadow
is initialized (should we rename it to kasan_shadow_initialized()?).
But then we can still move kasan_arch_is_ready() into
include/linux/kasan.h and use the proper combination of checks for
each affected function before calling __wrappers. And we can still
remove the duplicated flags/keys code from the arch code.

[1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0EA=
8RAtyr-KgkHdg@mail.gmail.com/
