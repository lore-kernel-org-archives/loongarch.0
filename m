Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64225154C17
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502864; cv=none; b=FcwH9dSWQUf/u2UT15fkPl0HmO48mZ1G+wIWdpL+l1ILS2QceIXOsonyO8dZ3ACdAUZ/aOp410QALBO5sktE1DFTyB2OZRAVhrdDmhJPhWD6x1hRUdlPkaoYaGtRjup4RkVLbB7zR1YLgeNuSsCGaFuCBJVpnmvKt/ifP74nvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502864; c=relaxed/simple;
	bh=axHHrpgUD7v1zaF4eLQM7Od/Mfp7jOaevM6Bc4L5QyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPygp8ool0SuSbgWWLI5qoAdySKc7nfBbk/4FDkyDlrjN81SCCSpEPiowZ+O0jQC7lO7HDBEGidXHDbPe6kAEDOvdwmS3m4K0GUa5lHBEi+HwpscUsKrGnb71QQ893JKR3G1piy+cEoGoz0VhphAbV6e+4Gdx95+PxRT3JUHuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmzW5+pO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmzW5+pO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7273967f2f0so6592212b3a.1
        for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502863; x=1735107663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=WmzW5+pO6vMkBvOx4W6kL1ew6qfJXvycempGgZvUyOtwsFvcF2bZwg79CnWwFS+3UA
         H1EbgUbspv6fvnMgWj9abnUsD1ZF3ZMStyXARcl0Ic63ClfUXXUgy+/hFfR/tf1aLMNF
         enXBEZ20sM9DO69q3ppU0HoFrfNLIdAgijWR3DZseeUZhKNrEX3LJN2MGw+aMIPYsmWU
         Rq9NnMhZ3fc3wR9nuDpPMuFvqrnH4butWyPdiQwAkadUtBVp6Vu7JjMR+uuXggstl1Zj
         e8Ob5m2v7cZarCIqeoLjF0YSxLOnYdsdnt1Ku7Pc6oO5IA0hWkNTXTLi7Ixl5/6MAC1r
         5UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502863; x=1735107663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=XdFAnS6Q+vvJB5rx6z1p3/kV+4Kx728jr7xn0QZK1uV7C1KJ9/kCmeHnubPLi/60LR
         LzFm+zNtb8VeT4OB4GaMYAziVXnmRwXwdODblowoHXdFv6uvL4cZV6sRUllviHTa6g8X
         Mkjewx3erOuVEVr40bEySYqZP7hSfpWZAWy3tpwYNAYUbqUmUHIbDGa+l3k7CKIZuGjY
         tYmiYAuYQIrJuBa98J4VU2LML2IqDwu+WCbyV+SjLsaNSN40Z4Dy+jlrpg2EJAvBNdMI
         e5jDy3XB5moIkgthxNaK3j1OcJp0DmYKZPnGWk9Q8FPEeQ+a+faZ5CtNNG8rCmekiz/p
         ddGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeW3QJclt23lw5kP0YkRRPBhLCGLJWvIyoa+txtqTU02LqBAADTCFjxnMb9URJfF5mDtysfKgVfeE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3yw0cXH5w1hfh2NFkbIlAL8MpOkSwUYdK5leI6CB91AQ+7Y9R
	2EDVMMrDM5Q5v0dQkB2C8Yegj30nKIYvKtt2BXjNSSwxvBaJMOruU+euFaDk
X-Gm-Gg: ASbGncvbB0J/3QDPU6iWnG5N5ZInFFJdhf3jRIH/WMM3hS/nftYHiSCsXP3JybqLEJx
	j0o0zgc96v/SA4sd6F+cEZETepNtAC9i2+fXPVUYTOfa/Jx18tRtkUIQ7m+3ZG4MDA/pOgcnFVb
	kQlYPeWVgazLnrrv/HS1Wlq3uTOdOxLGygp5FT8SGxyTR1SGdDCpljom6VfT/TNtbLzm2QvAvk/
	yCL/Z9qqdeu0CMLVdadhNlgmHnrpDrp5+IJHkP/HheNZHrabD7IvFPHjKLuN3Z9PqBubTtBMh5z
	ZHKwhKEhVJ9CZOShVg==
X-Google-Smtp-Source: AGHT+IHh5VfbLc1bzyNkDoQn4Y2IW8LvraCE8/Q1ywB1dqB6a07VG5XuZlyp8536+909iPa3S+qOgg==
X-Received: by 2002:a05:6a21:6f87:b0:1e0:b5ae:8fc1 with SMTP id adf61e73a8af0-1e5b47f9601mr3440480637.13.1734502862615;
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
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
Subject: [PATCH v2 0/5] rust: Add bug/warn abstractions
Date: Wed, 18 Dec 2024 15:20:04 +0900
Message-ID: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
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

Wrapping C's BUG/WARN macros does not work the same way on
architectures that support Rust (x86, RISC-V, ARM64, LoongArch). Rust
code needs to directly execute the same assembly code used on the C
side. To avoid duplicating the assembly code, this approach mirrors
what the static branch code does: it dynamically generates the
assembly code for Rust using the C preprocessor.

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

v2:
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

 arch/arm64/include/asm/asm-bug.h              |  31 +++++-
 arch/loongarch/include/asm/bug.h              |  31 +++++-
 arch/riscv/include/asm/bug.h                  |  35 +++---
 arch/x86/include/asm/bug.h                    |  51 +++++----
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 224 insertions(+), 49 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 517743c4e303252cd8c1a1fb1bed28e7d94d4678
-- 
2.43.0

