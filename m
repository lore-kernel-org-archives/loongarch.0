Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26731D9346
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284656; cv=none; b=LqvDX+4gigaWhDXH5VYzwINVWXyLZ0zTqwzkiXK7WkGsxo84Gm88ovmw6D4H3x++OAnVLG9GIL2qIXsNZlancKC+sL6Lj2gmbcSsypM6lbC2cqHWtwRSh9ReC1FPudG9RP6XFPCZFhmO4z985ryY2B1wzNiPNyCEnGNIAuhEXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284656; c=relaxed/simple;
	bh=ZNpoXNZfR07Erh+2npG2nIk/DKTvhkPzmRuGbN9DOvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omVv7OfYHIlhJUNQ7ltE1sBzirGuPbcW3i4vce4kY/8e2yliUZWo/OqPqeeweTttPev3wqvw8aDVHLSLsZSilVMIQ8yUX3IX7eGKO2hlz7OmXZWJJECdxBiKW3jSu2so51+FVPuFcTKVEiQ7MCP3RZuYzdInZsGQ57YKwBTZwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EmZk8OHc; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EmZk8OHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1765284652;
	bh=ZDeVS/pqjoM1+Q0+7286ulFJd5685nZDyK1k3NTk4TI=;
	h=From:To:Cc:Subject:Date:From;
	b=EmZk8OHckHaIy/KN4cadWBksVXTSOVko3r5AU5aHIL9l/ABkHRNqlCsfuX/MIepyB
	 q7eKVnpyambei+O9ClxQWL/d4XWWLXvz8sY1XhM4OM2ZkQFeC/mVW8sc4HCuawi3ne
	 WsMPUuuaZGKJihgqDbLp3wdCJhGKDN3Ga4noaK50=
Received: from stargazer (unknown [IPv6:2409:8a4c:e27:5840::b3c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6555E66912;
	Tue,  9 Dec 2025 07:50:46 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	hev <r@hev.cc>,
	Xi Ruoyao <xry111@xry111.site>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ANDROID DRIVERS)
Subject: [PATCH] rust_binder: Fix build failure if !CONFIG_COMPAT
Date: Tue,  9 Dec 2025 20:50:19 +0800
Message-ID: <20251209125029.1117897-1-xry111@xry111.site>
X-Mailer: git-send-email 2.52.0
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

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/all/CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com/
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 drivers/android/binder/rust_binder_main.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index c79a9e742240..9a527268f5b4 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -314,6 +314,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
         owner: THIS_MODULE.as_ptr(),
         poll: Some(rust_binder_poll),
         unlocked_ioctl: Some(rust_binder_ioctl),
+        #[cfg(CONFIG_COMPAT)]
         compat_ioctl: Some(bindings::compat_ptr_ioctl),
         mmap: Some(rust_binder_mmap),
         open: Some(rust_binder_open),
-- 
2.52.0

