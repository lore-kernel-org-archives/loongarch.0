Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E608433AB
	for <loongarch@lists.linux.dev>; Sun,  3 Nov 2024 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730674158; cv=none; b=jmjVf/gznIhBCmj4uoOfLAGuR1QJ8Di0av8E2oJf5i220IOprkIgDnbRRdopduT57UfK6kMAweiD4FoBbRlmNSdH6jgkCcYqKcTofyg9TuiqyUQZxwuXDL0KwPrAgk3pnNmp8JzbsqCkQgCh4fYkUsEV6pkNCwmaprK5cJdqtXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730674158; c=relaxed/simple;
	bh=BXXVhv406F7p03HUPAbjvv+Tq/XlhVakbEU2ArKdnT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bNe7HB51zbICJFV+cdsGkB3kUtyLtZZ680bWdfxXV9PV+T4l/kxb1tnV+PI1771S+RPDr9UPD2qYlDV9Ba+8vc7jjoVQyOB5B9M4jZSx+zOVOtxt8jAsOfFCogKGZEaWx+ThrU6nZWT9jh06eJ8TXpSE1Z8UlhPKnQd3BaK7NDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CopukTmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CopukTmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793C6C4CECD;
	Sun,  3 Nov 2024 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730674157;
	bh=BXXVhv406F7p03HUPAbjvv+Tq/XlhVakbEU2ArKdnT8=;
	h=From:To:Cc:Subject:Date:From;
	b=CopukTmmI/d5AK09E8YAkbN+9TwRC4WnPl7WiFQEd5dSliUUVcpncrd4AMe0Nf5+t
	 0FNog5qr3ptuwFDiqtjLwJ9LjFfLQlt20bs06DsnPsqI1spA/S67xOQ7quzGHOpmTY
	 ethLb6Xfwt/6Kw3x+CzD7gRUdRKzblZxGsCpg6+AxZ1GlcUFh3wlWXheXFoFF6nRCg
	 yhqatHMIqkat/dC9b9hzCeZgr6y3ndysysL/pvRTh1JDccK9OdvsTNkECG06iAOTcx
	 14Ct4Zbjlg/jiXwXeTQ5JAjg6iz9bqeSwdZRHLAEMWx2n8W3kSwx7mWynyCUnyqg+O
	 zMzWZ4euN2WOA==
From: Eric Biggers <ebiggers@kernel.org>
To: loongarch@lists.linux.dev
Cc: Min Zhou <zhoumin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] loongarch/crc32: add missing dependency on 64BIT
Date: Sun,  3 Nov 2024 14:47:52 -0800
Message-ID: <20241103224752.190742-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

The LoongArch CRC32 instructions are only specified for LA64 (64-bit)
and cannot be assembled in 32-bit mode.  Therefore only build the
LoongArch-optimized CRC32 functions when CONFIG_64BIT.

Fixes: 2f1648220214 ("LoongArch: crypto: Add crc32 and crc32c hw acceleration")
Reported-by: WangYuli <wangyuli@uniontech.com>
Closes: https://lore.kernel.org/r/DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/crypto/Kconfig b/arch/loongarch/crypto/Kconfig
index 200a6e8b43b1..b68b9a797f83 100644
--- a/arch/loongarch/crypto/Kconfig
+++ b/arch/loongarch/crypto/Kconfig
@@ -2,10 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (loongarch)"
 
 config CRYPTO_CRC32_LOONGARCH
 	tristate "CRC32c and CRC32"
+	depends on 64BIT
 	select CRC32
 	select CRYPTO_HASH
 	help
 	  CRC32c and CRC32 CRC algorithms
 

base-commit: 886b7e80ab19841f640cafd8b5ab053409b9b931
-- 
2.47.0

