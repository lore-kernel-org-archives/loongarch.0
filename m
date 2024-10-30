Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62A2141BD
	for <loongarch@lists.linux.dev>; Wed, 30 Oct 2024 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730304302; cv=none; b=B/PuxB5jk8lVdqPvN6BRXe/cP2uMA3vIBXgKmBg4VPCsmbAupcSbRq2d+wo38GKY4PF9sMVc8OKDH/dc+AabrznAYE0EqjFpw3pDwHa9cZsRxPTS14WKvbtvb7DtvkpZjCY3dKkHBS2fxSr4m1mR4ISxFuIXhuwAUFbBmBR0uRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730304302; c=relaxed/simple;
	bh=XID7x+7coWgnGBd5wIl/yqAS/1AzuHdHb0QK8txVMPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lcamGoqhbYpycLejBPX0gH5ujEipiPGbvrJpwvLcljfs9Se9PhPCMW/iP74R6l+oI3R6VWBWbRouI7nJacHvkdOqKgM4GOmkeoQeFGtRDKHRPqzIIMlPqDVXQyi8CSAYTVN0hQrxfjU031GfLJrALdzHFkCKKTTVDHMbLDaYjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1B70ovgk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1B70ovgk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4315cefda02so1845e9.0
        for <loongarch@lists.linux.dev>; Wed, 30 Oct 2024 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304297; x=1730909097; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5bBsDzzqub9ZaWqauRG4tAucTaa9wcfj1E33xP3xc=;
        b=1B70ovgkTaIsr/so/oWspsFr0MZZAsgDa+tBxU6uA7eRsK73wGD+YNVQ4GrM9n+ZF0
         Q4STpZdCaGe/z3WKStzgxrnz3XiNAEbdkgGqV70NVUioImXeObULhYuGEWEBdAPx4p4O
         eVnu7bXsLfMhM3WRFloc+EqwW2/NnFh2brWE4Gz7Kt+4EX4qMYZktgBKaoieMWOo99Kd
         RVeDLSF9H7zhXh/pBihmQrs8LebpgnODmWW1/24rN86UDo5101Nkkm/jSetVjve8jPMM
         s+bMRAK1pPMlQDOkGjiT5a7olJIz4YtNQhNe5PBNVk3woWBJc9gS8Sfur9ppPvcApPBF
         3b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304297; x=1730909097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5bBsDzzqub9ZaWqauRG4tAucTaa9wcfj1E33xP3xc=;
        b=iKALAxukn0ZXwkN/3PwAuOoJ/+7x9QucFoEOTUs+/2fq468lsn4hvl7+8Z7+QFnbZf
         PWv3QkIhHzGVxn9emwdl0VxO+NecWPYmzJVqkDMADANBl0SqM5IHYKp4ba+JkPvUv5qu
         4gAoUBEjdcz4ucOzIOg++iJL3iOjb0Bm05cntj5++ktElEP+Hg5SCY3KoCtKJH2Sc1ix
         QhyHXox3oqAZXKX4U2AM5YI5BMHKRQ6JKIlsLkcx9/Hip4848aFUCd41KxT2dQIQ+yqW
         ZBE89equYwM9dJNbJOdqwDiHe3NaoID23LNc0IilWvKG2l2S+Q4nf/S7J/alx5/mIByQ
         o52g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4C9dYPp52hy7giqE7Z9IFd24I5RFaBdzh5qY60jfDqZqBTCdwoCxOykmd2c6OkDSznncNER2pAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaP8jsHguYVWXOPtIQIQRnW9hp7V91W3anUN144lQop2tUi/P/
	vrrYlKtmkltIyggkjBz9nIv+eTNrDJL15j2mFtImxhYYEnrQd9gXGYQ+J7+3Cu+AK/TUWq1CP2+
	TKlYk3ZopMntfug==
X-Google-Smtp-Source: AGHT+IFVYJyJpHqXosREWKNk401dPodMtz/gzxt4mu2tfZOK6kHkRJP3u08JeJC4s0ELkJy7XaI8OGX/S3j3MuY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6a99:b0:431:4509:696a with SMTP
 id 5b1f17b1804b1-4327b6f8619mr645e9.2.1730304297194; Wed, 30 Oct 2024
 09:04:57 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:24 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3944; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XID7x+7coWgnGBd5wIl/yqAS/1AzuHdHb0QK8txVMPI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkhPSPbRePqgmcZkeV4PnRFaF06ORWPyb4Hd
 ZssKOLJjQqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIQAKCRAEWL7uWMY5
 RqSUD/9jfyehgB5qzKfR0aAlCXJYAKb9ZzLWaNn1EmqHjp8saPikwqUESI5omMnEt6W8h+4ok42
 pV4kX4p2S2qQqcKff9S5dttdXhdH2JZOmIXfwdu5yXJPN7oj5BpzCol3VvJux1Nx3JaScViKnG4
 4e0udKPwtlAyubQDD/+0Uk/9ayGweHYNvknT+8hoyjxsNDfCl5mTdR5pa3yXcSQMfXN4Ck+MOQh
 VD91Vo5mSBpn2DItkLSUPSKgIP9aK7q4yXIaKLf9WgPwcsdzNxuJ/Ak1+IWPdqzEjp0hiq67KkE
 hmiSAknb+A1aOfNv9gGpdRM+AuuoXsLOnhD5/yv+0utf5lP32ktyNBPq4IoJMANrT0kqkJ+nAIu
 gs5Eut6gmmuj9FgL+wjElrMboABY6QE/SENYeDZe4xLaDnxQKSqfvem36mOcMTP7j/02/GHoSYB
 RyLsXv/rPzX0s467Y++J+vePxJuIrQFgS8PVcnA/8dnKfeoU+kE4buLiFk6G/HoS4dxGyqiYbF3
 HMltLodkWAYZfs+nfTY3uUa5C7nDIZ+/QXJMyQ2VmpXgulpY7tPclpC1MxbFNAiPxW9jO1qVqOS
 GF2ERKm5fU5AwBn6KmQYgLsii6hIO/c+lfx1ndbl1K1zCZ0cC906aD5HA9HZrjMJ1EsMzzSVauC RVr59LvwW7YPQNA==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-1-eec7f0f8ad22@google.com>
Subject: [PATCH v12 1/5] rust: add static_branch_unlikely for static_key_false
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
2.47.0.163.g1226f6d8fa-goog

