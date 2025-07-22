Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53127FD4B
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208494; cv=none; b=p75I2pK+NyXNoIDtRX/qi2R0KAoh69XysX81X+Ohs0cX5tBQ2syxv5jBGemd1Zkh8ppd0q3Lgul1hYLxkxRpaJ7aQHeUYZ5fzu8HZITyR+zc8F0xJU6NuDCZzPVo0vhZX+SDPo9zvtByWj6jsGH9TmWjy8sfoE+trIt63pplTQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208494; c=relaxed/simple;
	bh=qUqSSv3ifayW+xtWbyUpGpvV2Zozny15J74dw4n6dzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4sBQdou+m8AAEhTVTkJmwhnjslfnQ1wX/xlOGspzueupLnPzYf6CXlnaJSHhz3pqNt1MmKFE1Nwkdn/rIuqTFRV9V/tnmLFofUig5oGOuNYAKDpppbxp6WwMvYD/F1NP8/EZjlybdWiMwu617nY13OzxEumRHrotyQo4xmRh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTBTOHB7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTBTOHB7"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5561d41fc96so6755432e87.1
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753208491; x=1753813291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=PTBTOHB7jE//lEYWNhYcjJMoHNlE51m1ObwroxP+PpqrsmBIiCd2ydoeSP0iQUK99S
         0RV9fbvg6Bf1zcAFqqGKPftJgPwLq42jqcBSKduNSURoVYMsA7zmbpQDHrpKARLyXLjC
         kY+EhATyIqyk0Zthto2+VWBYUsFDnmF01yQ0ATQ+ycucnQz/kHzoo4jrKRVb2KuBTfwa
         Cv9KCzNSNnreiCm9U5gaznftDL83koUVWssaTw4woM4xFaIMpnpOACpuYMk3VOwXCTvv
         0gPGAp0sgNORp167B+V1ZdEuNoWjYgtcmRh9A7zJFICQjfiBV8Rd60UXTNZzrZVonLP8
         jQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208491; x=1753813291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=MY+7iPUrXC+RKUIrtb+S+fJ3hkmeXlo9JJ8qau1ldvdHmvAqIMaANLhhuLzwCBi+st
         Q/pWl5OowhaltrieWAgCICfkYu62mxjxeo6JTI7R2eq34Xgz4ekruZPKCHX4IWKOohwk
         zvbSB+NUjDuWz2IqFJlKScFTKTUPBOrpo+FUkfwhuVecQP6VV78nVohERpnD1fp+nJ1I
         lQJCLkE599UWzEcbkW7CcFNr+sRqwZFbx3qtTGVcb3DTMKXgF9Jzps3tnTqmM9t2KRvT
         q1i8WBbzSANLGTSUt6V96s8GnEoDzGic6Pk5REve6mJHnIb2IhPl+gioLXYU8Gug5ybD
         zJvg==
X-Forwarded-Encrypted: i=1; AJvYcCWjP1Y0pjt23MyRYaIQ8+YzzYaYI/2VTLn+FD8G7rBKaycTLhC5w2zK9w2IIIFoWSpcJGSjoP9Rke0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtlXUP1DZmN6yws76uNvzVg4dz099HhAia87hTHbhktAdGcXe4
	tZ387XRXT9FjE+MehBnZwuNPGJhKDV7hYh2ZR9q4GcNCcOJo7KtMO+66SSu757wegGEvvxyxeqN
	LCyq95phoRPTJNROM17phUDat7kpYXRg=
X-Gm-Gg: ASbGncuv50nHciMf/piAHr/kMncffdHNr9lAhicmOKHHWoq5hn3GwoTZ0im8jmPfuUk
	0xOOm+8R9gR6NVHqe3PPn6WVUKFMK06IPfVWfKmxOyLfxR+48vQ4STfmqV3BIb4/EtWaCSI+TFe
	u0NZV4peaGSVkDNc1wd73qB+4SSd1Mb4egoU3E0u41bUAZyPvFqAgL1hqHgDPj+nZD57MlzAxc1
	eHuBzI=
X-Google-Smtp-Source: AGHT+IHgqZRO4CHZDXwO8i4qviF6GOSHLcIqgaK9MAu32BIYgiKkWD327bPslpy0X0mdn5DHRJd+TcwlCu2XTW4y0IA=
X-Received: by 2002:a05:6512:4021:b0:553:2190:fef8 with SMTP id
 2adb3069b0e04-55a513998a5mr31899e87.7.1753208490745; Tue, 22 Jul 2025
 11:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
In-Reply-To: <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 23:21:13 +0500
X-Gm-Features: Ac12FXzOVMCIvnTEhZltt3TS4XKarYeDIkGkWcMAqG0GgJ62pPTw9Xni6fYiOgs
Message-ID: <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 3:59=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>
> > =3D=3D=3D Testing with patches
> >
> > Testing in v3:
> >
> > - Compiled every affected arch with no errors:
> >
> > $ make CC=3Dclang LD=3Dld.lld AR=3Dllvm-ar NM=3Dllvm-nm STRIP=3Dllvm-st=
rip \
> >       OBJCOPY=3Dllvm-objcopy OBJDUMP=3Dllvm-objdump READELF=3Dllvm-read=
elf \
> >       HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTAR=3Dllvm-ar HOSTLD=3Dld.lld=
 \
> >       ARCH=3D$ARCH
> >
> > $ clang --version
> > ClangBuiltLinux clang version 19.1.4
> > Target: x86_64-unknown-linux-gnu
> > Thread model: posix
> >
> > - make ARCH=3Dum produces the warning during compiling:
> >       MODPOST Module.symvers
> >       WARNING: modpost: vmlinux: section mismatch in reference: \
> >               kasan_init+0x43 (section: .ltext) -> \
> >               kasan_init_generic (section: .init.text)
> >
> > AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
> > is placed in own section ".kasan_init", which calls kasan_init_generic(=
)
> > which is marked with "__init".
> >
> > - Booting via qemu-system- and running KUnit tests:
> >
> > * arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results=
.
> > * x86_64 (GENERIC): no regression, no errors
> >
>
> It would be interesting to see whether ARCH_DEFER_KASAN=3Dy arches work.
> These series add static key into __asan_load*()/_store*() which are calle=
d
> from everywhere, including the code patching static branches during the s=
witch.
>
> I have suspicion that the code patching static branches during static key=
 switch
> might not be prepared to the fact the current CPU might try to execute th=
is static
> branch in the middle of switch.

AFAIU, you're referring to this function in mm/kasan/generic.c:

static __always_inline bool check_region_inline(const void *addr,

      size_t size, bool write,

      unsigned long ret_ip)
{
        if (!kasan_shadow_initialized())
                return true;
...
}

and particularly, to architectures that selects ARCH_DEFER_KASAN=3Dy, which=
 are
loongarch, powerpc, um. So when these arch try to enable the static key:

1. static_branch_enable(&kasan_flag_enabled) called
2. Kernel patches code - changes jump instructions
3. Code patching involves memory writes
4. Memory writes can trigger any KASAN wrapper function
5. Wrapper calls kasan_shadow_initialized()
6. kasan_shadow_initialized() calls static_branch_likely(&kasan_flag_enable=
d)
7. This reads the static key being patched --- this is the potential issue?

The current runtime check is following in tis v3 patch series:

#ifdef CONFIG_ARCH_DEFER_KASAN
...
static __always_inline bool kasan_shadow_initialized(void)
{
        return static_branch_likely(&kasan_flag_enabled);
}
...
#endif

I wonder, if I should add some protection only for KASAN_GENERIC,
where check_region_inline() is called (or for all KASAN modes?):

#ifdef CONFIG_ARCH_DEFER_KASAN
...
static __always_inline bool kasan_shadow_initialized(void)
{
        /* Avoid recursion (?) during static key patching */
        if (static_key_count(&kasan_flag_enabled.key) < 0)
                return false;
        return static_branch_likely(&kasan_flag_enabled);
}
...
#endif

Please suggest where the issue is and if I understood the problem.
I might try to run QEMU on powerpc with KUnits to see if I see any logs.
