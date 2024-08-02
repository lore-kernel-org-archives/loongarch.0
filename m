Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F31DB451
	for <loongarch@lists.linux.dev>; Fri,  2 Aug 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591122; cv=none; b=FrdYub6IOFdY/tMW285HlViV953EHqIkdFla3Qb1IEe15XVVJ5xYWoNPTd1RxDictUy8HxW/MVkW7FD52ZRhcs2ssbbpRmT3wqG8Gb3zfYmkNw2SHyJntAS/V5zf3Hd/dsw0JsDuae0eAcHaYO8JUqHE2UQ9hAi3ri8xPqPjkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591122; c=relaxed/simple;
	bh=w0kjkNp9tXlUo73XWRVbps/1uhcBH0l+7rWOWIsb964=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RhD/gyURJsQUIWORuZEzGisl7yxYVlHxkOUd4fydIRG6WjcRGGnm6DZySRqlnuL3cOyRC8RN9i/x8lJablFt1iTRi+VfwF2OEUCxSb/i5I9jMvRGEZDr1tBVbaLurNQedc2FjEsgXgkNJ1Qd/tv53RTCZ6oAMe9tVpMEqH/7PAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbLvwftJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbLvwftJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3685bbd6dfbso3343823f8f.0
        for <loongarch@lists.linux.dev>; Fri, 02 Aug 2024 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722591119; x=1723195919; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFX002WF5KycYvj+q55NDLygad2v8oW7DNGZypmpcz0=;
        b=JbLvwftJCQFu6zlNFE8Ud6iQeQ78t0PXE+Hs27yXswGflC/TZCrQ8jETimfLechHex
         54hOo88FEfXrfhVXge9OaKYNVNJadphKXDm1drvjxtP5gHTfxFX8ylnKJ88emuAxO9j+
         tki9gYjJK8NhKMuECK1zUH4fUP+az1c6YhovZqYWeoilqg+0WzQN6/sftyBpqbZ7Z3sD
         vzdxOKigbo2Ctw+aDErBXPqTY87JmcgKIDDOBMoiPoGLc7qXn11bjHHZyeIoJ40oEuYt
         xBXbiC6SAhHsC2SPkJq9q4IqKslyHwTbh64ct/20SDFZcflYJDG788PdVO4AVrW2AvKQ
         5GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591119; x=1723195919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFX002WF5KycYvj+q55NDLygad2v8oW7DNGZypmpcz0=;
        b=NibdBkz226wuPqd767aNeMRHI6jy25LhuwDfesy/Slt4SAsXQjsHTcgAeBS5W2NMzR
         vQ+yzXWb/wMEZ793YZ4WOehQBshQOIgx2THi1wIJqcF6pyA70Gly3k3Wow7iotGvfY1j
         LUqbDH06cktNXPUEj6tAnga/BUsKCEYSNBtSQPrlAfNEk/+kSrDoPEGVRDF6s/MIKW5l
         TkVPSvcudGpwju/F9h8usnYxtdzcYfESzwsapPhg3svdJCYNJ5HxhoNlPkwMjXlfnZjf
         ZJIfiDr6zMFEo+p+xaLgNxTaGAHhwWtLgn3UgzYYKni9WVKARmfagYLzWLontFE8Df1T
         bOcg==
X-Forwarded-Encrypted: i=1; AJvYcCXUvpJfejiQACvrLDaRPRzdfhZXOQFgnG/RVlLFlrbMwNLO1F9l1MWAV8Y2MBkN5XXPEHDv1u0ycvOKjfoZryU5mn1X21RMkXEM
X-Gm-Message-State: AOJu0YxgrxtVtg/gl1dRcr2qjAQ2hfcWLl2HMIFXewsFlmKavJ/eLd9K
	58oV9ZYVZqx3c0zwyVUTFYHGpFMqhAl7BnrF3UTMPbuJXduQtOmWhsYsAMKBPiEJ3Xv5jm6JCRk
	gzDfuPft0/OCmSA==
X-Google-Smtp-Source: AGHT+IF6TeSE4s9eo+99KIz96YHlhNQA6ZSJ6aPAHp3y6TccqHauRJLpWLajZIVv2ZcexsnAul3c4G3kS9jn4ac=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:4a49:0:b0:367:8f81:2086 with SMTP id
 ffacd0b85a97d-36bbc0c268dmr3057f8f.3.1722591118384; Fri, 02 Aug 2024 02:31:58
 -0700 (PDT)
Date: Fri, 02 Aug 2024 09:31:28 +0000
In-Reply-To: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6821; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=w0kjkNp9tXlUo73XWRVbps/1uhcBH0l+7rWOWIsb964=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmrKeGhEkip34Q57vcFdE7eAZCn8m33EEqxM86s
 0iQvqOQFKGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqynhgAKCRAEWL7uWMY5
 RnLNEACz4FN/ONZ7Vt9T1opNcvYM0M1wnNDNzPcCJVfPGUgOOXaPaqXXozfu2ApS6kqEaBAAIw2
 jmFl+Luvdm/Dc+ITPOn9yqJdJ2lNZU9voXBpEssxVH+3TOlfNRn+9/MA8s4qzx1kEpzpX9TPZfR
 LsxFJQrNmp7EFcr/AS+esS8K89ZItQezsxbMNeVeIivkqs5juoxhLg06cvOTp488pwN9KIcIwNr
 M7KTeOVqZETJOZrScjCWw8WQ9udaxlHY5w8XcCF6+Kgw5gXMMCulYgxyVigHok6zIK8WpeRONdN
 Lj2yBJB7eiPyQ27XrASFlSz3SjqzeK55VfDJlAAu36xQHhXy94+KlZkkthdV7dxAJy6fFF0bkL2
 O6KYmORTKz8V7vehTZ0c36Iq0euccI1UtxBmR2rCMMoqV/oI/wTNwTwXRDTjMAXKE4up5znQFlb
 6Ysqrc9uXVAiKGPZDaPwXYPX6exhQo1Q/JRMFRUoejHXYPyQ9XhDlfp8568aFNP+cd+Jt+Mbpsz
 0uKE3uQyWMyrpU3lwlDL3hbFxNbh8RpVDNfW6L9T8PqbHE7j1eBq5k2VG7lGyQwq4y6Mev1FRuv
 XTFGZ+Ejy0DS7DWzMIsPa8Wvmv7PvdN0BRrBpmu4LePqlgzIN2wktBWcKnfhmuRkzjpiXbRKagC vcc8t+dAXUfcPRQ==
X-Mailer: b4 0.13.0
Message-ID: <20240802-tracepoint-v5-2-faa164494dcb@google.com>
Subject: [PATCH v5 2/2] rust: add tracepoint support
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
index b940a5777330..142ee71ae7c4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -19,6 +19,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index da1f69868d0d..64f2b09920e3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -52,6 +52,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod uaccess;
 pub mod workqueue;
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..69dafdb8bfe8
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
+    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::static_key::static_key_false!(
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
2.46.0.rc2.264.g509ed76dc8-goog

