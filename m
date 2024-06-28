Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F211BF313
	for <loongarch@lists.linux.dev>; Fri, 28 Jun 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581054; cv=none; b=Q9bJJo8GGtfOP12YryOWML0vwuh4lPjpRLOmO66iPTZ28/0K+eFVv6w3JR82aWNa7qyhYOMWR4PfmL/V7k4PA34C9mIGcYHS1v84jpTN2vdzAta5qeUWG96OIdnO+krqfxogYrr8H4PlY+m8wCrvHZKcGfSaq6M3MBM8dazF52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581054; c=relaxed/simple;
	bh=v/CwpANb/enEE59VpWuqO+vG2Bs6iq8UapwpRJZ9hQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oL/fDqsyZiweGP4HyBav181f9dxFgTJ/pxd+cw1xkdEqAXKivocxeGSo9Rq3eolk6ZyraPj08gS5SDgMTrzOQmprhxcm38aOwzXs9dcJaOXdTq/4dVEH9kqfKOnETsh5mezL6Y0i7rozbXagaMIXqP1M7sSZwS00DMoCBcA+x1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lLYFwQKE; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lLYFwQKE"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-52cd7e63b2aso619062e87.3
        for <loongarch@lists.linux.dev>; Fri, 28 Jun 2024 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719581051; x=1720185851; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=969O3CWF12Jm+ipcoNEWf7U/TfwGyBpHNp6wtcZC710=;
        b=lLYFwQKE3MgGh4V9+7rAw9UEx+XhFfFu02K9/Sfv6oU7/xjIcLOa/DwXJoVfNhEseI
         gN0VIZcRPrC8F8nLqGZ4e60pYswUuRck2FblFH3J0azy5WyKBGRKSw7xgxdbTC58oYZi
         89kfD/xZ4mLKhKqsVNGJsWzmqgy1ouaMgQVXC/Fe6bp96A7a3M1Z7Pka3euLbPlBQJY9
         ljg/mptWveXxmXHXSsFoOVPhHPLMar9i3dNFFqpkhIgQPUf+Q9sjvYspVxUaguEbkMmk
         /TTouAzCV1eZx64r/mbF92m1qndZfXRV7Aa6F8ghiUc7aaiT1vYSAAbS2e3wRB4zhUGr
         xh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719581051; x=1720185851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=969O3CWF12Jm+ipcoNEWf7U/TfwGyBpHNp6wtcZC710=;
        b=dPMM09gewudiS3XP84gjxtME7OIo6+ev62EHr2PO2SGw3bdz6ASZKUzlgv2lMRimd3
         E76A5spM/VnRXMu5Gd+RRBZGG591B+Ijs2nRXb+XTJWYpEoc3ZTiUP+eLJmzCvzedJP/
         7d1NpePYmDjF2zWjCy0PP9S8gBvZFDRu4RWg407mtBXX4jd3hoAh5vhou70WnAd6psxI
         EAH3nMpdyrzNdG2WdGTI1jYfyYtyt3rZ21MvqS66mRKKWzR/GA/qQ/mDztTV+8bRNZYW
         TbpkiKE7p4L5Ng365MD1fazonTRXR6Hg+NIY8cIJwkyQg7u0CWGhu2JT4YN+p2l7eqk+
         057A==
X-Forwarded-Encrypted: i=1; AJvYcCUyibKtxtwlgedHxL6jKpXmx626muzLDi45NyZpnuuydqy0bBvkOdCUZ4qqcPcPLPb8Gh2kcsARhBHRqW/cMoZpf7O01fcttosV
X-Gm-Message-State: AOJu0YxbYko6ZzL4KAAudLaXAZtttuXWW/Ye6N6mNjM5BDIrxtEs9XE7
	8nivza6lZTMBqrq/kB6whAOEZYIpIX8k+yR7v3O755+8/66oAW2NGEIUpiY5FROggsgqTSm9yli
	VIh6/qs2ve6Goew==
X-Google-Smtp-Source: AGHT+IHOuhMH8lCZyqgPZo0IUCZguSKcNbXCdaWjj3cdEvBVq1Q+0LN7WSNqoq7E7NvkH+V+nQUqXL0VRBCHifE=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:3e28:b0:52c:7f96:81d1 with SMTP
 id 2adb3069b0e04-52ce061ab41mr20614e87.6.1719581050857; Fri, 28 Jun 2024
 06:24:10 -0700 (PDT)
Date: Fri, 28 Jun 2024 13:23:32 +0000
In-Reply-To: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5954; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v/CwpANb/enEE59VpWuqO+vG2Bs6iq8UapwpRJZ9hQA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmfrlxFoRsS4nKuM5f791HMS0zaizWUN/GuWPSF
 5DmAsQIie+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZn65cQAKCRAEWL7uWMY5
 Rnn4D/9tLGOpO3gm1Mdg7+V3aBKPndVvoDIfPVKiSkD+ATgpOSjsralpHwXujxhx1IqP3lYgOdz
 F4tE/qK42GPiG2qOTjpSpJDaMSQfw1d9ndqFJp3KG71VnpHJGL3k4nwnKr4SGu5BoznL6eyv+wX
 GMjXIqpL1Aml+w5cF+MMfEs4FjjCVM/HRlpM4z5A/gCBUEAQqixk+LexC5R/qvVJJYOxiqTALFu
 idNa0gDOJwenzkvtOUM8hu1iBrNFC9/7BtwnCQ6dY14wy+j1zXRNORSmO4KK7TqxLuqtVRpBRm+
 +ZFo3ePJ2Cv3ppirCqmoxPx2ntkTkPSMtU32nFAWBumNIIUDyH+gG/XFzLYK3nFLghDsB8WjPpZ
 FpJDBtbmHzuGz4yQU3sNeN6piB8QumLbHKi3cHoLdujMGDkno25gVUSRCXe7h70q0g1x2RlEmjg
 sFElazH5qpsztWiLuPlFMNPJo7W6iijAV0RGTCLtTYg+NNrInG+xze+KV4I/vuK6GiZkTbR4X21
 YDrhSxVEt4S5Kv0bycWgW7FOOGIlWo7tDcn61JvMW8f9acRFHeVsKElIdbwzOnt1ThoUpvUbw7I
 HwsSEBS9BKACnoLcUCP1aDFTlZqDkmUTMcefFdHWM/6jPz92m7LbDPq2vWSCFmM2u/rum1QCrjY 6gmxPd34WQQHtZA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240628-tracepoint-v4-2-353d523a9c15@google.com>
Subject: [PATCH v4 2/2] rust: add tracepoint support
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
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, 
	Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
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

Make it possible to have Rust code call into tracepoints defined by C
code. It is still required that the tracepoint is declared in a C
header, and that this header is included in the input to bindgen.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 18 +++++++++++++++-
 include/trace/define_trace.h    | 12 +++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 47 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 689b6d71590e..d82af4d77c9f 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -238,6 +238,20 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define __DECLARE_TRACE_RCU(name, proto, args, cond)
 #endif
 
+/*
+ * Declare an exported function that Rust code can call to trigger this
+ * tracepoint. This function does not include the static branch; that is done
+ * in Rust to avoid a function call when the tracepoint is disabled.
+ */
+#define DEFINE_RUST_DO_TRACE(name, proto, args)
+#define DEFINE_RUST_DO_TRACE_REAL(name, proto, args)			\
+	notrace void rust_do_trace_##name(proto)			\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			cpu_online(raw_smp_processor_id()), 0);		\
+	}
+
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
  * not add unwanted padding between the beginning of the section and the
@@ -253,6 +267,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	extern int __traceiter_##name(data_proto);			\
 	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
+	extern void rust_do_trace_##name(proto);			\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_key_false(&__tracepoint_##name.key))		\
@@ -337,7 +352,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	void __probestub_##_name(void *__data, proto)			\
 	{								\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
+	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
 
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
index 00723935dcc7..08ed5ce63a96 100644
--- a/include/trace/define_trace.h
+++ b/include/trace/define_trace.h
@@ -72,6 +72,13 @@
 #define DECLARE_TRACE(name, proto, args)	\
 	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
 
+/* If requested, create helpers for calling these tracepoints from Rust. */
+#ifdef CREATE_RUST_TRACE_POINTS
+#undef DEFINE_RUST_DO_TRACE
+#define DEFINE_RUST_DO_TRACE(name, proto, args)	\
+	DEFINE_RUST_DO_TRACE_REAL(name, PARAMS(proto), PARAMS(args))
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
index ddb5644d4fd9..d442f9ccfc2c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fffd4e1dd1c1..9ae90eb69020 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod workqueue;
 
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..1005f09e0330
--- /dev/null
+++ b/rust/kernel/tracepoint.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for tracepoints.
+
+/// Declare the Rust entry point for a tracepoint.
+#[macro_export]
+macro_rules! declare_trace {
+    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                use $crate::bindings::*;
+
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::static_key::static_key_false!(
+                            [< __tracepoint_ $name >],
+                            $crate::bindings::tracepoint,
+                            key
+                        )
+                    }
+                };
+
+                if should_trace {
+                    $crate::macros::paste! {
+                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
+                        unsafe { [< rust_do_trace_ $name >]($($argname),*) };
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
2.45.2.803.g4e1b14247a-goog

