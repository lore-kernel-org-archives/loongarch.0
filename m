Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBEB1C3F01
	for <loongarch@lists.linux.dev>; Tue,  1 Oct 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789438; cv=none; b=idhSP2BbANLelY/lAuD2eyAJSciLIqfRNoSiV1ThdMSGWxpq/yZ5emXgzLMNGl7ng04ftVa0wEALm7ok8MZOFKnpEuqIDdR2fGvkcaO2M1fgdt35l18dG6ZYjAIve21uY2WkxOYnIEkeWZUVdmWkEjUh+N5e90pKPr3cUugH/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789438; c=relaxed/simple;
	bh=QAR3+Uf8S8g4ti0ixSbviLuiwMUo5f4YoL+bKjncXao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JjeADnfsvmlwAGRypvgS/9fnphu5wzMnfgXqmTBayrD6zW8HOLfBkhQnzadl5NcnZXflXepy4M54BjeiqSSsuz3DpgzXjmBCVJgn6/Bc0hmk5lJsk5YYE0MpNHSkaqV26KuoSwGmcYg2MQvAiTM/SVZnv6LwqwESk8Ibz0wJ8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eqLuisaS; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eqLuisaS"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e21dcc7044so104338677b3.1
        for <loongarch@lists.linux.dev>; Tue, 01 Oct 2024 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789436; x=1728394236; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHT7RCQWh9VJMF8oIXuBP7+2LpYWya7O6BZRCiI/HOc=;
        b=eqLuisaS+yTzxvQr6E/XHRisNndy51+mAEXdVkif9V0gosIsZ/XxX4O6tFk5mp/AmV
         9Jbr3YkVMik4CGwp1h1Ph5tGvTLacjxf4tgYEqUV2g8cBeRpRRycxrqtKKQ6Kmd03QB0
         nNigC/Hh3d4Q64FhPUTzY55KRA9a4jRAvP6PAb+GfRGuMiNBuoZQeh0/PRC5FYvGboPB
         1YNUz7P+E6TdlGINGmE5lnl6I3GgukDgS5Js9ThHd90SqtXPxblFxQBiiiLNTAixRfKa
         p05XH3PfRyH7i/x2WD0ReEcJ4+vd69ach34/CYhyStrbASCj3Odqv94+Qq6KfheqcCyX
         WaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789436; x=1728394236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHT7RCQWh9VJMF8oIXuBP7+2LpYWya7O6BZRCiI/HOc=;
        b=NScJ3bt5ptGWPqfMfG97O6ta1Bi6MC5scxUICe+eflmAhgTFFxCt8U43B8+1Bm4PQQ
         d+dEVritcICBC+hKCBf9g/NQVPibyRlG1CtOP5dZeNi1J2LSNShJiox/B9p+taBRPLPb
         hDToq32YxEoChgO1Uk29dooifal6gXaWKOivqvorkUPkbUbC+bL69uOrKM9B7SyROky4
         ABx/3/0Blw4jlKd7NrMuNs3IhAds1S5b/1xg1Ifjuos7vWux6VNqyVwBVJh/zUmbYHkk
         Y0HCM6iku1PRVDdsa54/TlcLVFN5fSKteTQa/C8ERO7jq204PxgaFJZFH6Ib8ifnCVAs
         iZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIjLRZ+nIDH5LFU+qZtVVtvuSq3MoeLModbYiu+SfLbQWUnq2Ixvb6jhsbwW+LBma7/uI6H20q2jE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLLKTF4jBs1GlHPXTZ2lUySzzKkFL756olQt38xHsjUeGnHJDm
	uXIHaYt+ReEw/HuB4IvljlJHPxOcP0/BuDNMFpNvlsFjxoCcc594NjKjkIsPHyXTggaugrOeo7v
	PGfSAT4V4osdOPw==
X-Google-Smtp-Source: AGHT+IHkTUHVo8ojrSDPAhDaM/l29E/UDPZXNOXZHUGDN5vnnYr5okPT46k0myzDL6E14UX9F+O4B3eF5tiFWOE=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a81:e349:0:b0:61c:89a4:dd5f with SMTP id
 00721157ae682-6e2473994camr609407b3.0.1727789435216; Tue, 01 Oct 2024
 06:30:35 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:29:59 +0000
In-Reply-To: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6914; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QAR3+Uf8S8g4ti0ixSbviLuiwMUo5f4YoL+bKjncXao=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+/lwLLpJIPmK9F6nIFaq3qeHRS41Xthj8IwUL
 +dYfwevd5iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvv5cAAKCRAEWL7uWMY5
 RnHND/0e5/swnUVhsY9o7C6VXyx98GKYvW6h/sOOvEpHwRdKaw7MsuphOCFBlp3GridSl2CdREw
 kp/PCwtrSdI6P4EfmhKrH1U+QG6MJA12aikTzwudkUJxgWL2jyadrWeeUpRuafUBS4oshCCbVAR
 56k1blE8NbJ4OJIttcUHPn2QkleaQdVFQNlZtzLRbtGdXUPMQvARAJENhTDyFqjFrSFQ5Nw/1md
 ZbD6ky8sXA1sGw0ZKaMOlxcaB7UM7oKYmxP0rg3JEtuMyVPRGTrxkJqWZUZhL9bCCQSRfWvxwuK
 PC2/p7aRxTIBBqTRYRKOIE1FhTqDXe+cbzeY5awE4vH+8ybFrIqkJ4HAyc7o1+SoqDqnOEU72tE
 OG6obmjo9io0JpBu/CFoyxUimdW1TVmPWanZY2koIXdKJczPx1y+xn6d8MKqcbdfKSE8IXdtpG6
 igaZwliGMBU9wxPeRJ2NAlqCcH/oIaODqDVLCz+IM0jbkAuTnLtqpjyR+2R3EgtaC7cjVnpZDJl
 c6pK13s+xQNGHg3LmwKHj+oEvRGGG/G/iR7aMe9BcvzrXgeKqlAWuHZh+f9QEVRa/78GBgcOAP8
 7Fg1csdkSMxBpFtgmhkmd1m61D9+nWPaZyBtreeMY/NNAtHZT0vYpal4VB7VBNDsxdQnKiAYd7M DCPx0zC4o9ThG/g==
X-Mailer: b4 0.13.0
Message-ID: <20241001-tracepoint-v9-2-1ad3b7d78acb@google.com>
Subject: [PATCH v9 2/5] rust: add tracepoint support
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 22 +++++++++++++++++-
 include/trace/define_trace.h    | 12 ++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 49 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 93a9f3070b48..316cb046653d 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -257,6 +257,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
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
@@ -272,6 +284,13 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
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
@@ -356,7 +375,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
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
index e0846e7e93e6..752572e638a6 100644
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
index 6dfafa69a84e..77610e19df96 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -54,6 +54,7 @@
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
2.46.1.824.gd892dcdcdd-goog

