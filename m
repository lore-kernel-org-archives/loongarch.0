Received: from mail.thinkmo.de (s3.thinkmo.de [162.55.237.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91C32B128
	for <loongarch@lists.linux.dev>; Thu, 18 Jun 2026 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.237.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799136; cv=none; b=pgC7CRBPCoN+L+pERjbwmdB2HUKyCj3IOAuIsSe0hHdbDdL1Hh/tRfYTtaPM3ZI8E+j9r8F1RKvxi3yRL1e8Y2BcAsHksYuusfs4aFUkbN8S2dfpJvn6WaW6aNH8PZJibJDE5mgKUEOQwYKNtWjZvTwcadif6MFytY2RzN3QCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799136; c=relaxed/simple;
	bh=W3NqXdaQIiK32menWWnI3L/NLlTfqgbB5fpKYvjjDow=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYzmdLlwAlOF6mONnj8p0Q8yg3+J7SIdbPzx9b55OqiLqctY6EAxZyD+8FOC94vrVq3iaHMs9qdfc1be8ye7BQaDz0veBuZgWTfEN+pFQMGXL9HMK6brERQf/c46l90w3FUuJyJ3tz8oTjmWkoj42kR6LnfKEZLpCLmrDbM8wxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=fail smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=pZyCNgr+; arc=none smtp.client-ip=162.55.237.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="pZyCNgr+"
Received: from localhost (localhost [127.0.0.1])
	by mail.thinkmo.de (Postfix) with ESMTP id 4gh5Mx0NMZzylW;
	Thu, 18 Jun 2026 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debian.org; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=mail202007.waldi.user; t=1781799132; bh=Ysr+bF0zahm
	ghKyXF8qx0uM8g01zbOeX/cVq8bbUysc=; b=pZyCNgr+QK2G9C6Dy8ueSnIKoGc
	Igkvyn0Ht/c/ydaOFt2OAJoqzcR+fFg+ZhzvAVeGJTqxAEy9ycPSDrrXCOQqU1Qz
	Ik7wZLnPYTU+8IM0fWzPcTfOyHw+uLX4eEJ4HEpY3FOfuzVx2etbjcg2HbCQa5iF
	r6qVv6Rg1Wb6Fb/myILcMn6Xr7NCFFPvZr245uY9RCyN8uGYVH1Ju6ky0kBcmMEK
	+pSToCtSTD3M3PEBoqGPu55filMVZBCr3kfUaj5mdM2axPRdsgLlZErCS/Edt+20
	ofoTyhtCp35ye7pbz4HI60GTPu76/XdudKL0+mSfCJcTXGRQJ9uRt3JDn/w==
X-Virus-Scanned: Debian amavis at 
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G0WRTqR4VY7; Thu, 18 Jun 2026 16:12:12 +0000 (UTC)
Received: from steamhammer.waldi.eu.org (unknown [IPv6:2a02:8071:5af1:6518:ad11:fa76:980a:620e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.thinkmo.de (Postfix) with ESMTPSA id 4gh5Mw69Qhzyg6;
	Thu, 18 Jun 2026 16:12:12 +0000 (UTC)
Date: Thu, 18 Jun 2026 18:12:11 +0200
From: Bastian Blank <waldi@debian.org>
To: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] loongarch: Add build salt to the vDSO
Message-ID: <ajQY2-ssx-ZHj3qe@steamhammer.waldi.eu.org>
Mail-Followup-To: Bastian Blank <waldi@debian.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Signed-off-by: Bastian Blank <waldi@debian.org>
---
 arch/loongarch/vdso/elf.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/vdso/elf.S b/arch/loongarch/vdso/elf.S
index 9bb21b9f9583..d6e000003b85 100644
--- a/arch/loongarch/vdso/elf.S
+++ b/arch/loongarch/vdso/elf.S
@@ -7,9 +7,12 @@
 
 #include <asm/vdso/vdso.h>
 
+#include <linux/build-salt.h>
 #include <linux/elfnote.h>
 #include <linux/version.h>
 
 ELFNOTE_START(Linux, 0, "a")
 	.long LINUX_VERSION_CODE
 ELFNOTE_END
+
+BUILD_SALT
-- 
2.53.0
