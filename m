Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F52222BB
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455243; cv=none; b=GfY5/WtYY6hWSFqvquMuGP1GXznm1lWCMNKBzH39O4hp6kRGhpWvXVGTwbakTc9oK3tTCK/O748n8xkwwGsQNFRs1Setb+wPSpd4q0VaBJ2cfdRgCGH+nXMZSK9psMaA8bZErYa2oAUAT6ASicKNEEz4rde3nf0gY5X6TDuEsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455243; c=relaxed/simple;
	bh=YpdB58uyq8tH7ERH2NdQvCyZMv332LF5vwPEXd91SCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkUwrKhzOPvo79M0K/AQ9FpNYKf9t+1V2HGpZyFDLDVU6lRHWDlPo5+Osk/ynk+WRrhX9nvg6ZAyrQviR8WpbhjGMZNRlkxVSxxsoJqHg+cRtZJweTMrZ4SjD2fOX5gyZWjrcuVVY6vaTYwAFhoSVaiOYL29VCUM+DPADXu/8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUAO25j+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUAO25j+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f7f03d856so15744585ad.1
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455241; x=1740060041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=;
        b=XUAO25j+QBk/w/OZnmnWS5yzsWDaLqCrPkxJJpgjiw1OOb3ZLBfT7lXDT7vy146v3g
         8jartP4yM/C2nZ0uwB4wlUnquL19GSjKmMWQJgygF7COChGAGtbm8kwp1gdnC4RNIHQv
         TeJoh/m8UBcbE0QWTPUEsgvOJmoO442tc2xWMaRlV9IogrgLtQhmTvaT2clgyHRBMUqO
         v25C3zijp8/uT+VKVWfyVioHBjKcrp95iQ7GAxiCd1D8VyR3xrd61WYcMSBm8b+UIHJK
         cZgxvJDphTwGl+3e4SZ2hSIQFT08Dnt1EqOtCYeeINY+CUqNYKTjpSXvn4rNDfZM3Hu9
         wqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455241; x=1740060041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=;
        b=vHOLJRpimhqS8Oi6AVnjQxZ+EpS+TDPr5Ct/H6yEENDKkd5Np+P3CA71Tlu3GgpqhC
         Dda5lsF5T6I0Cw/tRZqafP6lMfwgKWL2vxBiTUTBjyFjDFvNnp1LJhS7dnL5p1sQHR2P
         yImEYashdrDA9mfsZ6W6qgerXg7ClkY6Mm+tNtSeybwroZq9xR1tsMuuXI0Vo3b7j5VE
         Wo6NHhwE9No9Wc4YAyzu0gKqKFE6U5VzdgAkLazBmu6kaqdk71CAVdabM7X/1K4qWl9y
         wi6yF/LRLpbfrnEx7JGBbC2EstxoHES1jlqsmcmG6SjE3FBY0iDiGM4CNSsRZ9NYww6u
         rYxw==
X-Forwarded-Encrypted: i=1; AJvYcCWSGeF1zbY0Gj7HkKiDNgAtlQuTd/jFGUQ/DPMeoivHqr7bFI5JLQ2ownrnwO/SmRZbQR/Vkylieiw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh3faCFo0I+KVa6SC9DmnVlRN86uSq3Dy4GMu99Qjanfm0cD31
	j6BQZR1i5SYJ3y3A8T0dUSC15OI63IXaJQmCjWHCJ/sgJQImmmqJ
X-Gm-Gg: ASbGncttfKfAGttWbdOu9NS4O5bP9ek250uafOcNyqIp7JGIzB0xpDFk8HqwZveza3a
	msAfHoRFtkvutNsHBmbxb4RR5nQYx0ZEUcf0aRrrREhBrlCyH22dDCoS7oborNKgCI4HDfl5Vlo
	Fm630tdU1v/AKrXornlDBzV9i5DsO7Z82OLRzkr83xZ/IfaE2T1vJhXq75iIrNOJrMku7G+xw8C
	yr/pU3Dl0JdJ/AOfxq2Pz8G6Kr9TwRJcpFKMdOTg6Zh1LeEhj1pGBaI6NHyw0ZDjkqACxKowsvi
	6dQ6PccDOD527MpBUg64OT0DvKTEWD9x4vBmmuigwOCMAlr5yHgBsrxfzuZP/bYY6/E=
X-Google-Smtp-Source: AGHT+IFiybmklIR6sXPe5dOMXPko9nq/OxURSSt8JQfw095Ue+kPgwqj+3k15eW2uamc5z4ID2izMg==
X-Received: by 2002:a17:902:e850:b0:21f:78f:c178 with SMTP id d9443c01a7336-220d1ec1f7bmr52326585ad.3.1739455240643;
        Thu, 13 Feb 2025 06:00:40 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:40 -0800 (PST)
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
Subject: [PATCH v3 0/5] rust: Add bug/warn abstractions
Date: Thu, 13 Feb 2025 22:57:54 +0900
Message-ID: <20250213135759.190006-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds warn_on and warn_on_once macros with the bug/warn
abstraction.

Wrapping C's BUG/WARN macros does not work well for x86, RISC-V,
ARM64, and LoongArch. Rust code needs to directly execute the same
assembly code used on the C side. To avoid duplicating the assembly
code, this approach mirrors what the static branch code does: it
generates the assembly code for Rust using the C preprocessor at
compile time.

The 1st to 4th patches export the BUG/WARN assembly code for Rust on
each architecture, with no functional changes on the C side. The
changes for x86 and RISC-V are straightforward. However, the ARM64 and
LoongArch assembly code are designed differently; they are used by
both C inline assembly and assembly code. As a result, sharing this
code with Rust is complicated.

The last patch adds the bug abstraction with warn_on and warn_on_once
implementations.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.

v3:
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/linux-arm-kernel/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (5):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing
    with Rust
  rust: Add warn_on and warn_on_once

 arch/arm64/include/asm/asm-bug.h              |  33 +++++-
 arch/loongarch/include/asm/bug.h              |  35 +++++-
 arch/riscv/include/asm/bug.h                  |  37 ++++---
 arch/x86/include/asm/bug.h                    |  56 +++++-----
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 235 insertions(+), 51 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
-- 
2.43.0

