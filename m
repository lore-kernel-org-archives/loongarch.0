Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5A215789;
	Wed, 15 Oct 2025 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760495521; cv=none; b=C5CWYkRJDENj0VKM7BLnaJp7N4z243aGPab/ByiV7KXMM98aIXFQAqzRNh+fX/pj9Y7skBYpFHH977vDBBp9vdyt4+Lh2Dz38w+EPoM5PyeXKDXf9Njte9f1HwTJtjAJzwVrek/whFRY4jgia7KU4YkS6wM0gKs9edCKPibTh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760495521; c=relaxed/simple;
	bh=rHYitzTp0VyaZEyeYpEyE+uMhb284KrKi963xtVuyVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kl/cIY8yRks4CQUdbyeIp+k1au3XnmozsUql2O050W7eUkdRw7F2loQjJz5jmQB+PQzzH3buDVckuVLfbQRph5/6v0vJs4019p6bTSPZIF5BG4JrjrUnPG8yqIrQ1AAaAYYUrHcla26utu5EHd9O0SG1jrYF83h1jRAjPPILZKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=DVnKl5i5; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="DVnKl5i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1760494907;
	bh=vKBuG7wJ3nFVNQjdJlBOKUzILkcFxxJZbFgcRMhCDwc=;
	h=From:To:Cc:Subject:Date:From;
	b=DVnKl5i5kGpxtWVhu3yBMLwPcN24bZ0swcfr9V1KxrLy3KWpJpdydMOjXgwFNGE1F
	 xa/htFmrUgxi68bEkABM/EoiKTUQMUtRRCgJtuyz2ut6WjPatXFXnMx6ZXDdVAYYuh
	 aySsROd4eeL5xh3ZY45hEhlSBkpYm6fIJWpEFfjk=
Received: from stargazer (unknown [IPv6:2409:8a4c:e29:d50::256])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B192C66C06;
	Tue, 14 Oct 2025 22:21:41 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rust: Add -fno-isolate-erroneous-paths-dereference to bindgen_skip_c_flags
Date: Wed, 15 Oct 2025 10:20:37 +0800
Message-ID: <20251015022037.14535-2-xry111@xry111.site>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's used to work around an objtool issue since commit abb2a5572264
("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference"), but
it's then passed to bindgen and cause an error because Clang does not
have this option.

Fixes: abb2a5572264 ("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference")
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 23c7ae905bd2..0676b1194a62 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -289,7 +289,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-%
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-- 
2.51.0

