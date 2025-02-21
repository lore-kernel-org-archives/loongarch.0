Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33220202C5C
	for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130436; cv=none; b=HZ0zEqgwd8sdmgccDUyFQcfOstYwKn/HupNMuMPYBSqxXSY31FZhMNa8wcwYOXhWYiLFC6hDHKs5oqcfqcDRUqltUqnaJT9oJOaOLtM8MGvu1XjGjWR31V0lg31cXpRm5dFGO8HCI6UjgoyCOZKvn2cyWJ+7DHWSZGil/tvMv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130436; c=relaxed/simple;
	bh=6L5GbYGVZnK3Pg8hKzvZ2mxC8upqxVdMUqXOcV0n5Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxm8bQmEh+ZLe6HHFguEynfqmg91qO23RkCrm3m62x6V6i/ALlYYq+fmGBM7ki/YFCz4XXu8ubdSFSyI6IRL4dZE2RhXoKmNIQ7IKqGojgOgnfmlATsHfcxl59Uuvc9KNSRqUgGGTmak7y0bVl8Q9/WFa/HwZinhc10tnD6sMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=dBMVE34p; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="dBMVE34p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740129945;
	bh=x8sbwyIvDcpG5z1EJ3Q7rOK3biWGRso3LJ6nU4kWQlo=;
	h=From:To:Cc:Subject:Date:From;
	b=dBMVE34p4MAObvl1+w37smAr2xxxAYpf+mLROe8dXHv/4JSjIXxqpGL6YsV0iNCC3
	 2eoWoPzcjiRJ9RDV8Ab+ahddfYE2Bp1NjQdCiPG2DEiNuBMhrbUCnYUPIVfZW03GBK
	 7GGK160XWhP3qWFu4+loW3BlOW3AV9bQr3o7c64I=
Received: from stargazer.. (unknown [IPv6:240e:454:4311:1f25:535e:dcbe:c175:b1da])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B3E5C1A3F59;
	Fri, 21 Feb 2025 04:25:39 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
Date: Fri, 21 Feb 2025 17:25:23 +0800
Message-ID: <20250221092523.85632-1-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc added support for .gnu.hash in 2006 and .hash has been obsoleted
far before the first LoongArch CPU was taped.  Using
--hash-style=sysv might imply unaddressed issues and confuse readers.

In the past we really had an unaddressed issue: the vdso selftests did
not know how to process .gnu.hash.  But it has been addressed by commit
e0746bde6f82 ("selftests/vDSO: support DT_GNU_HASH") now.

Just drop the option and rely on the linker default, which is likely
"both" (AOSC) or "gnu" (Arch, Debian, Gentoo, LFS) on all LoongArch
distros.

Similar to commit 6b7e26547fad ("x86/vdso: Emit a GNU hash") and commit
48f6430505c0 ("arm64/vdso: Remove --hash-style=sysv").

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index fdde1bcd4e26..abaf87c58f9d 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -37,7 +37,7 @@ endif
 # VDSO linker flags.
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
-	--hash-style=sysv --build-id -T
+	--build-id -T
 
 #
 # Shared build commands.
-- 
2.48.1

