Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E52245005
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455282; cv=none; b=ZHmBOb35r1inIXaaB7k24Ql7fbMQ3RvdAEUnLdRmPsLhNnYhn/olxcNgVZlCbtEFisOPWgcfq2XRtLHgpI0cVnX4nIuvl28VhbDstx9DjT2KicvKjhveRl0jVtvhisUh8nLqNBriZ3ysy6x3tgke8LaRRe43nLFH9Fl3K4fOXfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455282; c=relaxed/simple;
	bh=Qm3OOHynsVWNFFeKMcNloBwCd256HD9FBBWaPy+8WqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZGqKpIyi4siczY5hhh8ZvDbhEfqiBc+0fjzC0yloaTOSU+vRGqBzZTpSalMAnG87mnryh2w7e1K2L6ST/mhMaLmYvv08Z+tq+QPKOo7wT5gpj9lfzpgQvmY90DRO8ceQPuTAOoY3V+JVoj6TU0+sJS9zEmo3vn9BbMP9yP6P3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWGtnKz8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWGtnKz8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so14197125ad.0
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455280; x=1740060080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=;
        b=VWGtnKz8rJOqAPoGNSvMkiNknZUyXNwt9kAhre0icEQr3KFMjkR/ZmBeAT5JVYcPoL
         jOh0ORzasmnMnlHNb5vmYt2aBpeNA8cmzZh7ZqZmhurBvYN3kUocwRu637aelrtuYHrM
         9/6RXS9msVTHyfZxCD6TEfYpgUVWu3BROt478mUas2eASwxu3WV4hudAlKGe+hMuele9
         KPCEYgD58bFiOAujzkNBhbXdz7IR4YRagYuHPFc4iQGnuog5i6LdklC5lBofZA5zXfbG
         Twz+pjxiHIqB5EyBM2pXvXTOic377QNYA2+xxtJT1uFq2b6VCVAqQhOqAefXsovD/N0I
         4kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455280; x=1740060080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=;
        b=Ru3NHMVx1N9zLKFpxRItkjH3WowYcA6paoJnfG/EQdt7ooulGfaNgkzDqNafq16Z4V
         1/rd9x2YHN8TxFAhLGh89Y9yNTi9Z+l3CfKVJ6MyJEhmSA6Efs5woBMpvbVf85X6je78
         8q++roYwKlsaeM5XqaaYkmRW+Ay0Gtb79XljelZCCNuErVRmrSWPh3CYeVqbIdfEGwp3
         T7D0wnTyYL4H7AqmIXZvzh+KAiFhg8RjlkU19TdHg9Uf3hggMs2mXzegtUlPR3otRgCA
         lK27AqzKe0G6SAmoKKWBCPAriEL5koghb5cdwgV1UD5nhU/k5GRXjMsafMqMyZ8D4EVj
         P1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXEUEfnaeGoLy/DeYf/XKR6+OfkbuPha8tWG/O5wTiavz8NnsKSTJ+S10dppVnKSQaq9beK4ALXqjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK8gLBe6YW/4MJzIK1sMScxOTJ4AccE8EukcI+EG4fH4IsUPYy
	31i6qAgk+xZwsyVAhsi74lIbDbvphIFB5G+muzXKc4NGq0C1T/q2
X-Gm-Gg: ASbGncvtma50sQIp/5Ih95JYpmjn2Xliee6GSzylrd3xBCm9uRsra8QHz7cIZaPphAZ
	wjiM7dwINK8zXmsVQOdKwp4ZmO5lBeew6gDuKoirTFpMVCz/i28xZ//403O/KL4peCvlpdmzCb/
	7SO5aP/xvqWbLe/5A8IuQvTSUbbp3IzaLVMAdEUrZPvGtz7DshnTLfnTz6o+whpaRUzoSQLitVR
	xm3piHRN09EWTwj8y963loznN69ZAJvPKgbpzPgxVaqi4ihETZF5Le/IUZUVf/ZhsCQ3Dpkw81S
	u/kl24X78hqVgs+emjthlCn/AI8neByevuK6T39kZ5Z8a0F4aFs84yb295p9rJhjM1I=
X-Google-Smtp-Source: AGHT+IFMceABDyWeSunss8UJzVYDb4BU4OkU0X8Hc7JUBpiklvsTg2hC46hEV4uH5kHdO2o6dh/F8A==
X-Received: by 2002:a17:902:eb8d:b0:220:c813:dfd1 with SMTP id d9443c01a7336-220c813e56amr81532275ad.36.1739455279808;
        Thu, 13 Feb 2025 06:01:19 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:19 -0800 (PST)
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
Subject: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
Date: Thu, 13 Feb 2025 22:57:59 +0900
Message-ID: <20250213135759.190006-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
macros doesn't work so this uses the assembly code exported by the C
side via ARCH_WARN_ASM macro. Like the static branch code, this
generates the assembly code for rust at compile time by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

Similarly, ARCH_WARN_REACHABLE is also used at compile time to
generate the assembly code; objtool's reachable anotation code. Only
architectures that use objtool (x86 and loongarch) need it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 125 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 8fcfd60447bc..a295b65c43f3 100644
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
@@ -481,5 +484,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f1d7f4225332 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
\ No newline at end of file
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..7ffd9cb1ad75
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 FUJITA Tomonori
+
+//! Support for BUG_* and WARN_* functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                "/* {size} */",
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(
+            concat!(
+                "/* {size} */",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
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
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const ::core::ffi::c_char,
+            );
+        }
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
+#[macro_export]
+macro_rules! bugflag_taint {
+    ($taint:expr) => {
+        $taint << 8
+    };
+}
+
+/// Report a warning only once.
+#[macro_export]
+macro_rules! warn_on_once {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!(
+                $crate::bindings::BUGFLAG_ONCE
+                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
+            );
+        }
+        $cond
+    };
+}
+
+/// Report a warning.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!($crate::bugflag_taint!($crate::bindings::TAINT_WARN));
+        }
+        $cond
+    };
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
index 000000000000..8f239b431aa4
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("111b", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..c0720846b249 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
-- 
2.43.0

