Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47822126D
	for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754830683; cv=none; b=JwLaRZ0z1Fz1fHDpTAtoHpVJ8/+qeic4MyHqO47I1BCU0fvAIqPwnrbWPIIuDfBqWmhcbtP+wls9ZJNcqDGAOwnQ2Uc9RNOCHxoM+TBV3H+dLw0nzlMnw9DMhQ9IAh8g8IoQpKbcxGRdI6RgxBB0uMu9SfDG8ckdk46Jq/6TBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754830683; c=relaxed/simple;
	bh=EhLsZojnCpTP6DR0ZKTrGtcX/QnBRFrvIOrMtYcrMLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4ZYZ+NKcNL+oHiXQ3oFA8U4Wwqm7OxlFyXVMkg7wjz1PBNyXjHC5x+KPpgtYvzowHv/ikE5BpUNIrrRyGMmNHxoyJUQFQkz1i6iu6cMfK21sQwTH4PpVRo3UndDNpDYVCxGpfxMPqQaMcnpvhh38zQXGtxcdz+I9UECdCW1NPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMVC0IRF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMVC0IRF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b88369530so3762225e87.0
        for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754830680; x=1755435480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLpTR6tAuSk7MmdRr1bx3cY7Ji1Fi9DhOlpvPdNYklM=;
        b=nMVC0IRFdBRJRaJWXH1qU72+LVpBlxgJW6/TONt4VIsWlxTtWZ3zkhenKJIJscAnnp
         JqnqqQv46AZeVTox3cNOkQCzNqNx6z7HUms1YjP7/wawGVNMao0pcxCbhc9/zk55cS6w
         bsQNkaDl65y79Znjwri9dHvX2yPxsvvJRK5OABqc2I8O6V6Jpe+jjUMPfsbpu7Ho8zjJ
         pfJQvrDbrllgkL+9w5TSvwLqRbLhLewwPRuq0P4J4N+ddbKA06IcWn9mC7XU2OOytU+v
         KMiZiqzXmzGY6DnWpqTS8Tu2l+3aD4Jvww45rpZoQ0/ifOiYU5UrtENn0pHxmx8SimTS
         rFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754830680; x=1755435480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLpTR6tAuSk7MmdRr1bx3cY7Ji1Fi9DhOlpvPdNYklM=;
        b=oJ0a8LAW+Uxq0OyIVNCfbJb0u06WQv+4jSqKPH2Das9YOz3UCr/bJ+OrXbSppjqLc3
         YGKVd/yypcohID8O5Q/6om8YjBLA9ptEbts2YV9Mi+wo4Gpct9VRg+nU39w6Clpcxbv3
         LrkWDQu+yApCPn5O2tL4qnkWpplXSguoZc+UsqMl45Avk7IkJlMQShwRfxvm5+lq2tms
         WDEHemRmB0q3jqzR8FJXZqhjQH5SGTDfnrFZKEsf0nPqXyI84TDP+9y+gP1JvUCQcNsq
         YwGuBL4vLqLKjz7+3k3c6gfFDhGrTNOexQU2fCIYHVuTjYS5m0TQ1eAEXysPsWIHYhKZ
         R0xg==
X-Forwarded-Encrypted: i=1; AJvYcCXXUn8eJrFSfUf1blXJZmp/H1gE/OMc/H7kKYmIdw7hgWfwiOGtpiGqlB6G0FXS7351DEmv2uJ77yg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxPwr0m1DztiZwOhFEyKUmTr+l3wdqt2B5KNVnLTruaUOB123F
	JV2ic6M5zCBefZ7FBnPYzk8eyfmomy0ArWFbUTwSg+yYGr8BC1Ndgt9E
X-Gm-Gg: ASbGncussQmMYe0lkAe3hrykHSDgDu7S9FeitbiJdHvdrEsBi5W/TnWaK00Vqy3FSel
	Hhca8NkTowbopMFZ/DJ64p/Hh6/0FXnZhCpyp/3TImiTNmDmAxGvorSEAzFb8Py12LpSy+f8+2f
	5Y38VN6zV+pH0JFlS0sgqGyPpHxQjrJDmfWU0peb9XfqYysitll9iltlIyN0rTKL/yoV2z4QlAt
	6fZeUbYQ8h0iKaTclRwG+EOWfGef/ZC5ROFQNt8Wn+impGvQzLiVPhinU6TiqJEc7ngep7QFNNX
	51g+S5yqpL8xeqq6drfDBcAQPjw8gV+FTd2QtWuxb5xR8J6VwMKjPLNqxSTyp4e/VaHOwHPVO24
	x4z1LfC18XK7fnwRDIBeLSE/nO0yZyzcwNKIPog==
X-Google-Smtp-Source: AGHT+IGP/4+VH4qZJqmI6pqOQcdamwMMjmUjwyAr9JTcQGvwe1pb2iGdV8kKhr91VYx69eEOJbHKcQ==
X-Received: by 2002:a05:6512:2313:b0:55b:8397:cffd with SMTP id 2adb3069b0e04-55cc00ada77mr2589766e87.9.1754830679327;
        Sun, 10 Aug 2025 05:57:59 -0700 (PDT)
Received: from localhost.localdomain ([2a03:32c0:2e:37dd:bfc4:9fdc:ddc6:5962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9908esm3804561e87.76.2025.08.10.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:57:58 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	bhe@redhat.com,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com
Cc: alex@ghiti.fr,
	agordeev@linux.ibm.com,
	vincenzo.frascino@arm.com,
	elver@google.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v6 0/2] kasan: unify kasan_enabled() and remove arch-specific implementations
Date: Sun, 10 Aug 2025 17:57:44 +0500
Message-Id: <20250810125746.1105476-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the fragmentation in KASAN initialization
across architectures by introducing a unified approach that eliminates
duplicate static keys and arch-specific kasan_arch_is_ready()
implementations.

The core issue is that different architectures have inconsistent approaches
to KASAN readiness tracking:
- PowerPC, LoongArch, and UML arch, each implement own kasan_arch_is_ready()
- Only HW_TAGS mode had a unified static key (kasan_flag_enabled)
- Generic and SW_TAGS modes relied on arch-specific solutions
  or always-on behavior

Changes in v6:
- Call kasan_init_generic() in arch/riscv _after_ local_flush_tlb_all()
- Added more details in git commit message
- Fixed commenting format per coding style in UML (Christophe Leroy)
- Changed exporting to GPL for kasan_flag_enabled (Christophe Leroy)
- Converted ARCH_DEFER_KASAN to def_bool depending on KASAN to avoid
        arch users to have `if KASAN` condition (Christophe Leroy)
- Forgot to add __init for kasan_init in UML

Changes in v5:
- Unified patches where arch (powerpc, UML, loongarch) selects
  ARCH_DEFER_KASAN in the first patch not to break
  bisectability. So in v5 we have 2 patches now in the series instead of 9.
- Removed kasan_arch_is_ready completely as there is no user
- Removed __wrappers in v4, left only those where it's necessary
  due to different implementations

Tested on:
- powerpc - selects ARCH_DEFER_KASAN
Built ppc64_defconfig (PPC_BOOK3S_64) - OK
Booted via qemu-system-ppc64 - OK

I have not tested in v4 powerpc without KASAN enabled.

In v4 arch/powerpc/Kconfig it was:
	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU

and compiling with ppc64_defconfig caused:
  lib/stackdepot.o:(__jump_table+0x8): undefined reference to `kasan_flag_enabled'

I have fixed it in v5 via adding KASAN condition:
	select ARCH_DEFER_KASAN			if KASAN && PPC_RADIX_MMU

- um - selects ARCH_DEFER_KASAN

KASAN_GENERIC && KASAN_INLINE && STATIC_LINK
	Before:
		In file included from mm/kasan/common.c:32:
		mm/kasan/kasan.h:550:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
		550 | #error kasan_arch_is_ready only works in KASAN generic outline mode

	After (with auto-selected ARCH_DEFER_KASAN):
		./arch/um/include/asm/kasan.h:29:2: error: #error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
		29 | #error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!

KASAN_GENERIC && KASAN_OUTLINE && STATIC_LINK && 
	Before:
		./linux boots.

	After (with auto-selected ARCH_DEFER_KASAN):
		./linux boots.

KASAN_GENERIC && KASAN_OUTLINE && !STATIC_LINK
	Before:
		./linux boots

	After (with auto-disabled !ARCH_DEFER_KASAN):
		./linux boots

- loongarch - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_GENERIC - OK
Haven't tested the boot. Asking Loongarch developers to verify - N/A
But should be good, since Loongarch does not have specific "kasan_init()"
call like UML does. It selects ARCH_DEFER_KASAN and calls kasan_init()
in the end of setup_arch() after jump_label_init().

Previous v5 thread: https://lore.kernel.org/all/20250807194012.631367-1-snovitoll@gmail.com/
Previous v4 thread: https://lore.kernel.org/all/20250805142622.560992-1-snovitoll@gmail.com/
Previous v3 thread: https://lore.kernel.org/all/20250717142732.292822-1-snovitoll@gmail.com/
Previous v2 thread: https://lore.kernel.org/all/20250626153147.145312-1-snovitoll@gmail.com/

Sabyrzhan Tasbolatov (2):
  kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
  kasan: call kasan_init_generic in kasan_init

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +---
 arch/loongarch/Kconfig                 |  1 +
 arch/loongarch/include/asm/kasan.h     |  7 ------
 arch/loongarch/mm/kasan_init.c         |  8 +++----
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ----------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 ++-
 arch/um/Kconfig                        |  1 +
 arch/um/include/asm/kasan.h            |  5 ++--
 arch/um/kernel/mem.c                   | 13 ++++++++---
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--------
 include/linux/kasan.h                  |  6 +++++
 lib/Kconfig.kasan                      | 12 ++++++++++
 mm/kasan/common.c                      | 17 ++++++++++----
 mm/kasan/generic.c                     | 19 +++++++++++----
 mm/kasan/hw_tags.c                     |  9 +-------
 mm/kasan/kasan.h                       |  8 ++++++-
 mm/kasan/shadow.c                      | 12 +++++-----
 mm/kasan/sw_tags.c                     |  1 +
 mm/kasan/tags.c                        |  2 +-
 27 files changed, 113 insertions(+), 77 deletions(-)

-- 
2.34.1

