Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9951F92E
	for <loongarch@lists.linux.dev>; Sat, 14 Feb 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771076063; cv=none; b=biY09i1uf5moDHKtmegCbMFDV57jh8io6MJxowjOsnbeKOT+Dl6vOS+/KijU3XwVI9clNvAbCDffmAHzNcFiHWMkx6IuHGMcVnmsKIMyGjlbtpSY/y7SvR/nvf/vdpMTK/FZuDWpM0yVoG8eiNOUCh5av6IJuz8Xq2IjK8Q5AR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771076063; c=relaxed/simple;
	bh=XYHDZzVKW99T6G9pkb2RTf2Fk7EvGAbdf7cdUCaErIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAYpApyyXwW6NxtmUBTzuazxqTb1CBUdDmaLp0KS0trCbQolPEMwEaoUOJMb9T111wSrmopUUwxZ+Bnyjt6sCNIxHeF/tp7PgcMGx2NjzXvtIG6dEm3uUxThmXdjyhzN3ukGxuHxCgPoZZabsJNV4UWI54IBTyuXHQPArdNpaYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=cN+XJ0ud; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="cN+XJ0ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1771076060;
	bh=phx2U09w0bMe/osybBoIqJR9EWk1uNkB+tFOzqwtjBc=;
	h=From:To:Cc:Subject:Date:From;
	b=cN+XJ0ud3ERtMvIy0pPuEuAQ8VUi2EDCF2gBmFpknfMeCM+E4KCmJ/xX3lcfIxeK7
	 uOiYd620PywDNo3Rnj9CcPjTPn7zsZwYI/vgRiA6yFcqhSHvWt5xmP+IWcb1RbeXzY
	 FvMjkZZ/HvOAH1xMITACe/n+N6aHJhWulIq1cq6o=
Received: from stargazer (unknown [IPv6:2408:8427:6a1:ffef:9848:ba49:67aa:3472])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 549C26696A;
	Sat, 14 Feb 2026 08:34:10 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	hev <r@hev.cc>,
	Xi Ruoyao <xry111@xry111.site>,
	Miguel Ojeda <ojeda@kernel.org>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Matt Gilbride <mattgilbride@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust_binder: Fix build failure if !CONFIG_COMPAT
Date: Sat, 14 Feb 2026 21:32:06 +0800
Message-ID: <20260214133337.112720-1-xry111@xry111.site>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindgen utility cannot handle "#define compat_ptr_ioctl NULL" in the
C header, so we need to handle this case on our own.

Simply skip this field in the initializer when !CONFIG_COMPAT as the
SAFETY comment above this initializer implies this is allowed.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com/
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---

Changes from v1: fix Miguel's mail address and add tags for stable
backport.

 drivers/android/binder/rust_binder_main.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 47bfb114cabb..e70f250bb4cd 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -312,6 +312,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
         owner: THIS_MODULE.as_ptr(),
         poll: Some(rust_binder_poll),
         unlocked_ioctl: Some(rust_binder_ioctl),
+        #[cfg(CONFIG_COMPAT)]
         compat_ioctl: Some(bindings::compat_ptr_ioctl),
         mmap: Some(rust_binder_mmap),
         open: Some(rust_binder_open),
-- 
2.53.0

