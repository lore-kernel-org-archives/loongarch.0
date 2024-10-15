Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202C1D5142
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998129; cv=none; b=qXYi4LxC3eNlpi3Ga0dTPQL27v15ui03l50s5uZWsIfqMEIpM1/URgfd7xPr81HVACQZoh9LQDxWfd16Zm1YImacmyeuWdLHHs2RO3an8iMpceYtov5IMSiprZK2W5zU5I/zyJM8zrnBM0ZeV0QeErRzFlrtnpetXVVohir9Upk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998129; c=relaxed/simple;
	bh=WmlS9ruybdrhRlaID/2lHfheMmCjKvPhIBuh/AhhcO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YeR/7nfQnzPIKyhmksHI2y1Wjq5VK8wnZpi+bFPxNxeWPbbzRvGlqVbFVKgEX/OgjIMlSMTLKUj1k+QkrCd9pHx2Xzh76QJnPLojlFR6IXACCwTTAOBpUfJ2L97lwVfYENz2O9dTCZbL6P4zjDbCu/4lSNbMlzDK3YYzLd+/FWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRgyUYAY; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRgyUYAY"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e347b1e29dso49938587b3.0
        for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728998126; x=1729602926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u88YC+HCUxUWsmDhhJzv+FDTM9B6f4PIf50qF6/YsME=;
        b=NRgyUYAY7Gp3DWuKvozo9CNENfOWz6uI50Cu61shcHfcEm+F7kyMkaAXK1pWvZJn/8
         P+HZxz9zTevRdlm+H4hXyAo23jsn7DWnkXWrCx60AvvVX6VM+jIkX7IMLWtqyrApASAe
         D9AujYr0I8Vd5oX1Ddm5AqIdCAuGt4WaPxhOipICP02Yu3X8JidaeB13pC2g4tdtb3nC
         8QH4oE9XsoiY+TXStf+gE+afzWv9m33BUyZUWCZjNc7Rmc5kdx+V3NR8pbFQ1aSuthCe
         v2z3Agydn/tiJWTJO36tgRZjQin9/ws/1f064CGOKGdABAZxXX9+eZPye55jUQfp4VfL
         fC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998126; x=1729602926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u88YC+HCUxUWsmDhhJzv+FDTM9B6f4PIf50qF6/YsME=;
        b=cLK8Mv8I+UNK5uEjXsJX/IE5ECeGkdBusJNz8jly/NV7J3aB63QeJWXMKYl9duxFt2
         d5BbDSLZJElTgFW97aoILzZqaSmEfLY8J0EIRVMUhzAlTCLZJpxsEczj9ipthKSSLbYq
         KKQ07AKponBHQyVSesZaLUz4x7o78tQsWBlcyljvqyFMQUkw9wvuV0di1L1qfO9LAVw0
         ZvgL6eaGcaN3bZ1DApUvzwcdk0RjRHD7sPEv9IgFA/KMm3TUPxbzh8GbQKUtpYPl+WKK
         LpdW2kwrfRJSNIIhGk8kZrGS4H4G+KHc4CEbHsV+kMKhslFadGxjxEcMYLQ1W8KYUEVb
         A53Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtebhegtRH7rb+neRbxge3RQCdE/2T2uGBawnilaxny4H5YflwxfUraDww7erhwbeVOcBvmpmZhPI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1oI8rbEy3jWiBVkw61vACGQHKv107pDmMzQ9pFvc7mLGD4Ve4
	duiLGLfuTeJZ7BghJbSeauVcCutKq9YU1ERzJz7gqdRH8xJTbH9YIhlT3TwXySLDqSlrgrMLn20
	WUkJOviOd9tf08Q==
X-Google-Smtp-Source: AGHT+IE4zub7wJu93X96Jlwuq2gB7BqQ9VZQMzbObcPdfJYRyYWGnR7sC3n9RszpByxiydfMX++uZvml6S+7iH0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4447:b0:6e3:189a:ad66 with SMTP
 id 00721157ae682-6e3d41c59camr45117b3.5.1728998126076; Tue, 15 Oct 2024
 06:15:26 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:14:55 +0000
In-Reply-To: <20241015-tracepoint-v11-0-cceb65820089@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241015-tracepoint-v11-0-cceb65820089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3948; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=WmlS9ruybdrhRlaID/2lHfheMmCjKvPhIBuh/AhhcO0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDmrmE/iEkUSJVfKvPvKYIgmZrgzDGpoY3SBMI
 +DDHm4J4paJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw5q5gAKCRAEWL7uWMY5
 Ru07D/90RnN4RcIrVzabl6QI81OsSJoCo6zq7NOIuJ+OciuqqlV90O//XrOJs+KsGYD+LZYM86w
 qEvM3RrHzXGhhMH4gcgfyg+kElp+aETc7eOLVfkWKqrRY3B2zCbjXrpwL7hHkyk0zPChq26bRtj
 BCCrpflbMr6ik0H++KIv8chFwz7XCwhnKmg4kaxAa+f1gHFcreTKCeIDC5mntcjL7iqpFJKPKpo
 JhPRylwhU4wEypAteXU6LGBEX7qQu1GoOS4YE8jA5sM9JPv4e83oUW0Q8BPjjLNzp2gB2+mgB5z
 F/Mw6u5XJmGDv87TVRfMD9Upr7U4G37rIYzTLYfwmRiD8IjjR0STuik1BWICYqlyWoi7a16iKZa
 jKtwKNI2hVGut0P4LjnQyqwVOqDRoFavLMuVyvPOhc6K0xpJl5ZRYMPIoPNuqSDKD0ObE7gQzKf
 Ly67ib70h3KKZrctRwAIcJn3u7Os6i15dEUCs5hXQeOZQOEjUrcswKFaSKLHy7Tj07jVauXV9kG
 lrujRTXo1UTGQaNnzAWcEk4PdbwgbbISpoX4ryPEgSe377NXOPIxEGed35rpdLwxAZ7BiQNa+36
 O6HABmLzc8XIvLWJoiIXrF3lvjIrrh+Xt/VgOkz0y+tKcFeeSDGLmS96O483iooq9sV3TqcTOcC ev/Y1GyjFnqcc1Q==
X-Mailer: b4 0.13.0
Message-ID: <20241015-tracepoint-v11-1-cceb65820089@google.com>
Subject: [PATCH v11 1/5] rust: add static_branch_unlikely for static_key_false
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

Add just enough support for static key so that we can use it from
tracepoints. Tracepoints rely on `static_branch_unlikely` with a `struct
static_key_false`, so we add the same functionality to Rust.

This patch only provides a generic implementation without code patching
(matching the one used when CONFIG_JUMP_LABEL is disabled). Later
patches add support for inline asm implementations that use runtime
patching.

When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
function, so a Rust helper is defined for `static_key_count` in this
case. If Rust is compiled with LTO, this call should get inlined. The
helper can be eliminated once we have the necessary inline asm to make
atomic operations from Rust.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/jump_label.c       | 14 ++++++++++++++
 rust/kernel/jump_label.rs       | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 47 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ae82e9c941af..e0846e7e93e6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -14,6 +14,7 @@
 #include <linux/ethtool.h>
 #include <linux/firmware.h>
 #include <linux/jiffies.h>
+#include <linux/jump_label.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/refcount.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 30f40149f3a9..17e1b60d178f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -12,6 +12,7 @@
 #include "build_assert.c"
 #include "build_bug.c"
 #include "err.c"
+#include "jump_label.c"
 #include "kunit.c"
 #include "mutex.c"
 #include "page.c"
diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
new file mode 100644
index 000000000000..fc1f1e0df08e
--- /dev/null
+++ b/rust/helpers/jump_label.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2024 Google LLC.
+ */
+
+#include <linux/jump_label.h>
+
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+#endif
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
new file mode 100644
index 000000000000..4b7655b2a022
--- /dev/null
+++ b/rust/kernel/jump_label.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for static keys.
+//!
+//! C header: [`include/linux/jump_label.h`](srctree/include/linux/jump_label.h).
+
+/// Branch based on a static key.
+///
+/// Takes three arguments:
+///
+/// * `key` - the path to the static variable containing the `static_key`.
+/// * `keytyp` - the type of `key`.
+/// * `field` - the name of the field of `key` that contains the `static_key`.
+///
+/// # Safety
+///
+/// The macro must be used with a real static key defined by C.
+#[macro_export]
+macro_rules! static_branch_unlikely {
+    ($key:path, $keytyp:ty, $field:ident) => {{
+        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
+        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $crate::bindings::static_key = _key.cast();
+
+        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+    }};
+}
+pub use static_branch_unlikely;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48..708ff817ccc3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub mod firmware;
 pub mod init;
 pub mod ioctl;
+pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;

-- 
2.47.0.rc1.288.g06298d1525-goog

