Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A521D58E
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173010; cv=none; b=HO2ozNOieOhXMZ5Oaa4RA4n5eNE5Xy2/nDEh0MJI2MZrPmrZ2SOh2FpGZhdUvhvXnAGEErhjPvBjd2YaVD9A68E9Oj5hlNUtVlzzWjF3pc1lXez/KPWm6P70XftIWHUfiWRpViRe+weh7fJ/YGeORutqBSQmKyeP626D/E31dxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173010; c=relaxed/simple;
	bh=p1h54BOh8Q9XBTfcRZnJQ9PmT0Z8qvm1fYbU8PCxoBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5YgMkJCiXGh/sqoajeW0sva9obL7c39s5dRBOHrGY1N7v7ppagnIK7JUVJrg9XOKM9vRa/qxXp9MeFpBWQYEjqC8SxxmzIzs3Wdc8fwgkP9ZDw1ouYiXgUGrEqnFSFVG6fZMTaAWvNmNPr6VaFE0OcbpddgCZOc7865eTZ5lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAfPx79n; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAfPx79n"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso10728411a91.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 03:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173008; x=1741777808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMVkt8VvD9u0w9McePyp8QpG5OxxVEdJnPN4xngSa2I=;
        b=WAfPx79n3MNpdA7LST33+CCBzKWqPYkUlshwkoMwi1Ow/Nm8vSfE0FWbwFYu2sEmkk
         sHmuI+d/M5WPOPjOU5mLMOpOz/WzrwjhH3eumpA+Y+aHVW/mffaL/qKBkphfJpLVaBKf
         Yi6/RAqd1a5HbMlfEZpo3z0dGtZ4SgVU2sR/SsnGbC1mzn53CICSP6Ht+0emGEB9N/vO
         l5FNDbbkj19Y9C03XJmSRLs8lbjSIS0O6Rm+i/vP6JApzUzKECbMtxaRg4c6grSnIGBN
         Mdnx4wAAKiTcKUy32DNhQcdorezsrUBLJ7V6HUN3yvvc2hMu5Jwl/sjcHoEDWA1Oz5+S
         /uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173008; x=1741777808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMVkt8VvD9u0w9McePyp8QpG5OxxVEdJnPN4xngSa2I=;
        b=k3/+5BSlBayn2Dx/VV0ZX79MhOmZ1/YHKyweMqYqNcfyQ/mLrHLGTbtHCDUq31YHTQ
         7EJgUOU84g33iUi5PihRhVmu9XmIUz7afHCAZ5TKmkYMmMUjrn93fHnto59//njosM0A
         86Hj+iDf3H65iyBTQRAJCpA9mqRSrqKreRLO2RJPqD/h4uDVeF6u8dsZovMDjGucOF7F
         2z2ki2lYLsZWenJnyT51tO165fm/c4KVOHkNh31jSMvIS2qt6RmpspC6T61okNzcywNE
         UQVGwbUEZQH+mI/ocUasAOcvmlZWspjOzens8Fa9EXfaz/Gkl8gCNu/SpYgq3LxZSKwf
         c9gg==
X-Forwarded-Encrypted: i=1; AJvYcCV48iMK6e1MeLZGj0tzlaIFhx35GBMs7d7vhragKwAd2jIoefaomHHJ/0rYJ6PKQEIov6b0GmmqW2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoHP2xlNANZQvEfxbIzIUOqGwIEEQdALF6wNrM481Iju1M8CDG
	vEXHZcLzmYy6LpM5Rgn9tr4Qyn84KAOZVrY8DBE/+hCodjXK63/z
X-Gm-Gg: ASbGncvmf9wNa/8yS2XNC4Z3zJ8RhYvrW3PwREBvvoTGqEJz9QElNN15VYs/e48ku9g
	fonHUbujduopkX/jAfRVtk8gYMM2Ozs3QdjW+zmJxjopdByxyzj3QtV6C7g/3OinPZ/1DdRz4Vt
	ljDUFu7o7RF9JpjDEhrw1hCheESdo3oc1yokrLbwyE9tDbREbOczI1m2LGY/S4FT1z9DOClbqvx
	RRrslHodY2SMr+x5o/5y4Fl+7lem9tvG1LGztlvalDBtnvqbmGaNWTK2ARqHTSblgKfr11qCNPX
	Zqk1tD1iEMtXTn7vcVKMiGkpAS/VBAVV/+0O9CrfxO6HzWquMvz3Wls/ZHlEBPVoq+8gvGmSH18
	37Vqe75pf7q0QveF1IkxDzQ==
X-Google-Smtp-Source: AGHT+IFluiMV7JrX1O1X/v1UbVS/X37LSME/ig8/X1xAoOdMRtTxpinwMPddXbT0s26nxPYJt9KENA==
X-Received: by 2002:a17:90a:d2c3:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-2ff502e645cmr1921672a91.32.1741173007728;
        Wed, 05 Mar 2025 03:10:07 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:07 -0800 (PST)
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
	tmgross@umich.edu
Subject: [PATCH v4 0/4] rust: Add bug/warn abstractions
Date: Wed,  5 Mar 2025 20:08:10 +0900
Message-ID: <20250305110814.272792-1-fujita.tomonori@gmail.com>
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

The change for LoongArch assembly hasn't been acked yet so the v4
doesnt' include it. LoongArch still uses the current approach; just
wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch and UML.

v4:
- added Acked-by tag to the RISC-V and ARM64 asm change
- simplify the asm code
- use the cfgs on the macro rather in its expansion
- use a const fn for bugflag_taint over macro
- dropped LoongArch assembly change
- dropped warn_on_once; make the patch easier to review
v3: https://lore.kernel.org/rust-for-linux/20250213135759.190006-1-fujita.tomonori@gmail.com/
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/linux-arm-kernel/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/


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
 arch/x86/include/asm/bug.h                    |  56 ++++-----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 113 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 222 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
-- 
2.43.0

