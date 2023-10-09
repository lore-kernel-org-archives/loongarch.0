Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11EFC06
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI5SrLE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EB0C433C8;
	Mon,  9 Oct 2023 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855337;
	bh=U5dRpNkQ/fqBLnscaXBlROlahn0CmiCXkgV4c0FDvI0=;
	h=From:To:Cc:Subject:Date:From;
	b=kI5SrLE3zsToT0oF3qzS1NvJht0qifBdMCiFQK/v9FTbI5L5n0EW6pYd5tuRl6ieP
	 HjcPlaqvxs2P1rdLZGTTdzoWudgM8hzKId9mZWBwXs6pCuJX6vnz+0E3ALlL+YFXWU
	 94ijd1tGExFHZ3B8P8E7hnKvTc3OsQF3vsMruK2UOg3+xlAFI12HkS7zNoWgeU9j5P
	 RqbGaNnpNq4mlV5D/TDLteQavy7GJgmfuO1Z3pz5lFVya+ir9OBnfBnLIK8QmIx8rd
	 QlNvlPOE9wtrWmdoNHUNCCaM0evOSeld2l1CPXbYgNd4+aOygWhRolJf7rUglqPuUx
	 wwtq9TTnaNu1Q==
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
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 1/5] csky: remove unused cmd_vdso_install
Date: Mon,  9 Oct 2023 21:42:06 +0900
Message-Id: <20231009124210.1064021-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You cannot run this code because arch/csky/Makefile does not define the
vdso_install target.

It appears that this code was blindly copied from another architecture.

Remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/csky/kernel/vdso/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 299e4e41ebc5..ddf784a62c11 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -58,13 +58,3 @@ quiet_cmd_vdsold = VDSOLD  $@
 # that contains the same symbols at the same offsets.
 quiet_cmd_so2s = SO2S    $@
       cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
-
-# install commands for the unstripped file
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-
-vdso.so: $(obj)/vdso.so.dbg
-	@mkdir -p $(MODLIB)/vdso
-	$(call cmd,vdso_install)
-
-vdso_install: vdso.so
-- 
2.39.2

