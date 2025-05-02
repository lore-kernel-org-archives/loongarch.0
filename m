Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1020019DF66
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179177; cv=none; b=dVd/F9h8QpTatZaBJ/YCj61NcaectDW1MzpHyAzCG2ksDr0JavszG71bNFvRtK7whK5sTps2gq7Ngg7kdAMIycurWJQSUhYiTaf8xwRWY7/U2V0j/8eZM7vGTy4Djf9nUTnInGxkEBcnmSIiR+QREcuco6OqA45ws1fwzJLE27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179177; c=relaxed/simple;
	bh=bL9NGsdk8Xu5wuKyoqLCssxfxtze5NXykOh+kVgSZug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbzuP8wn64U27Wyb/9nImYCdR52Qez1ybGRq663R21ALbOGkib9YyFG3HZoHPcfodVvTS6iiVcp3mfxHVaIhfpPHsSEVK+nbdTldoq7gg0QCK9w7nqB+AAadHwXRQWOOcBCgeOBv5kM3yCM2scwvLREyIsLMYjkg1c/WJc7o040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNQAqDA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNQAqDA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22c3407a87aso27399845ad.3
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179175; x=1746783975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=CgNQAqDAD0Z1VRfgImlOPNx4Mc1BTh0O9BpvwiJk/uELDv2sR7eCQ5hBeWTE5MNYCq
         lfo5sF9/eWVGKvI+gnb8ZNrlFD4qCysTXCbr05F8dIsw67zevjvagKncdsCMr4VLAtZT
         dwCrBP0RnRRhGiqtmJP4WXtP2nZzfeUT+I3BtYUYrKoy6Hvs/rbRLruvP2j71e6kiNL6
         rYgKD5Kdnn45x9ht+XolVCe1WzSA0DdwUMY85+9XIesR5Z6N9jJk7BPX1zG+PNUZhXxj
         FymqgGNuzIYMJq/oUyySxAm4/WOsZgWuPCWmH/fygDcAfddeXBySbg7ZGGxtTx8puvUQ
         LfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179175; x=1746783975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=vpHHKU9NV7YNs5AqG3NQZkmFfqMoA/hxqEfOBUQc3VlOGG1KMXxeyIhlZJkc4MF+kZ
         kMUgi1mOjhSjWCjoJte+TjWS1JMZQgWciyZ97QrJTB52qBj34vDguU1ykzheAYVzz74m
         K2KyB3M7leZwSC83g9dNAZtMfCxVw01H1Eo3KZ+0au08ckDkBGEKPYWdJcYFx5USgcf0
         voD1jwb+Y2Q7OZuAChURSSG+Sy+0tui2KhCIRQCjSuwBlD33NzD9MjrH+eSX3UdV+dM2
         Mh8d+XvP3I4PafDs9b/lB1OqzVGF8pfNG2TiAh78BrxBD7lT8vQXyVMgGZrvOI/nmBAt
         E4aw==
X-Forwarded-Encrypted: i=1; AJvYcCWBsSUdUNi+MsR6Q5eR/7UFyN0LgQ3JAHeS4ZV4kjA3ubIfKgr4x9RTkvoIVSVxCTHHis5hCGHUeLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNhX4+4mH63g1XwT/niJAnzNvlSPiSpfrEbT20HWP0UGEqqp+Q
	MyeZnxDu0a2EJ93mjCgDyHyHKK2q6vncmuyg4+0m9Qz9VoyXTXoE
X-Gm-Gg: ASbGncsBrMRgBKt3lNvhmQaBCGfrWZX1mxch/5YWLS/Pw10RsSgbqgMbN/IS2KRkwZE
	WPHCjtD2JPaF3NOZnT413HJCUk/rCLrrAROeYrySOrebma7pVGUNsiRbLgwLogPZrdOu1pJehcc
	B2lplYlB0zwppc3Y7DkYD05EQiiMZ1JVbx2QCWYbfN4jNFElTKUKYVoJlwDYjFHHy8Z8dRJPSo4
	WZtkonm+1N6tnDrdhjqeDloKG58xviJvaboKuyjqXpZELX+B0FvPemh/B4fMifpN7T4AHlfUZag
	uPbkXnliKvq+nwL3qpWHFHmU0HrHnd96X4TGm8zakgbyw+zHiEzzuFYG8N05my/8YIzMgXFuYqy
	wR2uYu2fLJmKoW41LJA==
X-Google-Smtp-Source: AGHT+IFCrNB3SEcUQSA4UULBWiPKSjzAq293G3JdHTwJkUqWADHaR7n7tHS0qoEezDF6fogaeNgeTg==
X-Received: by 2002:a17:903:2ec3:b0:224:f12:3734 with SMTP id d9443c01a7336-22e1030ba06mr31764015ad.30.1746179175181;
        Fri, 02 May 2025 02:46:15 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:14 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 0/4] rust: Add bug/warn abstractions
Date: Fri,  2 May 2025 18:45:32 +0900
Message-ID: <20250502094537.231725-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds warn_on macro with the bug/warn abstraction that
utilizes the kernel's BUG/WARN feature via assembly.

Currently, Rust code simply wraps BUG() macro; however the approach
doesn't provide the proper debug information. For example, I added
bindings::BUG() to rnull's init method and got the following output:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
RIP: 0010:rust_helper_BUG+0x8/0x10
(snip)

The kernel's BUG/WARN feature (lib/bug.c) can only be used from
assembly. Rust code needs to directly execute the same assembly code
used on the C side. To avoid duplicating the assembly code, this
approach follows the same strategy as the static branch code: it
generates the assembly code for Rust using the C preprocessor at
compile time.

The 1st to 3th patches export the BUG/WARN assembly code for Rust on
x86, RISC-V, and ARM64 architecture, with no functional changes on the
C side. They have already been acked by the maintainers of their
respective architectures.

No change for ARM and LoongArch; they still use the current approach;
just wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch, ARM, and UML.

v6:
- improved SAFETY comments
v5: https://lore.kernel.org/lkml/20250409065802.136971-1-fujita.tomonori@gmail.com/
- fix indentation in the macro
- use $crate::ffi::c_char instead ::kernel::ffi::c_uchar
- add support for building on arm32
v4: https://lore.kernel.org/lkml/20250305110814.272792-1-fujita.tomonori@gmail.com/
- added Acked-by tag to the RISC-V and ARM64 asm change
- simplify the asm code
- use the cfgs on the macro rather in its expansion
- use a const fn for bugflag_taint over macro
- dropped LoongArch assembly change
- dropped warn_on_once; make the patch easier to review
v3: https://lore.kernel.org/lkml/20250213135759.190006-1-fujita.tomonori@gmail.com/
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/lkml/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/lkml/20241210001802.228725-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (4):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  rust: Add warn_on macro

 arch/arm64/include/asm/asm-bug.h              |  33 ++++-
 arch/riscv/include/asm/bug.h                  |  37 +++---
 arch/x86/include/asm/bug.h                    |  56 ++++----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 125 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 234 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.43.0

