Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E834F4736;
	Thu,  3 Sep 2026 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466358; cv=none; b=mY8oIcLcyd1T20WOqY65GcLSmrvKcq6DuRpg7aDQPpHwOVdOCVx/3yC3wmutTz6cWIbOJvcvPHtFfY5iDVvhTnNyRYacWBFl5nDsVZqaAGgzgPiv0EKdvjzlS87GLnDKLNtRRcbAjXsg+PqdO8/35euHSrCVv8O3PazSwVr9Cwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466358; c=relaxed/simple;
	bh=i1peq7VbCVCF9eRkc2cvgC+qdC+Zx2KAzImcVFOceP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YpAp5UCD7/TSVQAjbiHP+gs3+E7Fb761Xs7VixcgjunpnYU2wIYkmC9gEOGry5EyM8s4zkkYt0ENTgtoGgn1AI54MIq5g6HyvIe/o0rGHt2hhtZufqYwXq5uF9TBdGZ7W7YZWdv747bKauqn7/RncuMXW6/jWJEl7xYkenANfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuO1Qu2D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuO1Qu2D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704711F000E9;
	Thu,  3 Sep 2026 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466341;
	bh=fUUEXbewzb/KDhdFKrSd3H3LK5U/uFqZ74akQCGrc60=;
	h=From:Date:Subject:To:Cc;
	b=SuO1Qu2D8wRq/Uk7lXYT8foIXzYRKXLFIkhgtnhNroYX7I2OJgf4QjRvjz7/q3j9i
	 ndbag4m2+SXIprB+DxQ/57xO/hcrNTrW15svPSxw5gslrnkB4+b2gOqvr7PEUQUn7+
	 RIrgexeq4D7RzzPElYl0db+AJkqGOVG3r3YnmluKLN+QNiGvcj5GEG1E2KDI7huAOv
	 o7fu2banoiZWyCxzh6uAFEQJA8/sXjFBoTvloy59vTcM9EFQ1dcMw+nBTtG2kPY7WH
	 NHlwI1lTuYYQ+RQ1gUGjFdgyXrTB9TIzeQdgptWMCyrFB2vMdOPFAactilUQk4BZT8
	 pJhq271XYDyqg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 03 Sep 2026 13:12:04 -0700
Subject: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJqYSoVzEupmWgo6Q1naImh
 LtTdfk2/6+gnIUVLs0KmV+ikmJFe2jAB4oTowzVYI3tzdkccU4pTpR9wEGU3MyYFy34lhLwQUo
 RmXtPtju5sfVQO8/Mo3x+j+vtb13cnX35hmHbdk+ugeaFAAAA
X-Change-ID: 20260903-loongarch-disable-rust-with-kasan-ee6ca248bf1c
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, 
 Kees Cook <kees@kernel.org>, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=nathan@kernel.org;
 h=from:subject:message-id; bh=i1peq7VbCVCF9eRkc2cvgC+qdC+Zx2KAzImcVFOceP8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkzr8xy5brQYGUS/FFuRVJh7xMuT4lfc/lO/dtSwOX59
 h3H/urpHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiO7gYGXZOenzJ5/eKakOm
 Zq6EhII3M/2cXGzX7H4ZKL7E+uzB5kJGhmO3FU7ar6hyY+S731o6UW5nS8LpwOci8VVmZy0DX3L
 u5AUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
for better allmodconfig support"), which allows Rust to be enabled for
allmodconfig, ARCH=loongarch allmodconfig starts failing with:

  error: kernel-address sanitizer is not supported for this target

  error: aborting due to 1 previous error

  make[4]: *** [rust/Makefile:741: rust/core.o] Error 1

For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN is
enabled until the loongarch64-unknown-none-softfloat target in rustc
supports KASAN.

Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/loongarch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a21f51e5815e..2067d1f2ad7a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -175,7 +175,7 @@ config LOONGARCH
 	select HAVE_RELIABLE_STACKTRACE if UNWINDER_ORC
 	select HAVE_RETHOOK
 	select HAVE_RSEQ
-	select HAVE_RUST
+	select HAVE_RUST if !KASAN
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_SETUP_PER_CPU_AREA if NUMA

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260903-loongarch-disable-rust-with-kasan-ee6ca248bf1c

Best regards,
--  
Cheers,
Nathan

