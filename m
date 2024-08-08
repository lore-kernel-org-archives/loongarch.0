Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688219005E
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723137830; cv=none; b=NjubKuWPwwe/Bx6kLHNYMa1obkNBAs+wtYsYKzDSnJyPEfAJ94qBKEyHQOAMNhEkFYtS+GlVtR7RQswzoBu262m8FkG6Ja1kZ72iZYpp3izkzOTG3QeVrz9YqbtKrMWvYYSUUvVWFgb2Of3Zdh2YFbNlPEO156NZ4o76cTCsm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723137830; c=relaxed/simple;
	bh=Liprgqcktt8MTwbUnf+wB6HuAJNXmlP70PfgF5tTV+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qpIcksDNmOIB6TzDLKzvOBzHsnQ3CcdzKLI9eFD9jSzWTOKyor5635ZNGh/K+1E5YvbEVmTnpSN73yXFvzy9cH5NSbKMmKKGn3aEq1knRpDuV2QV69Xd9umO0a09QOGhHk7R8WFwzV1S1Sv875w+Lbcm6sBeZ2jSgFNvTjSY6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w2SgZGri; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w2SgZGri"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-664bc570740so36003887b3.0
        for <loongarch@lists.linux.dev>; Thu, 08 Aug 2024 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723137827; x=1723742627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnVygMZX7iPHVWxzQi3pEMy3RocjC+XVhMLP7SBmGyU=;
        b=w2SgZGriAt/dq1tBZ8lGx/0guo5npcgzJRDsSgNv+Qhapd2ZFy9a2B8rozFoYxsCVw
         LY/iYsGjOpyZ08JxyR1STpbZIgJ1YRz6sr8HUHciYA+OV9Ha4XPZvWjoBsW8Mjh6m0PX
         nA67hvueWdzZgCZdjwaMHfSBdPld6spCkUSE8dAqEeZAnupA8qxORLytFpe6xteqJeuf
         9vXT6YHqXs82SM5pCU5uqimGYmmOl0ZOBChJ4sgPDWVbsJgaTm75YP6bTH3sEOw/fTar
         nJSjYEn//MDRqJSBrNCRlU/Tr3os2wRwk548s++ZG1w5w8QJdKiai6RPWmjrZthiR2Sp
         l6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137827; x=1723742627;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VnVygMZX7iPHVWxzQi3pEMy3RocjC+XVhMLP7SBmGyU=;
        b=H3/HeMYT4OhNrmaU2y09Yin7CXh3SdUzToCoHXZLIKdmEAV7aq4Vbf3cJYIKAeainX
         pauXkFn+iwQxCqX1AcTAWnrSNRfR5DsmfCJzpnVIleYUM2kiP6rs7t8EZkmXzxVf0ZE5
         kjTfGqkslE332LFCXLVoaf0F3/zFB887cJZSJOTZjeKLwnesdrjQChSnIDHswsz+lsbC
         sKvnkn1MFPxegk/c5UbMO5CgWVzeg+YZg+9buLgHf+ygxViygVP9gLb/0jFzhqT+tr9r
         ZeyWjza6lVGaPaYrOhZM1yQlKJxJAYkSfVA4IZ7gQhmCAzlAeUbwbxTNS96Mw7cRq5z0
         6uew==
X-Forwarded-Encrypted: i=1; AJvYcCUmp5qm9nsVnOfgmUScRtOSMrljGdl6NMp9SIFCZkBhiUrTqXzhfykgDiVQ0YrTOL76kB+sfkgATSXM79iwnC5bXoeNASOP27bY
X-Gm-Message-State: AOJu0YwcgtnmsRnDf/nJa/449GOTA+ToON5EnEJoDhjg1xxCz6XfppoL
	5IjLgXHNXybw2X78VThriOKJT0HQcHFFmpnKrWqNciXgvGeCbM2efreiu8gP/4EJusrfz48zosS
	OmN1faaGFEb0YQA==
X-Google-Smtp-Source: AGHT+IE1OkPXGo3v1Jwf6rmliI1ru3j9uDOkh7aAdLs+PnUwiCRBZL2DxlvskxpZ8naPb0v/gtKTRQBglOOtCXA=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a0d:ff44:0:b0:68e:edf4:7b42 with SMTP id
 00721157ae682-69c0e17e20bmr1388647b3.2.1723137827230; Thu, 08 Aug 2024
 10:23:47 -0700 (PDT)
Date: Thu, 08 Aug 2024 17:23:37 +0000
In-Reply-To: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fl9wvF9CONq5vMWdv4SzydSNhjVsZ9UpCuEcpZNAscs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmtP8bRhhwaCJyZlEFRWH/ifaHtpXPI8JU5pRUZ
 oYH+YuUpwGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrT/GwAKCRAEWL7uWMY5
 RnutD/9yGDHkP8YF6gTzwouw6B6/WVWzoRq+um+8JOY/u82V2tYU4KOFPGU3A04KAEDxitEOoVm
 qBxN3iNZRxptAZiHn7NXeDEdipseXrFIBYY8kDhhZq4W9fFVFmIHISguxkEtDYF9ZzPP2uCGnpq
 j6TOZoPRm3Gi7XCjuKowepUlbbTnfhlbpcRhhx0Qcz94qrXE9hd94neGqcsvAXDFwS/v57arGen
 aiBpAqPNmdv/Nve47F9SyD6kyajBU6/c5pvf+ZGFLOW+XzhNRwyvKwxzklcSzwEbYif46TmBTUX
 brFgrgrbJqdlOZufDZUFsFd+5mzs5lOi9d/Jq95q3hKeYdyiBDSxOT/tlId7kGEmZm0Pds07FPm
 rZ0EpOCaShADtHw6ChryxQ8zMsc2scDXck56M62bv6FmHaQtYcsAJU60F+ZTy/LvEKndq0HcauG
 BIw2/pv/KxoHPxdLwMezo29aagFCll9VO4MEj8Py4fOQgCrjltR0C9UHF+vr17+xCs4rxbBTo54
 gErPn3fhEJ7061fIaee7se2c/U9Qc2StUdQJRztLi6NvRGtbawndAqQC+rxruF041MNCaGsOblI
 bbClEkj9Ir99MDnKEx8xqD94qxmYcFiRhwjNTJSFJXlg9eKNZmg6nyYdi5ek4N9rjdKxOjhT/QE G2EWsxD4WEyjVrQ==
X-Mailer: b4 0.13.0
Message-ID: <20240808-tracepoint-v6-1-a23f800f1189@google.com>
Subject: [PATCH v6 1/5] rust: add generic static_key_false
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
Content-Transfer-Encoding: quoted-printable

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
 rust/bindings/bindings_helper.h       |  1 +
 rust/helpers.c                        |  9 +++++++++
 rust/kernel/arch_static_branch_asm.rs |  1 +
 rust/kernel/jump_label.rs             | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                    |  1 +
 5 files changed, 41 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
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
=20
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
diff --git a/rust/kernel/arch_static_branch_asm.rs b/rust/kernel/arch_stati=
c_branch_asm.rs
new file mode 100644
index 000000000000..958f1f130455
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs
@@ -0,0 +1 @@
+::kernel::concat_literals!("1: jmp " "{l_yes}" " # objtool NOPs this \n\t"=
 ".pushsection __jump_table,  \"aw\" \n\t" " " ".balign 8" " " "\n\t" ".lon=
g 1b - . \n\t" ".long " "{l_yes}" "- . \n\t" " " ".quad" " " " " "{symb} + =
{off} + {branch}" " - . \n\t" ".popsection \n\t")
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
+//! C header: [`include/linux/jump_label.h`](srctree/include/linux/jump_la=
bel.h).
+
+/// Branch based on a static key.
+///
+/// Takes three arguments:
+///
+/// * `key` - the path to the static variable containing the `static_key`.
+/// * `keytyp` - the type of `key`.
+/// * `field` - the name of the field of `key` that contains the `static_k=
ey`.
+///
+/// # Safety
+///
+/// The macro must be used with a real static key defined by C.
+#[macro_export]
+macro_rules! static_key_false {
+    ($key:path, $keytyp:ty, $field:ident) =3D> {{
+        let _key: *const $keytyp =3D ::core::ptr::addr_of!($key);
+        let _key: *const $crate::bindings::static_key =3D ::core::ptr::add=
r_of!((*_key).$field);
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

--=20
2.46.0.76.ge559c4bf1a-goog

