Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D423A6
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789953; cv=none; b=Uye1MTICPiSbUfTZ1UdODWvTmlPpmtYJaEyP0EpN8XV7Sj+Lo2hQ/yUhzm6HHe2ZuE6r+Yux3eh8RLc6OwzIiNZVCGN10qzx6IKINVURB1FMBlTxiI0BcjKXEWYGBHLJCQICxdMjcEepckePVzRyXnE2nWTTM3Z2eJyy0OOHMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789953; c=relaxed/simple;
	bh=+dWai1xx8b2AwAgDP3O1hmszP+7eXk+xWu+a5qgwJ6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbjwM6ChfDB9KGsR1Sgk8iZn31lz+gkO1zgS7uIzRdeUSx/YS1fzuWtbXvCfQgLI8NbpgacMl7KmEHcmJjpIPpp9Fnzct1o3pR5KkZ2xurr9J5ycUnUhuQUkhO+jrRSWt12Uy2wPZ29E8iU/oKnk7BZb+wm6Nr45VoLXn+ZRDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDH0qUKp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDH0qUKp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725ec1fa493so1246082b3a.1
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789951; x=1734394751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyn8QNTH7wqJjjw/QfPOjCU2TP5ahhHLckRiqYVzfDY=;
        b=DDH0qUKpN+Brs+/U/NQTuLS4WzMksKtCWEcOWGTJUyDTG8TgIUE33UkoMPD5+RbGQ3
         7PFFsTc1xVMkl85p46A942n8GkLDTexzanKfBqHSes7HQkOT3QykMb9ymZPCWveWnANm
         JKQotZCYhXJ8t2Kx2IlY2PsR3au/GeiGpmoUo9YQ2LPjEeFqAo8nCt0hW4sANA5TyZir
         sVr7wgW6lMEu1DcsOaIlR76xr3mLBc7CaoQDUu7vW9wmxxV9++EB6PbRz6uo2rfbJ+3I
         f0wOOM56dtm6B73YtDo2Adka0/mes/EeP5Qa/KVNLeWwecKHkTKbIw31Lfkvwy0zUEYa
         x2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789951; x=1734394751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyn8QNTH7wqJjjw/QfPOjCU2TP5ahhHLckRiqYVzfDY=;
        b=LS9jGgUs+BJFBQDF2JRysCmKUaoJktqFcNfxPP+yPp+wTybz5MZu/ukKdr86Usa5ka
         vX9RSny3lZaqJFSMCOpd7GkrziGvaPQZwS1A//nGZzFQIq6Ewl+qFA/EQ7EjVjxqi/MG
         06q6McGDvqvdibcgHrM+R/ZY+ozyTcyvB19miOSMx35vGp5YHXCmzrTTNLhu8SzMtbA2
         Yy6Kk3y7lgSJOr4xYMMnw5AkG95bfwS35J2YdeNt0CROopOhNe/XdqcN1bpBqHfUS3vK
         JsHpibE1zbE3UCCGwlWAzwqQrf/dgJoyBHDshtU8ofwNdJZn4CFn34OfUwQ9AI6SMtAe
         /qCA==
X-Forwarded-Encrypted: i=1; AJvYcCUWPNo1jYVC0OtVOYVdSIDlNa2csAK5envaNKDUSDhqYuFYNMGYioTYWvYNEaW0pxUDKX7tMwEzJQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/pr+jrT91O+Dh/RpkUsRX0gYlJFLXo7x74abhZjQERftd69pJ
	NYFXkS+1cBHzjrieLnzSswO6cWfK3GvjkSMgdX1GhRDnIXa8SeZv
X-Gm-Gg: ASbGncvh3pxaeLY3sJ2jCdSGFDPnDViLR9sTvBE6d9hjuMqVxZwSZmKepamrReioPZ/
	MFtLVXSN0DTtrH2kRAACOZ99hTGmGB2sQdZ9+48JdCa4kPrGOOFv1JNQRvZeeMHVgGNi0wziZYu
	Y9m8/vrzs5ldW8s9jcW8Dds82pYA9FUZ4azhLDiEyxw/6MMcI956h1bivOBX6vmukA0JZyEK0w1
	qSict9LikQXX8fNIWc8fVeCJGn9UNZyt+VONP6ncyye5w1NMiGUPJN/5TsMJy4f62jo0EsOYFxv
	Pak9JZas/fTjdzhPKOp4aJO86han
X-Google-Smtp-Source: AGHT+IEdFPEBCVbMfoJezZOTVqCwhcFvYK07D7Yq/Bkx4KQFK9L3M9HsZHOxAW7D+XoXG/7mHHQLwg==
X-Received: by 2002:a05:6a00:928b:b0:725:9f02:489a with SMTP id d2e1a72fcca58-7273cb72984mr3417048b3a.17.1733789950934;
        Mon, 09 Dec 2024 16:19:10 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:10 -0800 (PST)
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
Subject: [PATCH v1 0/5] rust: Add bug/warn abstractions
Date: Tue, 10 Dec 2024 09:17:56 +0900
Message-ID: <20241210001802.228725-1-fujita.tomonori@gmail.com>
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

The last patch adds the bug abstraction. Seems that an unused named
argument in Rust inline assembly can't be allowed so we need multiple
#[cfg].

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.


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

 arch/arm64/include/asm/asm-bug.h              |  31 ++++-
 arch/loongarch/include/asm/bug.h              |  31 ++++-
 arch/riscv/include/asm/bug.h                  |  35 +++--
 arch/x86/include/asm/bug.h                    |  51 ++++---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 131 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 255 insertions(+), 49 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 7503345ac5f5e82fd9a36d6e6b447c016376403a
-- 
2.43.0

