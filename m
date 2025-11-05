Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB121CFF6
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355651; cv=none; b=Vl7iFQJDOfWiF2ov3BYUh5tJbPq7cO+tV1G51hYzwDL4RGigY2IvYnLBAVWahYBIC27ysC5zK9A3F8L53rxuw9y/WPL/PPG7LeqfSCTBVGlwBJQGLDCkdsN5Z7bhVNuYOZBbkPSUBpgaA0tMDJYXyp+bQgYWPeYKJ8w/dBdmq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355651; c=relaxed/simple;
	bh=qvi7oIPnIz+eY7U+jHRFqVIGC+y9ZfdAEbH8bTFuxeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljjTE8rQvM/ntsT6nIVWRDCpaMzNfIrbxevYPAvrD6o5+oggE90Udj3SuA9jpNH+1PcnmsM86jryGV4bOZ6Hgs7CiLqeRlKR1qHrCCcyPBm4pJ/FMN9u/ycUuiSSrKzhFVZvxzAbAolFN99BsweeCSnadxcG3eUFsiKb3o8fPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=kWIy8uRM; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="kWIy8uRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1762355650;
	bh=cwlZVi0pf4Mx6crAaPM4cCr/ny6B50SfKYt8DlTwuhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWIy8uRMlHvuT/A0YFD2J6IwfaUYbo+hOrAC+Kk04ouBv1AAA3Qkyt0k++lHjGnv8
	 X+Lj2wjHnYQm5yfU6fJT/jMEd6ToCqb/NAi6eWcDBMxn98H+VL+M0WFBeCzFfD5wZH
	 7ZEfD50ZQNf6zQ9VQDc57a3A+Gf2V4hii0554eY4=
Received: from stargazer (unknown [IPv6:2408:824e:302:e8a1:c427:8c70:2426:6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EEC1066A4D;
	Wed,  5 Nov 2025 10:14:06 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev (open list:LOONGARCH),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] LoongArch: Simplify __arch_bitrev32 implementation
Date: Wed,  5 Nov 2025 23:12:54 +0800
Message-ID: <20251105151257.148530-3-xry111@xry111.site>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151257.148530-1-xry111@xry111.site>
References: <20251105151257.148530-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch has the bitrev.w instruction to reverse bits in a 32-bit
integer, thus there's no need to reverse the bytes and use bitrev.4b.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/include/asm/bitrev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/bitrev.h b/arch/loongarch/include/asm/bitrev.h
index 46f275b9cdf7..757738ea38d7 100644
--- a/arch/loongarch/include/asm/bitrev.h
+++ b/arch/loongarch/include/asm/bitrev.h
@@ -11,7 +11,7 @@ static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
 {
 	u32 ret;
 
-	asm("bitrev.4b	%0, %1" : "=r"(ret) : "r"(__swab32(x)));
+	asm("bitrev.w	%0, %1" : "=r"(ret) : "r"(x));
 	return ret;
 }
 
-- 
2.51.2

