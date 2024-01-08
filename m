Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AFF7F
	for <loongarch@lists.linux.dev>; Mon,  8 Jan 2024 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.22.232.245])
	by gateway (Coremail) with SMTP id _____8DxPuk+aptlowQDAA--.1577S3;
	Mon, 08 Jan 2024 11:21:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.232.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxO9wxaptlNuUGAA--.17925S4;
	Mon, 08 Jan 2024 11:21:33 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	WANG Xuerui <kernel@xen0n.name>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH v1 2/2] LoongArch: Enable initial Rust support
Date: Mon,  8 Jan 2024 11:21:17 +0800
Message-ID: <20240108032117.215171-3-wangrui@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108032117.215171-1-wangrui@loongson.cn>
References: <20240108032117.215171-1-wangrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxO9wxaptlNuUGAA--.17925S4
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr4xWr4xGr4fWr13CFWDKFX_yoW5Ary3pa
	929r97Jr4xXrykJrn8JFyUZr4UAFyDGr47XF18Cw18Jr4DZryUXr1ftFn3JF1rGws5ArW0
	gF15GryUArWUJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8EeHDUUUUU==

Add initial Rust support for LoongArch.

Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 Documentation/rust/arch-support.rst |  1 +
 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/Makefile             |  3 +++
 scripts/generate_rust_target.rs     | 10 ++++++++++
 4 files changed, 15 insertions(+)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 14875a2e073a..73203ba1e901 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
+``loongarch``  Maintained        -
 ``um``         Maintained        ``x86_64`` only.
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 15d05dd2b7f3..6d39ec3077da 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -142,6 +142,7 @@ config LOONGARCH
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK
 	select HAVE_RSEQ
+	select HAVE_RUST
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_SETUP_PER_CPU_AREA if NUMA
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 4ba8d67ddb09..ba45cb7b621c 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -81,8 +81,11 @@ KBUILD_AFLAGS_MODULE		+= -Wa,-mla-global-with-abs
 KBUILD_CFLAGS_MODULE		+= -fplt -Wa,-mla-global-with-abs,-mla-local-with-abs
 endif
 
+KBUILD_RUSTFLAGS_MODULE		+= -Crelocation-model=pic
+
 ifeq ($(CONFIG_RELOCATABLE),y)
 KBUILD_CFLAGS_KERNEL		+= -fPIE
+KBUILD_RUSTFLAGS_KERNEL		+= -Crelocation-model=pie
 LDFLAGS_vmlinux			+= -static -pie --no-dynamic-linker -z notext $(call ld-option, --apply-dynamic-relocs)
 endif
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d..3edda6a10dd0 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -161,6 +161,16 @@ fn main() {
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
         ts.push("target-pointer-width", "64");
+    } else if cfg.has("LOONGARCH") {
+        ts.push("arch", "loongarch64");
+        ts.push(
+            "data-layout",
+            "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
+        );
+        ts.push("features", "-f,-d");
+        ts.push("llvm-target", "loongarch64-linux-gnusf");
+        ts.push("llvm-abiname", "lp64s");
+        ts.push("target-pointer-width", "64");
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.43.0

