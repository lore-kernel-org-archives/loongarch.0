Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B33474273
	for <loongarch@lists.linux.dev>; Fri, 25 Sep 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373662; cv=pass; b=JKBRVPU0+wj6V0SYGBuTDsy/w5hcE9j2fS3LiAww2W/cTU2RvaTUnXxXlCiddKf9nv8ZcCXZYGctjLBhiuzcirLV9hwlUIwS9ts0T0ayutDIg2yOAQaujC3t8GZd+L2ooxUevWIXXdXdCf41+hMBdZke7kGd/upvkHNOml3o36o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373662; c=relaxed/simple;
	bh=LklSWknRMwfaVZQDpvI7pbaMGR+tZRKs+3Kj5yrKaHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwKRVRgYuCItHygdndipxog2x0x7jY9bcHy3xF3l7geDh/xpx9sqP9BCE3+BOWbxA3rT4IAZvoqPIFtpgjIBAsOH61diPdwBJN+e5bPaJgww09jzUB2XR6SM0srV5VOqhXUPACyc1HNQmpHGgaP+UmHkz4I5K3WQ7xUV9br7X9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+a4HyUs; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+a4HyUs"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so787652f8f.1
        for <loongarch@lists.linux.dev>; Fri, 25 Sep 2026 15:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373659; cv=none;
        d=google.com; s=arc-20260327;
        b=T/X/DZPSTIgQRJ+nDfffVRE0qMKZU4PW4g/TspM6sgVqZe32VRK/dkEJl6kgay8ON+
         EkhLWJK0TCjiN8InreDx1b0E7YS41pps0tVknwIN4JUqProGeeS7xgRKjOLskVR/UACh
         ReSZppP9uxNrN+pvhud2j7yfwyqxm4BJ0SbXFeooLtZzP7lbq1w3D4KAi32en8erfn9E
         Vk4TBrlp76LgY9AISeQ8Myf4djPCk1Tpr3cD2HA46hNhNkX67dglUzC/F4Alg6gYl0Fy
         ER2/DZJtTkeC3FnfveHlHEHovSUJhs67YqyMAZmcGKYXN6j/nnOVMCW0Z3O6dZtMPqUi
         0b4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        fh=dammZxgPV7p+oclyjWcf0VSNDIDWWdp0VdKRvYrdRG0=;
        b=Qfdx8U8GB/fLvvWpmol9QVck8BN4B1L9jHUqKj2JE/W08M5lQMAYOSLb6qqJZHSvTj
         TdWZoVXmn2OadSB7MKlrXOM9W5XxaSP9kxc9XnRCXOqliy/5f++T6Bb1BShO0NtPNX61
         PEwAN0g2RckcLIeOWIGj+VQJTceYMAb5aSL3TKlMfUHbxR3857Da9s8jDNVwLNw6HGyp
         EVN1TVlWm4qcP7yjO3ckhN4mIOgy6My9U17pfvCRXAvbAuYxFgplZk9Z7wSwe58UR81C
         1u42EbtFU5dK6I4m2N7fPkcQeNfvHusMB35Pokjg8b1kO8dhPMP2O0bTTBCJZvT9PSPt
         C5ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373659; x=1790978459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        b=Y+a4HyUsrYBL37o2+j+Co8LQADV6XzHZjXYtsLtXbvZgyS8Ijghog1EdUnQAvJLQ16
         nzzI7xxDw4QOy7tolOI+LPgRJoIKaHoKhZE7hOJz0z6sPnYMlJUsXbZ3Z2yqrFxRC7xM
         w9DK5/wKPKgskkYPg2uEz8KdB557gOCbtCF54sqhp0X2Lnjb+8NvCB6LVumXqdy1y7+v
         g06NqpsU+fZ/vFimySK9FX7fQGspSYE+vs/QHBWKN4oO62WNnatrX9iucm1eN/cKImAi
         zvfQIJqDPu1eV0s4wIoJeDFbX0rAgubYNEJWZzSCznDG7rrIgCBYhIyUR51QyMpZW7fL
         AQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373659; x=1790978459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlMEQu1qsaTBww97rVbchh8pOSM1CexDa8zo36TMiIs=;
        b=hf7tOMDeS9m9QZCEntFolPoq8EG4+ojujyXaRaIdIcuN1UsVFfu112uMj73kvKwYFw
         QparrrYDc+lw3qrhF4t0mct3PH4+JAKg2baQwLXNdHs9Ptacu3Ah2WNzyOIGoeXzRh2r
         M/fjLURGK3XTYkvSaVsSVbUz7RI+d+6Bo0lmIRwzfNtSOq0iiadHsEoCX4I0DEK2fLZ4
         Ffu5pmLWulm34JEDibU2d2AXfLhMutKCxqrFfb+dclvdbDZG2+WOZfH/kFC79uaXTVrw
         SnkrMmrC9DFTE4pSv/GDskdas9hBQ4u56XSjmyaMoOOTjaDbB07jeAQybmOTh8sBmwCq
         CiRg==
X-Forwarded-Encrypted: i=1; AKwUvByUhSV5zo7D1ioIp6o/AShKLyweT1BtxhtvLDN+h0NJnscokYM9g5Lzrcft/mK0ohx0s87M6F1RX4s=@lists.linux.dev
X-Gm-Message-State: AFuF++lMLvTI5SP8BG7xuU0ztp8U0VgwKTr3f+JTGzSJ+jnjr1K/QeCx
	+dhEqgWVTc0Sp1o35XCJ5iMURPuOqfTnsSubLkwMSHRVYEwAw7g6grByzv9LRnW3QaBB7fKKJ92
	oOtS8BzkwX3zDIrb7/AWlgmMAp0m9dvkiUBq14Jh7
X-Gm-Gg: AYBFou1VyhnsxLbtgLDGL2rY7EYJw6eVFreq//9+M2X/A5ZtjU1uw5fq4z3FsgYdu7K
	9H9cWAtF4HjLVFNXY0kCo9yNyq9+VkgkydvqsenSWxGwxSQ6RGbBdK/oK1k21JbvVXAM3dI2niI
	ihj+2UD3Kj4OTZDEKpBKYw+pYCxFh4E0dPf3dmE7wNjQ59vV/67pf7QIR5quZjqFWJbVQbMR9wG
	MnFZJ4mp2rzYEKseDYTZD4CXL52zLML6OXc06shRKvR29T/qvJxfqn7mjb3/eqWNiwqLZ5+HXVa
	1BI4vh0zD9UCio5GXDNxAL5cCYJjhhEG0rWDi1+4jcz8wUhUxzt5bD0Cw3EHZ2508N4wRGwIjUl
	nodKWfSyQ/kcGtnWfQa0jZYnp+j4BYsadtZ3ZHqnLTP7sJD44AR+DGRnVm0L80LabFVJ2qA==
X-Received: by 2002:a05:6000:41f7:b0:487:27f6:a4d6 with SMTP id
 ffacd0b85a97d-488716b00eemr13403982f8f.38.1790373658191; Fri, 25 Sep 2026
 15:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com> <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 15:00:46 -0700
X-Gm-Features: AclHuK_Ut9cdmWvtWXJ4TZyUvK9Gsy2XhR4mB0KeYmSzL3PaZLLknagb6ZhED0Y
Message-ID: <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:56=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 25, 2026 at 2:53=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > After a recent change in LLVM [1], builds with the random vDSO
> > > implementation, such as PowerPC and RISC-V, fail when checking the vD=
SO:
> > >
> > >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not=
 supported
> > >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not sup=
ported
> > >
> > > memset() is now generated when zeroing params->reserved for some buil=
ds
> > > because LLVM has an optimization (now run in more instances) that can
> > > recognize at compile time when it is assigning a static value to a
> > > contiguous area of memory and turn that into a call to memset(). Both
> > > clang and GCC assume memset() is always available [2].
> > >
> > > clang provides a builtin, __builtin_memset_inline [3][4], that can be
> > > used to ensure an external function call is not generated when zeroin=
g
> > > this memory. Use it when it is available.
> > >
> > > While GCC has no issues with the current code, it has generated memse=
t()
> > > before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to =
out
> > > of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5]=
[6]
> > > with a similar guarantee to the clang builtin, so use it and
> > > __builtin_memset() when available.
> > >
> > > If no option is available, provide a simple memset_inline() like the =
one
> > > from lib/string.c to avoid adding an ugly ifdef.
> > >
> > > Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3ee=
dd359bdf00cb44b1c2439 [1]
> > > Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#in=
dex-ffreestanding [2]
> > > Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90=
b37f149069d8e5c0c2efd [3]
> > > Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-=
inlined-memset [4]
> > > Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428=
b0668cd8ab0b3e3ab94f1d733124d [5]
> > > Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-=
finline-stringops [6]
> > > Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Switch approach entirely (Jason, Nick)
> > >   - clang: use __builtin_memset_inline() to avoid external call
> > >   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (henc=
e the
> > >     massive CC list increase)
> > >   - GCC < 14: no issues currently but avoid ifdef with simple memset
> > >     implementation
> > > - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-=
memset-llvm-24-v1-1-80a92f2e225a@kernel.org
> > > ---
> > >  arch/arm64/kernel/vdso/Makefile     |  2 +-
> > >  arch/loongarch/vdso/Makefile        |  1 +
> > >  arch/powerpc/kernel/vdso/Makefile   |  1 +
> > >  arch/riscv/kernel/vdso/Makefile     |  1 +
> > >  arch/s390/kernel/vdso/Makefile      |  1 +
> > >  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
> > >  init/Kconfig                        |  7 +++++++
> > >  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
> > >  8 files changed, 30 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso=
/Makefile
> > > index 7dec05dd33b7..f6619e1cb2ce 100644
> > > --- a/arch/arm64/kernel/vdso/Makefile
> > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(=
CC_FLAGS_SCS) \
> > >                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> > >                         -Wmissing-prototypes -Wmissing-declarations
> > >
> > > -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tab=
les
> > > +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tab=
les $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >
> > >  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > >  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > > diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makef=
ile
> > > index 9c9181bb4071..0b84892d084b 100644
> > > --- a/arch/loongarch/vdso/Makefile
> > > +++ b/arch/loongarch/vdso/Makefile
> > > @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
> > >         $(filter -m64,$(KBUILD_CFLAGS)) \
> > >         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
> > >         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> > > +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
> > >         $(CLANG_FLAGS) \
> > >         -D__VDSO__
> > >
> > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/=
vdso/Makefile
> > > index 368759f81708..0d1a49529885 100644
> > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDS=
O
> > >  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
> > >  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
> > >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
> > >  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
> > >  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecst=
ack $(CLANG_FLAGS)
> > > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso=
/Makefile
> > > index 8dbf2532a573..c023046a3fd7 100644
> > > --- a/arch/riscv/kernel/vdso/Makefile
> > > +++ b/arch/riscv/kernel/vdso/Makefile
> > > @@ -36,6 +36,7 @@ endif
> > >  ccflags-y :=3D -fno-stack-protector
> > >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > >  ccflags-y +=3D -fno-builtin
> > > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > >  ccflags-y +=3D $(CFI_FULL)
> > >  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > > diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/M=
akefile
> > > index 35c834b895ec..54bcf2984ca1 100644
> > > --- a/arch/s390/kernel/vdso/Makefile
> > > +++ b/arch/s390/kernel/vdso/Makefile
> > > @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-sy=
mbols,$(KBUILD_CFLAGS_VDSO))
> > >  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables=
,$(KBUILD_CFLAGS_VDSO))
> > >  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronou=
s-unwind-tables
> > >  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> > > +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
> > >              --hash-style=3Dboth --build-id=3Dsha1 \
> > >              $(call ld-option, --eh-frame-hdr) -T
> > > diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vds=
o/vdso64/Makefile
> > > index 7c0790065b5e..c2353a065279 100644
> > > --- a/arch/x86/entry/vdso/vdso64/Makefile
> > > +++ b/arch/x86/entry/vdso/vdso64/Makefile
> > > @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D =
vsgx.o
> > >  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
> > >
> > >  # Compilation flags
> > > -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcm=
odel=3Dsmall
> > > +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcm=
odel=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
> > >
> > >  # The location of this include matters!
> > >  include $(src)/../common/Makefile.include
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 8583d9f06c52..ff3f8475dd2f 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
> > >  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> > >         def_bool $(success,echo 'char tag[][4] __attribute__((__nonst=
ring__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> > >
> > > +config CC_HAS_OPT_INLINE_MEMSET
> > > +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> > > +
> > > +config CC_OPT_INLINE_MEMSET
> > > +       string
> > > +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_ME=
MSET
> > > +
> > >  config LD_CAN_USE_KEEP_IN_OVERLAY
> > >         # ld.lld prior to 21.0.0 did not support KEEP within an overl=
ay description
> > >         # https://github.com/llvm/llvm-project/pull/130661
> > > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > > index 2851afa9154f..f5cad5641985 100644
> > > --- a/lib/vdso/getrandom.c
> > > +++ b/lib/vdso/getrandom.c
> > > @@ -29,6 +29,22 @@
> > >         }                                                            =
           \
> > >  } while (0)
> > >
> > > +#if __has_builtin(__builtin_memset_inline)
> > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst,=
 value, size)
> > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value,=
 size)
> > > +#else
> > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > +{
> > > +       char *d =3D dst;
> > > +
> > > +       while (size--)
> > > +               *d++ =3D value;
> > > +
> > > +       return d;
> > > +}
> > > +#endif
> >
> > Does this work?
> > https://godbolt.org/z/Tx6EaGMfb
>
> Hmmm...possibly.
> https://godbolt.org/z/ec9rzd9Yf
> I don't get it...

Just keep it under 2 pages, it will be fine:
https://godbolt.org/z/qqoMqfxev

>
> >
> > (Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
> > just way behind on my code reviews. Sorry!)
> >
> > > +
> > >  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
> > >  {
> > >         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > > @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *=
rng_info, void *buffer, size_
> > >                 params->size_of_opaque_state =3D sizeof(*state);
> > >                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
> > >                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> > > -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved)=
; ++i)
> > > -                       params->reserved[i] =3D 0;
> > > +               memset_inline(params->reserved, 0, sizeof(params->res=
erved));
> > >                 return 0;
> > >         }
> > >
> > >
> > > ---
> > > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > > change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
> > >
> > > Best regards,
> > > --
> > > Cheers,
> > > Nathan
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
