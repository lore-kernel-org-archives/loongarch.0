Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4CD1C9DCC
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328298; cv=none; b=QIrmfWM/FP68eN8BRWG90zoN01zPqdoReuM0ATiqG6/HbMYd4d0WGFfUiKEveqCocRCXnpXTcI35WVvKgxZhhd40Usw+OtPTAlbNETAezm+CtXYYSKI+ZWGetmkskD10SfRcl+M3FymuZ+3YSW9KXWmLELBw6E4qwWK3MRlM66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328298; c=relaxed/simple;
	bh=mbr+t2kdtAR0gaGGgahPyE7BcbfXEyne0mHE/YfAoMM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VW5o676gkPKYwEqHEaGBkBPckq81IqbxCL9zvY6XM/WQomXO3Um2ICh4UkqScqTFqHtCGHp/DzV+dmnBGcbg4LZLLurvJbyiWJUBqqAL2Mda6AgX6zGp+cLSuDLYJmMp4d+B164DOWUlWVZxIKejQs9IZ4C3//xNFeisWU4NQ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sSF8hYLx; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sSF8hYLx"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b41e02c255so15799197b3.3
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328295; x=1724933095; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8cDHUaReumSMCOwyu04+mqYJDxHlzEMGiEzz4YHS0I=;
        b=sSF8hYLxzF3q/2sD9+4pwKJJ1edWg5v+ExD3QwXLUcT2cTaeOAONSeTun7lpYTrXBG
         liiSqzru/7fd9kgb0zHYABSPag6J0xumnzlJ+yOwFtbEE0mYKT+fRi+7m9z1jwdgW4K/
         Dqx29qkIfL3egWy5HHHq0RBu2MGvKydEL/gNa9ZTKAvh0NjuTc6dFnuyqXeZhwmLGXu8
         hiImx+70wQx3FuY4kKUOZr2QACY0exBGUuRiPGnFgWncRAAvQX0b5NVndX9WOlfR7uzp
         VDJkg8tXhCyzt3TyubF22X0fDtbnl5Dn9iE9VQ2vybUYFSZ0KOkTZ8FoKt03fS2Lhc+D
         mu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328295; x=1724933095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8cDHUaReumSMCOwyu04+mqYJDxHlzEMGiEzz4YHS0I=;
        b=jknv5YIPUVscS3CUqykVjCFXBw32NH+IGuefYbMejbjCVP+DngpOCyUPLgw4b4tznc
         nNJDko6olKZ3zaZO+BkU9BTPAzV1yp3paENKBoCXOrW9qynr3Z1WqPkxdu8ZQx1uVT+u
         OknCXKfQLmxx+y2iOb9WOPnYrov3IVA77xfqCTzBU+6VS2F+GU3oW5UwGBWNNb6BIU/b
         4qU8UwFqx6MZUCmrhrJyK7oA7LNQKxFZ6Vgiu0vAFktUu6YYEN5SIAoDSfjn1/PbZlYx
         ZjXGpDR9qBWj523a46N/YgGVB/GOnPgq8/nO1VocXYiaqH8GOBi1hS0Is3I7kUIG+zO0
         QegA==
X-Forwarded-Encrypted: i=1; AJvYcCWcSb8ZqqCbik+alQ6BPySgCWaGQ9Tnrg9Q9DrTdFKnhw1zZIvNRsqYWBeovOIIX3diWct2APFMLXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfRBzCt2kMiUR7ZzTxxJP7dIb/leG+1/zf7YWJhplV7DjS1qBO
	N2yNqINJDWu6LcUmcmjxbla3gM9M7qExRTzwggQX+9bxuHYu8Oov/pdW2WvD2T2H01vkTk7IQP3
	T3ozT+1uzCnR2nA==
X-Google-Smtp-Source: AGHT+IFS8l23pd6XKyyBpjZiibiQJuE/dGIDebXAym+Zq17SC6CU8fu8OUtqV4IA2VQql6cypuUkw5hRlPx/fCk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:3683:b0:62f:1f63:ae4f with SMTP
 id 00721157ae682-6c09ba0765fmr3529837b3.1.1724328294934; Thu, 22 Aug 2024
 05:04:54 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:04:14 +0000
In-Reply-To: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6866; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mbr+t2kdtAR0gaGGgahPyE7BcbfXEyne0mHE/YfAoMM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxyldgT9/w/ZnIezX+YKTsIh4Z5lhApHS8iZgy
 GDuXKIjQROJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscpXQAKCRAEWL7uWMY5
 Ri7YD/0ZsdMONo37tyeCBN+jKz/68J+eujSawLXMswiPYdTohvjITOoKtaLFazXZVIPOFfxDqrO
 MnNH9Nu53HzI5zwZy5mFohAdI2DyHlD3epSshGT9WBTbAhkBhQtppAStZiGcKhgg4pPuAVs7YB3
 b7NfaOR0ZAw+dx6u0ogwlrFB9HeVcrm8R0G5kFpwjGJnCgzWWh/VnTK4j+EINoBxBr82tHq3FSq
 DZq92HK3Q5sDkph8Z43wEhXzYUznw0mFas3+1Wj3aTgxlBYTvzAdCQdfpQN5+Hom37p8BNfJM7D
 OLN9kPzMmDEUV4asCHvO748lZ4FUAFQTYTsLFLz4G3kEJWxhmjd1ratMl1+YShBy1p5pI/K5qy9
 NO/C1gtukYu+zNURzZA5ssWdj+TLWVFEvfuKS7KK46XkbFn0o0PBn7yJ16z7kfLRRah+y/nNHkP
 kwg/SvSiYZ4a2dKhWmcpGKzOs4BGYHTEluxQaxUT2EINxWOAO/u1HqWxyvK+C4KDVUGJdUVu0Er
 0fBQQXZZnBWp63IQDfkQxt/UXIhGxZpb/+kEVlout+lLTVKx3uXKonl/YvbVyFPe2gLdAyX41Yb
 V9KNcoRaP8OKgE3RDT61a4JM3IFQA5/x7xNShkujV0gaMl2g3SLuTih4eBQyBEEsU76DrPZF7w1 3EbN95Wt07MWnKQ==
X-Mailer: b4 0.13.0
Message-ID: <20240822-tracepoint-v8-2-f0c5899e6fd3@google.com>
Subject: [PATCH v8 2/5] rust: add tracepoint support
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
	Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"

Make it possible to have Rust code call into tracepoints defined by C
code. It is still required that the tracepoint is declared in a C
header, and that this header is included in the input to bindgen.

Instead of calling __DO_TRACE directly, the exported rust_do_trace_
function calls an inline helper function. This is because the `cond`
argument does not exist at the callsite of DEFINE_RUST_DO_TRACE.

__DECLARE_TRACE always emits an inline static and an extern declaration
that is only used when CREATE_RUST_TRACE_POINTS is set. These should not
end up in the final binary so it is not a problem that they sometimes
are emitted without a user.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 22 +++++++++++++++++-
 include/trace/define_trace.h    | 12 ++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 49 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 6be396bb4297..5042ca588e41 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -237,6 +237,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define __DECLARE_TRACE_RCU(name, proto, args, cond)
 #endif
 
+/*
+ * Declare an exported function that Rust code can call to trigger this
+ * tracepoint. This function does not include the static branch; that is done
+ * in Rust to avoid a function call when the tracepoint is disabled.
+ */
+#define DEFINE_RUST_DO_TRACE(name, proto, args)
+#define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
+	notrace void rust_do_trace_##name(proto)			\
+	{								\
+		__rust_do_trace_##name(args);				\
+	}
+
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
  * not add unwanted padding between the beginning of the section and the
@@ -252,6 +264,13 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	extern int __traceiter_##name(data_proto);			\
 	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
+	extern void rust_do_trace_##name(proto);			\
+	static inline void __rust_do_trace_##name(proto)		\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			TP_CONDITION(cond), 0);				\
+	}								\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_key_false(&__tracepoint_##name.key))		\
@@ -336,7 +355,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	void __probestub_##_name(void *__data, proto)			\
 	{								\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
+	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
 
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
index 00723935dcc7..8159294c2041 100644
--- a/include/trace/define_trace.h
+++ b/include/trace/define_trace.h
@@ -72,6 +72,13 @@
 #define DECLARE_TRACE(name, proto, args)	\
 	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
 
+/* If requested, create helpers for calling these tracepoints from Rust. */
+#ifdef CREATE_RUST_TRACE_POINTS
+#undef DEFINE_RUST_DO_TRACE
+#define DEFINE_RUST_DO_TRACE(name, proto, args)	\
+	__DEFINE_RUST_DO_TRACE(name, PARAMS(proto), PARAMS(args))
+#endif
+
 #undef TRACE_INCLUDE
 #undef __TRACE_INCLUDE
 
@@ -129,6 +136,11 @@
 # undef UNDEF_TRACE_INCLUDE_PATH
 #endif
 
+#ifdef CREATE_RUST_TRACE_POINTS
+# undef DEFINE_RUST_DO_TRACE
+# define DEFINE_RUST_DO_TRACE(name, proto, args)
+#endif
+
 /* We may be processing more files */
 #define CREATE_TRACE_POINTS
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8fd092e1b809..fc6f94729789 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -20,6 +20,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 91af9f75d121..d00a44b000b6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -51,6 +51,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod uaccess;
 pub mod workqueue;
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..cf2d9ad15912
--- /dev/null
+++ b/rust/kernel/tracepoint.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for tracepoints.
+
+/// Declare the Rust entry point for a tracepoint.
+///
+/// This macro generates an unsafe function that calls into C, and its safety requirements will be
+/// whatever the relevant C code requires. To document these safety requirements, you may add
+/// doc-comments when invoking the macro.
+#[macro_export]
+macro_rules! declare_trace {
+    ($($(#[$attr:meta])* $pub:vis unsafe fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::jump_label::static_key_false!(
+                            $crate::bindings::[< __tracepoint_ $name >],
+                            $crate::bindings::tracepoint,
+                            key
+                        )
+                    }
+                };
+
+                if should_trace {
+                    $crate::macros::paste! {
+                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
+                        unsafe { $crate::bindings::[< rust_do_trace_ $name >]($($argname),*) };
+                    }
+                }
+            }
+
+            #[cfg(not(CONFIG_TRACEPOINTS))]
+            {
+                // If tracepoints are disabled, insert a trivial use of each argument
+                // to avoid unused argument warnings.
+                $( let _unused = $argname; )*
+            }
+        }
+    )*}
+}
+
+pub use declare_trace;

-- 
2.46.0.184.g6999bdac58-goog

