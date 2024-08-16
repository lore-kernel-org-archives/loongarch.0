Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE31919D07A
	for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723806504; cv=none; b=KXctfvKW8khxCep2eWzUnCClmI93Tdabl/5njJqxmVW/wg5zr9VvqG/+pOxQNcgkr1x/OqmOFtRxWvAmyYSItfuBhK5xTXXBBf7o7DRykGWoNivxQNP5VMz7LNkS4Wg72M23sqTjCCO3fAP1eKYI03AhzNDdNHT3RovsU9ogx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723806504; c=relaxed/simple;
	bh=x4Fj8n509ULmZ45N1WACwPWEQuAc2oLxAGwmKjHodr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eYQpc75c7O29fP/5Zx9wNtq05z/Wr5GJCFUHxpdQpLN9sTpM+FsS2WDYatUiQmZiN6H5pjKkzBcttnmbcy4vTWkeTNqJT/c1HK/pYMfpMryBjPZeKdoOA7y1tUZFzilRGn84gMj7aX5+sihfPemPY1mWD+uSiPIMGTcs039clvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VH1ycDY2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VH1ycDY2"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4281d0d1c57so15067255e9.1
        for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723806501; x=1724411301; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=VH1ycDY2ZE+SUHnNNHhSfEbE514RO7YjdxGzAj+UlDzdyqZwGUoPBpEniE2jYBxXQg
         g/zsvfBljisXdO7ky92WCP6/QAff61yMVXBfg26uRdm0i1K3Tex3b6/8/vA8Apc4ZUdK
         x96vhBrxGh2CNcjFv9Sd9LwByMVBr+Cn0eyYDcAMMzY+cA+MejbnTgwTcDUaUYyv6bji
         0RP3cXFmKDkseQIpziTAzVpqPQRQkOdGILlxh7Ph0mCBzuKdb/SZOFVv3hSVgw2WIfHR
         g77eIkIAbP2fb5KC9hmfdRkJ2FoLuX3aw2SiPkPbsTLfyanr+ZQU4OUuSOXf1h5MkPJS
         3o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806501; x=1724411301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=dV3t2DYpl95pDjKyIJep98VuFifXYsGClXid867fvR6gYkS4zbWPIARxCtuU1iXwQM
         bbWXVt6aJFMvc2BKBjTK2Ol4zie3GX29xlqkBj5ybei6SCcJhjTxGs3EsiDsrLk+1vvO
         JUPKDFBivEq6bCNgqTldy8m9ppstoSn6nxYqi4ruSt6bFE23FX0uc1owVsZNWOLn3IMx
         gAO3f0ag9+nYxdY9RlMxZtnn/GedbvBxofeXZmocDnLph96LuABczTPX++LdtOAbvKDu
         T1glZMNG5AjzJmYI/Zy6Ue3G0PYXeJ5oW3VshOO4qplRvvTogGnBYu50vmfH3/ZVUbiQ
         ZWxA==
X-Forwarded-Encrypted: i=1; AJvYcCW0F20tYhvXOYLuA0wQ69MwC6CQdI0OVrLvvaj7tkpi7y0rOi3lWbBO4T5EeiJ00imNX4xnRWcwLdjZGdYlyc8mCevxsQwcd0vf
X-Gm-Message-State: AOJu0Yx9CmhPgWe+1PF76ETfX7JVlgrngTGR1NFVAXMvyagwT+QD4bI+
	lkNn6Vv3hyW71F87U3no3o/vnD4y7xKJOkRoZXQi2Xdb5Tsjh+haFWbzlZ59AHpje9Jt6ZsPR/m
	w1j8qzwa0YONx0A==
X-Google-Smtp-Source: AGHT+IH+VAsKwfNCiHHe99AmivtojPl8jd65icHQdCeMvqDYGyRGiGAODBeHQJKgR08V8df12KeTAxMnbdJAq0U=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:4798:b0:429:c788:c218 with SMTP
 id 5b1f17b1804b1-429e23a6fdbmr962585e9.2.1723806500805; Fri, 16 Aug 2024
 04:08:20 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:38 +0000
In-Reply-To: <20240816-tracepoint-v7-0-d609b916b819@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3678; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x4Fj8n509ULmZ45N1WACwPWEQuAc2oLxAGwmKjHodr0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvzMdVneCXly8cWWe5Iu4uc6nbYralCN4y+TmV
 wOYf3kDVPyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZr8zHQAKCRAEWL7uWMY5
 Ri7iD/9j1byicYermmm/i5dPcFPGgulMHHWVSSxshMFGTPr69xesZ5H+/l90d3CEP5L9ih8x7ht
 QrRslTqFF8Yp9ivd8uuelOk1xaXEFPw8P5vRGIUU9b4I4WMxlcb9g7ckF8zrV1qdeFG1PZqDxsZ
 xf1pWqvqszr401XhR+fj7kNQVKbyFT0uPFGKXT3Sb9yrKuFQ5X/hMCfqLBrVhD29P8iiuEQoj62
 Okn2MG+8n0fmnixuWv0j/lp/bG/b3vBJNckorv3W41tf3YW4Sj0kLi2Idk95pBqhlIYisy+dRKb
 MOc2IfnPfQElbeKsEDjMpHy0oQY7LRmRHYv9dX9RsRfQsymv6hB/b9lfSF9M5MTn4jLFWTOQRBQ
 /k+2/1Nqk8i+cA5WE5loHeBrozeYvSmBfJATXTrTjh6yj/dVhAs4nZeqcn6hfSOux836gJFmke6
 Ahf59c/QmBydmV3fW9FO9HENgUanrfI0q3OCvmvwtDyHjA+ZZHCcpN7ZZGOkkPLIty1bxlL2P3W
 8xKYvJqNhw8XQdYqohiOX5Y62t/TPJ+aev1v9H3X1cbjvpKylN1KIjeIwoeRJZEdKSGV2ODqCWs
 RY8tY+QqDcfw9StVvP3jwp5XFJ2EYVh48XZ+qL8U8sgg7kYI0soQk/bI+WslYVmSP2/0f7BRhDZ NICGotH/M88i+uA==
X-Mailer: b4 0.13.0
Message-ID: <20240816-tracepoint-v7-1-d609b916b819@google.com>
Subject: [PATCH v7 1/5] rust: add generic static_key_false
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
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  |  9 +++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 40 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b940a5777330..8fd092e1b809 100644
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
diff --git a/rust/helpers.c b/rust/helpers.c
index 92d3c03ae1bd..5a9bf5209cd8 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -28,6 +28,7 @@
 #include <linux/errname.h>
 #include <linux/gfp.h>
 #include <linux/highmem.h>
+#include <linux/jump_label.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
@@ -133,6 +134,14 @@ bool rust_helper_refcount_dec_and_test(refcount_t *r)
 }
 EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
 
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
+#endif
+
 __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
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

