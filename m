Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE81CB130
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328305; cv=none; b=oJOE6qM2KdWz4dzWyS5YHUbKfHI9O7FEOgsc6AtYUaiKmSea3SbF7OB1gNhcBWD8PP84QR8LJF1XcJtajiNCFpwVK2/0M6ATmBKLk91dj48KS02ZHbvFnzPlNlicBcgD4pDkVNkkYZ9+Gzhi2WJAQbrpzyF5kpOBho+LMwquKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328305; c=relaxed/simple;
	bh=od1Acum7ZP3SHNuZV1Frd7Px5i5rAfWdJgysjyMhaoo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oyHXKUkSENyX+erxUnH7X1BO5jJxB5IzquAZeXlhYNrvHOAeJzvX/PVM4KXY/PlmiNOkm2irVZk0B+y/96gDzy+4Xe+EMXlcXB+L1a99lfYjxQCv29cMRZvIfsgAHfEdsrCRQeT3U8mzz/kWGxl5tR3rpXZPc0e5srD3RkCy/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mu0PN4mU; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mu0PN4mU"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6addeef41a2so14707347b3.2
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328303; x=1724933103; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxEAzZMzJr3y8oSKmglTMtntRHzNRdKVl0l9n/9vlWE=;
        b=mu0PN4mUE9tV49U2LR1J9C9+dFaeJO6BfGlRBmnXrn15+KqS6B1Sg5g7RoOsp2G/u2
         OooYyvwtI04Vizs3QJwGxP8ZAkXfH7ruEqIaeY8ZcITrIkQ32eZ44hbUooP9cyGaghEx
         OoL2/PEusvG9ql+Ygzz9K6slSm2CgnET7aChfXmkzrl2sDrGltgqM1iiE78dazDp/fJJ
         MvsDQQrDAqnl7J72luOD9fN5bIwPtc16UMCRLeaGqS+2F0itlDuq6piLQH0OFGIpHXkl
         cziorspbkHt40tS879TpV5t5OlbCFWLOIhCMHJ3LckyBdVRGFb1IPg19DyE0SQ+dzmWo
         4arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328303; x=1724933103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxEAzZMzJr3y8oSKmglTMtntRHzNRdKVl0l9n/9vlWE=;
        b=tmTulSssJutv85+DcE2Xc+AogpGw9T70TUDZnTTaCXgbULUTny0wEeypx/t3roGNsX
         9CpitSegwiK8aLO+ijZo6vM4yoqF13pe6e5vMjvlQe9tKvITkmRhu5efLVCzbC2Hadse
         i64+iIuSw9MB8IrWF31aKk8EFEkJxWB6YIfyJjk375G7SwIuckkh8FYVigsvp5n4sbuZ
         wP6t/7YY9anKVqXSe4KR8JGsaEBeVxtpePia4eOD0TNIuFn/HVpAgLoF1bm0BZPZDD8R
         ol0UlvTZZGKL6eu3PHokXlejWYUh8owxal3bjbL3oh9XTKHsN7GeoOk7YjpnuKRkPkBO
         YTCw==
X-Forwarded-Encrypted: i=1; AJvYcCUs/PXZi1G44c0Ofl41aKQ8dmn9bSngbw1b4QxXP4PADgDom9ZHznahToCjGQQBeWJsPZlhY2unTgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhAXNrStuTfF2XQPJFqiazfe85UxqrojHRDYvvtY6xSvMEcEkW
	HJV+mt/D8rb4N9jv8wL5yrwHfCtXwE/YXr3wKARJMLGey4D+/cb84Ji4aP6PmwFlt1PyIIhzXqK
	IRvLJybHmK15miA==
X-Google-Smtp-Source: AGHT+IGiVlbAew1+icwXyROm+LUwKLbHv3EgJ+ELhtPSIkQV+jPl3FGLr+njU0tLgnmjraKSgCDY+G6v6Qi4DsI=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4813:b0:6be:9d4a:f097 with SMTP
 id 00721157ae682-6c0a0236c74mr298177b3.7.1724328302925; Thu, 22 Aug 2024
 05:05:02 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:04:17 +0000
In-Reply-To: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8506; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=od1Acum7ZP3SHNuZV1Frd7Px5i5rAfWdJgysjyMhaoo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxyleWMqafxpffJQSjGJQbTSeoPMOs5rqYzOKA
 h7koJQoGQSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscpXgAKCRAEWL7uWMY5
 RshoD/9FmNAsAln8K8mfbgINydaroarjZhGmYp77z+tBgBU+vnZq3W+3YIcpqwRKHl8Gi3mFOVb
 OW5B9NMhyyhupwWgDELW5cgPZPUAT00yM0kK+sIVmpV9cxS3lbtT+5thF+ONcWTby43Cywgc6DX
 Dv2xq3ZdUBFAiUcVz1wy8EQHE8llFacx/qswJVcnRAjlJQKb26/jKadb1BpBYh0SA9yBFxzyHso
 NZHN/bTSJJ7VR8QjiTT1Y59WzjhkjR3/B3JcgHs8TAnOGP/kdDuldwkkhveUQBkwLNI0zpthfQs
 mstX0wkLGbi0K7xXR75OHisSb98lx6kM48LbFLpjM3+ZL+tGcqNtOOTubwbHza6j4GBuzDjots7
 i+gHzc80Q9z/Sal6mV/oQ8tgOOTBDldQXlaLbxLTG1oFfgRKSXRoYaFowmf0myQZiXSa+nWDfJs
 E/JYPRErb801FL/Jfu+42W89+vTpAHYEC8UW1uiVKXgONBT1Z3BMYWxInklTnTjGC6AWB38SmMV
 Surujt2TeSla20M8LkJfsq8mjId+E8sGO3/Fij807tf/blvZ5Kdh1kDpGRyHqELlLutojpxRaja
 geMR+csmMbMbDT3SggRsWo0zAG2mCRSXS1PXSJJoKpyvfmATpigqjksoCY3eK0alhr4mQL5zNrk Gn0aY4b7TsoYfLw==
X-Mailer: b4 0.13.0
Message-ID: <20240822-tracepoint-v8-5-f0c5899e6fd3@google.com>
Subject: [PATCH v8 5/5] rust: add arch_static_branch
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To allow the Rust implementation of static_key_false to use runtime code
patching instead of the generic implementation, pull in the relevant
inline assembly from the jump_label.h header by running the C
preprocessor on a .rs.S file. Build rules are added for .rs.S files.

Since the relevant inline asm has been adjusted to export the inline asm
via the ARCH_STATIC_BRANCH_ASM macro in a consistent way, the Rust side
does not need architecture specific code to pull in the asm.

It is not possible to use the existing C implementation of
arch_static_branch via a Rust helper because it passes the argument
`key` to inline assembly as an 'i' parameter. Any attempt to add a C
helper for this function will fail to compile because the value of `key`
must be known at compile-time.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/Makefile                           |  5 ++-
 rust/kernel/.gitignore                  |  3 ++
 rust/kernel/arch_static_branch_asm.rs.S |  7 ++++
 rust/kernel/jump_label.rs               | 64 ++++++++++++++++++++++++++++++++-
 rust/kernel/lib.rs                      | 35 ++++++++++++++++++
 scripts/Makefile.build                  |  9 ++++-
 6 files changed, 120 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 043d8737b430..27da24d90b0c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,6 +36,8 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
+
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
 
@@ -409,7 +411,8 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
+	$(obj)/kernel/arch_static_branch_asm.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
new file mode 100644
index 000000000000..d082731007c6
--- /dev/null
+++ b/rust/kernel/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+/arch_static_branch_asm.rs
diff --git a/rust/kernel/arch_static_branch_asm.rs.S b/rust/kernel/arch_static_branch_asm.rs.S
new file mode 100644
index 000000000000..9e373d4f7567
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs.S
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/jump_label.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 011e1fc1d19a..ccfd20589c21 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -23,7 +23,69 @@ macro_rules! static_key_false {
         let _key: *const $keytyp = ::core::ptr::addr_of!($key);
         let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
 
-        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        #[cfg(not(CONFIG_JUMP_LABEL))]
+        {
+            $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        }
+
+        #[cfg(CONFIG_JUMP_LABEL)]
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
     }};
 }
 pub use static_key_false;
+
+/// Assert that the assembly block evaluates to a string literal.
+#[cfg(CONFIG_JUMP_LABEL)]
+const _: &str = include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(CONFIG_JUMP_LABEL)]
+#[cfg(not(CONFIG_HAVE_JUMP_LABEL_HACK))]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        $crate::asm!(
+            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+            l_yes = label {
+                break 'my_label true;
+            },
+            symb = sym $key,
+            off = const ::core::mem::offset_of!($keytyp, $field),
+            branch = const $crate::jump_label::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(CONFIG_JUMP_LABEL)]
+#[cfg(CONFIG_HAVE_JUMP_LABEL_HACK)]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        $crate::asm!(
+            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+            l_yes = label {
+                break 'my_label true;
+            },
+            symb = sym $key,
+            off = const ::core::mem::offset_of!($keytyp, $field),
+            branch = const 2 | $crate::jump_label::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+#[cfg(CONFIG_JUMP_LABEL)]
+pub use arch_static_branch;
+
+/// A helper used by inline assembly to pass a boolean to as a `const` parameter.
+///
+/// Using this function instead of a cast lets you assert that the input is a boolean, and not some
+/// other type that can also be cast to an integer.
+#[doc(hidden)]
+pub const fn bool_to_int(b: bool) -> i32 {
+    b as i32
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d00a44b000b6..c912124b5e6b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -145,3 +145,38 @@ macro_rules! container_of {
         ptr.sub(offset) as *const $type
     }}
 }
+
+/// Helper for `.rs.S` files.
+#[doc(hidden)]
+#[macro_export]
+macro_rules! concat_literals {
+    ($( $asm:literal )* ) => {
+        ::core::concat!($($asm),*)
+    };
+}
+
+/// Wrapper around `asm!` configured for use in the kernel.
+///
+/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
+/// syntax.
+// For x86, `asm!` uses intel syntax by default, but we want to use at&t syntax in the kernel.
+#[cfg(target_arch = "x86_64")]
+#[macro_export]
+macro_rules! asm {
+    ($($asm:expr),* ; $($rest:tt)*) => {
+        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
+    };
+}
+
+/// Wrapper around `asm!` configured for use in the kernel.
+///
+/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
+/// syntax.
+// For non-x86 arches we just pass through to `asm!`.
+#[cfg(not(target_arch = "x86_64"))]
+#[macro_export]
+macro_rules! asm {
+    ($($asm:expr),* ; $($rest:tt)*) => {
+        ::core::arch::asm!( $($asm)*, $($rest)* )
+    };
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 72b1232b1f7d..79dde37621e4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -263,12 +263,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := asm_const,asm_goto,new_uninit
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 rust_common_cmd = \
+	OBJTREE=$(abspath $(objtree)) \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
@@ -318,6 +319,12 @@ quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 $(obj)/%.ll: $(obj)/%.rs FORCE
 	+$(call if_changed_dep,rustc_ll_rs)
 
+quiet_cmd_rustc_rs_rs_S = RSCPP $(quiet_modtag) $@
+      cmd_rustc_rs_rs_S = $(CPP) $(c_flags) -xc -C -P $< | sed '1,/^\/\/ Cut here.$$/d' >$@
+
+$(obj)/%.rs: $(obj)/%.rs.S FORCE
+	+$(call if_changed_dep,rustc_rs_rs_S)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 

-- 
2.46.0.184.g6999bdac58-goog

