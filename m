Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0C2EAD1A;
	Thu, 26 Jun 2025 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951928; cv=none; b=cGz/G3Q4O81URZCDoIuL0tetT2/T6/Qaq/VELTDLZ5MjBOhm/+NmeXMl+yxJ44DdyOMNXTVcmSnqdAaYn4MEcvbOxI8dPaX+97JnE7bap+4ue03Hw6guZ0ip9QtV+njiTgb7dD75AIfCVzXdrWBxiyOIaAzOlzbjeVfp/amhoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951928; c=relaxed/simple;
	bh=YRTPh4M5vCs+N0uizwmFsKU7yoOODDIMAcYCfmONAgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yp5nOD52PhVbgymdP0RLKufee5sHSxQak+VnABg8/dUW9I+mZcz/ua/M69Luiv1i+7FvSsqnI3b2DYJKRJfGBJ9k031rVrFem5PKVHge/nUT0st8s9Fjc6KIb/ybVgH3KQ86XZkBv7h5wxXwGyrPvblQ23eXmYir3IhOyTfTaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axQvtbqn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axQvtbqn"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32cd0dfbd66so9020261fa.3;
        Thu, 26 Jun 2025 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951925; x=1751556725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMfAvEP2mtW3abNAfjIslAPajM3CO1XTnrCn/94UwT0=;
        b=axQvtbqnOltMCE/hHuXMx2Ff0QtL3YHI/9CteAVcxHd1SK0tsMrVPyfMmZrSUdU8zU
         nieaVWg2Dax9IHDH8F//kxNygnKSGQw+ea9ni76JZ078NaPcq5kMXtjcPyNvlNMY2wSf
         8FPARpcrg59fYUtatAj3dN2pxtETLHlSFpeNRA884p9UhumEo2P/v5hAvIf5gcgpPVNE
         yER4xViZTr8GDrxyucmeawQ5mkFrH8KhLpewzI6f9b983lq2j7GOZOcWN1MPxUJzEWez
         i+Oi9Wb+Zt/8A3VXUAoQWNCizu0eB059HkWyr6bmWuPT0gTyKse2u3oiIro3jl2Hp1m0
         syTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951925; x=1751556725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMfAvEP2mtW3abNAfjIslAPajM3CO1XTnrCn/94UwT0=;
        b=fzpa74S1jDhsge1K1LphgdD0du7/MgU4RzrZAi6gJHZ9aV6NMt5UtTNIEuYZsd+oqP
         c0tfKoG5BVjxaEP7bhKpSXtLkdWlPXSb21NZ+liEo3ie9lXGzVqImG9NYbGGsIKTUsZV
         DyfFIHLVuWE4RPXKBHUTE40pQg9L1JZOEXI6eJeP+L7sbAWdqMGrSLf31qogsHuJJ7Sw
         YQ65tTShtwsrd55fUM0N1fX9gV+ABO2fkSXoWGbiJ+HP9jClVj5PJr7CorcD+xhd95F/
         PeD2h/9oJ/bDMnwfEX8J+RX2sshBENa/gtfdjZdQx/Q4V72PbjlDt+nJmpY/4KWHynn2
         x+MA==
X-Forwarded-Encrypted: i=1; AJvYcCV8u6L0U6FJQ3NHIPJjtsSYZxEyV2GNvN9XYcqmuSUSWaSFarUGbjfkpzqCJtOHBB1FYA+7iA6SA/gx@lists.linux.dev, AJvYcCXKJUm/p2gXR/6tpSeDZXuxeuiSdRp3jzE1oLLQg3aOf46wZR/3HU0rOeRGDYjUOaxavSDJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwhdS9C5yeLkRQIZVtMo/0ZJfArWzBLAkdbkjHVmppzk2Gc2KqE
	uINrSfox+H221iINiC03a1K/2/KmLcWwdUNu5sTWYYHsLeA/AI6ArEy7
X-Gm-Gg: ASbGncu80HVGKQnZs4Z3ocPY1C0QacJdzSL+z1c4U8j3mw29T7ZfpaHnaHUaFLU2JTL
	6BKloRo1IaJXdYEvSPe4K7jlP1h8k9EQjpzJpC2r9p6eHUNmnM1NFwc4V8nanTmeSrkllAWt9oK
	5KH9VoraOHMc81hauo80yieuHLMzsSG0+6fzhAsdhs4A0KDNIsep2gsZ3qxEAG1+F6osbTojUAO
	bZH8V4oKDm+vEIVYhXFlyzijCCjQ55T+CavkigeT0oBGkQRMFGFxsL7ChrPP8ysvpRW1qq58tE1
	zHNQ0lKNt6r/Ue73ZKa9psOwbgqO7TnQW9xsTckaDSTT4IN3P4x+uqsp06iEZsTSwg34f8yX6SC
	1OlQ9dAgaNE1oZ4Ket6x+H6w+lePd2ieGQxwBCBvF
X-Google-Smtp-Source: AGHT+IHpXirYmk7XDZLOi1Ssi0yS8Ocf718QqXqkpNJ7oPQlT+uR1sIDO9gdQg1tyNmCsb6VEaTfFA==
X-Received: by 2002:a05:6512:1589:b0:554:f76a:baba with SMTP id 2adb3069b0e04-554fdcbb935mr2999055e87.3.1750951924452;
        Thu, 26 Jun 2025 08:32:04 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:03 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
Date: Thu, 26 Jun 2025 20:31:36 +0500
Message-Id: <20250626153147.145312-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
interfaces by extending the existing kasan_enabled() infrastructure to
work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).

Currently, kasan_enabled() only works for HW_TAGS mode using a static key,
while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
constant) or rely on architecture-specific kasan_arch_is_ready()
implementations with custom static keys and global variables.

This leads to:
- Code duplication across architectures  
- Inconsistent runtime behavior between KASAN modes
- Architecture-specific readiness tracking

After this series:
- All KASAN modes use the same kasan_flag_enabled static key
- Consistent runtime enable/disable behavior across modes
- Simplified architecture code with unified kasan_init_generic() calls
- Elimination of arch specific kasan_arch_is_ready() implementations
- Unified vmalloc integration using kasan_enabled() checks

This addresses the bugzilla issue [1] about making
kasan_flag_enabled and kasan_enabled() work for Generic mode,
and extends it to provide true unification across all modes.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=217049

=== Current mainline KUnit status

To see if there is any regression, I've tested first on the following
commit 739a6c93cc75 ("Merge tag 'nfsd-6.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux").

Tested via compiling a kernel with CONFIG_KASAN_KUNIT_TEST and running
QEMU VM. There are failing tests in SW_TAGS and GENERIC modes in arm64:

arm64 CONFIG_KASAN_HW_TAGS:
	# kasan: pass:62 fail:0 skip:13 total:75
	# Totals: pass:62 fail:0 skip:13 total:75
	ok 1 kasan

arm64 CONFIG_KASAN_SW_TAGS=y:
	# kasan: pass:65 fail:1 skip:9 total:75
	# Totals: pass:65 fail:1 skip:9 total:75
	not ok 1 kasan
	# kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test_c.c:1598
	KASAN failure expected in "strscpy(ptr, src + KASAN_GRANULE_SIZE, KASAN_GRANULE_SIZE)", but none occurred

arm64 CONFIG_KASAN_GENERIC=y, CONFIG_KASAN_OUTLINE=y:
	# kasan: pass:61 fail:1 skip:13 total:75
	# Totals: pass:61 fail:1 skip:13 total:75
	not ok 1 kasan
	# same failure as above

x86_64 CONFIG_KASAN_GENERIC=y:
	# kasan: pass:58 fail:0 skip:17 total:75
	# Totals: pass:58 fail:0 skip:17 total:75
	ok 1 kasan

=== Testing with patches

Testing in v2:

- Compiled every affected arch with no errors:

$ make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
	OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
	HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
	ARCH=$ARCH

$ clang --version
ClangBuiltLinux clang version 19.1.4
Target: x86_64-unknown-linux-gnu
Thread model: posix

- make ARCH=um produces the warning during compiling:
	MODPOST Module.symvers
	WARNING: modpost: vmlinux: section mismatch in reference: \
		kasan_init+0x43 (section: .ltext) -> \
		kasan_init_generic (section: .init.text)

AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
is placed in own section ".kasan_init", which calls kasan_init_generic()
which is marked with "__init".

- Booting via qemu-system- and running KUnit tests:

* arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
* x86_64 (GENERIC): no regression, no errors

=== NB

I haven't tested the kernel boot on the following arch. due to the absence
of qemu-system- support on those arch on my machine, so I defer this to
relevant arch people to test KASAN initialization:
- loongarch
- s390
- um
- xtensa
- powerpc
- riscv

Code changes in v2:
- Replace the order of patches. Move "kasan: replace kasan_arch_is_ready
	with kasan_enabled" at the end to keep the compatibility.
- arch/arm, arch/riscv: add 2 arch. missed in v1
- arch/powerpc: add kasan_init_generic() in other kasan_init() calls:
	arch/powerpc/mm/kasan/init_32.c
	arch/powerpc/mm/kasan/init_book3e_64.c
- arch/um: add the proper header `#include <linux/kasan.h>`. Tested
	via compiling with no errors. In the v1 arch/um changes were acked-by
	Johannes Berg, though I don't include it due to the changed code in v2.
- arch/powerpc: add back `#ifdef CONFIG_KASAN` deleted in v1 and tested
	the compilation.
- arch/loongarch: update git commit message about non-standard flow of
	calling kasan_init_generic()

Sabyrzhan Tasbolatov (11):
  kasan: unify static kasan_flag_enabled across modes
  kasan/arm64: call kasan_init_generic in kasan_init
  kasan/arm: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: call kasan_init_generic in kasan_init
  kasan/um: call kasan_init_generic in kasan_init
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/powerpc: call kasan_init_generic in kasan_init
  kasan/riscv: call kasan_init_generic in kasan_init
  kasan: replace kasan_arch_is_ready with kasan_enabled

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +---
 arch/loongarch/include/asm/kasan.h     |  7 -------
 arch/loongarch/mm/kasan_init.c         |  7 ++-----
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 ++-
 arch/um/include/asm/kasan.h            |  5 -----
 arch/um/kernel/mem.c                   |  4 ++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 22 ++++++++++++++++------
 include/linux/kasan.h                  |  6 ++++++
 mm/kasan/common.c                      | 15 +++++++++++----
 mm/kasan/generic.c                     | 17 ++++++++++++++---
 mm/kasan/hw_tags.c                     |  7 -------
 mm/kasan/kasan.h                       |  6 ------
 mm/kasan/shadow.c                      | 15 +++------------
 mm/kasan/sw_tags.c                     |  2 ++
 22 files changed, 66 insertions(+), 84 deletions(-)

-- 
2.34.1

