Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426921503F
	for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641670; cv=none; b=RtmZCTmgD3GM803wOX9fqrx9MG8ciWUuNJH/pW6PE0s5IpWBmCmDNRiRQNCSZUMw4xNOtqwSX/iP7XsOTSQy+mM2l9z/KRy2U1mj8ZuXig0gbrEX0eQn4ZLArP4U69D+adkV9uoWNFLTcy/vzHGXFk1/Sho3kZkECVHqmIo5ET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641670; c=relaxed/simple;
	bh=OvzSr4VFrX1KtK2UXFthBCdVxqArCAH6SA7+jizJ+V0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fKIZVUQ5YTzJLVXORntDTMzrxrMRuwBhtd0Cl3avueeplwJQY+qMZLIIJJ1LFOIyDmHYL3XPw0CToQ4mkdqyBfC7LdClhD4RSYJLx/UxlGU5juH+xtAUyrbd3t8LPRx9zWIxcaTyP2Z0lyKSCepoNkXfYSkUZllWEz/VHM95QhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3IIRSkbn; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3IIRSkbn"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a996c29edabso119233866b.1
        for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641665; x=1729246465; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXlYt/oa+7NEzDWWVPyKVNY96AVLFROe93mGWbsR7r0=;
        b=3IIRSkbnWuaLoaZBg4yCU21EYsciLAcDb4IkW2NM1Q/AcMRRlULDeRATatfMKDLMNX
         GWvMZuoXETvohM7G7yyp/Lyl23wZhONiYTFyhg1vywm7MweopD8RCBMribTnlSoKeQAu
         nZrgbjTgSrc5WuGIdn61iI43I446j5riR92MBiwt9R9orNDUhNUhQvxo3BTl0PCr03ST
         ZKQZjlTcPUAeC9FwJntMjX+YbzG/GaoLVPiX5xkw2AdvyToJ3FgUhm+yNeXIL9vAFAQU
         Axe4r3xm5QeNPwnDCGKyXWCw6PGlfikenZGFSWffePQa7VzQEoyd9Jr5li24QUtUuKvb
         ik5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641665; x=1729246465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXlYt/oa+7NEzDWWVPyKVNY96AVLFROe93mGWbsR7r0=;
        b=DMZX96RI3kL3owrPsgR+NkjwKVS71qoM5KLQQOySe63c8s6qRWsNNR3Nsd5EthBiTz
         ghO7pX9X408kEgfSNyd5jaHP0evankdYgiH9J3HU+z4dbQQ+DOaUtBAwZ0DjoLQFE+HW
         ywJu6xJxXWj/NHDb43qgd7b8RCMve7tExKF8ajh4P0HGnaDNiUpLTB9HGEX2r0C9LIIh
         qM4oBDb2d5FEnhVdFHMG/2YN2FbntSXJ59wXrND/Rcte19MM/z2vKBXonrAum0LJdwUD
         GaX75GXNABW1o10yPGI3QV+X4ex17+N3AlfTGQHoBQtDxyGLBJSxR6GiwuRBDxm0csd+
         rgVw==
X-Forwarded-Encrypted: i=1; AJvYcCV1X+Avfug2m7T5R3T8kBho9IAqBdt5eHXjFjtGzu0II3rp7gUyZi85envdHr0x2FBBKLOzVXJfRtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOAf3JvVw1awSwm4/SOZ+sM+TfyV6iT+/PISYVK+9+gihDrzaQ
	+RKIC/qHPGJKr9EmRvuSFOefQvEK1remi6h15lB9sJM0If+R0kWSCBiS1wjKwyXHSqkKsspp7a6
	hY+velOZykqFuOw==
X-Google-Smtp-Source: AGHT+IFUZk2XvsvMj6Wc3yCHDL1hoT/VWhngxWmpV68U6xzKMORLk/rDkjmoUsncuiuiUYkc5ZtZnBPBoMLMN2Q=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:7e8e:b0:a99:3a34:5cae with SMTP
 id a640c23a62f3a-a99b92d148emr46766b.2.1728641665077; Fri, 11 Oct 2024
 03:14:25 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:13:38 +0000
In-Reply-To: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8525; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=OvzSr4VFrX1KtK2UXFthBCdVxqArCAH6SA7+jizJ+V0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnCPpx+Q1CTMK1zq1TvBDRV65hgxAf2+JhbNWSq
 9VSnEym5kWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwj6cQAKCRAEWL7uWMY5
 RqAlEACRKcilZAk3daKUNVB69XPd0ba36+SjExxjWIeNqFcCXa/txKr36QlmH0UAaoHDzHjqlVh
 xQTBWY9Iey+UMsJ9H78It7nCP53ylbcZd5YV2U2QZMxAdmKiP6ZF4aG0GZGx9MmlcCxtFsD+B1x
 X72KQi90T94oyyMiyTWI0i7vEx5FWYljYDU7OVCvEtVrHqdqxEa/XVGGmzt0xGM6HZ0R6Fqle7h
 uaHZyn5XOwLJ9jlfpdVCpold8x1IJDwx1NzokTVEWLPIISmdsKw76UumqYFiMth9FELCCH5h9zd
 ZiDQACwvtCFi4UShoCsTNEdmkg7KQPYbu9ZWYTeAgi1bnEHkzDh6iNHrhM2kydaC155iwO0QEu+
 zfOZUWbqiH2+a6TCzPHdOuQCzmxmfY+FkA+OeIVQKREERe92SXetc2I1QRcKEheJ+Rl79bjqvGI
 Dc4DiMB/QxGOxKVe3WpJHHGZWKnf/+sYEr8a78usmQqkrgCx2mToZQLvkWKgVM/laa5oag1bAkZ
 rqwH/jNzMoaVXsfbEGVByX+kwbZmBtPcAWr9/guV1Y9/jHEKYONhQTkudCU2/gSBAuYym/Xf2S/
 v4+uEtlf0wCnoKx5eSSu8WciQvPYrAHT8dpj2PYinx13xVhv/4c9sGWGN+tfIiFrZ0Ylc5Ck25p PXXvORodchFSF4A==
X-Mailer: b4 0.13.0
Message-ID: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
Subject: [PATCH v10 5/5] rust: add arch_static_branch
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
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
index b5e0a73b78f3..09ea07cc4001 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,6 +36,8 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
+
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
 
@@ -421,7 +423,8 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
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
index 000000000000..2afb638708db
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/jump_label.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4b7655b2a022..cbd0ec00f0c5 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -24,7 +24,69 @@ macro_rules! static_branch_unlikely {
         let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
         let _key: *const $crate::bindings::static_key = _key.cast();
 
-        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        #[cfg(not(CONFIG_JUMP_LABEL))]
+        {
+            $crate::bindings::static_key_count(_key) > 0
+        }
+
+        #[cfg(CONFIG_JUMP_LABEL)]
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
     }};
 }
 pub use static_branch_unlikely;
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
index 55f81f49024e..c0ae9ddd9468 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -148,3 +148,38 @@ macro_rules! container_of {
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
index 8f423a1faf50..03ee558fcd4d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -248,12 +248,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
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
@@ -303,6 +304,12 @@ quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
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
2.47.0.rc1.288.g06298d1525-goog

