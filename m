Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EFFFC06
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHYkpZWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160ADC433C7;
	Mon,  9 Oct 2023 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855343;
	bh=2pDAXsYdr6lnZaEYy+XyoiLH0SPTSNq4AwXsBcAaKjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHYkpZWPOomWrfTFYsYVR0dUXhsAstX8BQkaIe3nW9TdyVFGMja92VWRyCVFwtvLu
	 CbD7EBBZEDbE6fCV4YR61vYddvnMXW67ZL85pe26/hUqPjUmqu0OAa8XY0PvvwbenC
	 /oGofIlRr4w/Og4GChSzkelChds0+PIHOQPVgEybQ6zx+9uKj1+hy9HriCG/xUVpot
	 U3xkmlZXMutL2G9oSGHhPB7gSKKDzof5imbxXPmpSZKgOHnUaD+6xRQHglYQzxwJjW
	 yT5ERsvwknSJqNYTvtNznli7Pq9cxsMmX8BJaFSR2Egmg1Nb1Tb44If/mAVcG+esbL
	 kM3C1xQExPh2Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 3/5] parisc: remove broken vdso_install
Date: Mon,  9 Oct 2023 21:42:08 +0900
Message-Id: <20231009124210.1064021-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009124210.1064021-1-masahiroy@kernel.org>
References: <20231009124210.1064021-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'make ARCH=parisc vdso_install' has never worked. It attempts to
descend into arch/parisc/kernel/vdso/, which does not exist.

The command just fails:

  scripts/Makefile.build:41: arch/parisc/kernel/vdso/Makefile: No such file or directory

The second line is also meaningless because parisc does not define
CONFIG_COMPAT_VDSO.

It appears that this code was copied from another architecture without
proper adaptation.

Remove the broken code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 968ebe17494c..4222fa73c34a 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -177,13 +177,6 @@ vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso32 include/generated/vdso32-offsets.h
 endif
 
-PHONY += vdso_install
-
-vdso_install:
-	$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso $@
-	$(if $(CONFIG_COMPAT_VDSO), \
-		$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso32 $@)
-
 install: KBUILD_IMAGE := vmlinux
 zinstall: KBUILD_IMAGE := vmlinuz
 install zinstall:
-- 
2.39.2

