Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C793380
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789985; cv=none; b=G/FvSmng7QUDHk35aYaV8dx27KJbg+k49n7PbHBgQmyPYp0YYCn36CaHWdDN5mz45wSuDkiPQ+KC02uWWuLx3Eguf/LkGzreudxE8GIG1J7PfiRhVwCWndlVN9kjb7zkA7zbkMRHN24bBhhIp5zOy3XRpqD4SljBRRnY4M7R5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789985; c=relaxed/simple;
	bh=gc1d39RS7wiVXEfbWtH+yBQbESP+Z3kFhmrAhSEg62w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdBTS3FE2Ddm2Zjn9SB06Sr3Rljp3JQJxxAqpq/ZFinjKE0kdS9VkQBjJElHTTWtjIOHepCZyQzA2HQqyNaO3aFeV+GwKLOidOdizlpxLHw88uXYvw7baA1JD8RFdYWVi93+LYMoB2NJGzFXWv8piT78W6NKXaGC2+gD1tzdulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP4rqm3o; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP4rqm3o"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7258bce5289so3907416b3a.0
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789983; x=1734394783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StSb96QxP9/iNWSVkb/5jVIomgW7WStqt28dyYj6iuc=;
        b=UP4rqm3oxLPRI9dzhl+lzfAZNXx34nH0XnDsp4lsuze7gouQyOX9AKOBUTHhitMjXd
         zCHweIiK9z/rfoEdhEMeB3uLqajbrU+kuwtk5A2/iM7C6MmTJVh29Qmlg1w7+9Mu5YYu
         QKttQ21z4qhtsmdGLOAGsy6YZB7ZhdKXHcRIuIkFsj4JzhU7QwnDy14M22vhMjIYAksY
         UrA9uniJv03dXzLhpqUd5cnA6XuZXJm7J2LE0KgTJCoIkWmIx6/bB2c+0E9s8MuF6pKD
         dT1Os5oSjDrt1HBquNPip9v9uhzr6iLPxMdakqdoMAoKx6zsJ38+OasV18RlyxJ134D5
         doyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789983; x=1734394783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StSb96QxP9/iNWSVkb/5jVIomgW7WStqt28dyYj6iuc=;
        b=NVTw+0D+hUmEN7F2uBiEe8yTe39FOi58/q6lPaPEieHGfjGzd5eH+UbR520NPTY+Eu
         yu0F+JacH80f/Goh9+6tLKd/3CdJqU5IzqL46MBS0w1DSiYRTuz2Gd651cC5bNLrsX6y
         e9usSAkaBGy+N5yfAWhvE2h+W0yzRzzBXCyPvsMoDC41b/vMg7VNeDLnJjqxj8J4lCih
         TkYghrgNIRWZqPQ5HPvs3BKWPFjiX1ekPjVQ5dofMO280X2CJhdQss2q25flYmfhAYNl
         77ysgz9IDrl/6qbPaO53axe4R3b2RRz4fgVi3BPOfpHsM5wpqrYGCTDMaPudc+Zt7Bbq
         cXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzIIz02Bb51dx0GVYBwbUaNmj5QblnSNu0NLfJvq6lf4oveGz3GsP0hyJFhhSztKbFOfNWhwxju2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBryeviDTKBQobvr0SBllPVE+8asWX4DuUCKxAj6A/hqjtkkCx
	9e415bd5+yrrVos0tqjfo0zSwPLdjx4sucWr7xq0XwfqmEx4m/GA
X-Gm-Gg: ASbGncuFJo6xN72+tiEnqHCXNPDIP43QI2GCh/x5arjmDQ3/5N3XU128K783A15Resx
	Jg28+dFMGQJR8Im4fEvBPlrpkyFLvZbkPqjQo3WCherhCTRc3UpiCvudpV6chZvLH94jckVmsl8
	jAHmeHldMq31k8tBAiIGXF9oCvyXfsv2O0wFFtGCnhTyUa1nyXz8fdebMbVJ6s89sL9GWTA4jwl
	F8OXL2mVuq6BT/O6gNQPGUdiU32Ai1flqluofglYqnGZntUz09FxsQXhr7nXUafe3G+WzXW0axS
	6H5cZ9ToM8CSEB8vbENgh37m7Phy
X-Google-Smtp-Source: AGHT+IEAyDAPo8at1XMlk9fsI+urdhbvpydHDU/JmlA7KkIMjf5Ed0t5JYgg2Zppc8mo6aYL53N8NA==
X-Received: by 2002:a05:6a00:2ea9:b0:725:b702:af with SMTP id d2e1a72fcca58-725b81b7b57mr24866139b3a.25.1733789982639;
        Mon, 09 Dec 2024 16:19:42 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:42 -0800 (PST)
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
Subject: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
Date: Tue, 10 Dec 2024 09:18:01 +0900
Message-ID: <20241210001802.228725-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
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
generates the assembly code for rust dynamically by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

ASM_REACHABLE definition works in the same way to get objtool's
reachable asm code. The architectures which use objtool (x86 and
loongarch) needs it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 131 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 156 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 9da9042fd627..80c9c6b3e491 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -37,6 +37,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
@@ -436,5 +439,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
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
index 000000000000..8959a2e94971
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,131 @@
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
+#[cfg(any(target_arch = "x86_64", target_arch = "riscv64"))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
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
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+#[cfg(any(target_arch = "aarch64", target_arch = "loongarch64"))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(concat!(
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
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
index 000000000000..4e65525e4464
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/objtool.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ASM_REACHABLE)
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
index e1065a7551a3..913f3a5b2a98 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 mod build_assert;
 pub mod cred;
 pub mod device;
-- 
2.43.0

