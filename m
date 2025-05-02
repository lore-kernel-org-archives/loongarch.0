Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D996238D54
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179231; cv=none; b=qvtpk2WnquvWU6cgbOjwMCZkwXsSntcRwLPRhvTgxVI8YMEq6ZGLF2QhhzTMhXNl4u4dSpqozilgbC73n0fHavHAv7ot8ubgVFpgGN6skZSM2q06wQWpO+XuthnkOSvrkrRBrGbjTK5BzaHKFcuGmmVz1rkInNa/IOY5LpNlduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179231; c=relaxed/simple;
	bh=F/ioxLkwrGK5uM6SqQFmwcOuoVcvbM8a3k5uGh+UdI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5AqastWap8anR7PFRYc8NQTQKKw/di68aiNgZN87U+9WrQHBOr015y6qUcR+N+FmcRjYWLrQwyerO+z2P1yTNd/F1rwH2darvz2d6UKV2I/GwXLsNz7r3dRZwoZLYC0/OS3WE4wXsyr2jYe1lm2v/9jlIw2ez/x0widMjTJUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVOhUlOu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVOhUlOu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224171d6826so27537145ad.3
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179229; x=1746784029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWwTYv3OuQyqBw6PFnlRc2w3UN+NoCmVRkA1ASlyyn0=;
        b=bVOhUlOulnJqEpcBlwiB7z5hEEyyGfIX18+5/3dq6d/flEqlN8LB0lntL57QBFp1vp
         qLx7jRIz7iAAzNuZC/oSXB8lFFGfKrDLVefWQKjTIV0rFdiihDSTWRp4DqaR0eQsX4/P
         O5/Z3NryzK0anjPl1KPsJi3eIp8q713fHgHxLGTAS4pqP1yOP3106WvV1GW/rBeM3v95
         GTFnIfUyQ+qKpSa4OowPV7obZi8dFzfz7M/n8PxQUYui9NoiInA+CdEIHojkeYETLnB1
         BEui0JfteviF/HESD3RwaVgx96iP0x96HqoXN8QgVDU/qJu54FEyJtIVG2QQpyh/7CBF
         QMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179229; x=1746784029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWwTYv3OuQyqBw6PFnlRc2w3UN+NoCmVRkA1ASlyyn0=;
        b=tGq8FEmIEpq2oORqoTblVS2jCCdJGDSBRyAyro6DM1J0m/PrE7KqyzuimwNyYurZnk
         qooZGKPTPLJ+92lByYkr8Y42SFs84ONEaD399cln/uXpS/RIGdLhMqWYWVE2RitIvykF
         STh+s1ne2NviMxVvulSFY83ogja/kffHbU+2C9A3sAbgmw9A7u+1ZjH95RO4YL1CLxbT
         6EQFd77BO0g37hCxYYp6ClOUKIUvSCM+bMuUT9QJgFh+IOHHXUHRir4Fh5ZEA1X2dFOK
         dWSIjjzWxlP1odsSq2vUq19bTKugBVz7HCnLbUIthKGMhVDX+onXdHGr69LGGhRRoS0a
         ruJw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZIobgVC4xoHagU2Lj3rp8cJY452ja7nkChOiCoUq8jXNse+F6fmr67KUF3pSQQhyli/F0DVtZWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIvwyz3dQcBaLwgA8/G9YKXAhwo8eLZl/c/usCHVhQnr9u+fml
	eE0NDjSRPbuVk6Mtl5f42o+z21GapNMxLhlsLTTcP3aIlCMyZwWi
X-Gm-Gg: ASbGncsmgbvveeZqCNaKZAmcg4quz7a49/TVytESy3ws8+JpRlBOhTyb8bvLnVPM767
	I9j8LA5YCsfw8joOsFlwtuEPhJGaNlUYN5U6iuCluMB4k3YyiklsNAv1TbKuToP/8DoYoNOhA+R
	zHT1MrNs78+nMhC5UBD5HOg7PFaIF1m78zhsN8PQY58dg3gqOkK2S0Xbiw3XPEWuWMhxJXxfZ+U
	Hvcg4Q0aFSiZIb0fiQjdxFC92v++EUUBcach6pI7lSQLB0N9HQPoHIAefPw94o53RoJgCORrjJs
	a9RCw/HcrSXgLnHt9gT5xG3+MO6kt9zk9hAwHcpQ0YL9Wo1MCD9KCbes8w/BB/1QaV58dJOyj3J
	+6zWJtM4ZZj+PMuHVUw==
X-Google-Smtp-Source: AGHT+IGbwIKmjfJSvIlalpwpU81DyeocVw//dhZVAVqySp6/OCnXJS9YDEVoTaJ2tYPhS7J096/sbA==
X-Received: by 2002:a17:903:40d0:b0:220:c178:b2e with SMTP id d9443c01a7336-22e102c722bmr39746555ad.17.1746179229387;
        Fri, 02 May 2025 02:47:09 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:47:09 -0700 (PDT)
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
Subject: [PATCH v6 4/4] rust: Add warn_on macro
Date: Fri,  2 May 2025 18:45:36 +0900
Message-ID: <20250502094537.231725-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
for x86_64/arm64/riscv.

The current Rust code simply wraps BUG() macro but doesn't provide the
proper debug information. The BUG/WARN feature can only be used from
assembly.

This uses the assembly code exported by the C side via ARCH_WARN_ASM
macro. To avoid duplicating the assembly code, this approach follows
the same strategy as the static branch code: it generates the assembly
code for Rust using the C preprocessor at compile time.

Similarly, ARCH_WARN_REACHABLE is also used at compile time to
generate the assembly code; objtool's reachable annotation code. It's
used for only architectures that use objtool.

For now, Loongarch and arm just use a wrapper for WARN macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 125 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 7 files changed, 155 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..0b795cf05a34 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
@@ -536,5 +539,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index e2d13babc737..a62c96f507d1 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -6,3 +6,8 @@ __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
+
+bool rust_helper_WARN_ON(bool cond)
+{
+	return WARN_ON(cond);
+}
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f636ad95aaf3 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..1191391eb2cb
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
+
+//! Support for BUG and WARN functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
+#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        const _FILE: &[u8] = file!().as_bytes();
+        // Plus one for null-terminator.
+        static FILE: [u8; _FILE.len() + 1] = {
+            let mut bytes = [0; _FILE.len() + 1];
+            let mut i = 0;
+            while i < _FILE.len() {
+                bytes[i] = _FILE[i];
+                i += 1;
+            }
+            bytes
+        };
+
+        // SAFETY:
+        // - `file`, `line`, `flags`, and `size` are all compile-time constants or
+        // symbols, preventing any invalid memory access.
+        // - The asm block has no side effects and does not modify any registers
+        // or memory. It is purely for embedding metadata into the ELF section.
+        unsafe {
+            $crate::asm!(
+                concat!(
+                    "/* {size} */",
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                file = sym FILE,
+                line = const line!(),
+                flags = const FLAGS,
+                size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
+#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+
+        // SAFETY:
+        // - `flags` and `size` are all compile-time constants, preventing
+        // any invalid memory access.
+        // - The asm block has no side effects and does not modify any registers
+        // or memory. It is purely for embedding metadata into the ELF section.
+        unsafe {
+            $crate::asm!(
+                concat!(
+                    "/* {size} */",
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                flags = const FLAGS,
+                size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: It is always safe to call `warn_slowpath_fmt()`
+        // with a valid null-terminated string.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const $crate::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const $crate::ffi::c_char,
+            );
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: It is always safe to call `WARN_ON()`.
+        unsafe { $crate::bindings::WARN_ON(true) }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(CONFIG_BUG))]
+macro_rules! warn_flags {
+    ($flags:expr) => {};
+}
+
+#[doc(hidden)]
+pub const fn bugflag_taint(value: u32) -> u32 {
+    value << 8
+}
+
+/// Report a warning if `cond` is true and return the condition's evaluation result.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {{
+        if $cond {
+            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
+
+            $crate::warn_flags!(WARN_ON_FLAGS);
+        }
+        $cond
+    }};
+}
diff --git a/rust/kernel/generated_arch_reachable_asm.rs.S b/rust/kernel/generated_arch_reachable_asm.rs.S
new file mode 100644
index 000000000000..3886a9ad3a99
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_REACHABLE)
diff --git a/rust/kernel/generated_arch_warn_asm.rs.S b/rust/kernel/generated_arch_warn_asm.rs.S
new file mode 100644
index 000000000000..409eb4c2d3a1
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..bc13e92bdb1e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
-- 
2.43.0

