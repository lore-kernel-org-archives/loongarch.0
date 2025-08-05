Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C12797A5
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754403992; cv=none; b=sxiH90trbb6zHmfuPxVe6VQiFaI4hQhG5fAVthZ6/EDbs6OHJin8g1GNSDK2uWvQJcJCl9yK1SGMj8+XC6wWI7qfMTCee9Wm70KF29Hg08rI/9tHdYKo8iQW46PHBccZiY948MyOGbQMAAzoJsURkLucwchVdAYPUyGohCVxytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754403992; c=relaxed/simple;
	bh=kWK6iKFWIFYyFTWQkZuVDSZkdVcbDsC/lAMrEgHer1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oZpf3HQDXmvnOeJrnIl9zjS8VYH5U4flr3RdW7ZR31bQnyqYrK7SvLXSmfTtIqOoxu8IYijGzf22JrCPzyNOH960XklSHnTX0vMdvdu9bA2vx9uvTEdU0sPqgFim2MzW1p/YzCPs3y1PEy6tBIZRRBhJ2mJsFs5nQOq/DfRItlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuE+IwfT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuE+IwfT"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55b9a3e69d3so4044598e87.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403988; x=1755008788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pksKKRBtO31JVCyUig2REP3M3oI0Y/m5ILEfob1JeTo=;
        b=PuE+IwfTKWDI97roYruFEo46xZPTYVjuqnRmgvtOhHpHz5Rqiaq+YJKEGMHDKIyQq4
         vIlAmZEgJ153AuQta34nfJ6ERDuQHKe7e9biV8zMxxmFeQk8pV6eOtXmE199kUwAvmrF
         71M5bErlLRJsotc5yWZCPhgMQQaeZqK1rC+IWQ+C53ZVTK67khZ+62NgUfhpMf1DtQIN
         +Su6L6VL/rwTEuaqmOSrjZjR6Uf4FhR9og0uh9s4HiGiHqRgB/5RUqyxhrWpJTyfkVCA
         zNXR085QtHGeEoY6UYXyMNHF1U+RrjyOMK3QSfBLffSluHAYQGVOEvS6C5p53yZCxOkc
         HOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403988; x=1755008788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pksKKRBtO31JVCyUig2REP3M3oI0Y/m5ILEfob1JeTo=;
        b=e4vsZi4xnPQuRwz6O8uHWsamR0Fb+oRaxCQ+bIXXtrSAUWJMBN7kVDUpDSV/fzSDFC
         uDxH58RoUG4St0wf+ujK4gEky+29kNLPYmx+naolVLuzqOwu5Cz5Gc6U8wT+vMHWQtSu
         uVbrk/LyT2sdBO15sBWkZEkBdymV34QfGr1sR0q7TNWerQBbN8E76D3RmDPT3CUgbl/2
         L7cQg4vwDkxxhTv1XP02scsMZW6V4gYNBARFfSNFFc0fiIBWy718cL9nLqaIWQE6zPhu
         ysXBDfqQGK3MkZZ5ESTBt9wN9kn7smMMmKcYIw7qkUBvIc7yVpy9HIIJ05rHawpQOV1X
         0ngQ==
X-Forwarded-Encrypted: i=1; AJvYcCV27IhkMFoKVnESOrnZFkiDk98se0Y9TG0D5WsWJeRHCYGj3PVx5fnzOaaJJwFndeJOce1uWdrhHYo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN2iHOoV9YmzNqol7j/FXC7rSIHd8dITgvxnwCwi87Kj699IK/
	Yr9OCkwmkr+V/1tp4hzAijvXLueax8ie8H/cGTasnhD3IfPAnjS8CLs5
X-Gm-Gg: ASbGncti7sqQ40JymBSPwMPDQ8BZrV7ROlnCHtZjUn5ycx3HwKvrLZ93003DY+QUJP3
	6Am2HED3ImpdykPsblKiye9nQvEXZOBDPhcQchYGzao2y0ddNe4722GFbacDPbreyoMUT4Vm4/X
	75wDmJG+evLzgBDSC5x3uWYpxL8ki8o995dSXosVt+Cpd67WWY8SvhWJbf76sIaXW2NrYmlrCOQ
	odZk1IORvjrjzJ8hBbjSZSdhMU+s1v6xz8N6gKT3o/lKrxMkP+bDq7U46bjs/M1U7ZhkZ0DJx35
	9+DeLyKQcqIeDjGa5Y4Gqcf8wkpKi+p0Q7VDMviT4PHRf1BCcX6MtWiX+0rYngHo2CBd1oI68Cs
	dJQ4g1VbC8GJiijWAYoeTbl0sxSlJXRcb+INJS5+8tpMSjKakxTrUKxhI5rcz0BBPrfIvoQ==
X-Google-Smtp-Source: AGHT+IGy1WhFbslChqIwW3zDEXwo6CDb6xK1zgNUQQFWNlekigvy4oRcbBK1ihRZGuO8OayIKRf+qA==
X-Received: by 2002:a05:6512:39cc:b0:55b:9647:8e7b with SMTP id 2adb3069b0e04-55b97b75a15mr4601956e87.43.1754403988090;
        Tue, 05 Aug 2025 07:26:28 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:27 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v4 0/9] kasan: unify kasan_arch_is_ready() and remove arch-specific implementations
Date: Tue,  5 Aug 2025 19:26:13 +0500
Message-Id: <20250805142622.560992-1-snovitoll@gmail.com>
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

This series implements two-level approach:
1. kasan_enabled() - compile-time check for KASAN configuration
2. kasan_shadow_initialized() - runtime check for shadow memory readiness

Changes in v4:
- Unified patches where ARCH_DEFER_KASAN is introduced and used
  in the KASAN code (Andrey Ryabinin)
- Fixed kasan_enable() for HW_TAGS mode (Andrey Ryabinin)
- Replaced !kasan_enabled() with !kasan_shadow_initialized() in
  loongarch which selects ARCH_DEFER_KASAN (Andrey Ryabinin)
- Addressed the issue in UML arch, where kasan_init_generic() is
  called before jump_label_init() (Andrey Ryabinin)

Adding in TO additional recipients who developed KASAN in LoongArch, UML.

Tested on:
- powerpc - selects ARCH_DEFER_KASAN
Built ppc64_defconfig (PPC_BOOK3S_64) - OK
Booted via qemu-system-ppc64 - OK

- um - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_INLINE - OK
Built defconfig with STATIC_LINK && KASAN_OUTLINE - OK
Booted ./linux - OK

- loongarch - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_GENERIC - OK
Haven't tested the boot. Asking Loongarch developers to verify - N/A
But should be good, since Loongarch does not have specific "kasan_init()"
call like UML does. It selects ARCH_DEFER_KASAN and calls kasan_init()
in the end of setup_arch() after jump_label_init().

- arm64
Built defconfig, kvm_guest.config with HW_TAGS, SW_TAGS, GENERIC - OK
KASAN_KUNIT_TEST - OK
Booted via qemu-system-arm64 - OK

- x86_64
Built defconfig, kvm_guest.config with KASAN_GENERIC - OK
KASAN_KUNIT_TEST - OK
Booted via qemu-system-x86 - OK

- s390, riscv, xtensa, arm
Built defconfig with KASAN_GENERIC - OK

Previous v3 thread: https://lore.kernel.org/all/20250717142732.292822-1-snovitoll@gmail.com/
Previous v2 thread: https://lore.kernel.org/all/20250626153147.145312-1-snovitoll@gmail.com/

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049

Sabyrzhan Tasbolatov (9):
  kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
  kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/arm,arm64: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/riscv: call kasan_init_generic in kasan_init

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +--
 arch/loongarch/Kconfig                 |  1 +
 arch/loongarch/include/asm/kasan.h     |  7 -----
 arch/loongarch/mm/kasan_init.c         |  8 ++---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 --------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +---
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 +-
 arch/um/Kconfig                        |  1 +
 arch/um/include/asm/kasan.h            |  5 ---
 arch/um/kernel/mem.c                   | 12 ++++++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 36 +++++++++++++++++-----
 include/linux/kasan.h                  | 42 ++++++++++++++++++++------
 lib/Kconfig.kasan                      |  8 +++++
 mm/kasan/common.c                      | 18 +++++++----
 mm/kasan/generic.c                     | 23 ++++++++------
 mm/kasan/hw_tags.c                     |  9 +-----
 mm/kasan/kasan.h                       | 36 ++++++++++++++++------
 mm/kasan/shadow.c                      | 32 +++++---------------
 mm/kasan/sw_tags.c                     |  4 ++-
 mm/kasan/tags.c                        |  2 +-
 27 files changed, 157 insertions(+), 124 deletions(-)

-- 
2.34.1

