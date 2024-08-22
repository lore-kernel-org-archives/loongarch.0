Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C71C93C9
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328494; cv=none; b=iRHnNwQhbK9wFm0f6Roc3+iMCH5dK/g27fAYotAjorf16sndUAuVxdAv+86Ydruo7NQRS5vi9zc0X97N/Xr5Yg2N0PkhFY95dsZx9t7+3JtgQK630Fh3RC4zK3B5iZEw2CqUe9zonROV9rGoIl3UUP+gzFRl91110Z3msuNclOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328494; c=relaxed/simple;
	bh=JHM/BUkuA/+cbusgqfq0ytDzqdKx7hEHKUaGhoYxU7Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=leydiQEiR8HdrVx3TZM1rWIQlif9lXevKww2Zjaourm4QfjGbi+/si55ikwSDfiKicIBSxZxGVxnF5WO7qagKYdgYLR1U/BUas1DCqCFXrh/Qx8+x5ooIYrslzh542gVD4XSkYYM+V33ViH1/Y7GM+l0SbcBfAysG2H4FnrolKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FM9vm6kY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FM9vm6kY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-427ffa0c9c7so7336015e9.1
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328491; x=1724933291; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=naARk6fBMWgAYGgevIE1Y5LEGU4i3ZShVI06qtX0z80=;
        b=FM9vm6kYNPjFVYILha0B/F2pNDHOmJXC8LJq1eldklYTSo9BZDmuhhgb7CmW100Fmw
         4lLgY02pXaGIwrRjE8MbQCXbZR/oCWY70BDESTU50PkiYp5Ihk1VFd8dI50pIes0IlRx
         +59OvTqlzPmyYNzSrWcNAf5pfenclfOtrbDucaqtCsoaGjz05JpAXVjiGIlqQVMRP4uo
         EzUvOA6VY2kJQdJ9g+Ll2zJ15FDs4rjkYXa/k2Kz33C+idO12ajkfMpUtV2tZczaJ3lY
         XKU/9/xBN7cg3J9U/Eyrl4CTO8aun5CnsVZ4FxeNVZrGVvS1Mvov02xm0EqPAzeTOEou
         5toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328491; x=1724933291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naARk6fBMWgAYGgevIE1Y5LEGU4i3ZShVI06qtX0z80=;
        b=Uh5Gx5mRyHz3r/mDlpGQg655ibkQtynxTKCYZadSHmOlA2Qn7LB0qNokLudVbwpb/u
         7/Kam1jIfQDCqGChcu2kjROjBWpG/crHjZLmjlBVgY+1IxHp/Mla3o5zeEB2VADVp66b
         WR8icmxCuNPJYXYSlTqlNIfom6Ak3aoDI2R+x110hXxPvHJzcsuAcdWBIKb/oVZO7Gnp
         IY6wNdzSd+chOmPBb87eEmtoyu2WkEofZmJonP9AX/qUEIAX5JWYpkNC+sOnUZAkTMmN
         /wRgcphyZ7VrhwXaIxvySPSruhxu4ChGcenryMxEajXb4/tDNq5yGRDeIiCXeBvqV1W0
         ukSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSKrpQjW8hr73e5I+Sf2yBakOSCoWiPK02TV4ewUgdEUnUSR0hAWupYX0BJQNQ8rPbwLjy8FZKmpE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8MTSy70w8IrFeiGu1U5ACMO32eM19deE6aXVQdReJdLZX/hGB
	kyRG1sBesfqbIhAGyBXGs2Fo3B+A/qrcN8pcuOg0v6tN6iXJ3mNHsgNVMFWfD/UcQKpZYLJhftX
	cnC7OQpzh2LQPdw==
X-Google-Smtp-Source: AGHT+IEyGPJXeWJysEIPI6wD0lhSnVGXUniixtIB5lAxq9kG0NFe6KvQxgYn2CVMHMVUuURWnQ4QiAiTHcwXBdk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6b18:b0:424:aa3f:65e1 with SMTP
 id 5b1f17b1804b1-42abd25cb5fmr849535e9.8.1724328490630; Thu, 22 Aug 2024
 05:08:10 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:08:07 +0000
In-Reply-To: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4177; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JHM/BUkuA/+cbusgqfq0ytDzqdKx7hEHKUaGhoYxU7Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxynfawVu6X01dRB20ihmTOJOPQpQJzWbIzWrx
 yL2avgJZ7OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscp3wAKCRAEWL7uWMY5
 RkrGEACX3xXt4E8r0VZmkmxJiePcgHdkNY7hyfphrwZfNs95eYXkmxp+QjuXTM0LYXfDn5mPC3S
 E/oNrzrrNmhqnAqx9GR4LeLrGWDCftXyo9TFd28s6kNeZABALwmwfrfaGgn2IEtGbx6muhGD+uM
 QdQ7IjC6AHU/P0fg3579y60ArAuJVybjt05kz3GYb+O/COG2BHa4TL8q/RUryS04ivLa18bR7bD
 vvlRYZe7K7+YFtluNZRBSwkNNfu22CovK5DmlX1080VXZHnAJ9ZBMlLbrfBqZ7DJ0wxLzjEOOPj
 H8xx9TM2niBJWUab6VwMaKGh7d0wWdv4J51eYAOn/xCfmyRKVqSA7Cswk28GNhTilTzxBArQKbk
 VqLyLzfjFPbfbLYbVCQ+abUwuqsipnfwgNq16Y5ogOTHHimvPfcPgddERBoeLHH6KqIVH+/+mzh
 4tVsApW1kOkX3NbbnVEJj/NqdFFwlZTN8BWue8Zy519K9x7E2sKMlw1oDCLa7KOGk9oRG4bR1xB
 yUGB957o3zZcAMFB6zJuZm1OvgF0DQ6HKNY7uO3iiNOljXoMu3JLJuSKxJ2FH7xW7piqH3CrH00
 k39MhO0Ac3up1BwikxcVKGw5Ll1ZnS3OkVLdgx0f0eGrpE/fEmrEnmopqRBlCiOGwysim5kxgyf Ys6/LRmIPw4rDQw==
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240822-tracepoint-v8-1b-f0c5899e6fd3@google.com>
Subject: [PATCH v8 1/5 alt] rust: add generic static_key_false
From: Alice Ryhl <aliceryhl@google.com>
To: aliceryhl@google.com
Cc: a.hindborg@samsung.com, ajones@ventanamicro.com, akpm@linux-foundation.org, 
	alex.gaynor@gmail.com, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, ardb@kernel.org, arnd@arndb.de, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	bp@alien8.de, catalin.marinas@arm.com, chenhuacai@kernel.org, 
	conor.dooley@microchip.com, dave.hansen@linux.intel.com, gary@garyguo.net, 
	hpa@zytor.com, jbaron@akamai.com, jpoimboe@kernel.org, kernel@xen0n.name, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	maobibo@loongson.cn, mark.rutland@arm.com, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, mingo@redhat.com, ojeda@kernel.org, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, rostedt@goodmis.org, rust-for-linux@vger.kernel.org, 
	ryan.roberts@arm.com, samuel.holland@sifive.com, seanjc@google.com, 
	tabba@google.com, tglx@linutronix.de, ubizjak@gmail.com, wedsonaf@gmail.com, 
	will@kernel.org, x86@kernel.org, yangtiezhu@loongson.cn, 
	zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"

Add just enough support for static key so that we can use it from
tracepoints. Tracepoints rely on `static_key_false` even though it is
deprecated, so we add the same functionality to Rust.

This patch only provides a generic implementation without code patching
(matching the one used when CONFIG_JUMP_LABEL is disabled). Later
patches add support for inline asm implementations that use runtime
patching.

When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
function, so a Rust helper is defined for `static_key_count` in this
case. If Rust is compiled with LTO, this call should get inlined. The
helper can be eliminated once we have the necessary inline asm to make
atomic operations from Rust.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This is an alternate version of patch 1 that resolves the conflict with
https://lore.kernel.org/all/20240725183325.122827-7-ojeda@kernel.org/

 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/tracepoint.c       | 18 ++++++++++++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 50 insertions(+)
 create mode 100644 rust/helpers/tracepoint.c
 create mode 100644 rust/kernel/jump_label.rs

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
index 173533616c91..5b17839de43a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -20,6 +20,7 @@
 #include "slab.c"
 #include "spinlock.c"
 #include "task.c"
+#include "tracepoint.c"
 #include "uaccess.c"
 #include "wait.c"
 #include "workqueue.c"
diff --git a/rust/helpers/tracepoint.c b/rust/helpers/tracepoint.c
new file mode 100644
index 000000000000..02aafb2b226f
--- /dev/null
+++ b/rust/helpers/tracepoint.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for tracepoints. At the moment, helpers are only needed when
+ * CONFIG_JUMP_LABEL is disabled, as `static_key_count` is only marked inline
+ * in that case.
+ *
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
index 000000000000..011e1fc1d19a
--- /dev/null
+++ b/rust/kernel/jump_label.rs
@@ -0,0 +1,29 @@
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
+macro_rules! static_key_false {
+    ($key:path, $keytyp:ty, $field:ident) => {{
+        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
+        let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
+
+        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+    }};
+}
+pub use static_key_false;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 274bdc1b0a82..91af9f75d121 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub mod firmware;
 pub mod init;
 pub mod ioctl;
+pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 #[cfg(CONFIG_NET)]
-- 
2.46.0.184.g6999bdac58-goog

